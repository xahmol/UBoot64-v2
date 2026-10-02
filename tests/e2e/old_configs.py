"""Synthetic UBoot64 config and slot files in the old formats v1 and v2.

For the end-to-end test of the built-in conversion (GitHub issue #23).
Generated instead of copied from a real stick, so no personal slot data
ends up in the repository. Layouts from src/uboot_upd12.c (v1) and
include/defines.h (v2 = today's SlotStruct with cfgvs 2, and a
ConfigStruct that ends after timeoutidx).

Strings are plain ASCII upper case: on the C64's lower case character
set they show as lower case letters.

Each set has three slots that exercise the conversion rules:
  0  a program slot
  1  a REU slot (REU image path taken from image_a_path, GitHub #6)
  2  a mount slot with images on drive A and B
"""

import struct

SLOTS = 18
CFGVERSION = 3
COMMAND_REU = 0x02
COMMAND_IMGA = 0x04
COMMAND_IMGB = 0x08

V1_SLOT = 488
V3_SLOT = 1360
V3_CONFIG = 263

# Field offsets of today's SlotStruct (include/defines.h)
SLOT = {
    "cfgvs": (0, 1), "path": (1, 256), "menu": (257, 31), "file": (288, 51),
    "cmd": (339, 81), "reu_image": (420, 51), "reu_path": (471, 256),
    "reusize": (727, 1), "runboot": (728, 1), "device": (729, 1),
    "command": (730, 1), "image_a_path": (731, 256), "image_a_file": (987, 51),
    "image_a_id": (1038, 1), "image_b_path": (1039, 256),
    "image_b_file": (1295, 51), "image_b_id": (1346, 1), "isdefault": (1347, 1),
    "partition": (1348, 1),
}

# Field offsets of a v1 slot (OldSlotStruct in src/uboot_upd12.c)
V1 = {
    "path": (0, 100), "menu": (100, 21), "file": (121, 20), "cmd": (141, 80),
    "reu_image": (221, 20), "reusize": (241, 1), "runboot": (242, 1),
    "device": (243, 1), "command": (244, 1), "cfgvs": (245, 1),
    "image_a_path": (246, 100), "image_a_file": (346, 20), "image_a_id": (366, 1),
    "image_b_path": (367, 100), "image_b_file": (467, 20), "image_b_id": (487, 1),
}

# The test slots, by field name (strings as bytes)
TEST_SLOTS = [
    {"menu": b"PROGRAM SLOT", "path": b"/USB0/GAMES/", "file": b"GAME",
     "device": 8, "runboot": 0x02},
    {"menu": b"REU SLOT", "reu_image": b"TEST.REU", "reusize": 2,
     "command": COMMAND_REU, "image_a_path": b"/USB0/REU/", "device": 8},
    {"menu": b"MOUNT SLOT", "command": COMMAND_IMGA | COMMAND_IMGB,
     "image_a_path": b"/USB0/DISKS/", "image_a_file": b"A.D64", "image_a_id": 8,
     "image_b_path": b"/USB0/DISKS/", "image_b_file": b"B.D64", "image_b_id": 9,
     "device": 8},
]

V1_HOST = b"V1.NTP.TEST"
V2_HOST = b"V2.NTP.TEST"
UTC_OFFSET = 3600
V2_TEXT_COLOUR = 14  # light blue instead of the default yellow


def _put(buf, layout, name, value):
    off, size = layout[name]
    if isinstance(value, int):
        buf[off] = value
    else:
        assert len(value) < size or (len(value) == size), name
        buf[off:off + len(value)] = value


def _get(buf, layout, name):
    off, size = layout[name]
    if size == 1:
        return buf[off]
    return bytes(buf[off:off + size]).split(b"\0", 1)[0]


def v1_files():
    """(config, slots) of a v1 set: 86 and 8784 bytes."""
    cfg = bytearray(86)
    cfg[0] = 1
    cfg[1] = 0  # timeon: no NTP during the test
    cfg[2:6] = struct.pack(">l", UTC_OFFSET)
    cfg[6:6 + len(V1_HOST)] = V1_HOST
    slots = bytearray(V1_SLOT * SLOTS)
    for i, fields in enumerate(TEST_SLOTS):
        s = bytearray(V1_SLOT)
        for k, v in fields.items():
            _put(s, V1, k, v)
        s[V1["cfgvs"][0]] = 1
        slots[i * V1_SLOT:(i + 1) * V1_SLOT] = s
    return bytes(cfg), bytes(slots)


