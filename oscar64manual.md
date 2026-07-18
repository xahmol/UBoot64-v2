# Oscar64 Compiler Reference — Fast-Retrieval Memory Bank

**Source:** `~/oscar64/` (wherever Oscar64 is cloned locally — see `OSCAR64_HOME`)  
**Tutorials (local):** `~/OscarTutorials/` (wherever the tutorials repo is cloned locally)  
**Online manual:** https://github.com/drmortalwombat/oscar64/blob/main/oscar64.md  
**Tutorials:** https://github.com/drmortalwombat/OscarTutorials

---

## Compiler Invocation

```
oscar64 [flags] source.c
```

### Output format flags (`-tf=`)

| Flag | Output |
|------|--------|
| `-tf=prg` | Commodore PRG (default) |
| `-tf=crt` | EasyFlash CRT (code expanded from bank 0) |
| `-tf=crt8` | Generic 8KB CRT (0x8000–0xa000, autostart) |
| `-tf=crt16` | Generic 16KB CRT (0x8000–0xc000, autostart) |
| `-tf=bin` | Raw binary |

### Target machine flags (`-tm=`)

| Flag | Machine / Range |
|------|----------------|
| `c64` | Commodore 64 (0x0800–0xa000) |
| `c128` | C128 (0x1c00–0xfc00) |
| `c128b` | C128 first 16KB (0x1c00–0x4000) |
| `c128e` | C128 first 48KB (0x1c00–0xc000) |
| `plus4` | PLUS4 (0x1000–0xfc00) |
| `vic20` | VIC20 no expansion (0x1000–0x1e00) |
| `vic20+3/+8/+16/+24` | VIC20 with expansion |
| `nes` / `nes_nrom_h` / `nes_nrom_v` / `nes_mmc1` / `nes_mmc3` | NES variants |
| `atari` | Atari 8-bit (0x2000–0xbc00) |
| `x16` | Commander X16 (0x0800–0x9f00) |
| `mega65` | Mega 65 (0x2000–0xc000) |
| `pet` / `pet16` / `pet32` | PET variants |

### Optimization flags

| Flag | Effect |
|------|--------|
| `-O0` | No optimization |
| `-O1` / `-O` | Default |
| `-O2` | Aggressive speed + auto inline |
| `-O3` | Most aggressive speed |
| `-Os` | Optimize for size |
| `-Oi` | Auto inline small functions |
| `-Oa` | Optimize inline assembler |
| `-Oz` | Auto-place globals in zero page |
| `-Op` | Optimize constant parameters |
| `-Oo` | Size optimization via outliner |
| `-Ox` | Optimize pointer arithmetic |

### Other flags

| Flag | Effect |
|------|--------|
| `-o=file` | Output filename |
| `-i=path` | Additional include path |
| `-ii=path` | Default include path |
| `-g` | Source-level debug info (`.lbl`, `.dbj`) |
| `-gp` | Debug with static profile data (`.csz`) |
| `-e` | Run in integrated emulator after compile |
| `-ep` | Run and profile in emulator |
| `-n` | Pure native code (default) |
| `-bc` | Bytecode for all functions |
| `-pp` | C++ mode |
| `-strict` | Strict ANSI C |
| `-v` / `-v2` | Verbose / more verbose |
| `-d64=file` | Create D64 disk image |
| `-f=file` | Add binary file to disk image |
| `-fz=file` | Add compressed binary file to disk image |
| `-dSYMBOL` | Define preprocessor symbol |
| `-D NAME=VALUE` | GCC-style symbol define |
| `-psci` | PETSCII encoding for all strings |
| `-xz` | Extended zero page usage |
| `-rt=file` | Alternative runtime library |
| `-rmp` | Generate error files on linker failure |
| `-cid=n` | Cartridge type ID (for VICE) |
| `-csub=n` | Cartridge sub-type |
| `-cname=s` | Cartridge name |

### Runtime defines (`-dSYMBOL`)

| Symbol | Effect |
|--------|--------|
| `NOFLOAT` | No float support in printf |
| `NOLONG` | No long support in printf |
| `HEAPCHECK` | Check heap alloc/free, jam if full |
| `NOBSSCLEAR` | Don't clear BSS on startup |
| `NOZPCLEAR` | Don't clear zero page BSS |

### Output files

| Extension | Contents |
|-----------|---------|
| `.prg` / `.crt` / `.bin` | Executable |
| `.map` | Memory region/section/object layout |
| `.asm` | Assembler listing with source refs |
| `.int` | Intermediate code listing |
| `.lbl` | VICE debugger labels |
| `.dbj` | Full JSON debug info (requires `-g`) |
| `.csz` | Annotated code size (requires `-gp`) |

---

## Language Extensions

### Storage class qualifiers

```c
__zeropage int x;         // Place global in zero page (0x80–0xff); no init, no kernel
__striped int arr[8];     // Layout bytes as LLLLHHHH instead of LHLHLHLH (fast indexed access)
__export char data[] = {}; // Force symbol into output even if unreferenced
__noinline void f(void);  // Prevent inlining
__forceinline void f(void); // Force inlining
__native void f(void);    // Compile to 6502 native code
```

### Interrupt handlers

```c
__interrupt void handler(void)     // Saves zero page registers
__hwinterrupt void irq(void)       // Saves CPU registers, exits with RTI
```

### Memory consistency

```c
*((volatile __memmap char *)0x01) = val;  // Prevents reordering around bank switching
```

### Compiler hints

```c
__assume(false)         // Mark unreachable
__assume(x < 10)        // Constrain value range for optimizer
__assume(p != nullptr)  // Non-null hint
```

### Dynamic stack

```c
__dynstack int setjmp(jmp_buf env);   // Function uses dynamic stack frame
```

### Bank queries

```c
int id = __bankof(function_name);   // Returns bank ID of function
int id = __bankof(0);               // Returns bank ID of calling code
```

---

## Pragma Directives

```c
#pragma compile("file.c")          // Add source to build (used in headers)
#pragma native(FunctionName)        // Compile function to native 6502
#pragma optimize(push)             // Save optimizer state
#pragma optimize(pop)              // Restore optimizer state
#pragma optimize(0|1|2|3|size|speed|inline|noinline|autoinline|asm|noasm|outline|nooutline|constparams|noconstparams)
#pragma unroll(full)               // Unroll following loop completely
#pragma unroll(page)               // Page-level unroll
#pragma align(name, N)             // Align variable/function to power-of-two boundary
#pragma section(name, bank_id)     // Define linker section
#pragma code(section_name)         // Place code in section
#pragma data(section_name)         // Place data in section
#pragma bss(section_name)          // Place BSS in section
#pragma region(name, start, end, flags, bank, {sections} [, runtime_addr])
#pragma overlay(name, id)          // Define overlay
#pragma stacksize(N)               // Set stack size in bytes
#pragma heapsize(N)                // Set heap size in bytes — MUST also list `heap` in region sections or malloc() returns NULL (heap goes to $10000)
#pragma reference(name)            // Force linker to include symbol
#pragma charmap(char, code [,count]) // Remap character constants
#pragma warning(disable: 2000,2001) // Suppress warnings
#pragma message("text")            // Compile-time message
#pragma callinline()               // Inline following call
```

---

## Inline Assembly

```c
__asm {
    lda variable       // local vars/params via zero page
    bne label
    jsr 0xffd2
label:
    nop
}

// Volatile (prevent optimization):
__asm volatile { lda #0 }

// Return value from asm:
char getchar(void) {
    return __asm { jsr 0xffcf; sta accu; lda #0; sta accu + 1 };
}

// Struct member offset:
__asm { ldy #MyStruct::member_name; sta (ptr),y }
```

Return values go in `accu` (bytes 0x00–0x03). Local variables and parameters are zero-page registers.

---

## Embedded Data (`#embed`)

```c
byte data[] = { #embed "file.bin" };
byte data[] = { #embed 4096 126 "file.bin" };          // limit, offset
char data[] = { #embed 2048 0 lzo "file.bin" };        // LZO compressed
char data[] = { #embed 2048 0 rle "file.bin" };        // RLE compressed
unsigned data[] = { #embed 2048 0 word "file.bin" };   // 16-bit words

// Charpad/CTM imports:
const char FloorChars[] = { #embed ctm_chars lzo "floortiles.ctm" };
const char tiles8[]     = { #embed ctm_tiles8 "file.ctm" };
const unsigned tiles16[]= { #embed ctm_tiles16 word "file.ctm" };
const char tilessw[]    = { #embed ctm_tiles8sw "file.ctm" };  // Reordered dims
const char map8[]       = { #embed ctm_map8 "file.ctm" };
const unsigned map16[]  = { #embed ctm_map16 word "file.ctm" };
const char attr[]       = { #embed ctm_attr1 "file.ctm" };

// Spritepad/SPD imports:
const char sprites[] = { #embed spd_sprites lzo "sprites.spd" };
const char tiles[]   = { #embed spd_tiles "sprites.spd" };
```

**Gotcha**: `#embed` is a preprocessor directive and must be the *only*
thing on its source line. `byte data[] = { #embed "file.bin" };` all on
one line mis-tokenizes the embedded byte stream (the compiler tries to
parse the binary's raw bytes as C source, producing a cascade of
"invalid token"/"Declaration starts with invalid token" errors whose
location is reported inside the .bin file). Always write:
```c
byte data[] = {
    #embed "file.bin"
};
```

**Gotcha**: if `malloc`/`free` are fully stubbed (e.g. a bare-metal
runtime where `crt_malloc` always returns NULL, no real heap ever used),
and `#embed`-ing enough data fills most of the `main` region, oscar64 can
fail with `error 3034: Cannot place heap section` even though the total
binary size is well under the region's nominal size — the heap section
still needs *some* room and a full code+data+bss leaves none. Fix: drop
`heap` from the region's section list (`#pragma region(main, ..., {code,
data, bss})` instead of `{code, data, bss, heap}`) once you've confirmed
nothing in the program actually allocates from it.

---

## Preprocessor Extensions

```c
#assign NAME expression      // Assign computed value to macro

// Repeat block:
#repeat
    arr[ry] = val;
#assign ry ry + 1
#until ry == 25
#undef ry

