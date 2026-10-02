"""C64 text screen dumps as readable, comparable text.

A dump is the 1000 screen codes at $0400 plus the 1000 colour RAM
nybbles at $D800. It is written as three 25-line blocks:

    text     the characters, as UBoot64 shows them (lower case
             character set: codes 1-26 are a-z, 65-90 are A-Z)
    reverse  '#' for a reverse-video cell, '.' otherwise
    colour   the cell's colour as one hex digit (0-f), '.' for a blank
             cell (a space, not reversed): its colour RAM is whatever an
             earlier screen left there and isn't visible

Codes without a plain ASCII character map one-to-one onto the Unicode
box-drawing block (U+2500 + code), so every code still has its own
character and a dump compares exactly. Masked cells (dynamic fields such
as the clock) are written as '~' in all three blocks.
"""

ROWS, COLS = 25, 40
MASK = "~"


def screen_char(code):
    code &= 0x7F
    if code == 0:
        return "@"
    if 1 <= code <= 26:
        return chr(ord("a") + code - 1)
    if code == 27:
        return "["
    if code == 29:
        return "]"
    if 32 <= code <= 63:
        return chr(code)
    if 65 <= code <= 90:
        return chr(ord("A") + code - 65)
    return chr(0x2500 + code)


class Screen:
    def __init__(self, codes, colours):
        self.codes = bytes(codes)
        self.colours = bytes(c & 0x0F for c in colours)

    def row(self, y):
        """Row y as text (no mask)."""
        return "".join(screen_char(c) for c in self.codes[y * COLS:(y + 1) * COLS])

    def text(self):
        return "\n".join(self.row(y) for y in range(ROWS))

    def contains(self, needle, row=None):
        rows = [row] if row is not None else range(ROWS)
        return any(needle in self.row(y) for y in rows)

    def dump(self, masks=()):
        """The three blocks, with masks = [(row, first col, last col + 1)]."""
        masked = set()
        for y, x0, x1 in masks:
            masked.update(y * COLS + x for x in range(x0, x1))

        def block(cell):
            return ["".join(MASK if y * COLS + x in masked else cell(y * COLS + x)
                            for x in range(COLS)) for y in range(ROWS)]

        text = block(lambda i: screen_char(self.codes[i]))
        rev = block(lambda i: "#" if self.codes[i] & 0x80 else ".")
        col = block(lambda i: "." if self.codes[i] == 0x20 else "%x" % self.colours[i])
        return "\n".join(["[text]"] + text + ["[reverse]"] + rev + ["[colour]"] + col) + "\n"


def diff(expected, actual):
    """Lines that differ between two dumps, as readable report lines."""
    out = []
    section = ""
    row = 0
    for e, a in zip(expected.splitlines(), actual.splitlines()):
        if e.startswith("["):
            section, row = e, 0
            continue
        if e != a:
            out.append("%s row %2d: expected |%s|" % (section, row, e))
            out.append("%s         got      |%s|" % (" " * len(section), a))
        row += 1
    return out