def v2_files():
    """(config, slots) of a v2 set: 100 and 24480 bytes."""
    cfg = bytearray(100)
    cfg[0] = 2
    cfg[1] = 0
    cfg[2:2 + len(V2_HOST)] = V2_HOST
    cfg[83:87] = struct.pack("<l", UTC_OFFSET)
    cfg[87] = 1  # verbose
    cfg[88:99] = bytes([0, 0, 5, 13, V2_TEXT_COLOUR, 1, 3, 1, 3, 2, 5])
    cfg[99] = 0  # timeoutidx
    slots = bytearray(V3_SLOT * SLOTS)
    for i in range(SLOTS):
        s = bytearray(V3_SLOT)
        s[0] = 2
        # v2 stamped "uboot64 x mol" over the padding, where partition is now
        s[1348:1360] = b"UBOOT64 X MO"
        for k, v in (TEST_SLOTS[i].items() if i < len(TEST_SLOTS) else ()):
            _put(s, SLOT, k, v)
        slots[i * V3_SLOT:(i + 1) * V3_SLOT] = s
    return bytes(cfg), bytes(slots)


def v3_slots(slots):
    """A current-format (v3) slot file from a list of field dicts, as
    UBoot64 writes it: cfgvs 3, partition 0, "uboot64 x mol" filler."""
    out = bytearray(V3_SLOT * SLOTS)
    for i in range(SLOTS):
        s = bytearray(V3_SLOT)
        s[0] = CFGVERSION
        s[1349:1360] = b"UBOOT64 X M"
        for k, v in (slots[i].items() if i < len(slots) else ()):
            _put(s, SLOT, k, v)
        out[i * V3_SLOT:(i + 1) * V3_SLOT] = s
    return bytes(out)


def converted_test_slots():
    """TEST_SLOTS as the conversion leaves them (REU slot with reu_path)."""
    slots = [dict(f) for f in TEST_SLOTS]
    for f in slots:
        if f.get("command", 0) & COMMAND_REU:
            f["reu_path"] = f["image_a_path"]
    return v3_slots(slots)


def slot_field(slots, index, name):
    """One field of slot `index` in a v3 slot file."""
    return _get(slots[index * V3_SLOT:(index + 1) * V3_SLOT], SLOT, name)


def check_converted(version, cfg, slots):
    """Problems found in converted v3 files, as a list of strings."""
    problems = []
    if len(cfg) != V3_CONFIG or cfg[0] != CFGVERSION:
        problems.append("config: %d bytes, version %d" % (len(cfg), cfg[0] if cfg else -1))
        return problems
    host = bytes(cfg[2:83]).split(b"\0", 1)[0]
    want = V1_HOST if version == 1 else V2_HOST
    if host != want:
        problems.append("config host %r, expected %r" % (host, want))
    if struct.unpack_from("<l", cfg, 83)[0] != UTC_OFFSET:
        problems.append("config UTC offset %d" % struct.unpack_from("<l", cfg, 83)[0])
    if version == 2 and cfg[92] != V2_TEXT_COLOUR:
        problems.append("config text colour %d, expected %d" % (cfg[92], V2_TEXT_COLOUR))
    for off, name in ((101, "host2"), (182, "host3")):
        if not cfg[off]:
            problems.append("config %s empty (default expected)" % name)
    if len(slots) != V3_SLOT * SLOTS:
        problems.append("slots: %d bytes" % len(slots))
        return problems
    for i in range(SLOTS):
        s = slots[i * V3_SLOT:(i + 1) * V3_SLOT]
        if s[0] != CFGVERSION:
            problems.append("slot %d: cfgvs %d" % (i, s[0]))
        if s[SLOT["partition"][0]] != 0:
            problems.append("slot %d: partition %d" % (i, s[SLOT["partition"][0]]))
        fields = TEST_SLOTS[i] if i < len(TEST_SLOTS) else {}
        for k, v in fields.items():
            got = _get(s, SLOT, k)
            if got != v:
                problems.append("slot %d %s: %r, expected %r" % (i, k, got, v))
        if fields.get("command", 0) & COMMAND_REU:
            if _get(s, SLOT, "reu_path") != fields["image_a_path"]:
                problems.append("slot %d: reu_path %r" % (i, _get(s, SLOT, "reu_path")))
    return problems


if __name__ == "__main__":
    for v, (c, s) in ((1, v1_files()), (2, v2_files())):
        print("v%d: config %d bytes, slots %d bytes" % (v, len(c), len(s)))