// Loop expansion:
#for(i, COUNT) expr_with_i,
// Example:
char * const ScreenRows[] = { #for(i, 25) Screen + 40 * i, };
```

---

## PETSCII / Screen Codes

```c
printf(p"Hello\n");    // p/P prefix = PETSCII string
char c = s'A';         // s/S prefix = screen code character
iocharmap(IOCHM_PETSCII_2);   // Switch console to PETSCII mode
#pragma charmap(97, 65, 26)   // Remap a-z to PETSCII uppercase
```

---

## Memory Model (C64 PRG default)

| Range | Purpose |
|-------|---------|
| 0x0080–0x00FF | Zero page (compiler regs, `__zeropage` vars) |
| 0x0801–0x0900 | Startup (BASIC header, bytecode stub) |
| 0x0900–0x0a00 | Bytecode interpreter jump table |
| 0x0a00–0xa000 | Main region: code → data → BSS → heap → stack |

Custom region example (use all RAM, no BASIC):
```c
#include <c64/memmap.h>
#pragma region(main, 0x0a00, 0xd000, , , {code, data, bss, heap, stack})
int main(void) { mmap_set(MMAP_NO_BASIC); }
```

---

## C++ Support

Supported: namespaces, references, member functions, constructors/destructors, operator overloading, single inheritance, const members, virtual functions, `new`/`delete`, templates, lambda, `auto`, range-for, `constexpr`, parameter packs, default parameters.

C++ headers in `include/opp/`: `array.h`, `vector.h`, `static_vector.h`, `list.h`, `string.h`, `hashmap.h`, `span.h`, `optional.h`, `slab.h`, `iostream.h`, `algorithm.h`, `utility.h`, `iterator.h`, `numeric.h`, `functional.h`, `bidxlist.h`, `boundint.h`, `ifstream.h`, `ofstream.h`, `sstream.h`.

Enable with `-pp` flag.

---

## Standard C Library (`include/`)

### Types (`stdint.h`, `c64/types.h`)

**Oscar64 type sizes and signedness (6502 target):**

| Type | Size | Signedness |
|---|---|---|
| `char` | 8-bit | **unsigned** — Oscar64 default; unlike ISO C! |
| `signed char` / `sbyte` | 8-bit | signed |
| `unsigned char` / `byte` | 8-bit | unsigned |
| `int` | 16-bit | signed |
| `unsigned int` / `word` | 16-bit | unsigned |
| `long` | 32-bit | signed |
| `unsigned long` / `dword` | 32-bit | unsigned |
| `intptr_t` | 16-bit | signed (= `int`) |
| `uintptr_t` | 16-bit | unsigned (= `unsigned int`) |

**Key gotcha:** `char` is unsigned by default in Oscar64. Loops like `for (char x = 0; x < 255; x++)` correctly iterate 255 times (x = 0..254). Code that stores PETSCII values (0–255) in plain `char` is safe. Use `signed char` or `sbyte` for values that must go negative.

```c
// stdint.h
int8_t, int16_t, int32_t
uint8_t, uint16_t, uint32_t
intptr_t, uintptr_t (= int, unsigned int on 6502)

// c64/types.h
byte   = unsigned char
word   = unsigned int
dword  = unsigned long
sbyte  = signed char
```

### `stdio.h`
`printf`, `sprintf`, `vprintf`, `vsprintf`, `scanf`, `sscanf`, `putchar`, `getchar`, `puts`, `gets`, `fopen`, `fclose`, `fread`, `fwrite`, `fprintf`, `fgetc`, `fputc`, `fgets`, `fputs`, `fseek`, `ftell`, `rewind`, `feof`

### `stdlib.h`
`malloc`, `free`, `calloc`, `realloc`, `heapfree` — Memory  
`rand`, `srand`, `lrand`, `lsrand` — Random  
`itoa`, `atoi`, `ftoa`, `atof`, `strtol`, `strtof` — Conversion  
`div`, `ldiv` — Division with remainder  
`exit`, `abort`

### `string.h`
`strcpy`, `strncpy`, `strcmp`, `strlen`, `strcat`, `strchr`, `strstr`, `strtok`  
`memcpy`, `memset`, `memcmp`, `memmove`, `memclr`, `memchr`

### `math.h`
`fabs`, `floor`, `ceil`, `sqrt`, `sin`, `cos`, `tan`, `asin`, `acos`, `atan`, `atan2`, `exp`, `log`, `log10`, `pow`, `isinf`, `isfinite`  
Constant: `PI = 3.141592653`  
Disable with `-dNOFLOAT` to save space.

### `fixmath.h` — Fixed-point math (no float)
`lmul16u/s`, `lmul16f16` — 16-bit multiply  
`lmul12f4s`, `lmul8f8s`, `lmul4f12s` — Fixed-point multiply  
`ldiv16u/s`, `ldiv16f16` — 16-bit divide  
`lmuldiv16u/s` — Combined multiply+divide  
`usqrt` — Integer square root

### `conio.h` — Console I/O
```c
// Colors: BLACK, WHITE, RED, CYAN, PURPLE, GREEN, BLUE, YELLOW,
//         ORANGE, BROWN, LT_RED, DARK_GREY, MED_GREY, LT_GREEN, LT_BLUE, LT_GREY
kbhit(), getch(), getchx(), putch()
clrscr(), gotoxy(), wherex(), wherey(), textcursor()
textcolor(), bgcolor(), bordercolor(), revers()
putpch(), getpch()   // raw PETSCII I/O
```

### `ctype.h`
`isctrnl`, `isprint`, `isspace`, `isblank`, `isgraph`, `ispunct`, `isalnum`, `isalpha`, `isupper`, `islower`, `isdigit`, `isxdigit`, `tolower`, `toupper`

### `time.h`
`clock_t clock(void)` — Returns elapsed time; `CLOCKS_PER_SEC = 60`

### `setjmp.h`
`int setjmp(jmp_buf env)`, `void longjmp(jmp_buf env, int value)`, `int setjmpsp(jmp_buf env, void *sp)`

### `oscar.h` — Decompression + debug
```c
oscar_expand_lzo(dst, src)      // Expand LZO in-place or to dst
oscar_expand_rle(dst, src)      // Expand RLE
oscar_expand_lzo_buf(dst, src)  // Expand LZO with stack buffer
breakpoint()                     // VICE debugger breakpoint
debugcrash()                     // Trigger debug crash
```

### `petscii.h` — Character remap
```c
#pragma charmap(97, 65, 26)   // a-z → PETSCII uppercase
#pragma charmap(65, 97, 26)   // A-Z → PETSCII lowercase
```

---

## C64 Hardware Libraries (`include/c64/`)

### `vic.h` — VIC-II

```c
extern struct VIC *vic;   // at 0xd000

// Display modes:
VICM_TEXT, VICM_TEXT_MC, VICM_TEXT_ECM, VICM_HIRES, VICM_HIRES_MC

// Colors: VCOL_BLACK, WHITE, RED, CYAN, PURPLE, GREEN, BLUE, YELLOW,
//         ORANGE, BROWN, LT_RED, DARK_GREY, MED_GREY, LT_GREEN, LT_BLUE, LT_GREY

void vic_setbank(byte bank);              // 0–3, sets CIA2 bits
void vic_setmode(VICMode mode, char *screen, char *charset);
void vic_sprxy(byte spr, int x, byte y);
void vic_sprgetx(byte spr) → int;
void vic_waitBottom(void);   // Wait for beam past last line
void vic_waitTop(void);      // Wait for beam before first line
void vic_waitFrame(void);    // Wait for full frame
void vic_waitLine(byte line);
void vic_waitBelow(byte line);
void vic_waitRange(byte from, byte to);
bool vic_isBottom(void);
void vic_waitFrames(int n);
```

Control register flags: `VIC_CTRL1_RSEL`, `VIC_CTRL1_DEN`, `VIC_CTRL1_BMM`, `VIC_CTRL1_ECM`, `VIC_CTRL1_RST8`  
`VIC_CTRL2_CSEL`, `VIC_CTRL2_MCM`, `VIC_CTRL2_RES`  
Interrupt flags: `VIC_INTR_RST`, `VIC_INTR_MBC`, `VIC_INTR_MMC`, `VIC_INTR_ILP`, `VIC_INTR_IRQ`

### `sid.h` — SID

```c
extern struct SID *sid;   // at 0xd400

// ADSR times:
// SID_ATK_2MS .. SID_ATK_8000MS (15 values)
// SID_DKY_6MS .. SID_DKY_24000MS (15 values)

// Waveforms:
CTRL_GATE, CTRL_SYNC, CTRL_RING, CTRL_TEST, CTRL_TRI, CTRL_SAW, CTRL_RECT, CTRL_NOISE

// Filter modes:
SID_FILTER_1, SID_FILTER_2, SID_FILTER_3
SID_FMODE_LP, SID_FMODE_BP, SID_FMODE_HP, SID_FMODE_3DB_OFF

// Clock references:
SID_CLOCK_PAL = 985248, SID_CLOCK_NTSC = 1022730
SID_CLKSCALE_PAL, SID_CLKSCALE_NTSC

// Note macros (octave 0–10):
NOTE_C(o), NOTE_CS(o), NOTE_D(o), NOTE_DS(o), NOTE_E(o), NOTE_F(o),
NOTE_FS(o), NOTE_G(o), NOTE_GS(o), NOTE_A(o), NOTE_AS(o), NOTE_B(o)

// SID voice struct:
// sid->v[0..2].freq, .pwm, .ctrl, .attdec, .susrel
```

### `sprites.h` — Hardware & Virtual Sprites

**Hardware sprites (0–7):**
```c
void spr_init(char *screen);           // Init, base in screen char area
void spr_set(byte spr, bool show, int x, byte y, byte img, byte color, bool xexp, bool yexp);
void spr_move(byte spr, int x, byte y);
void spr_show(byte spr, bool show);
void spr_image(byte spr, byte img);
void spr_color(byte spr, byte color);
void spr_expand(byte spr, bool x, bool y);
int  spr_posx(byte spr);
byte spr_posy(byte spr);
void spr_move16(byte spr, int x, int y);
```

**Virtual sprites (up to 16, multiplexed via raster IRQ):**
```c
void vspr_init(byte num);
void vspr_shutdown(void);
void vspr_screen(char *screen);
void vspr_set(byte spr, bool show, int x, byte y, byte img, byte color);
void vspr_move(byte spr, int x, byte y);
void vspr_movex(byte spr, int x);
void vspr_movey(byte spr, byte y);
void vspr_image(byte spr, byte img);
void vspr_color(byte spr, byte color);
void vspr_hide(byte spr);
void vspr_sort(void);      // Sort by Y — call before rirq_sort()
void vspr_update(void);    // Update frame — call before rirq_sort()
```

### `cia.h` — CIA1 & CIA2

```c
extern struct CIA *cia1;  // at 0xdc00
extern struct CIA *cia2;  // at 0xdd00

// CIA struct members:
// pra, prb  — Port A/B data
// ddra, ddrb — Data direction
// talo, tahi, tblo, tbhi — Timer A/B
// tod10, todsec, todmin, todhr — TOD clock
// sdr — Serial data register
// icr — Interrupt control / status
// cra, crb — Control register A/B

void cia_init(void);
```

### `joystick.h`

```c
extern sbyte joyx[2], joyy[2];   // Axis velocity (-1, 0, +1)
extern bool  joyb[2];             // Button state
void joy_poll(byte port);          // port 0 or 1
```

### `keyboard.h`

```c
extern char keyb_codes[128];       // PETSCII map (64 normal + 64 shifted)
extern char keyb_matrix[8];        // Raw keyboard matrix
extern char keyb_key;              // Currently pressed key

void keyb_poll(void);
bool key_pressed(char key);
bool key_shift(void);

// Scan codes: KSCAN_DEL, KSCAN_RETURN, KSCAN_CRSR_RIGHT, KSCAN_F7, ...
// Key codes: CSR_DOWN, CSR_RIGHT, F1–F8, HOME, RETURN, DELETE, etc.
// Qualifier: KSCAN_QUAL_SHIFT (0x80), KSCAN_QUAL_DOWN (own key-down bit)
```

### `rasterirq.h` — Raster Interrupt System

```c
// Up to 16 IRQ slots, each targeting a raster line

// Build an IRQ code block:
void rirq_build(RIRQCode *rc, byte size);     // Allocate static block
void rirq_alloc(RIRQCode *rc, byte size);     // Allocate dynamic

// Add operations to an IRQ block:
void rirq_write(RIRQCode *rc, byte slot, void *addr, byte data);
void rirq_call(RIRQCode *rc, byte slot, void (*fn)(void));
void rirq_addr(RIRQCode *rc, byte slot, void *addr);
void rirq_addrhi(RIRQCode *rc, byte slot, void *addr);
void rirq_data(RIRQCode *rc, byte slot, byte data);
void rirq_delay(RIRQCode *rc, byte cycles);

// Manage IRQ slots (0–15, sorted by raster line):
void rirq_set(byte slot, byte line, RIRQCode *rc);
void rirq_clear(byte slot);
void rirq_move(byte slot, byte line);

// Init variants:
void rirq_init(bool kernal);           // With or without kernal
void rirq_init_kernal(void);
void rirq_init_crt(void);
void rirq_init_memmap(void);

void rirq_start(void);                  // Enable IRQ system
void rirq_stop(void);
void rirq_sort(void);                   // Sort slots by line number
void rirq_wait(void);                   // Wait for IRQ pass
void rirq_wait_done(void);
```

### `reu.h` — RAM Expansion Unit (16 MB at 0xdf00)

```c
// REU at 0xdf00: Status, CMD, LADDR(2), RADDR(2), RBANK, LENGTH(2), IRQMASK, CTRL

int  reu_count_pages(void);                    // Detect installed RAM (in 64KB pages)
void reu_store(void *dst_reu, const void *src, unsigned len); // C64→REU
void reu_load(void *dst, const void *src_reu, unsigned len);  // REU→C64
void reu_fill(void *dst_reu, byte val, unsigned len);

// 2D transfers (stride for char-by-char or tile copying):
void reu_load2d(void *dst, unsigned dststride,
                const void *src_reu, unsigned srcstride,
                unsigned w, unsigned h);
void reu_load2dpage(void *dst, unsigned dststride,
                    const void *src_reu, unsigned srcpage,
                    unsigned w, unsigned h);

// Status flags: REU_STAT_IRQ, REU_STAT_EOB, REU_STAT_FAULT, REU_STAT_SIZE, REU_STAT_VERSION
// Command flags: REU_CMD_EXEC, REU_CMD_AUTO, REU_CMD_FF00
//                REU_CMD_STORE, REU_CMD_LOAD, REU_CMD_SWAP, REU_CMD_VERIFY
// IRQ masks: REU_IRQ_ENABLE, REU_IRQ_EOB, REU_IRQ_FAULT
```

**Gotcha (compiler regression, 2026-06-20 to at least 2026-07-05):** Oscar64
commit `3bbffe9` ("Improve `__memmap` storage modifier adherence for REU
usage") added a `__memmap` qualifier to `REU.cmd` in this header and rewrote
~900 lines of memory-mapped-I/O codegen in `NativeCodeGenerator.cpp`/
`InterCode.cpp`. Two follow-up commits shortly after (`b64db3b` "Fix some
`__memmap` inconsistencies", `abc65c3` "More `__memmap` corrections") show
this area was still being actively patched. Symptom: `reu_count_pages()`
returns 0 on real hardware where a REU is actually present and previously
detected fine — confirmed via A/B test (same project source, older vs newer
Oscar64 binary; only the newer one fails). If a project suddenly fails REU
detection/I/O on real hardware after only updating the Oscar64 toolchain (no
project source changes), suspect this area first — check `git log --oneline
-i --grep="reu\|memmap"` in the Oscar64 checkout, and compare its
last-commit date against the last known-good release date, before assuming a
regression in the calling project's own code.

**Root cause (confirmed via disassembly, `-O2`):** it is not a register
write-ordering issue. `reu_count_pages()`'s body — `volatile char c, d; ...;
reu_load(0, &d, 1); if (d == 0) { ... }` — gets miscompiled so the entire
`if (d == 0)` / `if (d == 0x47)` chain and the detection loop are dead-code
eliminated, and the function unconditionally falls through to `return 0`.
Confirmed by reading the generated `.asm`: the comparison and every branch
instruction for those `if`s are simply absent; the code goes straight from
the second `reu_load()`'s register writes to `STA ACCU+0/STA ACCU+1` with
the accumulator still holding a stale `0` from many instructions earlier.
The optimizer appears to conclude a `volatile` local written only through a
DMA-triggering side effect (never an explicit C-level store) doesn't need a
fresh read, and eliminates the comparison as trivially resolvable — an
interaction between the `__memmap`/byte-index-pointer-propagation passes
from the commits above and volatile-alias tracking for REU's `inline`
`reu_load`/`reu_store` wrappers. `#pragma optimize(push)/(0)/(pop)` scoped
around the call site does **not** fix it (verified) — the elimination
survives even at that pragma's disabled optimization level, so it isn't a
simple backend reordering choice.

**Confirmed workaround (no Oscar64/toolchain changes needed):** route the
probe byte through a real, `__noinline` function-call boundary before each
comparison — a genuine call the compiler cannot see through restores correct
codegen (verified: real `BEQ`/`BNE` branches reappear in the `.asm`, and the
probe correctly detects actual REU size on hardware again):
```c
__noinline char reu_probe_barrier(char v) { return v; }
// ... then compare `reu_probe_barrier(d)` instead of `d` directly ...
```
This only needs to wrap the comparison, not every access to the volatile.
Do not use a plain `volatile`-to-`volatile` assignment as the barrier
instead of a real call — that wasn't tested and, given the bug is in
volatile-alias tracking itself, a same-class miscompile is plausible; the
`__noinline` call-boundary approach is the one actually confirmed on
hardware. Applied in UBoot64-v2 as `uboot64_reu_count_pages()` in
`src/main.c` (project-local reimplementation of the library's
`reu_count_pages()`, since the library function itself can't be patched from
project source).

**Status as of Oscar64 commit `0808a62` (2026-07-18, v1.32.272):** still
broken. Pulled and rebuilt Oscar64 from `d0e1f5b` to `0808a62` (11 commits,
including "Improve cross block/function accu forwarding", "Optimize switch
branch cascade", "Fix loss of zp dependency when moving parameter passing
out of loop" — all plausibly-relevant codegen changes) and reverted the
workaround to retest: the exact same dead-code elimination reproduces
(verified via `.asm` — falls straight through to `return 0` again, no
branches). None of those 11 commits touched this. The `__noinline` barrier
workaround remains necessary; re-check against future Oscar64 updates before
assuming it's fixed upstream.

## Second confirmed instance: conditional row/position miscompilation

A second, structurally similar Oscar64 `-O2` codegen bug was found in the
same UBoot64-v2 session, in unrelated project code (`src/filebrowse.c`,
`browse_menu()` — a right-hand key-reference panel with several
`cwin_putat_string(&cw, 26, ++menuy, ...)` calls gated by runtime conditionals
like `if (fb_uci_mode)`/`if (inside_mount)`, where `menuy` accumulates via
`++menuy` across the conditionally-skipped blocks).

**Symptom:** later lines in the panel render at completely wrong rows —
observed on hardware as e.g. a "UCI mode" label overwriting "Cur Navigate"
several lines earlier than intended, with 5+ lines' worth of `++menuy`
increments seemingly vanishing between two adjacent-looking lines.

**Root cause (confirmed via disassembly):** at `-O2`, the compiler
precomputes multiple candidate row values into register-allocated temporaries
(`T5`-`T8` etc. in the `.asm` — one value per possible combination of the
runtime conditionals) instead of keeping `menuy` as a real, re-read/re-stored
variable. Something in how those candidate values get selected downstream is
wrong. At `#pragma optimize(0)` (or the equivalent whole-function scope),
codegen changes completely: `menuy` becomes an ordinary RAM variable
(`STA`/`LDA` at each step), and the correct row is used throughout — verified
both via `.asm` and on real hardware.

**Confirmed workaround:** wrap the affected function definition in
`#pragma optimize(push)` / `#pragma optimize(0)` / `#pragma optimize(pop)`
(whole-function scope, not just a call site — a call-site-only pragma did
not fix the REU case above, but a definition-scope pragma does fix this one,
since the miscompilation lives inside the function body itself here rather
than across an `inline` library boundary). Applied in UBoot64-v2 around
`browse_menu()` in `src/filebrowse.c`.

**Still present as of Oscar64 `0808a62`** (same retest procedure as above:
reverted the pragma, rebuilt, same wrong codegen reappeared in the `.asm`).

**Pattern to watch for in general:** both confirmed bugs in this Oscar64
build involve a value that is *conditionally* determined at runtime (a
volatile hardware readback in one case, an accumulated row counter across
`if`-gated increments in the other) and *used later* in the same function.
If code that "obviously" depends on a runtime condition behaves as if the
condition were resolved at compile time (branches vanish, or one branch's
value is used unconditionally), suspect this class of `-O2` bug before
assuming the C source is wrong. Diagnose via `.asm`; fix via `#pragma
optimize(0)` scoped to the smallest region that changes the codegen (function
definition, not call site, if a call-site scope doesn't work), or via an
`__noinline` call-boundary barrier if the affected value is a `volatile`
local rather than a whole function's control flow.

### `memmap.h` — Memory Mapping

```c
// Maps (value for 0x01 register):
MMAP_ROM       (0x37)  // BASIC + I/O + KERNAL (default)
MMAP_NO_BASIC  (0x36)  // I/O + KERNAL
MMAP_NO_ROM    (0x35)  // I/O only
MMAP_RAM       (0x30)  // All RAM
MMAP_CHAR_ROM  (0x31)  // CHAR ROM only
MMAP_ALL_ROM   (0x33)  // All ROM, no I/O

void mmap_trampoline(void);   // Install IRQ/NMI trampoline
char mmap_set(char pla);      // Change map, return previous
```

### `charwin.h` — Character Window

```c
typedef struct { ... } CharWin;   // Screen region with cursor state

void cwin_init(CharWin *w, char *screen, byte x, byte y, byte width, byte height);
void cwin_clear(CharWin *w);
void cwin_fill(CharWin *w, char ch, byte color);

// Cursor movement:
void cwin_cursor_left/right/up/down/forward/backward/newline(CharWin *w);

// Put/get character (with and without color):
void cwin_put_char(CharWin *w, char ch);
void cwin_put_char_color(CharWin *w, char ch, byte color);
void cwin_putat_char(CharWin *w, byte x, byte y, char ch);
void cwin_putat_char_color(CharWin *w, byte x, byte y, char ch, byte color);
char cwin_get_char(CharWin *w);
char cwin_getat_char(CharWin *w, byte x, byte y);

// Rectangle copy:
void cwin_put_rect(CharWin *w, byte x, byte y, byte width, byte height, char *data);
void cwin_get_rect(CharWin *w, byte x, byte y, byte width, byte height, char *data);

// Scrolling:
void cwin_scroll_left/right/up/down(CharWin *w);

// Console mode:
void cwin_console_init(CharWin *w, ...);
void cwin_console_printf(CharWin *w, const char *fmt, ...);
void cwin_console_edit_line(CharWin *w, char *buf, byte len);
```

### `kernalio.h` — Kernal File I/O

```c
// Error codes: KRNIO_OK, KRNIO_DIR, KRNIO_TIMEOUT, KRNIO_SHORT, KRNIO_LONG,
//              KRNIO_VERIFY, KRNIO_CHKSUM, KRNIO_EOF, KRNIO_NODEVICE
extern char krnio_pstatus[16];   // Per-device status

void krnio_setnam(const char *name);
void krnio_setnam_n(const char *name, byte len);
void krnio_setbnk(byte filebank, byte namebank);   // C128 only
bool krnio_open(byte lfn, byte device, byte sa);
void krnio_close(byte lfn);
byte krnio_status(void);
bool krnio_load(const char *name, byte device, void *dest);
bool krnio_save(const char *name, byte device, const void *src, unsigned len);
bool krnio_chkout(byte lfn);
bool krnio_chkin(byte lfn);
void krnio_clrchn(void);
void krnio_chrout(char c);
char krnio_chrin(void);
bool krnio_getch(byte lfn, char *c);
bool krnio_putch(byte lfn, char c);
int  krnio_write(byte lfn, const char *data, unsigned len);
int  krnio_read(byte lfn, char *data, unsigned len);
bool krnio_puts(byte lfn, const char *str);
bool krnio_gets(byte lfn, char *str, unsigned maxlen);
bool krnio_read_lzo(byte lfn, char *dst);
```

### `iecbus.h` — Low-Level IEC

```c
// Status: IEC_OK, IEC_EOF, IEC_QUEUED, IEC_ERROR, IEC_TIMEOUT, IEC_DATA_CHECK

int  iec_write(byte data);
int  iec_read(void);
void iec_atn(bool state);
void iec_talk(byte device, byte sa);
void iec_untalk(void);
void iec_listen(byte device, byte sa);
void iec_unlisten(void);
bool iec_open(byte device, byte sa, const char *name, byte len);
bool iec_close(byte device, byte sa);
int  iec_write_bytes(const char *data, unsigned len);
int  iec_read_bytes(char *data, unsigned len);
```

### `flossiec.h` — Fast IEC Loader

```c
// Build-time defines: FLOSSIEC_BORDER, FLOSSIEC_NODISPLAY, FLOSSIEC_NOIRQ,
//                     FLOSSIEC_CODE, FLOSSIEC_BSS

// Kernal mode:
void flosskio_init(byte device);
void flosskio_shutdown(void);
bool flosskio_open(byte sa, const char *name);
void flosskio_close(byte sa);
void flosskio_mapdir(floss_blk *blocks, byte count);

// Non-kernal mode:
void flossiec_init(byte device);
void flossiec_shutdown(void);
bool flossiec_open(byte sa, const char *name);
void flossiec_close(byte sa);

// Read:
bool flossiec_eof(void);
int  flossiec_get(void);
int  flossiec_get_lzo(void);                         // LZO compressed
int  flossiec_read(char *dst, unsigned len);
int  flossiec_read_lzo(char *dst, unsigned len);     // LZO compressed
```

### `mouse.h`

```c
extern sbyte mouse_dx, mouse_dy;   // Relative movement since last poll
extern bool  mouse_lb, mouse_rb;   // Button state

void mouse_init(byte port);
void mouse_arm(void);    // Arm potentiometer (wait 4ms for settle)
void mouse_poll(void);
```

### `easyflash.h`

```c
// EasyFlash at 0xde00
// Bits: EFCTRL_GAME, EFCTRL_EXROM, EFCTRL_MODE, EFCTRL_LED

// C++ template for bank-switched calls:
EFlashCall<fn>
```

### `asm6502.h` — Inline 6502 Assembler (runtime emit)

```c
// 45 opcodes: ASM_LDA, ASM_STA, ASM_LDX, ASM_STX, ASM_LDY, ASM_STY,
//             ASM_ADC, ASM_SBC, ASM_AND, ASM_ORA, ASM_EOR, ASM_CMP, ASM_CPX, ASM_CPY,
//             ASM_INC, ASM_DEC, ASM_ASL, ASM_LSR, ASM_ROL, ASM_ROR,
//             ASM_JMP, ASM_JSR, ASM_RTS, ASM_RTI, ASM_BRK,
//             ASM_BCC, ASM_BCS, ASM_BEQ, ASM_BNE, ASM_BMI, ASM_BPL, ASM_BVC, ASM_BVS,
//             ASM_SEC, ASM_CLC, ASM_SEI, ASM_CLI, ASM_NOP, ASM_TAX, ASM_TXA, ...

// Addressing modes:
asm_np(op)          // Implied
asm_ac(op)          // Accumulator
asm_im(op, imm)     // Immediate
asm_zp(op, addr)    // Zero page
asm_zx(op, addr)    // Zero page,X
asm_zy(op, addr)    // Zero page,Y
asm_ab(op, addr)    // Absolute
asm_ax(op, addr)    // Absolute,X
asm_ay(op, addr)    // Absolute,Y
asm_in(op, addr)    // Indirect
asm_ix(op, addr)    // (Indirect,X)
asm_iy(op, addr)    // (Indirect),Y
asm_rl(op, target)  // Relative branch
```

---

## C128 Libraries (`include/c128/`)

### `vdc.h` — VDC 80-column chip

```c
extern struct VDC *vdc;   // at 0xd600: addr, data registers

// 40+ VDC registers (VDCR_HTOTAL, VDCR_HDISPLAY, VDCR_VSYNC, VDCR_CTRL, ...)

void     vdc_reg(byte reg);                     // Select register
void     vdc_write(byte val);
byte     vdc_read(void);
void     vdc_reg_write(byte reg, byte val);     // Inline
byte     vdc_reg_read(byte reg);

void     vdc_mem_addr(unsigned addr);           // Set memory pointer
void     vdc_mem_write(byte val);
byte     vdc_mem_read(void);
void     vdc_mem_write_at(unsigned addr, byte val);
byte     vdc_mem_read_at(unsigned addr);
void     vdc_mem_write_buffer(unsigned addr, const char *buf, unsigned len);
void     vdc_mem_read_buffer(unsigned addr, char *buf, unsigned len);
```

### `mmu.h` — C128 MMU

```c
extern struct MMU  *mmu;   // at 0xff00: cr, bank0, bank1, bank14, bankx
extern struct XMMU *xmmu;  // at 0xd500: cr, pcr[4], mcr, rcr, page0, page1, vr

char mmu_set(char config);   // Change memory config, return previous
```

### `bank1.h` — C128 Bank 1 Access

```c
void bnk1_init(void);
byte     bnk1_readb(void *addr);
unsigned bnk1_readw(void *addr);
unsigned long bnk1_readl(void *addr);
void     bnk1_readm(void *dst, const void *src, unsigned len);
void     bnk1_writeb(void *addr, byte val);
void     bnk1_writew(void *addr, unsigned val);
void     bnk1_writel(void *addr, unsigned long val);
void     bnk1_writem(void *dst, const void *src, unsigned len);
```

---

## PLUS4 Libraries (`include/plus4/`)

### `ted.h` — TED chip

```c
extern struct TED *ted;   // at 0xff00

// Display modes: TEDM_TEXT, TEDM_TEXT_MC, TEDM_TEXT_ECM, TEDM_HIRES, TEDM_HIRES_MC

void ted_setmode(TEDMode mode, char *screen, char *charset);
void ted_waitBottom(void);
void ted_waitTop(void);
void ted_waitFrame(void);
void ted_waitLine(byte line);

// Control flags: TED_CTRL1_RSEL, TED_CTRL1_DEN, TED_CTRL1_BMM, TED_CTRL1_ECM
//                TED_CTRL2_CSEL, TED_CTRL2_MCM, TED_CTRL2_RES, TED_CTRL2_NTSC, TED_CTRL2_INV
// Sound: TED_SND_SQUARE1, TED_SND_SQUARE2, TED_SND_NOISE2, TED_SND_DA
// Interrupt: TED_INTR_RST, TED_INTR_LPEN, TED_INTR_CNT1, TED_INTR_CNT2, TED_INTR_CNT3, TED_INTR_IRQ
```

---

## NES Libraries (`include/nes/`)

### `nes.h` — NES PPU / APU registers

```c
extern struct PPU  *ppu;   // at 0x2000
extern struct NESIO *nesio; // at 0x4000

// PPU control: NT_0/1/2/3, INC_1/32, SPR_0/1, BG_0/1, NMI
// PPU mask: GREYSCALE, BG8, SPR8, BG_ON, SPR_ON, EM_RED, EM_GREEN, EM_BLUE
// APU: square channels (volume, sweep, freq), triangle, noise, DMC
```

### `neslib.h` — Shiru's NES library

```c
// Palette:
void pal_all(const char *p);      // 32 bytes
void pal_bg(const char *p);       // 16 bytes
void pal_spr(const char *p);      // 16 bytes
void pal_col(byte idx, byte val);
void pal_clear(void);
void pal_bright(byte lvl);

// PPU:
void ppu_wait_nmi(void);
void ppu_wait_frame(void);        // 50Hz normalized
void ppu_off(void);
void ppu_on_all(void);
void ppu_on_bg(void);
void ppu_on_spr(void);

// Sprites / OAM:
void oam_clear(void);
void oam_size(byte size);          // OAM_SIZE_8 or OAM_SIZE_16
void oam_spr(byte x, byte y, byte tile, byte attr, byte id);
void oam_meta_spr(byte x, byte y, const byte *metaspr);
void oam_hide_rest(byte from);

// Audio:
void music_play(byte song);
void music_stop(void);
void music_pause(bool pause);
void sfx_play(byte sfx, byte channel);
void sample_play(byte sample);

// Input:
byte pad_poll(byte pad);
byte pad_trigger(byte pad);
byte pad_state(byte pad);
// Bits: PAD_A, PAD_B, PAD_SELECT, PAD_START, PAD_UP, PAD_DOWN, PAD_LEFT, PAD_RIGHT

// Scrolling:
void scroll(unsigned x, unsigned y);
void split(unsigned x, unsigned y);

// CHR banking:
void bank_spr(byte bank);
void bank_bg(byte bank);

// Random:
byte     rand8(void);
unsigned rand16(void);
void     set_rand(unsigned seed);

// VRAM (rendering off):
void vram_adr(unsigned adr);
void vram_put(byte val);
void vram_fill(byte val, unsigned len);
void vram_inc(byte inc);
void vram_read(unsigned adr, char *buf, unsigned len);
void vram_write(unsigned adr, const char *buf, unsigned len);
void vram_unrle(const char *data);
void vram_unlz4(const char *data, unsigned adr);

// VRAM update buffer (rendering on):
void set_vram_update(byte *buf);
void flush_vram_update(byte *buf);
// Buffer format: MSB, LSB, BYTE for single; MSB|NT_UPD_HORZ/VERT, LSB, LEN, [bytes] for run

// Nametable address macros:
NTADR_A(x,y), NTADR_B(x,y), NTADR_C(x,y), NTADR_D(x,y)
NAMETABLE_A=0x2000, NAMETABLE_B=0x2400, NAMETABLE_C=0x2800, NAMETABLE_D=0x2c00
```

### `mmc1.h` — NES MMC1 Mapper

```c
void mmc1_reset(void);
void mmc1_config(byte mirror, byte prg, byte chr);
void mmc1_bank_prg(byte bank);
void mmc1_bank_chr0(byte bank);
void mmc1_bank_chr1(byte bank);
// Mirror: MMC1M_LOWER/UPPER/VERTICAL/HORIZONTAL
// PRG: MMC1P_32K, 32Kx, 16K_UPPER, 16K_LOWER
// CHR: MMC1C_8K, 4Kx
```

### `mmc3.h` — NES MMC3 Mapper

```c
void mmc3_reset(void);
void mmc3_config(byte prg, byte chr);
void mmc3_bank(byte reg, byte bank);
void mmc3_bank_prg(byte slot, byte bank);   // slot 0/1
void mmc3_bank_chr0(byte slot, byte bank);  // slot 0–2 (2K)
void mmc3_bank_chr1(byte slot, byte bank);  // slot 0–1 (1K)
extern byte mmc3_shadow[];
// Regs: MMC3B_CHR0-5, MMC3B_PRG0-1
```

---

## Commander X16 Libraries (`include/cx16/`)

### `vera.h` — VERA chip

```c
extern struct VERA *vera;  // at 0x9f20

// Address control: VERA_ADDRH_DECR, VERA_ADDRH_INC (step options)
// Control: VERA_CTRL_RESET, VERA_CTRL_DCSEL, VERA_CTRL_ADDRSEL
// IRQ: VERA_IRQ_LINE_8, VERA_IRQ_AFLOW, VERA_IRQ_SPRCOL, VERA_IRQ_LINE, VERA_IRQ_VSYNC
// Sprite sizes: 8x8, 16x16, 32x32, 64x64
// Sprite priority: VSPRPRIO_OFF, BACK, MIDDLE, FRONT

void vram_addr(unsigned long adr, byte step);
void vram_addr0(unsigned long adr, byte step);
void vram_addr2(unsigned long adr, byte step);
void vram_put(byte val);
void vram_putw(unsigned val);
byte vram_get(void);
unsigned vram_getw(void);
void vram_put_at(unsigned long adr, byte val);
byte vram_get_at(unsigned long adr);
void vram_putn(unsigned long adr, const char *buf, unsigned len);
void vram_getn(unsigned long adr, char *buf, unsigned len);
void vram_fill(unsigned long adr, byte val, unsigned len);

void vera_spr_set(byte id, bool show, int x, int y, byte img, byte pal, byte size);
void vera_spr_flip(byte id, bool xflip, bool yflip);
void vera_spr_move(byte id, int x, int y);
void vera_spr_image(byte id, byte img);
void vera_pal_put(byte idx, unsigned color);
unsigned vera_pal_get(byte idx);
void vera_pal_putn(byte idx, const unsigned *colors, byte n);
void vera_pal_getn(byte idx, unsigned *colors, byte n);

#define VERA_COLOR(r,g,b)  // Pack 4-4-4 RGB into 16-bit
```

---

## VIC20 Libraries (`include/vic20/`)

### `vic.h` — VIC chip

```c
extern struct VICI *vici;  // at 0x9000
// Members: hpos, vpos, ncols, nrows, beam, mempos,
//          hlpen, vlpen, xpaddle, ypaddle, oscfreq[4], volcol, color
```

---

## Graphics Libraries (`include/gfx/`)

### `bitmap.h` — Hires Bitmap

```c
typedef struct { char *data; byte cwidth, cheight; unsigned pwidth; } Bitmap;
typedef struct { int left, top, right, bottom; } ClipRect;

// BlitOp: SET, RESET, NOT, XOR, OR, AND, AND_NOT, COPY, NCOPY, PATTERN, PATTERN_AND_SRC
// LineOp: SET, OR, AND, XOR
// NineShadesOfGrey[9][8] — dithering patterns

Bitmap * bm_alloc(int w, int h);
void     bm_free(Bitmap *bm);
void     bm_init(Bitmap *bm, char *data, int w, int h);
void     bm_fill(Bitmap *bm, byte pattern);

// Pixels:
void bm_set(Bitmap *bm, int x, int y);
void bm_clr(Bitmap *bm, int x, int y);
bool bm_get(Bitmap *bm, int x, int y);
void bm_put(Bitmap *bm, int x, int y, bool v);

// Lines:
void bmu_line(Bitmap *bm, int x0, int y0, int x1, int y1, byte pat, LineOp op);
void bm_line(Bitmap *bm, const ClipRect *cr, int x0, int y0, int x1, int y1, byte pat, LineOp op);

// Rectangles:
void bm_rect_fill(Bitmap *bm, const ClipRect *cr, int x, int y, int w, int h, byte pat, BlitOp op);
void bm_rect_clear(Bitmap *bm, const ClipRect *cr, int x, int y, int w, int h);
void bm_rect_pattern(Bitmap *bm, const ClipRect *cr, int x, int y, int w, int h, byte pat);
void bm_rect_copy(Bitmap *bm, const ClipRect *cr, int sx, int sy, int dx, int dy, int w, int h);

// Shapes:
void bm_circle_fill(Bitmap *bm, const ClipRect *cr, int cx, int cy, int r, byte pat, BlitOp op);
void bm_trapezoid_fill(Bitmap *bm, const ClipRect *cr, long x0, long x1, long dx0, long dx1, int y0, int y1, byte pat, BlitOp op);
void bm_triangle_fill(Bitmap *bm, const ClipRect *cr, int x0, int y0, int x1, int y1, int x2, int y2, byte pat, BlitOp op);
void bm_quad_fill(Bitmap *bm, const ClipRect *cr, ...);
void bm_polygon_fill(Bitmap *bm, const ClipRect *cr, const int *pts, byte n, byte pat, BlitOp op);   // convex
void bm_polygon_nc_fill(Bitmap *bm, const ClipRect *cr, const int *pts, byte n, byte pat, BlitOp op); // arbitrary

// Blitting:
void bmu_bitblit(Bitmap *dst, int dx, int dy, const Bitmap *src, int sx, int sy, int w, int h, BlitOp op);
void bm_bitblit(Bitmap *dst, const ClipRect *cr, int dx, int dy, const Bitmap *src, int sx, int sy, int w, int h, BlitOp op);

// Text:
void bmu_text(Bitmap *bm, int x, int y, const char *s, byte color);
void bm_put_string(Bitmap *bm, const ClipRect *cr, int x, int y, const char *s);
unsigned bmu_text_size(const char *s);

// Transform (rotation/scale):
void bm_transform(Bitmap *dst, const ClipRect *cr, int cx, int cy, const Bitmap *src, int sx, int sy, const int *matrix2x2, BlitOp op);
```

### `mcbitmap.h` — Multicolor Bitmap

```c
// MixedColors[4][4][8] — multicolor dithering patterns

void bmmc_put(Bitmap *bm, int x, int y, byte color);
byte bmmc_get(Bitmap *bm, int x, int y);

void bmmcu_line(Bitmap *bm, int x0, int y0, int x1, int y1, byte color);
void bmmc_line(Bitmap *bm, const ClipRect *cr, int x0, int y0, int x1, int y1, byte color);
void bmmcu_circle(Bitmap *bm, int cx, int cy, int r, byte color);
void bmmc_circle(Bitmap *bm, const ClipRect *cr, int cx, int cy, int r, byte color);
void bmmc_circle_fill(Bitmap *bm, const ClipRect *cr, int cx, int cy, int r, byte pat, byte color);

void bmmc_trapezoid_fill(Bitmap *bm, const ClipRect *cr, long x0, long x1, long dx0, long dx1, int y0, int y1, byte color);
void bmmc_triangle_fill(Bitmap *bm, const ClipRect *cr, int x0, int y0, int x1, int y1, int x2, int y2, byte color);
void bmmc_quad_fill(Bitmap *bm, const ClipRect *cr, ...);
void bmmc_polygon_fill(Bitmap *bm, const ClipRect *cr, const int *pts, byte n, byte color);    // convex
void bmmc_polygon_nc_fill(Bitmap *bm, const ClipRect *cr, const int *pts, byte n, byte color); // arbitrary
void bmmc_flood_fill(Bitmap *bm, const ClipRect *cr, int x, int y, byte color);

void bmmcu_rect_fill(Bitmap *bm, int x, int y, int w, int h, byte color);
void bmmcu_rect_pattern(Bitmap *bm, int x, int y, int w, int h, byte pat, byte color);
void bmmcu_rect_copy(Bitmap *bm, int sx, int sy, int dx, int dy, int w, int h);
void bmmc_rect_fill(Bitmap *bm, const ClipRect *cr, int x, int y, int w, int h, byte color);
void bmmc_rect_pattern(Bitmap *bm, const ClipRect *cr, int x, int y, int w, int h, byte pat, byte color);
void bmmc_rect_copy(Bitmap *bm, const ClipRect *cr, int sx, int sy, int dx, int dy, int w, int h);
```

**Known issue:** `mcbitmap.h` — multicolor pixel coordinates are char-cell based; x must be passed as `x*2` when working in pixel space from a hires context. (This bit me in UltimateDemo2026 fractal code.)

### `vector3d.h` — 3D Math

```c
// All operations inline for 6502 performance

// Types: Vector2 (float[2]), Matrix2 (float[4])
//        Vector3 (float[3]), Matrix3 (float[9])
//        Vector4 (float[4]), Matrix4 (float[16])
//        F12Vector3 (int[3]), F12Matrix3 (int[9])  ← fixed-point 4.12

// Vector3 key ops:
void   vec3_set(Vector3 v, float x, float y, float z);
void   vec3_copy(Vector3 dst, const Vector3 src);
void   vec3_add(Vector3 dst, const Vector3 a, const Vector3 b);
void   vec3_sub(Vector3 dst, const Vector3 a, const Vector3 b);
void   vec3_scale(Vector3 dst, const Vector3 v, float s);
float  vec3_dot(const Vector3 a, const Vector3 b);
void   vec3_cross(Vector3 dst, const Vector3 a, const Vector3 b);
float  vec3_length(const Vector3 v);
float  vec3_distance(const Vector3 a, const Vector3 b);
void   vec3_norm(Vector3 v);
void   vec3_project(Vector2 dst, const Matrix4 m, const Vector3 v);  // 3D→2D

// Matrix3 key ops:
void mat3_ident(Matrix3 m);
void mat3_mmul(Matrix3 dst, const Matrix3 a, const Matrix3 b);
void mat3_set_rotate_x/y/z(Matrix3 m, float angle);
void mat3_rotate_x/y/z(Matrix3 m, float angle);
void mat3_invert(Matrix3 dst, const Matrix3 src);
float mat3_determinant(const Matrix3 m);

// Matrix4 key ops:
void mat4_ident(Matrix4 m);
void mat4_mmul(Matrix4 dst, const Matrix4 a, const Matrix4 b);
void mat4_perspective(Matrix4 m, float fov, float aspect, float near, float far);
void mat4_translate(Matrix4 m, float x, float y, float z);
void mat4_scale(Matrix4 m, float x, float y, float z);

// Fixed-point 4.12 (faster, no FPU):
void f12mat3_ident(F12Matrix3 m);
void f12mat3_mmul(F12Matrix3 dst, const F12Matrix3 a, const F12Matrix3 b);
void f12mat3_set_rotate_x/y/z(F12Matrix3 m, int angle);  // angle in fixed-point radians
void f12vec3_mmul(F12Vector3 dst, const F12Matrix3 m, const F12Vector3 v);
```

### `tinyfont.h`

```c
extern const byte TinyFont[];   // Small bitmap font data for bm_put_string()
```

---

## Audio Libraries (`include/audio/`)

### `sidfx.h` — SID Sound Effects

```c
typedef struct {
    word freq, pwm;
    byte ctrl, attdec, susrel;  // current SID values
    int  dfreq, dpwm;           // per-frame deltas
    byte time1, time0;          // timing counters
    byte priority;
} SIDFX;

void sidfx_init(void);          // Init 3-channel SFX system
void sidfx_play(byte ch, const SIDFX *fx, byte count);
void sidfx_stop(byte ch);
bool sidfx_idle(byte ch);
byte sidfx_cnt(byte ch);
void sidfx_loop(void);          // Update — call once per game loop
void sidfx_loop_2(void);        // Alternate update variant
```

---

## C++ Library (`include/opp/`)

Quick reference of key templates:

| Header | Template | Key methods |
|--------|----------|------------|
| `array.h` | `array<T,N>` | `size()`, `at()`, `[]`, `begin/end`, `fill()` |
| `vector.h` | `vector<T>` | `push_back()`, `pop_back()`, `resize()`, `reserve()`, `emplace_back()`, `insert()`, `erase()` |
| `static_vector.h` | `static_vector<T,N>` | Same as vector but fixed max capacity |
| `list.h` | `list<T>` | `push/pop_front/back()`, `insert()`, `erase()`, iterator |
| `string.h` | `string` | `+=`, `+`, `find()`, `substr()`, `to_int()`, `to_string()` |
| `hashmap.h` | `hashmap<K,T>` | `at()`, `insert()`, `erase()`, `find()`, iterator |
| `span.h` | `span<T,N>` | `subspan()`, `first()`, `last()`, `[]` |
| `optional.h` | `optional<T>` | `operator bool()`, `operator*()`, `operator->()` |
| `slab.h` | `slab<T,N>` | `init()`, `alloc()`, `free()` — static slab allocator |
| `iostream.h` | `cin`/`cout` | `<<`, `>>`, `endl`, `setw()`, `setprecision()` |
| `algorithm.h` | — | `sort()`, `copy()`, `find()` |

---

## Sample Programs Reference (`samples/`)

| Directory | Key files | Demonstrates |
|-----------|-----------|-------------|
| `fractals/` | `mbhires.c`, `mbfixed.c`, `mbmulti.c`, `mbzoom.c` | Mandelbrot (float/fixed-point), zoom, multicolor |
| `hires/` | `bitblit.c`, `cube3d.c`, `fractaltree.c` | Blit ops, 3D wireframe, recursive tree |
| `hiresmc/` | `floodfill.c`, `func3d.c`, `paint.c` | Flood fill, 3D math surface, interactive paint |
| `sprites/` | `joycontrol.c`, `multiplexer.c`, `creditroll.c` | Basic sprites, virtual multiplexer, scrolling |
| `rasterirq/` | `colorbars.c`, `movingbars.c`, `autocrawler.c` | Raster IRQ color effects, crawler |
| `scrolling/` | `colorram.c`, `bigfont.c`, `cgrid8way.c` | Color RAM scroll, big font, 8-way grid |
| `games/` | `breakout.c`, `connectfour.c`, `hscrollshmup.c` | Complete games |
| `kernalio/` | `fileread.c`, `filewrite.c`, `diskdir.c`, `charread.c`, `hiresread.c` | Kernal file I/O, directory listing |
| `memmap/` | `allmem.c`, `charsetcopy.c`, `charsetexpand.c` | Memory banking, charset copy/modify |
| `particles/` | `fireworks_hires.c`, `fireworks_ptr.c`, `fireworks_stripe.c` | Particle effects |
| `stdio/` | `helloworld.c` | Basic printf usage |

---

## Common Patterns / Gotchas

### `#pragma compile` chains
Oscar64 follows `#pragma compile("x.c")` automatically — only `#include "x.h"` needed in your source; no per-file make rules required.

### Zero page for speed
Use `__zeropage` for hot globals (loop counters, current pointers). The `-Oz` flag automates this. Remember: no initialization at startup, incompatible with kernal.

### Volatile for hardware registers
Always declare hardware-mapped pointers as `volatile unsigned char *`. The compiler will otherwise optimize away repeated reads.

### Striped arrays for indexed access
```c
__striped struct Sprite sprites[16];
// Access sprites[i].x is sprites.x[i] in memory — no multiply needed
```

### `mcbitmap` coordinate system
Multicolor pixels are 2 horizontal screen pixels wide. `bmmc_*` functions take pixel coordinates where x is in multicolor units. When projecting from hires space, use `x/2` for mc functions. (Passing raw pixel x causes double-width rendering — see UltimateDemo2026 fractal fix.)

### Raster IRQ sort order
When using virtual sprites with raster IRQ: call `vspr_sort()` then `vspr_update()` then `rirq_sort()` — in that order, once per frame.

### Interrupt handlers
`__hwinterrupt` saves CPU registers and uses RTI. `__interrupt` saves zero page regs only. Use `__hwinterrupt` for CIA/VIC hardware IRQs; use `__interrupt` for software callbacks.

**Critical: never use `__interrupt` on a $0314 chain handler that ends with `jmp`.**
`__interrupt` generates a prologue that pushes all ZP pseudo-registers to the hardware
stack. If the function body ends with `__asm { jmp (saved_vector) }`, the epilogue
(PLA restores + RTS) is dead code — the JMP exits first. The KERNAL's `$EA7E` then
pops ZP garbage as A/X/Y; RTI jumps to a garbage address → crash.

Correct pattern for a $0314 chain handler:
```c
// Entry: __asm function (no C prologue/epilogue at all)
__asm modplay_irq
{
    lda $dc0d          // read + ack CIA1 ICR
    and #$01           // Timer A bit?
    beq irq_exit
    jsr modplay_tick   // __interrupt worker: saves ZP, runs, restores ZP, RTS
irq_exit:
    jmp (mod_saved_irq) // chain → $EA31 → $EA7E → RTI
}
// Worker: __interrupt (ZP save/restore, returns via RTS)
__interrupt void modplay_tick(void) { /* logic */ }
```
The `__asm` entry has zero C overhead. The `jsr/__interrupt/rts` trio is balanced
so the hardware stack is clean when JMP executes.

### D64 disk image
```
oscar64 main.c -d64=output.d64 -fz=resource.bin -f=uncompressed.bin
```
Embeds files into disk image alongside the compiled program.

### Inline vs native
Functions in hot inner loops: mark `__native` or `#pragma native(FuncName)`. For tiny helpers use `__forceinline`. The `-O2` flag auto-inlines based on size heuristic.

### Cast before struct-member-access via macro (parser bug)

`(type)macro.member` inside a `do { }` block (and possibly other contexts)
causes Oscar64 to emit "Struct expected" / "Unknown identifier" errors when
`macro` is defined as a dereferenced pointer, e.g. `#define vic (*((struct VIC *)0xd000))`.

**Broken:**
```c
do {
    unsigned char ln = (unsigned char)vic.raster;  // parse error
} while (...);
```

**Workaround 1** — drop the cast (works when the member type is already compatible):
```c
unsigned char ln;
do {
    ln = vic.raster;  // byte is already unsigned — no cast needed
} while (...);
```

**Workaround 2** — parenthesise the sub-expression:
```c
unsigned char ln = (unsigned char)(vic.raster);
```

**Root cause:** Oscar64 sees `(unsigned char) vic` and tries to parse `vic` as the
start of a new statement, then fails to find `.` as a valid token. Adding parens
around the struct access avoids the ambiguity.

### petscii.h charmap is global: always use hex for raw binary comparisons

`petscii.h` installs `#pragma charmap(97, 65, 26)` and `#pragma charmap(65, 97, 26)`,
swapping uppercase and lowercase characters. This pragma is **session-global**: once set
by any file in the `#pragma compile` chain, it affects every subsequently compiled file —
even those that don't include `petscii.h` directly.

Effect:
- `'A'`–`'Z'` compile to `0x61`–`0x7A` (PETSCII lowercase a-z)
- `'a'`–`'z'` compile to `0x41`–`0x5A` (PETSCII uppercase A-Z)
- Non-letter characters (digits, punctuation) are **unchanged**

Rule: any code that compares raw binary data against character literals will silently
produce wrong values and fail.

**Always use raw hex for binary comparisons:**
```c
// WRONG — 'M' compiles as 0x6D due to charmap
if (p[0] == 'M' && p[2] == 'K') ...

// CORRECT
if (p[0] == 0x4D && p[2] == 0x4B) ...  // M.K. magic bytes
```

For filesystem paths passed to UCI/uii_*() functions, use an identity charmap override:
```c
#pragma charmap(97, 97, 26)   // a-z → a-z (identity)
#pragma charmap(65, 65, 26)   // A-Z → A-Z (identity)
static char path[] = "/usb0/Dev/file.mod";
#pragma charmap(97, 65, 26)   // restore petscii.h
#pragma charmap(65, 97, 26)
```

String literals for screen display are **correct** with the charmap active — that is the
intended use of petscii.h.

**Real incident (UltimateDemo2026 2026-05-22):** MOD format detection compared `'M'`, `'K'`,
`'C'`, `'H'`, `'N'`, `'F'`, `'L'`, `'T'` against raw bytes from the REU. All failed silently.
"M.K." MODs were detected as 15-sample format, `sample_data_base` was 484 bytes too low,
all samples played wrong REU data → complete silence.

---

## Tutorial-Derived Techniques

### SID music from .sid file
Embed code section at SID load address using `#pragma region`; skip 0x7e-byte header with `#embed 0x2000 0x7e "song.sid"`. Call init at `+$0000`, play at `+$0003` via inline asm. Drive play from raster IRQ for independence from main loop. See tutorial 2000/2010.

### Raster IRQ turbo toggle
Use `rirq_write()` at line 250 to write 1 to `$d030` (turbo on), at line 49 to write 0 (turbo off). Keeps visible area at 1 MHz, gains speed in border/vblank. See tutorial 1425.

### rirq_call() — C function from IRQ
`rirq_call(&code, slot, fn)` emits JSR into raster IRQ block. `fn` must be `__interrupt`. Use for: vspr_update mid-frame, SID play, DMA trigger. See tutorial 2010, 1750.

### CORDIC algorithms (no FPU, fast)
Rotation table `{8192, 4836, 2555, 1297, 651, 326, 163, 81}` (16-bit) or `{32, 19, 10, 5, 3, 1}` (8-bit). 7–8 iterations for atan/sin/cos, 4 iterations for distance. Use `__striped` on table, `#pragma unroll(full)` on loop. Faster than float by >50%. See tutorials 4220–4290.

### CORDIC distance gain compensation
After 4 CORDIC iterations rotating to x-axis: result is `magnitude * CORDIC_GAIN`. Compensate: `return (ux + (ux >> 2) - (ux >> 6)) >> 1` (≈ × 0.6073). See tutorial 4290.

### Fractional sprite position
Store `pos << FRAC_BITS` (typically 4 bits = 1/16 px). Add fractional velocity each frame. Display `pos >> FRAC_BITS`. See tutorial 1340.

### Spread row updates for bitmap scroll
Divide 25 rows into 8 groups of ~3. Each frame update only the current group (indexed by fine_scroll_offset). Flip when fine offset wraps at 8. See tutorial 1245.

### Sprite-background pixel collision
`char_at_pixel(x,y) = Screen[40*(y>>3) + (x>>3)]`. Test four corners of sprite bounding box. For circles, test distance from sprite center to char-cell center. See tutorials 1600–1630.

### Per-tile color from ctm_attr1
`#embed ctm_attr1 "file.ctm"` gives 1 color byte per tile. For per-char: `Color[pos] = TileColors[charcode]`. See tutorials 1800–1810.

### CharPad full import set
`ctm_chars` (charset), `ctm_map8/16` (screen indices), `ctm_tiles8/16` (4×4 char tile defs), `ctm_tiles8sw` (reordered dims), `ctm_attr1` (per-tile color). All from one `.ctm` file. See tutorials 1140–1160.

### Spritepad import
`spd_sprites` (frame data), `spd_tiles` (tile data). Expand with `oscar_expand_lzo`. Animate with frame counter + `spr_image(i, base + frame)`. See tutorial 1380.

### Inlay levels (code overlays)
`#pragma section(icode0, 0)` + `#pragma region(isec0, 0xc000, 0xd000, , Inlay0, {icode0})` compiles a section into a constant. `oscar_expand_lzo((char*)0xc000, Inlay0)` loads it at runtime. Multiple inlays share the same RAM window. See tutorial 4530.

### Large memory layout patterns
- `MMAP_NO_BASIC`: gains 8 KB at 0x0800–0x9fff; use `#pragma region(main, 0x0880, 0xd000, ...)`
- `MMAP_RAM` + `mmap_trampoline()`: gains ~50 KB; needs separate stack region + trampoline before disabling kernal
- Resource regions: `#pragma section/region` to place const data at specific addresses
See tutorials 4500–4520.

### C++ double-buffer template clear
`template<int N> void clear() { #pragma unroll(page) for(int i=0; i<8000; i++) Hires[N][i]=0; }` — template instantiation generates absolute addressing per buffer, eliminating indirect overhead. See tutorial 5030.

### XOR animation (draw=erase)
`LINOP_XOR` in `bm_line` draws on first call, erases on second. No explicit clear needed. For delayed clear: save previous-frame vertices and XOR them on next frame. See tutorials 5000–5010.

### Virtual sprite order — canonical
Each frame: `vspr_sort()` → `rirq_wait()` → `vspr_update()` → `rirq_sort()`. Or: drive `vspr_update()` + `rirq_sort()` from `rirq_call()` in IRQ. See tutorials 1710, 1750.

### Tutorials local path
`~/OscarTutorials/` (wherever cloned) — numbered 0010–5030, Resources/ subfolder has .ctm/.spd/.sid/.bin assets.

---

## Non-C64 Bare-Metal Targets (e.g. Oric Atmos)

### Custom runtime via `-rt=file.c`

Replace Oscar64's default `crt.c` entirely with `-rt=include/oric_crt.c`. This means:
- No default startup code — you provide your own `__asm startup_name { ... }` + `#pragma startup(startup_name)`
- No default memory regions — you provide `#pragma region(...)` and `#pragma stacksize()`
- **All Oscar64 runtime symbols must still be provided**, even in native mode (`-n`): multiply, divide, float, malloc, free, bcexec, jmpaddr, breakpoint, etc.

### Providing the math/float runtime

When using `-rt=`, extract the math and float runtime routines from `oscar64/include/crt.c` into a separate file (e.g. `include/crt_math.c`) and `#pragma compile("crt_math.c")` from your custom runtime. Needed sections (by line range in crt.c):
- Lines ~390–1098: negation, unsigned/signed multiply/divide (negaccu, negtmp, divmod, mul16, mul16by8, mul32by8, mul32, divs16, etc.) + `#pragma runtime(mul16, ...)` etc.
- Lines ~2939–4164: float register ops (freg), float arithmetic (faddsub, crt_fmul, crt_fdiv, crt_fcmp), int↔float conversions, fround, store32/load32 + `#pragma runtime(fsplita, ...)` etc.
- Stub routines for bcexec, jmpaddr, crt_malloc, crt_free, crt_breakpoint (see below).

**`divu16by8` runtime required (oscar64 ≥ v1.32.272+41, Jun 2026):**
Oscar64 commit `5da792a` ("Optimize div/mod pairs") added a fast `uint16÷uint8` path
that emits `JSR divu16by8`. The standard `crt.c` gained a `DM8:` entry label inside
`__asm divmod` and `#pragma runtime(divu16by8, divmod.DM8)`. A custom `crt_math.c`
that was extracted before this commit will be missing both. Build fails with:
```
error 3002: Missing runtime code implementation 'divu16by8'
```
Fix: add a `DM8:` label before the existing `WB:` label in `__asm divmod`, and add
`#pragma runtime(divu16by8, divmod.DM8);` to the pragma block. The DM8 entry stores
the byte divisor from `A` into `tmp`, zero-extends to `tmp+1`, checks if the dividend
fits in a byte (branches to `BB`), then falls into the existing `WB` word/byte path.

**Do NOT include the bytecode handler wrappers** (`inp_*` functions that end with `jmp startup.exec`) — they reference labels inside the default startup block which won't exist in your custom runtime.

The `accu`, `tmp`, `tmpy`, `ip`, `addr`, `sp`, `fp` aliases must be defined in crt_math.c:
```c
#define tmpy  __tmpy
#define tmp   __tmp
#define ip    __ip
#define accu  __accu
#define addr  __addr
#define sp    __sp
#define fp    __fp
```

### bcexec / jmpaddr / malloc / free / breakpoint stubs

Oscar64 always requires these symbols. In native bare-metal mode, provide minimal stubs:
```c
__asm bcexec    { jmp (accu) }    // native-mode function call via accu
__asm jmpaddr   { jmp (addr) }    // indirect jump via addr register
__asm crt_malloc { lda #0; sta accu; sta accu + 1; rts }  // no heap → NULL
__asm crt_free   { rts }
__asm crt_breakpoint { rts }
#pragma runtime(bcexec, bcexec)
#pragma runtime(jmpaddr, jmpaddr)
#pragma runtime(malloc, crt_malloc)
#pragma runtime(free, crt_free)
#pragma runtime(breakpoint, crt_breakpoint)
```

### Inline asm syntax for non-ZP hardware addresses

In `__asm { }` inline blocks, absolute addresses above $FF require bracket notation:
```c
// WRONG — $ prefix only works for named asm blocks (addresses), NOT for immediates ever
lda #$0e         // error: End of line expected ($ invalid for immediates)
sta $030f        // error or wrong result in inline blocks

// CORRECT in inline __asm { }:
lda #14          // immediate: use decimal
lda #0x0e        // immediate: 0x prefix also works
sta [0x030f]     // absolute address > $FF: use [0xXXXX] bracket notation
lda [0x0300]
```

In **named** `__asm funcname { }` blocks, `$XX` IS valid for addresses but still NOT for immediates:
```c
__asm my_func {
    sta $0245    // OK: $ for addresses in named blocks
    lda #$0e     // STILL wrong — named blocks also reject $ for immediates
    lda #14      // correct
}
```

### `#pragma compile` path resolution

Oscar64 prepends the first `-i=` include path to any path given to `#pragma compile`. Absolute paths become broken: `include/ + /absolute/path`. To reference files outside the include directory, use a relative path from the include directory:
```c
// From include/oric_crt.c, with -i=include:
#pragma compile("crt_math.c")              // found as include/crt_math.c ✓
#pragma compile("../tools/helper.c")       // found as include/../tools/helper.c ✓
// #pragma compile("/absolute/path.c")     // BROKEN: becomes include//absolute/path.c ✗
```

### `#pragma compile` with multiple `-i=` paths and co-located header/source

With **two or more** `-i=` paths (e.g. `-i=include -i=src`), if a header and its
`.c` companion live together in a non-first `-i=` directory, a **plain
filename** in `#pragma compile("X.c")` still resolves correctly:
```c
// src/dir.h, with -i=include -i=src and src/dir.c present:
#pragma compile("dir.c")           // ✓ resolves to src/dir.c

// Adding a relative prefix BREAKS this case:
#pragma compile("../src/dir.c")    // ✗ error 3001: looks for src/src/dir.c
```
A co-located header/source pair keeps working with a plain filename even
after both are moved together into a directory that is not the first `-i=`
path — don't "fix" the pragma when relocating files together. Verified by
moving locifilemanager-v2's dir/file/drive/menu/input modules from
`include/` to `src/` (adding `-i=src`) and rebuilding cleanly across all
targets.

### Named asm blocks conflict with C prototypes

`__asm funcname { }` defines a function named `funcname`. If a C prototype `void funcname(void);` also exists, Oscar64 raises "Duplicate definition". Remove the prototype — named asm functions are directly callable from C without a prototype (the symbol is visible in the same translation unit).

### Memory layout for Oric Atmos

```c
// Stack: 512 bytes just below screen RAM ($BB80)
#pragma stacksize(0x0200)
#pragma region(stack, 0xB980, 0xBB80, , , {stack})

// Main program: $0500–$B980 (~46 KB, code+data+bss+heap)
#pragma region(main, 0x0500, 0xB980, , , {code, data, bss, heap})
```

Screen RAM: $BB80, 40×28, serial attributes at (byte & 0x60)==0. INK attr at col 0, PAPER attr at col 1 of each row. Characters 0x20–0x7F (note: $20 IS a character, not an attribute — unlike bit-6-based checks in older documentation). Overlay RAM $C000–$FFFF via MICRODISCCFG ($0314) = $FD; requires LOCI device; not testable in Oricutron.

### `va_arg` is broken in native mode (`-n`)

Oscar64's `stdarg.h` defines `va_arg` as:
```c
#define va_arg(list, mode) ((mode *)(list = (char *)list + sizeof(mode)))[-1]
```
The `[-1]` pointer subscript fails in native (`-n`) mode with **error 3016 "Array expected for indexing"**. Do **not** use `va_list` / `va_arg` / `va_start` / `va_end` in native-mode code.

**Correct pattern — mirrors Oscar64's own `stdio.c` `sformat` / `sprintf`:**

```c
// In the variadic function, get args via pointer arithmetic on last named param:
void my_printf(const char *fmt, ...)
{
    _my_vformat(fmt, (int *)&fmt + 1);  // skip past fmt to reach varargs
}

// Internal formatter takes int * instead of va_list:
static void _my_vformat(const char *fmt, int *fps)
{
    // consume args:
    int   ival = *fps++;              // integer arg
    char *sval = (char *)*fps++;      // string arg
    char  cval = (char)*fps++;        // char arg
}
```

`sizeof(int)` is 2 on 6502, so `fps++` advances 2 bytes per argument — correct for all
`int`-promoted types. Pointers are also 2 bytes, so `(char *)*fps++` works for string args.

For a function with non-pointer named params before `...` (e.g. `uint8_t x, uint8_t y`),
still use `(int *)&last_named_param + 1` where the last param is the one immediately before `...`:
```c
void cwin_putat_printf(OricCharWin *w, uint8_t x, uint8_t y, const char *fmt, ...)
{
    _cwin_vformat(pbuf, 80, fmt, (int *)&fmt + 1);  // fmt is last named param
}
```

### Native-mode preprocessor and expression gotchas

**`#if MACRO` vs `#ifdef MACRO` with `-d` defines**

When a macro is defined via the compiler `-d` flag (e.g. `-dLANG_FR`), Oscar64 defines it with
no value. `#if LANG_FR` then fails with **error 3032 "Invalid preprocessor token 'tk_eols'"**
because the expression evaluator sees an empty token stream.

Always use `#ifdef` (or `#ifndef`) when testing macros that may be defined via `-d`:
```c
// Wrong — fails when -dLANG_FR is passed:
#if LANG_FR
// Right:
#ifdef LANG_FR
```

**Cast-before-member precedence: `(type)struct.member`**

Oscar64 native mode parses `(uint16_t)MIA.xreg` as `((uint16_t)MIA).xreg` — applying the
cast to the whole struct before the member access. In standard C, `.` has higher precedence
than a unary cast, so this is a compiler bug.

Error produced: `error 3013: Struct expected` at the `.` position.

**Workaround:** use a temporary variable:
```c
// Wrong (Oscar64 parses cast before member access):
return (int16_t)((uint16_t)MIA.xreg << 8 | MIA.areg);
// Right:
uint8_t lo = MIA.areg;
uint8_t hi = MIA.xreg;
return (int16_t)((uint16_t)hi << 8 | (uint16_t)lo);
```

**Macro expanding to volatile read in for-loop body**

When a macro expands to a volatile struct member read (e.g. `#define mia_pop_char() (MIA.xstack)`)
and is used as the RHS of an assignment in a braces-free for-loop body, Oscar64 fails with
`error 3006: ';' expected` at the closing `}` of the surrounding block.

**Workaround:** use a braced for-loop body with an explicit temp variable:
```c
// Wrong:
for (i = 0; i < count; i++)
    buf[i] = mia_pop_char();     // macro expands to (MIA.xstack)
// Right:
for (i = 0; i < count; i++)
{
    uint8_t ch = MIA.xstack;    // read volatile directly into temp
    buf[i] = ch;
}
```

**Ternary with null pointer: `? ptr : 0`**

Oscar64 does not implicitly convert integer `0` to a pointer type in a ternary expression.
Error: `error 3013: Incompatible conditional types`.

**Workaround:** replace with `if`/`return`:
```c
// Wrong:
return (fd >= 0) ? &s_dir : 0;
// Right:
if (fd < 0) return 0;
return &s_dir;
```

**`-O2` whole-program register allocator: caller-save set can be under-counted**
(discovered locifilemanager-v2, 2026-06-10)

A function `F` that calls a chain of other functions can have its compiler-generated
prologue/epilogue save/restore set **under-counted** at `-O2` — i.e. it saves too few
zero-page bytes across the call, leaving some register that's actually live in one of
`F`'s callers unprotected. That caller's variable gets silently clobbered. Symptom:
stray garbage written to memory (e.g. screen RAM) at a position that tracks **runtime
state** (not a fixed location), even though the function `F` itself renders correctly.

This is an *emergent, whole-program* property — adding/removing as little as one
unrelated function call deep in `F`'s callee subtree (e.g. an extra `sprintf(...)`
in a leaf function, never on the path back to the affected caller) can flip the
save-set between drastically different sizes (e.g. 2 vs 13 bytes), in either
direction, fixing or worsening the corruption. `#pragma optimize(...)` on a callee
is equally unpredictable — it produced a third, even worse outcome in this case.
**There's no way to predict the effect without building and testing.**

**Diagnosis:** build with `-g`, find `F`'s label in the `.asm`, and look at its
prologue. A save loop looks like:
```
LDX #$0c
LDA T1+0,x
STA $bbXX,x    ; (F@stack + 0)
DEX
BPL ...
```
`LDX #$0c` saves 13 bytes. A suspiciously tiny save (1-2 bytes, or none) for a
function with a non-trivial callee subtree is a red flag. To confirm, build two
`-g` variants differing only in a small, functionally-inert way deep in the callee
subtree (toggle a debug call on/off) and diff `F`'s prologue between them — if the
save-set size changes and correlates with the visible bug, this is the cause.

**Fix pattern:** if a "dummy" call happens to produce the correct (larger) save-set,
keep it but make it harmless — e.g. redirect a debug `sprintf`'s destination buffer
from visible/important memory to unused scratch space (a spare region from the
`.map` file), changing only the 16-bit immediate constant so the instruction
*shapes* — and thus the register allocation — stay identical:
```c
// WORKAROUND for -O2 whole-program register-allocator under-count.
uint8_t *debug = (uint8_t *)0xA000;  // unused scratch RAM, never read
sprintf((char *)debug, "...", ...);
```
Do not remove such a call without re-testing the full UI — its removal can
silently re-break a caller's save-set. Full writeup with addresses/diffs:
`~/.claude/oscar64.md`.

**`-O2` drops a `bool`-returning function's return-value store into `accu`**
(discovered oricdemo2026, 2026-07-11)

A DIFFERENT `-O2` bug, also whole-program, also found via emulator RAM-dump +
PC-trace. Affects any function called through a stored function pointer
(a dispatch-table `tick(screen)` callback, in this case) whose implementation's
tail is `[call a void helper][load/compute a value][RTS]` with no other cleanup
in between: the compiler skips storing the result into `accu` — Oscar64's own
documented return-value location — leaving it only in the transient real A
register. If the CALLER reads the return value only after other code that
clobbers A (e.g. a pacing busy-wait between the call and the check — an
entirely ordinary, correct pattern), it silently reads stale garbage instead.
Symptom looks exactly like a hang/infinite-loop from the caller's side (nothing
ever advances past that dispatch call again), while the callee itself keeps
running correctly forever — confirmed via a temporary tick counter in the
callee that kept incrementing while the caller behaved as if told "finished"
on the very first call, always.

A sibling function in the same file, with the byte-for-byte identical
`return false;` source, was unaffected purely because it happens to need its
own stack-frame cleanup right before its `RTS` (it calls several sub-functions
needing arg marshaling) — generating that cleanup incidentally forces the
`accu` store too. The bug is present either way; it only shows up in whichever
sibling has nothing else going on right before its own `return`.

**What did NOT fix it**, in order (each confirmed still broken by re-checking
the `.asm`): a named local: same broken tail (constant-folded away). A
`static volatile bool`, unwritten elsewhere: `volatile` alone doesn't block
constant propagation for a provably-single-valued static; same tail. A
genuinely non-foldable runtime comparison (against a different file's
non-`static volatile` global mutated by an ISR): forced real comparison code,
but STILL omitted the `accu` store in both branches — confirms the bug is
about the tail *shape*, not about constant-foldability. A bare
`return __asm { lda #0; sta accu };`: Oscar64 traces even inline asm well
enough to prove it always yields 0, and reduces the whole function back to
the same broken constant-return codegen anyway.

**"Fix" that worked functionally but was CONFIRMED UNSAFE — do not use**:
`__asm volatile` writing all four `accu` bytes made the return value read
correctly (confirmed via a debug counter), but a LONGER real-time soak test
(hundreds of millions of cycles, not just a quick RAM-dump check) showed the
whole program eventually hanging anyway elsewhere — an unrelated
`__interrupt` music-tick handler ended up stuck or the CPU jumped into
unrelated DATA. Hand-writing compiler-internal scratch registers from inline
asm isn't safe just because it fixes the one read site you're targeting. The
actual safe fix: stop routing "finished" through a return value crossing any
intervening code at all — change the callback to `void` and signal
completion via a plain function call to a shared flag-setting helper
instead. Confirmed safe via a 1.5-billion-cycle (~25 real-minute) soak test
on both build targets. Practical implication: any dispatch-table callback
ending in `[void call][return simple/constant expr]` is a silent risk under
`-O2` — check every candidate handler's own compiled tail (look for a bare
`RTS` not preceded by an `accu` store), don't assume "if one handler's fine,
they all are," and never "fix" it with inline asm into `accu` — change the
calling convention instead.

