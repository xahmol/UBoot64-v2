"""Minimal client for the Ultimate firmware's REST API and FTP server.

Based on mandelbrot-upic's tests/e2e/ultimate.py by Christian Gleissner
(https://github.com/xahmol/mandelbrot-upic, PR #2). Adapted: run_crt,
drive control and FTP file access added. The video stream (VicStream) is
his, unchanged: the test reads text screens from memory, screenshot.py
uses the stream.

Python 3 standard library only. Covers what the end-to-end test needs:
read the product name, start a cartridge image, read and write C64 memory, press
keys on the keyboard matrix, and read, write and delete files on the
device's storage (for the config and slot files).
"""

import ftplib
import io
import json
import socket
import struct
import time
import urllib.error
import urllib.parse
import urllib.request


class UltimateError(RuntimeError):
    pass


class Ultimate:
    def __init__(self, host, password=None, timeout=10.0):
        self.host = host
        self.password = password
        self.timeout = timeout

    # --- HTTP -----------------------------------------------------------

    def _request(self, method, path, params=None, body=None, content_type=None, retry=None):
        url = "http://%s%s" % (self.host, path)
        if params:
            url += "?" + urllib.parse.urlencode(params, quote_via=urllib.parse.quote)
        # A GET, and any other request the caller marks as safe to repeat,
        # is retried: the firmware occasionally drops one request while
        # the machine is busy.
        if retry is None:
            retry = method == "GET"
        for attempt in range(3 if retry else 1):
            req = urllib.request.Request(url, data=body, method=method)
            if content_type:
                req.add_header("Content-Type", content_type)
            if self.password:
                req.add_header("X-Password", self.password)
            try:
                with urllib.request.urlopen(req, timeout=self.timeout) as resp:
                    return resp.read()
            except urllib.error.HTTPError as e:
                raise UltimateError("%s %s: HTTP %d %s" % (method, url, e.code, e.read()[:200])) from None
            except (urllib.error.URLError, TimeoutError, ConnectionError) as e:
                if attempt == 2 or not retry:
                    raise UltimateError("%s %s: %s" % (method, url, e)) from None
                time.sleep(0.5)

    def _json(self, method, path, params=None, body=None, content_type=None, retry=None):
        data = json.loads(self._request(method, path, params, body, content_type, retry) or b"{}")
        if data.get("errors"):
            raise UltimateError("%s %s: %s" % (method, path, data["errors"]))
        return data

    # --- Machine --------------------------------------------------------

    def info(self):
        return self._json("GET", "/v1/info")

    def get_config(self, category, item):
        """Current value of a setting."""
        path = "/v1/configs/%s/%s" % (urllib.parse.quote(category), urllib.parse.quote(item))
        return self._json("GET", path)[category][item]["current"]

    def set_config(self, category, item, value):
        path = "/v1/configs/%s/%s" % (urllib.parse.quote(category), urllib.parse.quote(item))
        self._json("PUT", path, {"value": value})

    def reset(self):
        self._json("PUT", "/v1/machine:reset")

    def run_crt(self, crt):
        """Upload a cartridge image, reset the machine and start it."""
        self._json("POST", "/v1/runners:run_crt", body=crt,
                   content_type="application/octet-stream")

    def run_prg(self, prg):
        """Upload a PRG, reset the machine and start it."""
        self._json("POST", "/v1/runners:run_prg", body=prg,
                   content_type="application/octet-stream")

    def read_memory(self, address, length):
        return self._request("GET", "/v1/machine:readmem",
                             {"address": "%04X" % address, "length": length})

    def write_memory(self, address, data):
        self._json("POST", "/v1/machine:writemem", {"address": "%04X" % address},
                   body=bytes(data), content_type="application/octet-stream", retry=True)

    def tap_keys(self, keys):
        """Tap each key in turn on the keyboard matrix.

        The firmware holds each tapped key for about 60 ms and leaves a
        40 ms gap before the next one. Key names are the firmware's
        (e.g. "f1", "return", "y"); a list of names is one chord, its
        keys held together (["left_shift", "f1"] is F2).
        """
        for i in range(0, len(keys), 64):
            events = [{"kind": "keyboard", "inputs": k if isinstance(k, list) else [k],
                       "transition": "tap"}
                      for k in keys[i:i + 64]]
            try:
                self._json("POST", "/v1/machine:input",
                           body=json.dumps({"events": events}).encode(),
                           content_type="application/json")
            except UltimateError as e:
                if "timed out" not in str(e):
                    raise
                # The REST interface sometimes stops answering for a while
                # when it's busy: try once more (the first tap may have
                # been executed after all)
                time.sleep(2.0)
                self._json("POST", "/v1/machine:input",
                           body=json.dumps({"events": events}).encode(),
                           content_type="application/json")

    # --- Video stream ---------------------------------------------------

    def local_address(self):
        """This host's address on the route to the device."""
        with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as s:
            s.connect((socket.gethostbyname(self.host), 80))
            return s.getsockname()[0]

    def video_stream(self, port):
        return VicStream(self, port)


    # --- Files (FTP) ----------------------------------------------------

    def _ftp(self):
        ftp = ftplib.FTP(self.host, timeout=self.timeout)
        ftp.login("anonymous", self.password or "")
        return ftp

    def list_dir(self, path):
        """Names in a directory, or None if it doesn't exist."""
        with self._ftp() as ftp:
            try:
                return [n.rsplit("/", 1)[-1] for n in ftp.nlst(path)]
            except ftplib.error_perm:
                return None

    def read_file(self, path):
        buf = io.BytesIO()
        with self._ftp() as ftp:
            ftp.retrbinary("RETR " + path, buf.write)
        return buf.getvalue()

    def write_file(self, path, data):
        with self._ftp() as ftp:
            ftp.storbinary("STOR " + path, io.BytesIO(data))

    def make_dir(self, path):
        with self._ftp() as ftp:
            ftp.mkd(path)

    def remove_dir(self, path):
        with self._ftp() as ftp:
            ftp.rmd(path)

    def drives(self):
        """{"a": {...}, "b": {...}} from GET /v1/drives (floppy drives only)."""
        out = {}
        for entry in self._json("GET", "/v1/drives").get("drives", []):
            out.update({k: v for k, v in entry.items() if k in ("a", "b")})
        return out

    def softiec_id(self):
        """Bus ID of the Ultimate's SoftIEC drive ("IEC Drive"), or 0 when
        it is off."""
        for entry in self._json("GET", "/v1/drives").get("drives", []):
            if "IEC Drive" in entry:
                d = entry["IEC Drive"]
                return d.get("bus_id", 0) if d.get("enabled") else 0
        return 0

    def drive_mount(self, drive, image):
        self._json("PUT", "/v1/drives/%s:mount" % drive, {"image": image})

    def drive_remove(self, drive):
        self._json("PUT", "/v1/drives/%s:remove" % drive)

    def drive_set_mode(self, drive, mode):
        self._json("PUT", "/v1/drives/%s:set_mode" % drive, {"mode": mode})

    def delete_file(self, path):
        with self._ftp() as ftp:
            ftp.delete(path)


