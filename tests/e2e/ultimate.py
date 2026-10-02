"""Minimal client for the Ultimate firmware's REST API and FTP server.

Based on mandelbrot-upic's tests/e2e/ultimate.py by Christian Gleissner
(https://github.com/xahmol/mandelbrot-upic, PR #2). Adapted: the video
stream is left out (UBoot64's screens are text, read from C64 memory),
run_crt and FTP file access added.

Python 3 standard library only. Covers what the end-to-end test needs:
read the product name, start a cartridge image, read and write C64 memory, press
keys on the keyboard matrix, and read, write and delete files on the
device's storage (for the config and slot files).
"""

import ftplib
import io
import json
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
            self._json("POST", "/v1/machine:input",
                       body=json.dumps({"events": events}).encode(),
                       content_type="application/json")

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

    def drive_mount(self, drive, image):
        self._json("PUT", "/v1/drives/%s:mount" % drive, {"image": image})

    def drive_remove(self, drive):
        self._json("PUT", "/v1/drives/%s:remove" % drive)

    def drive_set_mode(self, drive, mode):
        self._json("PUT", "/v1/drives/%s:set_mode" % drive, {"mode": mode})

    def delete_file(self, path):
        with self._ftp() as ftp:
            ftp.delete(path)
