"""A minimal 1541 disk image with one BASIC program, for the boot test.

The program is `10 PRINT"<text>"`, tokenized, loaded at $0801. Standard
D64 layout (35 tracks, BAM at 18/0, directory at 18/1); the program
fills one sector on track 17. Based on tests/make_test_d64.py.
"""

SECTORS_PER_TRACK = [21] * 17 + [19] * 7 + [18] * 6 + [17] * 5
D64_SIZE = 174848


def _offset(track, sector):
    return (sum(SECTORS_PER_TRACK[:track - 1]) + sector) * 256


def _name(text, length=16):
    data = text.encode("ascii")
    return data + bytes([0xA0]) * (length - len(data))


def basic_print_prg(text):
    """PRG bytes (load address first) of 10 PRINT"text"."""
    line = bytes([10, 0, 0x99, 0x22]) + text.encode("ascii") + bytes([0x22, 0])
    nxt = 0x0801 + 2 + len(line)
    return bytes([0x01, 0x08, nxt & 255, nxt >> 8]) + line + bytes([0, 0])


def build(prg_name, prg, disk_name="E2E TEST"):
    assert len(prg) <= 254
    image = bytearray(D64_SIZE)
    bam = _offset(18, 0)
    image[bam:bam + 4] = bytes([18, 1, 0x41, 0])
    for track in range(1, 36):
        count = SECTORS_PER_TRACK[track - 1]
        bits = (1 << count) - 1
        if track == 18:
            bits &= ~0b11  # BAM and directory
            count -= 2
        if track == 17:
            bits &= ~0b1  # the program
            count -= 1
        e = bam + 4 * track
        image[e] = count
        image[e + 1:e + 4] = bytes([bits & 255, (bits >> 8) & 255, (bits >> 16) & 255])
    image[bam + 0x90:bam + 0xA0] = _name(disk_name)
    image[bam + 0xA0:bam + 0xAB] = b"\xa0\xa0E2\xa02A\xa0\xa0\xa0\xa0"

    data = _offset(17, 0)
    image[data:data + 2] = bytes([0, len(prg) + 1])  # last sector: index of last byte
    image[data + 2:data + 2 + len(prg)] = prg

    d = _offset(18, 1)
    image[d:d + 2] = bytes([0, 0xFF])
    image[d + 2] = 0x82  # PRG, closed
    image[d + 3:d + 5] = bytes([17, 0])
    image[d + 5:d + 21] = _name(prg_name)
    image[d + 30:d + 32] = bytes([1, 0])  # 1 block
    return bytes(image)


def big_basic_prg(text, size):
    """10 PRINT"text" followed by filler up to `size` bytes in total: a
    large program (the filler lies after BASIC's end marker)."""
    prg = bytearray(basic_print_prg(text))
    filler = bytes((i * 7 + 3) & 0xFF for i in range(size - len(prg)))
    return bytes(prg) + filler