**Whole-program allocator can silently break an UNRELATED `__interrupt`
handler when a normal function's own complexity changes** (discovered
oricdemo2026, 2026-07-11, follow-up investigation 2026-07-11)

A THIRD distinct whole-program `-O2` bug. Adding ANY per-row colour-varying
value to a normal (non-interrupt) function elsewhere in the program — an
array lookup, a divmod-free rewrite of the same lookup, that lookup
extracted to its own small helper, a plain `switch` instead of a lookup, or
even a version with NO time-varying state at all (a compile-time-constant
array indexed only by loop position) — reproducibly hung the WHOLE PROGRAM
after anywhere from under a minute to tens of minutes of real playback: an
unrelated Arkos Tracker music player's `__interrupt` 50Hz tick handler ends
up stuck forever, or the CPU jumps into unrelated DATA bytes and executes
them. Confirmed only via a real, long (hundreds of millions of cycles)
headless soak test — invisible in a short run or a single RAM-dump.

A follow-up session disproved the obvious theory ("same as the caller-save
under-count bug above"): a `-g` disassembly diff of the `__interrupt`
handler's own compiled prologue between a safe build and a hang-reproducing
build was BYTE-IDENTICAL (only unrelated data addresses differed) — this is
NOT a static save-set gap. It also requires an ACTUAL interrupt firing live
(proven safe for 400M+ cycles with the interrupt never registered) and
specifically needs the interrupt handler's own callee to process genuinely
time-varying real data, not merely "this code path runs" (forcing/
suppressing that callee in a degenerate, repetitive way was safe either
way) — a genuine runtime race, not a build-time code-shape defect. An
IRQ-level trace confirmed clean, regular ENTRY/RTI pairs right up to the
one that never returns, and — surprisingly — that fatal interrupt's own
landing point, and every other interrupt across the traced run, never fell
inside the offending function's own code at all; the eventual frozen PC sat
inside a legitimate, UNCORRUPTED BSS lookup table, meaning some JUMP/RETURN
target elsewhere had been corrupted to point there (consistent with a stray
write hitting the hardware stack, not a missing save). The exact
instruction responsible was not pinned down — that needs live
instruction-level tracing across millions of instructions to catch an
event that's evidently rare even when it does occur. Full writeup with
every experiment (both the original session's and the follow-up's) and
every disproved theory: `~/.claude/oscar64.md`. Safest known response:
revert to no time-varying per-row value at all — every alternate
implementation tried (across two full sessions) reproduced the same bug.

**RESOLVED** (third session, 2026-07-12): NOT a caller-save-set bug, NOT
an Arkos bug, NOT a bird-sprite bug (all directly checked and ruled out) —
a genuine Oscar64 **inliner** bug. A hand-written loop indexing a
`uint16_t` table by an 8-bit row value (`hires_row_off[y]`, this
project's `include/hires.c`) compiles CORRECTLY as a standalone `JSR`'d
function (each iteration resets the address's high byte to 0 before
re-doubling the row index), but when Oscar64 INLINES that same loop shape
directly into a caller — confirmed to happen for a call site with
literal-constant arguments — the inlined copy DROPS that reset, so every
iteration after the first doubles the row index against a STALE high
byte left over from the previous iteration's own (different) use of that
same zero-page cell, producing a wrong table-lookup address that misreads
an arbitrary on-screen byte as a row offset. This lands back in valid
VRAM by chance almost always (explaining 1.5B+ clean prior soak cycles on
"safe" builds — this bug was always latent, not introduced by the colour
change), but occasionally wraps past $FF into low memory when the
misread byte is large enough — in the traced case, landing on
`arkos_advance_pattern()`'s own compiled code and corrupting 2
instruction bytes with the very ink/paper values being painted, which is
why the symptom looked Arkos-shaped. **Fix**: `__noinline` on the
`set_rows()`-shaped helper forces every call site through the one
correctly-compiled body. Confirmed via disassembly (post-fix: plain `JSR`,
high-byte reset present) and a full soak-test re-run (100M-1.5B cycles,
both build targets, healthy progressing PC at every sample, `make
test`/`make test-disk` green) — the multi-colour raster bar now works.
Full mechanism/evidence trail: `~/.claude/oscar64.md`'s same entry.
**Practical takeaway**: if a hang's own symptom points at one subsystem
(here, Arkos) but every targeted check of that subsystem comes up clean,
diff the WHOLE PROGRAM's compiled function sizes (not just the suspected
function) between a safe and broken build — the one that actually changed
size here was nowhere near the suspected subsystem, and that's what
redirected the investigation to the real cause.

**Fourth session, third symptom shape (2026-07-12): documented fixes can
FAIL for this bug class, not just vary in effectiveness.**
`hb_polygon_fill()`'s own nested `for(py) for(px)` fill loop silently ran
only 149 of an expected 405 iterations (a 27x15 bounding box), zero of them
ever testing "inside" — confirmed by a temporary counter inside the loop,
gated on a known coordinate to isolate one call site, read back via
emulator RAM-dump. An ISOLATED call to the same function with the
IDENTICAL coordinates (in a small separate test fixture) ran all 405
iterations correctly — the function has no logic bug; only reachable from
deep in the real program's call graph did it misbehave, the same
"emergent, whole-program property" signature as the original entry above.
**Neither established fix worked**: `__noinline` on the function changed
nothing (it was already a real standalone `JSR`'d function, nothing to
prevent inlining); extracting its bounds-scan loop into its own
`__noinline static` helper (this section's own documented mitigation)
demonstrably changed the compiled code (binary size and disassembly both
differed) yet the loop still ran the exact same wrong iteration count.
**Practical takeaway**: this bug class can resist its own documented
workarounds at a given call site for reasons not yet understood. After one
honest attempt at each known fix, stop trying to out-guess the allocator —
route around the buggy call site instead (here: replaced a
`hb_triangle_fill`/`hb_polygon_fill` call with several simpler
`hb_rect_fill` calls, proven to work at that exact call site, accepting a
blockier visual result). Full write-up: `~/.claude/oscar64.md`'s same
entry family.

**Fifth session, fourth symptom shape (2026-07-12): a working function can
break when UNRELATED code is added elsewhere, and live per-tick counters
can produce false alarms.** A wireframe 3D mesh renderer (`hb_line()` in a
loop, driven by a per-tick state machine) was built and verified working,
then started rendering INTERMITTENTLY (sometimes correct, sometimes
entirely blank) purely because a second, unrelated new section was added
elsewhere in the same program — confirmed via deterministic VRAM reads
(not a live counter) at fixed cycle counts, so a real bug, not a
measurement artifact. Two false trails to watch for: (1) a screenshot
showing a PARTIAL render isn't necessarily a bug — an async/arbitrary-cycle
capture can legitimately catch a multi-line draw still mid-render; only a
blank or a stable wrong result across multiple independent settled samples
is real evidence. (2) A live, continuously-incrementing per-tick debug
counter sampled at an arbitrary cycle count can look exactly like the
symptom above purely because it's caught mid-computation — unlike a probe
gated on a one-time init call (which stays valid at any later sample), a
live per-tick value needs a genuinely settled capture (log it right after
the section's own tick-function call returns in the main loop) before
trusting it. **Real fix, once genuinely confirmed** via the settled-capture
technique: (1) replace the library's `hb_line()` with a local, `__noinline`
hand-written Bresenham calling `hb_set()`/`hb_clr()` directly, AND
(2) bracket the whole erase/recompute/draw sequence with
`hrirq_stop()`/`hrirq_start()` — the intermittent nature pointed at an
interrupt-timing collision (both fixes applied and verified together, not
proven individually necessary). **Practical takeaway**: this bug class's
"adding code elsewhere can flip a save-set" signature isn't limited to
build-time register-pressure changes — it can also show up as runtime,
timing-dependent intermittent failures once a large enough whole-program
change lands. Never treat a section as "done" just because it passed
verification once, in isolation — re-verify with the settled-sample
technique after each subsequent unrelated addition. Full write-up:
`~/.claude/oscar64.md`'s same entry family.

---

## Oric Atmos Project Library API (`include/charwin.h/c`)

Project-specific bare-metal character window library for the Oric Atmos.
Screen RAM at $BB80, 40×28, serial attributes. `OricCharWin` is the window struct.
Call `charwin_init()` once before any `cwin_*` function.

### Init / clear

```c
void charwin_init(void);                                 // build row table
void cwin_init(OricCharWin *w, sx, sy, wx, wy, ink, paper);
void cwin_clear(OricCharWin *w);                         // fill spaces + attrs, cx=cy=0
```

### Positional write/read (no cursor update)

```c
void cwin_putat_char(w, x, y, ch);
void cwin_putat_string(w, x, y, s);
void cwin_putat_printf(w, x, y, fmt, ...);
void cwin_putat_chars(w, x, y, chars, num);              // write N chars, clip at right edge
void cwin_putat_dblhi_string(w, x, y, s);               // double-height (rows y and y+1)
uint8_t cwin_getat_char(w, x, y);
void cwin_getat_chars(w, x, y, chars, num);              // read N chars (no NUL)
```

### Rectangle copy (chars only — no separate colour RAM on Oric)

```c
void cwin_get_rect(w, x, y, bw, bh, chars);  // copy bw×bh chars to flat buffer
void cwin_put_rect(w, x, y, bw, bh, chars);  // write flat buffer into bw×bh region
```
Buffer layout: row-major, `bw` bytes per row. Size = `bw * bh` bytes.

### Cursor-advancing write

```c
void cwin_put_char(w, ch);
void cwin_put_string(w, s);
void cwin_put_attr(w, attr);                             // for A_FWBLACK (NUL)
void cwin_put_chars(w, chars, num);                      // write exactly N chars
void cwin_printf(w, fmt, ...);
```

### Console mode (handles `\n`, wraps, scrolls)

```c
void cwin_console_put_char(w, ch);
void cwin_console_put_string(w, s);
void cwin_printwrap(w, str);                             // word-wrap into window
void cwin_printline(w, s);                               // put_string then newline
```

### Cursor movement

```c
void cwin_cursor_move(w, cx, cy);       // direct jump
bool cwin_cursor_left/right/up/down(w); // returns false at edge
bool cwin_cursor_forward(w);            // advance; wrap to (0, cy+1) at right edge
bool cwin_cursor_backward(w);           // retreat; wrap to (wx-1, cy-1) at left edge
bool cwin_cursor_newline(w);            // cx=0, cy++; returns false at last row (no scroll)
void cwin_cursor_show(w, on);           // inverse-video toggle
```

### Fill / scroll

```c
void cwin_fill_rect(w, x, y, bw, bh, ch);
void cwin_scroll_up(w);                 // shift content up 1 row, clear bottom
void cwin_scroll_down(w);               // shift content down 1 row, clear top
void cwin_scroll_left(w, by);           // shift all rows left `by` cols, clear right
void cwin_scroll_right(w, by);          // shift all rows right `by` cols, clear left
void cwin_insert_char(w);               // insert space at cursor, shift row right
void cwin_delete_char(w);               // delete char at cursor, shift row left
```

### Viewport (scrollable view into flat char buffer)

```c
void cwin_viewport_init(vp, sourcebase, sourcewidth, sourceheight, win);
void cwin_viewport_blit(vp);
void cwin_viewport_scroll(vp, KEY_UP/DOWN/LEFT/RIGHT);
```

### Key input / text widget

```c
uint8_t cwin_getch(void);
signed int cwin_textinput(w, x, y, vwidth, str, maxlen, validation);
// validation flags: VINPUT_ALL=0, VINPUT_NUMS=1, VINPUT_ALPHA=2, VINPUT_WILD=4
```

### Overlay RAM (LOCI required — not in Oricutron)

```c
void cwin_push(w);  // save window rows to overlay RAM (LIFO, max 8 levels)
void cwin_pop(w);   // restore from overlay RAM
```

### Printf format support

`%d` (int16), `%u` (uint16), `%x` (uint16 hex), `%s`, `%c`, `%%`, width+zero-fill (e.g. `%02u`). No floats (`-dNOFLOAT`). Max 79 formatted chars. Implemented via internal `_cwin_vformat` without `va_list` (Oscar64 native-mode `va_arg` is broken — see gotcha above).
