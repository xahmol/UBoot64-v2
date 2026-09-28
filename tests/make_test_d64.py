#!/usr/bin/env python3
"""Build tests/ubtest.d64: a 1541 disk image whose directory holds the IEC
listing cases UBoot64's parser must handle (GitHub #8, #12):

- a locked PRG and a locked SEQ (the drive lists them as "PRG<" / "SEQ<"),
- an invalid file type byte (the drive lists garbage as its type),
- files of 300 and 1000 blocks (16-bit block counts),
- normal PRG/SEQ entries before and after them.

The block counts are only directory values; all entries share one data
sector. Usage: python3 tests/make_test_d64.py [output.d64]
Upload it (e.g. curl -T ubtest.d64 ftp://$ULTIP1/usb0/Dev/), mount it on
drive A in 1541 mode via the Ultimate REST API (PUT /v1/drives/a:set_mode?
mode=1541, PUT /v1/drives/a:mount?image=/usb0/Dev/ubtest.d64) and list
device 8 in UBoot64's IEC browser. See CLAUDE.md, "Hardware testing".
"""
import sys

SECTORS_PER_TRACK = [21] * 17 + [19] * 7 + [18] * 6 + [17] * 5


def offset(track, sector):
    return (sum(SECTORS_PER_TRACK[:track - 1]) + sector) * 256


def petscii_name(text, length=16):
    data = text.encode('ascii')
    return data + bytes([0xa0]) * (length - len(data))


def build():
    image = bytearray(174848)

    # BAM (18/0): directory link, DOS version, free-sector bitmap, name, ID
    bam = offset(18, 0)
    image[bam:bam + 3] = bytes([18, 1, 0x41])
    for track in range(1, 36):
        count = SECTORS_PER_TRACK[track - 1]
        bits = (1 << count) - 1
        if track == 18:
            bits &= ~0b11          # BAM and directory sector in use
            count -= 2
        if track == 17:
            bits &= ~0b1           # shared data sector in use
            count -= 1
        entry = bam + 4 * track
        image[entry] = count
        image[entry + 1:entry + 4] = bytes([bits & 255, (bits >> 8) & 255, (bits >> 16) & 255])
    image[bam + 0x90:bam + 0xa0] = petscii_name('UBOOT TEST')
    image[bam + 0xa0:bam + 0xab] = b'\xa0\xa0UT\xa02A\xa0\xa0\xa0\xa0'

    # Shared data sector (17/0): a tiny PRG
    data = offset(17, 0)
    image[data:data + 7] = bytes([0, 6, 1, 8, 0, 0, 0])

    # Directory (18/1): type byte, first sector, name, block count
    entries = [
        (0x82, 'NORMAL', 1),
        (0xC2, 'LOCKED PRG', 1),
        (0xC1, 'LOCKED SEQ', 1),
        (0x85, 'UNKNOWN TYPE', 1),
        (0x82, 'BIG 300', 300),
        (0x82, 'BIG 1000', 1000),
        (0x81, 'AFTER ALL', 1),
    ]
    directory = offset(18, 1)
    image[directory:directory + 2] = bytes([0, 0xff])
    for index, (filetype, name, blocks) in enumerate(entries):
        entry = directory + index * 32
        image[entry + 2:entry + 5] = bytes([filetype, 17, 0])
        image[entry + 5:entry + 21] = petscii_name(name)
        image[entry + 30:entry + 32] = bytes([blocks & 255, blocks >> 8])
    return image


if __name__ == '__main__':
    path = sys.argv[1] if len(sys.argv) > 1 else 'ubtest.d64'
    with open(path, 'wb') as out:
        out.write(build())
    print(f'Wrote {path}')