class VicStream:
    """Receives the VIC video stream as complete frames of colour indexes.

    Each UDP packet carries a 12-byte little-endian header
        u16 sequence, u16 frame, u16 line (bit 15 = last packet of the
        frame), u16 pixels per line (384), u8 lines per packet (4),
        u8 bits per pixel (4), u16 encoding
    followed by 4 lines of 384 pixels, two pixels per byte, the left
    pixel in the low nibble. A PAL frame is 272 lines.

    The stream goes to a multicast group, as the firmware's own default
    does: a unicast destination needs the device to resolve this host's
    address first, which fails intermittently with "Network Host
    Resolve Error". Each device is given its own port, and packets from
    any other source address are ignored, so two devices streaming at
    the same time can't mix their frames.
    """

    WIDTH = 384
    HEADER = 12
    GROUP = "239.0.1.64"

    def __init__(self, ultimate, port):
        self.u = ultimate
        self.port = port
        self.source = socket.gethostbyname(ultimate.host)
        self.sock = None

    def __enter__(self):
        local = self.u.local_address()
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, 4 << 20)
        self.sock.bind(("", self.port))
        self.sock.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP,
                             socket.inet_aton(self.GROUP) + socket.inet_aton(local))
        self.sock.settimeout(2.0)
        self.u._json("PUT", "/v1/streams/video:start", {"ip": "%s:%d" % (self.GROUP, self.port)})
        return self

    def __exit__(self, *exc):
        try:
            self.u._json("PUT", "/v1/streams/video:stop")
        finally:
            self.sock.close()

    def frames(self, count, timeout=10.0):
        """Return `count` consecutive complete frames as lists of rows.

        Each row is a bytes object of 384 colour indexes (0-15). A frame
        with a missing packet is discarded rather than returned
        incomplete, and so is the first, partially received one.
        """
        self._drain()
        deadline = time.monotonic() + timeout
        frames = []
        current, lines, started = None, {}, False
        while len(frames) < count:
            if time.monotonic() > deadline:
                raise UltimateError("%s: got %d of %d video frames" % (self.u.host, len(frames), count))
            data, addr = self.sock.recvfrom(2048)
            if addr[0] != self.source or len(data) < self.HEADER:
                continue
            _, frame, line, width, per_packet, bpp, _ = struct.unpack_from("<HHHHBBH", data)
            if width != self.WIDTH or bpp != 4:
                continue
            last = bool(line & 0x8000)
            line &= 0x7FFF
            if frame != current:
                current, lines = frame, {}
            payload = data[self.HEADER:]
            row_bytes = self.WIDTH // 2
            for i in range(per_packet):
                lines[line + i] = payload[i * row_bytes:(i + 1) * row_bytes]
            if last:
                height = line + per_packet
                if started and len(lines) == height:
                    frames.append([_unpack_row(lines[y]) for y in range(height)])
                started = True
                current, lines = None, {}
        return frames

    def _drain(self):
        self.sock.setblocking(False)
        try:
            while True:
                self.sock.recv(2048)
        except BlockingIOError:
            pass
        finally:
            self.sock.settimeout(2.0)


def _unpack_row(packed):
    row = bytearray(len(packed) * 2)
    row[0::2] = bytes(b & 0x0F for b in packed)
    row[1::2] = bytes(b >> 4 for b in packed)
    return bytes(row)
