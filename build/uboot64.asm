; Compiled with 1.32.271
--------------------------------------------------------------------
verbosecounter:
4900 : __ __ __ BSS	1
--------------------------------------------------------------------
cfg:
4901 : __ __ __ BSS	99
--------------------------------------------------------------------
cw:
4964 : __ __ __ BSS	12
--------------------------------------------------------------------
vspriteScreen:
4970 : __ __ __ BSS	2
--------------------------------------------------------------------
linebuffer:
4972 : __ __ __ BSS	100
--------------------------------------------------------------------
uii_data:
49d6 : __ __ __ BSS	513
--------------------------------------------------------------------
uii_status:
4bd7 : __ __ __ BSS	257
--------------------------------------------------------------------
execute_keys:
4cd8 : __ __ __ BSS	10
--------------------------------------------------------------------
reudetected:
4ce2 : __ __ __ BSS	2
--------------------------------------------------------------------
uii_devinfo:
4ce4 : __ __ __ BSS	16
--------------------------------------------------------------------
menuselect:
4cf4 : __ __ __ BSS	1
--------------------------------------------------------------------
sorted:
4cf5 : __ __ __ BSS	1
--------------------------------------------------------------------
inside_mount:
4cf6 : __ __ __ BSS	1
--------------------------------------------------------------------
fb_uci_mode:
4cf7 : __ __ __ BSS	1
--------------------------------------------------------------------
previous:
4cf8 : __ __ __ BSS	4
--------------------------------------------------------------------
present:
4cfc : __ __ __ BSS	4
--------------------------------------------------------------------
execute_commands:
4d00 : __ __ __ BSS	200
--------------------------------------------------------------------
Slot:
4dc8 : __ __ __ BSS	1360
--------------------------------------------------------------------
iec_devices:
5318 : __ __ __ BSS	23
--------------------------------------------------------------------
krnio_pstatus:
532f : __ __ __ BSS	16
--------------------------------------------------------------------
DOSstatus:
533f : __ __ __ BSS	40
--------------------------------------------------------------------
pathdevice:
5367 : __ __ __ BSS	1
--------------------------------------------------------------------
presentdir:
5368 : __ __ __ BSS	281
--------------------------------------------------------------------
linebuffer2:
5481 : __ __ __ BSS	100
--------------------------------------------------------------------
bad_type:
54e5 : __ __ __ BSS	4
--------------------------------------------------------------------
HeapNode:
54e9 : __ __ __ BSS	4
--------------------------------------------------------------------
presentdirelement:
5500 : __ __ __ BSS	69
--------------------------------------------------------------------
devicetype:
5545 : __ __ __ BSS	31
--------------------------------------------------------------------
imagename:
5564 : __ __ __ BSS	51
--------------------------------------------------------------------
pathfile:
5597 : __ __ __ BSS	51
--------------------------------------------------------------------
pathbuffer:
5600 : __ __ __ BSS	256
--------------------------------------------------------------------
path:
5700 : __ __ __ BSS	408
--------------------------------------------------------------------
startup: ; startup
00:8000 : 09 80 __ ORA #$80
00:8002 : 09 80 __ ORA #$80
00:8004 : c3 __ __ INV
00:8005 : c2 __ __ INV
00:8006 : cd 38 30 CMP $3038 
00:8009 : a9 e7 __ LDA #$e7
00:800b : 85 01 __ STA $01 
00:800d : a9 2f __ LDA #$2f
00:800f : 85 00 __ STA $00 
00:8011 : a2 49 __ LDX #$49
00:8013 : a0 00 __ LDY #$00
00:8015 : a9 00 __ LDA #$00
00:8017 : 85 19 __ STA IP + 0 
00:8019 : 86 1a __ STX IP + 1 
00:801b : e0 58 __ CPX #$58
00:801d : f0 0b __ BEQ $802a ; (startup + 42)
00:801f : 91 19 __ STA (IP + 0),y 
00:8021 : c8 __ __ INY
00:8022 : d0 fb __ BNE $801f ; (startup + 31)
00:8024 : e8 __ __ INX
00:8025 : d0 f2 __ BNE $8019 ; (startup + 25)
00:8027 : 91 19 __ STA (IP + 0),y 
00:8029 : c8 __ __ INY
00:802a : c0 98 __ CPY #$98
00:802c : d0 f9 __ BNE $8027 ; (startup + 39)
00:802e : a9 00 __ LDA #$00
00:8030 : a2 f7 __ LDX #$f7
00:8032 : d0 03 __ BNE $8037 ; (startup + 55)
00:8034 : 95 00 __ STA $00,x 
00:8036 : e8 __ __ INX
00:8037 : e0 f7 __ CPX #$f7
00:8039 : d0 f9 __ BNE $8034 ; (startup + 52)
00:803b : a9 a2 __ LDA #$a2
00:803d : 85 23 __ STA SP + 0 
00:803f : a9 77 __ LDA #$77
00:8041 : 85 24 __ STA SP + 1 
00:8043 : 20 60 80 JSR $8060 ; (main.s4 + 0)
00:8046 : a9 4c __ LDA #$4c
00:8048 : 85 54 __ STA $54 
00:804a : a9 00 __ LDA #$00
00:804c : 85 13 __ STA P6 
00:804e : a9 19 __ LDA #$19
00:8050 : 85 16 __ STA P9 
00:8052 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
; 397, "/home/xahmol/git/UBoot64-v2/src/main.c"
.s4:
00:8060 : a9 37 __ LDA #$37
00:8062 : 85 01 __ STA $01 
00:8064 : 78 __ __ SEI
00:8065 : a2 ff __ LDX #$ff
00:8067 : 9a __ __ TXS
00:8068 : a2 05 __ LDX #$05
00:806a : 8d 16 d0 STA $d016 
00:806d : 20 a3 fd JSR $fda3 
00:8070 : 20 84 ff JSR $ff84 
00:8073 : a2 3c __ LDX #$3c
00:8075 : a0 03 __ LDY #$03
00:8077 : 86 b2 __ STX $b2 
00:8079 : 84 b3 __ STY $b3 
00:807b : a2 00 __ LDX #$00
00:807d : a0 a0 __ LDY #$a0
00:807f : 86 c1 __ STX $c1 
00:8081 : 8e 83 02 STX $0283 
00:8084 : 84 c2 __ STY $c2 
00:8086 : 8c 84 02 STY $0284 
00:8089 : a9 08 __ LDA #$08
00:808b : 8d 82 02 STA $0282 
00:808e : a9 04 __ LDA #$04
00:8090 : 8d 88 02 STA $0288 
00:8093 : 20 15 fd JSR $fd15 
00:8096 : 20 5b ff JSR $ff5b 
00:8099 : 58 __ __ CLI
00:809a : a9 0e __ LDA #$0e
00:809c : 20 d2 ff JSR $ffd2 
00:809f : a9 00 __ LDA #$00
00:80a1 : 8d 21 d0 STA $d021 
00:80a4 : a9 07 __ LDA #$07
00:80a6 : 8d 86 02 STA $0286 
00:80a9 : a2 00 __ LDX #$00
00:80ab : bd 05 81 LDA $8105,x ; (startmessage[0] + 0)
00:80ae : f0 06 __ BEQ $80b6 ; (main.s4 + 86)
00:80b0 : 20 d2 ff JSR $ffd2 
00:80b3 : e8 __ __ INX
00:80b4 : d0 f5 __ BNE $80ab ; (main.s4 + 75)
00:80b6 : a2 00 __ LDX #$00
.l8:
00:80b8 : bd 00 82 LDA $8200,x ; (fc3_exit.s4 + 0)
00:80bb : 9d 00 c0 STA $c000,x 
00:80be : ee 20 d0 INC $d020 
00:80c1 : e8 __ __ INX
00:80c2 : d0 f4 __ BNE $80b8 ; (main.l8 + 0)
.s5:
00:80c4 : 86 43 __ STX T0 + 0 
00:80c6 : a9 83 __ LDA #$83
00:80c8 : 85 44 __ STA T0 + 1 
.l6:
00:80ca : 86 1b __ STX ACCU + 0 
00:80cc : 18 __ __ CLC
00:80cd : 69 86 __ ADC #$86
00:80cf : 85 1c __ STA ACCU + 1 
00:80d1 : a0 00 __ LDY #$00
.l10:
00:80d3 : b1 43 __ LDA (T0 + 0),y 
00:80d5 : 91 1b __ STA (ACCU + 0),y 
00:80d7 : ee 20 d0 INC $d020 
00:80da : ad 20 d0 LDA $d020 
00:80dd : c8 __ __ INY
00:80de : d0 f3 __ BNE $80d3 ; (main.l10 + 0)
.s11:
00:80e0 : 84 43 __ STY T0 + 0 
00:80e2 : e6 44 __ INC T0 + 1 
00:80e4 : a5 44 __ LDA T0 + 1 
00:80e6 : c9 c0 __ CMP #$c0
00:80e8 : d0 e0 __ BNE $80ca ; (main.l6 + 0)
.l9:
00:80ea : bd 2f 81 LDA $812f,x ; (logo_sprite[0] + 0)
00:80ed : 9d 40 03 STA $0340,x 
00:80f0 : ee 20 d0 INC $d020 
00:80f3 : ad 20 d0 LDA $d020 
00:80f6 : e8 __ __ INX
00:80f7 : e0 40 __ CPX #$40
00:80f9 : 90 ef __ BCC $80ea ; (main.l9 + 0)
.s7:
00:80fb : 20 00 09 JSR $0900 
00:80fe : a9 00 __ LDA #$00
00:8100 : 85 1b __ STA ACCU + 0 
00:8102 : 85 1c __ STA ACCU + 1 
.s3:
00:8104 : 60 __ __ RTS
--------------------------------------------------------------------
startmessage:
00:8105 : __ __ __ BYT 73 54 41 52 54 49 4e 47 20 75 62 4f 4f 54 36 34 : sTARTING ubOOT64
00:8115 : __ __ __ BYT 2e 0d 0d 63 4f 50 59 49 4e 47 20 43 4f 52 45 20 : ...cOPYING CORE 
00:8125 : __ __ __ BYT 54 4f 20 72 61 6d 2e 0d 00 00                   : TO ram....
--------------------------------------------------------------------
logo_sprite:
00:812f : __ __ __ BYT 00 0f 80 00 10 40 00 10 40 00 13 80 00 12 00 00 : .....@..@.......
00:813f : __ __ __ BYT 3f 00 40 c0 c0 a3 00 30 94 00 18 9a ba 94 92 a2 : ?.@....0........
00:814f : __ __ __ BYT a2 52 bb a2 22 a8 a1 23 b8 a1 5c 00 22 93 00 22 : .R.."..#..\.".."
00:815f : __ __ __ BYT 88 c0 d4 94 3f 18 93 00 30 a0 c0 c0 40 3f 00 07 : ....?...0...@?..
--------------------------------------------------------------------
fc3_exit: ; fc3_exit()->void
;  13, "/home/xahmol/git/UBoot64-v2/include/fc3.h"
.s4:
00:8200 : a9 a7 __ LDA #$a7
00:8202 : 85 0f __ STA P2 
00:8204 : a9 c0 __ LDA #$c0
00:8206 : 85 10 __ STA P3 
00:8208 : 20 5e 12 JSR $125e 
00:820b : 20 25 14 JSR $1425 
00:820e : 78 __ __ SEI
00:820f : a9 70 __ LDA #$70
00:8211 : 8d ff df STA $dfff 
00:8214 : a2 ff __ LDX #$ff
00:8216 : 9a __ __ TXS
00:8217 : a2 05 __ LDX #$05
00:8219 : 8e 16 d0 STX $d016 
00:821c : 20 b3 fd JSR $fdb3 
00:821f : 20 84 ff JSR $ff84 
00:8222 : a9 00 __ LDA #$00
00:8224 : a8 __ __ TAY
00:8225 : 99 02 00 STA $0002,y 
00:8228 : 99 00 02 STA $0200,y 
00:822b : 99 00 03 STA $0300,y 
00:822e : c8 __ __ INY
00:822f : d0 f4 __ BNE $8225 ; (fc3_exit.s4 + 37)
00:8231 : a2 3c __ LDX #$3c
00:8233 : a0 03 __ LDY #$03
00:8235 : 86 b2 __ STX $b2 
00:8237 : 84 b3 __ STY $b3 
00:8239 : a2 00 __ LDX #$00
00:823b : a0 a0 __ LDY #$a0
00:823d : 86 c1 __ STX $c1 
00:823f : 8e 83 02 STX $0283 
00:8242 : 84 c2 __ STY $c2 
00:8244 : 8c 84 02 STY $0284 
00:8247 : a9 08 __ LDA #$08
00:8249 : 8d 82 02 STA $0282 
00:824c : a9 04 __ LDA #$04
00:824e : 8d 88 02 STA $0288 
00:8251 : 20 15 fd JSR $fd15 
00:8254 : 20 5b ff JSR $ff5b 
00:8257 : a9 00 __ LDA #$00
00:8259 : 8d 00 08 STA $0800 
00:825c : 8d 01 08 STA $0801 
00:825f : 8d 02 08 STA $0802 
00:8262 : 58 __ __ CLI
00:8263 : 20 53 e4 JSR $e453 
00:8266 : 20 bf e3 JSR $e3bf 
00:8269 : 20 22 e4 JSR $e422 
00:826c : a2 fb __ LDX #$fb
00:826e : 9a __ __ TXS
00:826f : a9 00 __ LDA #$00
00:8271 : 85 c6 __ STA $c6 
00:8273 : 38 __ __ SEC
00:8274 : 20 f0 ff JSR $fff0 
00:8277 : 8a __ __ TXA
00:8278 : 48 __ __ PHA
00:8279 : 98 __ __ TYA
00:827a : 48 __ __ PHA
00:827b : a2 00 __ LDX #$00
00:827d : bd 00 4d LDA $4d00,x ; (execute_commands[0] + 0)
00:8280 : f0 06 __ BEQ $8288 ; (fc3_exit.s4 + 136)
00:8282 : 20 d2 ff JSR $ffd2 
00:8285 : e8 __ __ INX
00:8286 : d0 f5 __ BNE $827d ; (fc3_exit.s4 + 125)
00:8288 : a2 00 __ LDX #$00
00:828a : bd d8 4c LDA $4cd8,x ; (execute_keys[0] + 0)
00:828d : f0 08 __ BEQ $8297 ; (fc3_exit.s4 + 151)
00:828f : 9d 77 02 STA $0277,x 
00:8292 : e6 c6 __ INC $c6 
00:8294 : e8 __ __ INX
00:8295 : d0 f3 __ BNE $828a ; (fc3_exit.s4 + 138)
00:8297 : 68 __ __ PLA
00:8298 : a8 __ __ TAY
00:8299 : 68 __ __ PLA
00:829a : aa __ __ TAX
00:829b : 18 __ __ CLC
00:829c : 20 f0 ff JSR $fff0 
00:829f : a9 b4 __ LDA #$b4
00:82a1 : a0 c0 __ LDY #$c0
00:82a3 : 4c 78 a4 JMP $a478 ; (uii_enable_drive_a.s4 + 3)
.s3:
00:82a6 : 60 __ __ RTS
--------------------------------------------------------------------
00:82a7 : __ __ __ BYT 65 58 49 54 20 52 4f 55 54 49 4e 45 00          : eXIT ROUTINE.
--------------------------------------------------------------------
bootmsg:
00:82b4 : __ __ __ BYT 0d 55 42 4f 4f 54 36 34 2e 0d 00                : .UBOOT64...
--------------------------------------------------------------------
mainloop: ; mainloop()->void
; 160, "/home/xahmol/git/UBoot64-v2/src/main.c"
.s1:
00:8300 : a2 03 __ LDX #$03
00:8302 : b5 53 __ LDA T0 + 0,x 
00:8304 : 9d a4 77 STA $77a4,x ; (mainloop@stack + 0)
00:8307 : ca __ __ DEX
00:8308 : 10 f8 __ BPL $8302 ; (mainloop.s1 + 2)
.s4:
00:830a : a9 02 __ LDA #$02
00:830c : 8d 01 49 STA $4901 ; (cfg.version + 0)
00:830f : 8d 62 49 STA $4962 ; (cfg.colors.error + 0)
00:8312 : a9 01 __ LDA #$01
00:8314 : 8d 02 49 STA $4902 ; (cfg.timeon + 0)
00:8317 : 8d 58 49 STA $4958 ; (cfg.verbose + 0)
00:831a : 8d 5e 49 STA $495e ; (cfg.colors.text_input + 0)
00:831d : 8d 60 49 STA $4960 ; (cfg.colors.diritem_normal + 0)
00:8320 : a9 00 __ LDA #$00
00:8322 : 85 16 __ STA P9 
00:8324 : 8d 56 49 STA $4956 ; (cfg.secondsfromutc + 2)
00:8327 : 8d 57 49 STA $4957 ; (cfg.secondsfromutc + 3)
00:832a : 8d 59 49 STA $4959 ; (cfg.colors.background + 0)
00:832d : 8d 5a 49 STA $495a ; (cfg.colors.border + 0)
00:8330 : 8d 00 49 STA $4900 ; (verbosecounter + 0)
00:8333 : a9 20 __ LDA #$20
00:8335 : 8d 54 49 STA $4954 ; (cfg.secondsfromutc + 0)
00:8338 : a9 1c __ LDA #$1c
00:833a : 8d 55 49 STA $4955 ; (cfg.secondsfromutc + 1)
00:833d : a9 05 __ LDA #$05
00:833f : 8d 5b 49 STA $495b ; (cfg.colors.header1 + 0)
00:8342 : 8d 63 49 STA $4963 ; (cfg.colors.ok + 0)
00:8345 : a9 03 __ LDA #$03
00:8347 : 8d 5f 49 STA $495f ; (cfg.colors.key + 0)
00:834a : 8d 61 49 STA $4961 ; (cfg.colors.diritem_select + 0)
00:834d : a9 0d __ LDA #$0d
00:834f : 8d 5c 49 STA $495c ; (cfg.colors.header2 + 0)
00:8352 : a9 07 __ LDA #$07
00:8354 : 8d 5d 49 STA $495d ; (cfg.colors.text + 0)
00:8357 : a2 ff __ LDX #$ff
.l5:
00:8359 : e8 __ __ INX
00:835a : bd a2 0d LDA $0da2,x 
00:835d : 9d 03 49 STA $4903,x ; (cfg.host[0] + 0)
00:8360 : d0 f7 __ BNE $8359 ; (mainloop.l5 + 0)
.s6:
00:8362 : 20 af 0d JSR $0daf 
00:8365 : a9 00 __ LDA #$00
00:8367 : 8d 20 d0 STA $d020 
00:836a : 8d 21 d0 STA $d021 
00:836d : 20 c9 0d JSR $0dc9 
00:8370 : 20 f6 0d JSR $0df6 
00:8373 : a9 f8 __ LDA #$f8
00:8375 : 8d 70 49 STA $4970 ; (vspriteScreen + 0)
00:8378 : a9 07 __ LDA #$07
00:837a : 8d 71 49 STA $4971 ; (vspriteScreen + 1)
00:837d : 20 4a 0e JSR $0e4a 
00:8380 : 20 92 0e JSR $0e92 
00:8383 : a9 00 __ LDA #$00
00:8385 : 8d 68 49 STA $4968 ; (cw.cx + 0)
00:8388 : a9 03 __ LDA #$03
00:838a : 8d 69 49 STA $4969 ; (cw.cy + 0)
00:838d : a9 dc __ LDA #$dc
00:838f : 85 0f __ STA P2 
00:8391 : a9 12 __ LDA #$12
00:8393 : 85 10 __ STA P3 
00:8395 : 20 5e 12 JSR $125e 
00:8398 : ad 1d df LDA $df1d 
00:839b : c9 c9 __ CMP #$c9
00:839d : f0 25 __ BEQ $83c4 ; (mainloop.s96 + 0)
.s7:
00:839f : a9 00 __ LDA #$00
00:83a1 : 85 0f __ STA P2 
00:83a3 : a9 13 __ LDA #$13
00:83a5 : 85 10 __ STA P3 
00:83a7 : 20 5e 12 JSR $125e 
00:83aa : 20 25 14 JSR $1425 
00:83ad : a9 3d __ LDA #$3d
00:83af : 85 0f __ STA P2 
00:83b1 : a9 14 __ LDA #$14
00:83b3 : 85 10 __ STA P3 
00:83b5 : 20 5e 12 JSR $125e 
00:83b8 : 20 25 14 JSR $1425 
00:83bb : 20 50 14 JSR $1450 
00:83be : 20 00 c0 JSR $c000 
00:83c1 : 4c c7 09 JMP $09c7 
.s96:
00:83c4 : 20 f5 12 JSR $12f5 
.s8:
00:83c7 : a9 00 __ LDA #$00
00:83c9 : 8d 09 dc STA $dc09 
00:83cc : 8d 08 dc STA $dc08 
00:83cf : a9 93 __ LDA #$93
00:83d1 : 85 11 __ STA P4 
00:83d3 : a9 3d __ LDA #$3d
00:83d5 : 85 12 __ STA P5 
.l97:
00:83d7 : 20 66 14 JSR $1466 
00:83da : ad d7 4b LDA $4bd7 ; (uii_status[0] + 0)
00:83dd : c9 30 __ CMP #$30
00:83df : d0 f6 __ BNE $83d7 ; (mainloop.l97 + 0)
.s9:
00:83e1 : ad d8 4b LDA $4bd8 ; (uii_status[0] + 1)
00:83e4 : c9 30 __ CMP #$30
00:83e6 : d0 ef __ BNE $83d7 ; (mainloop.l97 + 0)
.s10:
00:83e8 : ad 09 dc LDA $dc09 
00:83eb : c9 05 __ CMP #$05
00:83ed : b0 e8 __ BCS $83d7 ; (mainloop.l97 + 0)
.s11:
00:83ef : 20 87 1b JSR $1b87 
00:83f2 : a9 00 __ LDA #$00
00:83f4 : 85 16 __ STA P9 
00:83f6 : 20 92 0e JSR $0e92 
00:83f9 : ad 5a 49 LDA $495a ; (cfg.colors.border + 0)
00:83fc : 8d 20 d0 STA $d020 
00:83ff : ad 59 49 LDA $4959 ; (cfg.colors.background + 0)
00:8402 : 8d 21 d0 STA $d021 
00:8405 : ad 58 49 LDA $4958 ; (cfg.verbose + 0)
00:8408 : d0 11 __ BNE $841b ; (mainloop.s95 + 0)
.s12:
00:840a : ae 00 49 LDX $4900 ; (verbosecounter + 0)
00:840d : 86 0d __ STX P0 
00:840f : e8 __ __ INX
00:8410 : 8e 00 49 STX $4900 ; (verbosecounter + 0)
00:8413 : a5 0d __ LDA P0 
00:8415 : 20 62 1d JSR $1d62 
00:8418 : 4c 33 0a JMP $0a33 
.s95:
00:841b : a9 00 __ LDA #$00
00:841d : 8d 68 49 STA $4968 ; (cw.cx + 0)
00:8420 : a9 04 __ LDA #$04
00:8422 : 8d 69 49 STA $4969 ; (cw.cy + 0)
00:8425 : a9 00 __ LDA #$00
00:8427 : 85 0f __ STA P2 
00:8429 : a9 20 __ LDA #$20
00:842b : 85 10 __ STA P3 
00:842d : 20 5e 12 JSR $125e 
00:8430 : 20 25 14 JSR $1425 
.s13:
00:8433 : a9 01 __ LDA #$01
00:8435 : 8d 8a 3d STA $3d8a 
00:8438 : 8d aa 77 STA $77aa ; (cmd[0] + 1)
00:843b : a9 02 __ LDA #$02
00:843d : 85 0f __ STA P2 
00:843f : a9 00 __ LDA #$00
00:8441 : 85 10 __ STA P3 
00:8443 : 8d a9 77 STA $77a9 ; (cmd[0] + 0)
00:8446 : a9 a9 __ LDA #$a9
00:8448 : 85 0d __ STA P0 
00:844a : a9 77 __ LDA #$77
00:844c : 85 0e __ STA P1 
00:844e : 20 53 11 JSR $1153 
00:8451 : 20 ce 11 JSR $11ce 
00:8454 : 20 0c 12 JSR $120c 
00:8457 : 20 18 11 JSR $1118 
00:845a : ad 58 49 LDA $4958 ; (cfg.verbose + 0)
00:845d : d0 11 __ BNE $8470 ; (mainloop.s94 + 0)
.s14:
00:845f : ae 00 49 LDX $4900 ; (verbosecounter + 0)
00:8462 : 86 0d __ STX P0 
00:8464 : e8 __ __ INX
00:8465 : 8e 00 49 STX $4900 ; (verbosecounter + 0)
00:8468 : a5 0d __ LDA P0 
00:846a : 20 62 1d JSR $1d62 
00:846d : 4c 89 0a JMP $0a89 
.s94:
00:8470 : a9 25 __ LDA #$25
00:8472 : 85 0f __ STA P2 
00:8474 : a9 20 __ LDA #$20
00:8476 : 85 10 __ STA P3 
00:8478 : 20 5e 12 JSR $125e 
00:847b : a9 d6 __ LDA #$d6
00:847d : 85 0f __ STA P2 
00:847f : a9 49 __ LDA #$49
00:8481 : 85 10 __ STA P3 
00:8483 : 20 5e 12 JSR $125e 
00:8486 : 20 25 14 JSR $1425 
.s15:
00:8489 : 20 33 20 JSR $2033 
00:848c : a5 1b __ LDA ACCU + 0 
00:848e : 8d e2 4c STA $4ce2 ; (reudetected + 0)
00:8491 : a5 1c __ LDA ACCU + 1 
00:8493 : 8d e3 4c STA $4ce3 ; (reudetected + 1)
00:8496 : 05 1b __ ORA ACCU + 0 
00:8498 : d0 10 __ BNE $84aa ; (mainloop.s91 + 0)
.s16:
00:849a : a9 9a __ LDA #$9a
00:849c : 8d eb 7f STA $7feb ; (sstack + 12)
00:849f : a9 21 __ LDA #$21
00:84a1 : 8d ec 7f STA $7fec ; (sstack + 13)
00:84a4 : 20 01 15 JSR $1501 
00:84a7 : 4c e9 0a JMP $0ae9 
.s91:
00:84aa : ad 58 49 LDA $4958 ; (cfg.verbose + 0)
00:84ad : d0 11 __ BNE $84c0 ; (mainloop.s93 + 0)
.s92:
00:84af : ae 00 49 LDX $4900 ; (verbosecounter + 0)
00:84b2 : 86 0d __ STX P0 
00:84b4 : e8 __ __ INX
00:84b5 : 8e 00 49 STX $4900 ; (verbosecounter + 0)
00:84b8 : a5 0d __ LDA P0 
00:84ba : 20 62 1d JSR $1d62 
00:84bd : 4c e9 0a JMP $0ae9 
.s93:
00:84c0 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:84c3 : 85 18 __ STA P11 
00:84c5 : a9 7e __ LDA #$7e
00:84c7 : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:84ca : a9 21 __ LDA #$21
00:84cc : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:84cf : a5 1b __ LDA ACCU + 0 
00:84d1 : 85 54 __ STA T0 + 1 
00:84d3 : a5 1c __ LDA ACCU + 1 
00:84d5 : 4a __ __ LSR
00:84d6 : 66 54 __ ROR T0 + 1 
00:84d8 : 6a __ __ ROR
00:84d9 : 66 54 __ ROR T0 + 1 
00:84db : 29 80 __ AND #$80
00:84dd : 6a __ __ ROR
00:84de : 8d e5 7f STA $7fe5 ; (sstack + 6)
00:84e1 : a5 54 __ LDA T0 + 1 
00:84e3 : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:84e6 : 20 25 15 JSR $1525 
.s17:
00:84e9 : a9 01 __ LDA #$01
00:84eb : 8d f0 7f STA $7ff0 ; (sstack + 17)
00:84ee : 20 ab 21 JSR $21ab 
00:84f1 : 20 35 26 JSR $2635 
00:84f4 : a5 1b __ LDA ACCU + 0 
00:84f6 : d0 0d __ BNE $8505 ; (mainloop.s19 + 0)
.s18:
00:84f8 : a9 03 __ LDA #$03
00:84fa : 8d eb 7f STA $7feb ; (sstack + 12)
00:84fd : a9 27 __ LDA #$27
00:84ff : 8d ec 7f STA $7fec ; (sstack + 13)
00:8502 : 20 01 15 JSR $1501 
.s19:
00:8505 : ad 58 49 LDA $4958 ; (cfg.verbose + 0)
00:8508 : f0 03 __ BEQ $850d ; (mainloop.s20 + 0)
00:850a : 4c a9 0b JMP $0ba9 
.s20:
00:850d : ae 00 49 LDX $4900 ; (verbosecounter + 0)
00:8510 : 86 0d __ STX P0 
00:8512 : e8 __ __ INX
00:8513 : 8e 00 49 STX $4900 ; (verbosecounter + 0)
00:8516 : a5 0d __ LDA P0 
00:8518 : 20 62 1d JSR $1d62 
.s21:
00:851b : a9 01 __ LDA #$01
00:851d : 8d ff df STA $dfff 
00:8520 : 20 00 80 JSR $8000 ; (startup + 0)
00:8523 : ad 15 d0 LDA $d015 
00:8526 : 29 fe __ AND #$fe
00:8528 : 8d 15 d0 STA $d015 
.l22:
00:852b : a9 01 __ LDA #$01
00:852d : 8d ff df STA $dfff 
00:8530 : 20 9b 85 JSR $859b ; (mainloop.s30 + 1)
00:8533 : ad f4 4c LDA $4cf4 ; (menuselect + 0)
00:8536 : 85 56 __ STA T2 + 0 
00:8538 : c9 30 __ CMP #$30
00:853a : 90 4f __ BCC $858b ; (mainloop.s29 + 0)
.s37:
00:853c : 85 53 __ STA T0 + 0 
00:853e : c9 3a __ CMP #$3a
00:8540 : 90 08 __ BCC $854a ; (mainloop.s36 + 0)
.s23:
00:8542 : c9 41 __ CMP #$41
00:8544 : 90 45 __ BCC $858b ; (mainloop.s29 + 0)
.s33:
00:8546 : c9 5b __ CMP #$5b
00:8548 : b0 0e __ BCS $8558 ; (mainloop.s34 + 0)
.s36:
00:854a : 20 5d 87 JSR $875d ; (mainloop.s44 + 36)
00:854d : 8d ff 7f STA $7fff ; (sstack + 32)
00:8550 : 20 67 87 JSR $8767 ; (mainloop.l46 + 2)
00:8553 : a5 53 __ LDA T0 + 0 
00:8555 : 4c 67 0b JMP $0b67 
.s34:
00:8558 : c9 87 __ CMP #$87
00:855a : d0 0b __ BNE $8567 ; (mainloop.s24 + 0)
.s35:
00:855c : a9 01 __ LDA #$01
00:855e : 8d ff df STA $dfff 
00:8561 : 20 43 97 JSR $9743 
00:8564 : 4c 2b 0b JMP $0b2b 
.s24:
00:8567 : c9 87 __ CMP #$87
00:8569 : 90 20 __ BCC $858b ; (mainloop.s29 + 0)
.s25:
00:856b : c9 89 __ CMP #$89
00:856d : d0 08 __ BNE $8577 ; (mainloop.s26 + 0)
.s28:
00:856f : a9 01 __ LDA #$01
00:8571 : 8d ff df STA $dfff 
00:8574 : 20 5b 8a JSR $8a5b ; (cwin_putat_string_reverse.s6 + 22)
.s26:
00:8577 : a5 56 __ LDA T2 + 0 
00:8579 : c9 88 __ CMP #$88
00:857b : d0 ae __ BNE $852b ; (mainloop.l22 + 0)
.s27:
00:857d : 20 00 c0 JSR $c000 
.s3:
00:8580 : a2 03 __ LDX #$03
00:8582 : bd a4 77 LDA $77a4,x ; (mainloop@stack + 0)
00:8585 : 95 53 __ STA T0 + 0,x 
00:8587 : ca __ __ DEX
00:8588 : 10 f8 __ BPL $8582 ; (mainloop.s3 + 2)
00:858a : 60 __ __ RTS
.s29:
00:858b : c9 85 __ CMP #$85
00:858d : d0 0b __ BNE $859a ; (mainloop.s30 + 0)
.s32:
00:858f : a9 02 __ LDA #$02
00:8591 : 8d ff df STA $dfff 
00:8594 : 20 00 80 JSR $8000 ; (startup + 0)
00:8597 : 4c 77 0b JMP $0b77 
.s30:
00:859a : c9 86 __ CMP #$86
00:859c : d0 d9 __ BNE $8577 ; (mainloop.s26 + 0)
.s31:
00:859e : a9 01 __ LDA #$01
00:85a0 : 8d ff df STA $dfff 
00:85a3 : 20 19 8d JSR $8d19 
00:85a6 : 4c 77 0b JMP $0b77 
.s38:
00:85a9 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:85ac : 85 18 __ STA P11 
00:85ae : a9 1e __ LDA #$1e
00:85b0 : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:85b3 : a9 27 __ LDA #$27
00:85b5 : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:85b8 : 20 25 15 JSR $1525 
00:85bb : ad e4 4c LDA $4ce4 ; (uii_devinfo[0].exist + 0)
00:85be : f0 75 __ BEQ $8635 ; (mainloop.s39 + 0)
.s76:
00:85c0 : ad e6 4c LDA $4ce6 ; (uii_devinfo[0].power + 0)
00:85c3 : d0 07 __ BNE $85cc ; (mainloop.s90 + 0)
.s77:
00:85c5 : a9 27 __ LDA #$27
00:85c7 : a0 59 __ LDY #$59
00:85c9 : 4c d0 0b JMP $0bd0 
.s90:
00:85cc : a9 1f __ LDA #$1f
00:85ce : a0 fb __ LDY #$fb
.s78:
00:85d0 : 8c e7 7f STY $7fe7 ; (sstack + 8)
00:85d3 : 8d e8 7f STA $7fe8 ; (sstack + 9)
00:85d6 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:85d9 : 85 18 __ STA P11 
00:85db : a9 3d __ LDA #$3d
00:85dd : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:85e0 : a9 27 __ LDA #$27
00:85e2 : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:85e5 : ad e7 4c LDA $4ce7 ; (uii_devinfo[0].id + 0)
00:85e8 : 8d e5 7f STA $7fe5 ; (sstack + 6)
00:85eb : a9 00 __ LDA #$00
00:85ed : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:85f0 : ad e5 4c LDA $4ce5 ; (uii_devinfo[0].type + 0)
00:85f3 : c9 02 __ CMP #$02
00:85f5 : d0 10 __ BNE $8607 ; (mainloop.s79 + 0)
.s89:
00:85f7 : a9 27 __ LDA #$27
00:85f9 : a0 67 __ LDY #$67
.s83:
00:85fb : 8c e9 7f STY $7fe9 ; (sstack + 10)
00:85fe : 8d ea 7f STA $7fea ; (sstack + 11)
00:8601 : 20 25 15 JSR $1525 
00:8604 : 4c 35 0c JMP $0c35 
.s79:
00:8607 : 90 1d __ BCC $8626 ; (mainloop.s86 + 0)
.s80:
00:8609 : c9 0f __ CMP #$0f
00:860b : d0 07 __ BNE $8614 ; (mainloop.s81 + 0)
.s85:
00:860d : a9 27 __ LDA #$27
00:860f : a0 6c __ LDY #$6c
00:8611 : 4c fb 0b JMP $0bfb 
.s81:
00:8614 : c9 50 __ CMP #$50
00:8616 : f0 07 __ BEQ $861f ; (mainloop.s84 + 0)
.s82:
00:8618 : a9 12 __ LDA #$12
00:861a : a0 fe __ LDY #$fe
00:861c : 4c fb 0b JMP $0bfb 
.s84:
00:861f : a9 27 __ LDA #$27
00:8621 : a0 74 __ LDY #$74
00:8623 : 4c fb 0b JMP $0bfb 
.s86:
00:8626 : aa __ __ TAX
00:8627 : f0 06 __ BEQ $862f ; (mainloop.s87 + 0)
.s88:
00:8629 : a9 27 __ LDA #$27
00:862b : a0 62 __ LDY #$62
00:862d : 90 cc __ BCC $85fb ; (mainloop.s83 + 0)
.s87:
00:862f : a9 27 __ LDA #$27
00:8631 : a0 5d __ LDY #$5d
00:8633 : 90 c6 __ BCC $85fb ; (mainloop.s83 + 0)
.s39:
00:8635 : ad e8 4c LDA $4ce8 ; (uii_devinfo[0] + 4)
00:8638 : f0 75 __ BEQ $86af ; (mainloop.s40 + 0)
.s61:
00:863a : ad ea 4c LDA $4cea ; (uii_devinfo[0] + 6)
00:863d : d0 07 __ BNE $8646 ; (mainloop.s75 + 0)
.s62:
00:863f : a9 27 __ LDA #$27
00:8641 : a0 59 __ LDY #$59
00:8643 : 4c 4a 0c JMP $0c4a 
.s75:
00:8646 : a9 1f __ LDA #$1f
00:8648 : a0 fb __ LDY #$fb
.s63:
00:864a : 8c e7 7f STY $7fe7 ; (sstack + 8)
00:864d : 8d e8 7f STA $7fe8 ; (sstack + 9)
00:8650 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:8653 : 85 18 __ STA P11 
00:8655 : a9 7c __ LDA #$7c
00:8657 : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:865a : a9 27 __ LDA #$27
00:865c : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:865f : ad eb 4c LDA $4ceb ; (uii_devinfo[0] + 7)
00:8662 : 8d e5 7f STA $7fe5 ; (sstack + 6)
00:8665 : a9 00 __ LDA #$00
00:8667 : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:866a : ad e9 4c LDA $4ce9 ; (uii_devinfo[0] + 5)
00:866d : c9 02 __ CMP #$02
00:866f : d0 10 __ BNE $8681 ; (mainloop.s64 + 0)
.s74:
00:8671 : a9 27 __ LDA #$27
00:8673 : a0 67 __ LDY #$67
.s68:
00:8675 : 8c e9 7f STY $7fe9 ; (sstack + 10)
00:8678 : 8d ea 7f STA $7fea ; (sstack + 11)
00:867b : 20 25 15 JSR $1525 
00:867e : 4c af 0c JMP $0caf 
.s64:
00:8681 : 90 1d __ BCC $86a0 ; (mainloop.s71 + 0)
.s65:
00:8683 : c9 0f __ CMP #$0f
00:8685 : d0 07 __ BNE $868e ; (mainloop.s66 + 0)
.s70:
00:8687 : a9 27 __ LDA #$27
00:8689 : a0 6c __ LDY #$6c
00:868b : 4c 75 0c JMP $0c75 
.s66:
00:868e : c9 50 __ CMP #$50
00:8690 : f0 07 __ BEQ $8699 ; (mainloop.s69 + 0)
.s67:
00:8692 : a9 12 __ LDA #$12
00:8694 : a0 fe __ LDY #$fe
00:8696 : 4c 75 0c JMP $0c75 
.s69:
00:8699 : a9 27 __ LDA #$27
00:869b : a0 74 __ LDY #$74
00:869d : 4c 75 0c JMP $0c75 
.s71:
00:86a0 : aa __ __ TAX
00:86a1 : f0 06 __ BEQ $86a9 ; (mainloop.s72 + 0)
.s73:
00:86a3 : a9 27 __ LDA #$27
00:86a5 : a0 62 __ LDY #$62
00:86a7 : 90 cc __ BCC $8675 ; (mainloop.s68 + 0)
.s72:
00:86a9 : a9 27 __ LDA #$27
00:86ab : a0 5d __ LDY #$5d
00:86ad : 90 c6 __ BCC $8675 ; (mainloop.s68 + 0)
.s40:
00:86af : ad ec 4c LDA $4cec ; (uii_devinfo[0] + 8)
00:86b2 : f0 33 __ BEQ $86e7 ; (mainloop.s41 + 0)
.s57:
00:86b4 : ad ee 4c LDA $4cee ; (uii_devinfo[0] + 10)
00:86b7 : d0 07 __ BNE $86c0 ; (mainloop.s60 + 0)
.s58:
00:86b9 : a9 27 __ LDA #$27
00:86bb : a0 59 __ LDY #$59
00:86bd : 4c c4 0c JMP $0cc4 
.s60:
00:86c0 : a9 1f __ LDA #$1f
00:86c2 : a0 fb __ LDY #$fb
.s59:
00:86c4 : 8c e7 7f STY $7fe7 ; (sstack + 8)
00:86c7 : 8d e8 7f STA $7fe8 ; (sstack + 9)
00:86ca : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:86cd : 85 18 __ STA P11 
00:86cf : a9 98 __ LDA #$98
00:86d1 : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:86d4 : a9 27 __ LDA #$27
00:86d6 : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:86d9 : ad ef 4c LDA $4cef ; (uii_devinfo[0] + 11)
00:86dc : 8d e5 7f STA $7fe5 ; (sstack + 6)
00:86df : a9 00 __ LDA #$00
00:86e1 : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:86e4 : 20 25 15 JSR $1525 
.s41:
00:86e7 : ad f0 4c LDA $4cf0 ; (uii_devinfo[0] + 12)
00:86ea : f0 33 __ BEQ $871f ; (mainloop.s42 + 0)
.s53:
00:86ec : ad f2 4c LDA $4cf2 ; (uii_devinfo[0] + 14)
00:86ef : d0 07 __ BNE $86f8 ; (mainloop.s56 + 0)
.s54:
00:86f1 : a9 27 __ LDA #$27
00:86f3 : a0 59 __ LDY #$59
00:86f5 : 4c fc 0c JMP $0cfc 
.s56:
00:86f8 : a9 1f __ LDA #$1f
00:86fa : a0 fb __ LDY #$fb
.s55:
00:86fc : 8c e7 7f STY $7fe7 ; (sstack + 8)
00:86ff : 8d e8 7f STA $7fe8 ; (sstack + 9)
00:8702 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:8705 : 85 18 __ STA P11 
00:8707 : a9 b0 __ LDA #$b0
00:8709 : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:870c : a9 27 __ LDA #$27
00:870e : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:8711 : ad f3 4c LDA $4cf3 ; (uii_devinfo[0] + 15)
00:8714 : 8d e5 7f STA $7fe5 ; (sstack + 6)
00:8717 : a9 00 __ LDA #$00
00:8719 : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:871c : 20 25 15 JSR $1525 
.s42:
00:871f : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:8722 : 85 55 __ STA T1 + 0 
00:8724 : 20 f0 27 JSR $27f0 
00:8727 : a6 55 __ LDX T1 + 0 
00:8729 : 86 18 __ STX P11 
00:872b : aa __ __ TAX
00:872c : d0 07 __ BNE $8735 ; (mainloop.s52 + 0)
.s43:
00:872e : a9 28 __ LDA #$28
00:8730 : a0 c7 __ LDY #$c7
00:8732 : 4c 39 0d JMP $0d39 
.s52:
00:8735 : a9 28 __ LDA #$28
00:8737 : a0 c3 __ LDY #$c3
.s44:
00:8739 : 8c e5 7f STY $7fe5 ; (sstack + 6)
00:873c : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:873f : a9 c8 __ LDA #$c8
00:8741 : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:8744 : a9 27 __ LDA #$27
00:8746 : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:8749 : 20 25 15 JSR $1525 
00:874c : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:874f : 85 18 __ STA P11 
00:8751 : a9 ca __ LDA #$ca
00:8753 : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:8756 : a9 28 __ LDA #$28
00:8758 : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:875b : 20 25 15 JSR $1525 
00:875e : a0 00 __ LDY #$00
00:8760 : ad 18 53 LDA $5318 ; (iec_devices[0] + 0)
00:8763 : d0 0a __ BNE $876f ; (mainloop.l48 + 0)
.l46:
00:8765 : c8 __ __ INY
00:8766 : c0 17 __ CPY #$17
00:8768 : b0 32 __ BCS $879c ; (mainloop.s47 + 0)
.s45:
00:876a : b9 18 53 LDA $5318,y ; (iec_devices[0] + 0)
00:876d : f0 f6 __ BEQ $8765 ; (mainloop.l46 + 0)
.l48:
00:876f : 84 56 __ STY T2 + 0 
00:8771 : 98 __ __ TYA
00:8772 : c0 16 __ CPY #$16
00:8774 : d0 04 __ BNE $877a ; (mainloop.s49 + 0)
.s51:
00:8776 : a9 04 __ LDA #$04
00:8778 : d0 03 __ BNE $877d ; (mainloop.s50 + 0)
.s49:
00:877a : 18 __ __ CLC
00:877b : 69 08 __ ADC #$08
.s50:
00:877d : 8d e5 7f STA $7fe5 ; (sstack + 6)
00:8780 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:8783 : 85 18 __ STA P11 
00:8785 : a9 00 __ LDA #$00
00:8787 : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:878a : a9 db __ LDA #$db
00:878c : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:878f : a9 28 __ LDA #$28
00:8791 : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:8794 : 20 25 15 JSR $1525 
00:8797 : a4 56 __ LDY T2 + 0 
00:8799 : 4c 65 0d JMP $0d65 
.s47:
00:879c : 20 25 14 JSR $1425 
00:879f : 4c 1b 0b JMP $0b1b 
--------------------------------------------------------------------
00:87a2 : __ __ __ BYT 50 4f 4f 4c 2e 4e 54 50 2e 4f 52 47 00          : POOL.NTP.ORG.
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  97, "/home/xahmol/oscar64/include/c64/vic.h"
.s4:
00:87af : a9 1b __ LDA #$1b
00:87b1 : 8d 11 d0 STA $d011 
00:87b4 : a9 08 __ LDA #$08
00:87b6 : 8d 16 d0 STA $d016 
00:87b9 : ad 00 dd LDA $dd00 
00:87bc : 29 fc __ AND #$fc
00:87be : 09 03 __ ORA #$03
00:87c0 : 8d 00 dd STA $dd00 
00:87c3 : a9 16 __ LDA #$16
00:87c5 : 8d 18 d0 STA $d018 
.s3:
00:87c8 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_init: ; cwin_init(struct CharWin*,u8*,u8,u8,u8,u8)->void
;  15, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
00:87c9 : a9 00 __ LDA #$00
00:87cb : 8d 64 49 STA $4964 ; (cw.sx + 0)
00:87ce : 8d 65 49 STA $4965 ; (cw.sy + 0)
00:87d1 : 8d 68 49 STA $4968 ; (cw.cx + 0)
00:87d4 : 8d 69 49 STA $4969 ; (cw.cy + 0)
00:87d7 : 8d 6c 49 STA $496c ; (cw.sp + 0)
00:87da : 8d 6e 49 STA $496e ; (cw.cp + 0)
00:87dd : a9 28 __ LDA #$28
00:87df : 8d 66 49 STA $4966 ; (cw.wx + 0)
00:87e2 : a9 19 __ LDA #$19
00:87e4 : 8d 67 49 STA $4967 ; (cw.wy + 0)
00:87e7 : a9 04 __ LDA #$04
00:87e9 : 8d 6d 49 STA $496d ; (cw.sp + 1)
00:87ec : a9 d8 __ LDA #$d8
00:87ee : 8d 6f 49 STA $496f ; (cw.cp + 1)
.s3:
00:87f1 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_clear@proxy: ; cwin_clear@proxy
00:87f2 : a9 01 __ LDA #$01
00:87f4 : 85 16 __ STA P9 
--------------------------------------------------------------------
cwin_clear: ; cwin_clear(struct CharWin*)->void
;  20, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
00:87f6 : ad 67 49 LDA $4967 ; (cw.wy + 0)
00:87f9 : f0 32 __ BEQ $882d ; (cwin_clear.s3 + 0)
.s5:
00:87fb : ad 6c 49 LDA $496c ; (cw.sp + 0)
00:87fe : 85 1b __ STA ACCU + 0 
00:8800 : ad 6d 49 LDA $496d ; (cw.sp + 1)
00:8803 : 85 1c __ STA ACCU + 1 
00:8805 : ad 6e 49 LDA $496e ; (cw.cp + 0)
00:8808 : 85 43 __ STA T1 + 0 
00:880a : ad 6f 49 LDA $496f ; (cw.cp + 1)
00:880d : 85 44 __ STA T1 + 1 
00:880f : a2 00 __ LDX #$00
00:8811 : ad 66 49 LDA $4966 ; (cw.wx + 0)
00:8814 : f0 11 __ BEQ $8827 ; (cwin_clear.l7 + 0)
.l8:
00:8816 : 85 1d __ STA ACCU + 2 
00:8818 : a0 00 __ LDY #$00
.l9:
00:881a : a9 20 __ LDA #$20
00:881c : 91 1b __ STA (ACCU + 0),y 
00:881e : a9 01 __ LDA #$01
00:8820 : 91 43 __ STA (T1 + 0),y 
00:8822 : c8 __ __ INY
00:8823 : c4 1d __ CPY ACCU + 2 
00:8825 : 90 f3 __ BCC $881a ; (cwin_clear.l9 + 0)
.l7:
00:8827 : e8 __ __ INX
00:8828 : ec 67 49 CPX $4967 ; (cw.wy + 0)
00:882b : 90 01 __ BCC $882e ; (cwin_clear.s6 + 0)
.s3:
00:882d : 60 __ __ RTS
.s6:
00:882e : a5 1b __ LDA ACCU + 0 
00:8830 : 69 28 __ ADC #$28
00:8832 : 85 1b __ STA ACCU + 0 
00:8834 : 90 03 __ BCC $8839 ; (cwin_clear.s11 + 0)
.s10:
00:8836 : e6 1c __ INC ACCU + 1 
00:8838 : 18 __ __ CLC
.s11:
00:8839 : a5 43 __ LDA T1 + 0 
00:883b : 69 28 __ ADC #$28
00:883d : 85 43 __ STA T1 + 0 
00:883f : 90 02 __ BCC $8843 ; (cwin_clear.s13 + 0)
.s12:
00:8841 : e6 44 __ INC T1 + 1 
.s13:
00:8843 : ad 66 49 LDA $4966 ; (cw.wx + 0)
00:8846 : f0 df __ BEQ $8827 ; (cwin_clear.l7 + 0)
00:8848 : d0 cc __ BNE $8816 ; (cwin_clear.l8 + 0)
--------------------------------------------------------------------
spr_set: ; spr_set(u8,bool,i16,i16,u8,u8,bool,bool,bool)->void
;  12, "/home/xahmol/oscar64/include/c64/sprites.h"
.s4:
00:884a : ad 10 d0 LDA $d010 
00:884d : 09 01 __ ORA #$01
00:884f : 8d 10 d0 STA $d010 
00:8852 : ad 15 d0 LDA $d015 
00:8855 : 09 01 __ ORA #$01
00:8857 : 8d 15 d0 STA $d015 
00:885a : ad 1c d0 LDA $d01c 
00:885d : 29 fe __ AND #$fe
00:885f : 8d 1c d0 STA $d01c 
00:8862 : ad 1d d0 LDA $d01d 
00:8865 : 29 fe __ AND #$fe
00:8867 : 8d 1d d0 STA $d01d 
00:886a : ad 17 d0 LDA $d017 
00:886d : 29 fe __ AND #$fe
00:886f : 8d 17 d0 STA $d017 
00:8872 : a9 46 __ LDA #$46
00:8874 : 8d 01 d0 STA $d001 
00:8877 : a9 40 __ LDA #$40
00:8879 : 8d 00 d0 STA $d000 
00:887c : ad 70 49 LDA $4970 ; (vspriteScreen + 0)
00:887f : 85 1b __ STA ACCU + 0 
00:8881 : ad 71 49 LDA $4971 ; (vspriteScreen + 1)
00:8884 : 85 1c __ STA ACCU + 1 
00:8886 : a9 0d __ LDA #$0d
00:8888 : a0 00 __ LDY #$00
00:888a : 91 1b __ STA (ACCU + 0),y 
00:888c : a9 03 __ LDA #$03
00:888e : 8d 27 d0 STA $d027 
.s3:
00:8891 : 60 __ __ RTS
--------------------------------------------------------------------
headertext@proxy: ; headertext@proxy
00:8892 : a9 51 __ LDA #$51
00:8894 : 85 14 __ STA P7 
00:8896 : a9 12 __ LDA #$12
00:8898 : 85 15 __ STA P8 
--------------------------------------------------------------------
headertext: ; headertext(const u8*,u8)->void
;  13, "/home/xahmol/git/UBoot64-v2/src/core.h"
.s4:
00:889a : a9 00 __ LDA #$00
00:889c : 85 0d __ STA P0 
00:889e : 85 0e __ STA P1 
00:88a0 : ad 5b 49 LDA $495b ; (cfg.colors.header1 + 0)
00:88a3 : 85 12 __ STA P5 
00:88a5 : a9 28 __ LDA #$28
00:88a7 : 85 0f __ STA P2 
00:88a9 : 20 c7 3c JSR $3cc7 
00:88ac : e6 0e __ INC P1 
00:88ae : ad 5c 49 LDA $495c ; (cfg.colors.header2 + 0)
00:88b1 : 85 12 __ STA P5 
00:88b3 : 20 bb 0f JSR $0fbb 
00:88b6 : c6 10 __ DEC P3 
00:88b8 : a9 00 __ LDA #$00
00:88ba : 85 0f __ STA P2 
00:88bc : ad 5b 49 LDA $495b ; (cfg.colors.header1 + 0)
00:88bf : 85 13 __ STA P6 
00:88c1 : a9 c9 __ LDA #$c9
00:88c3 : 85 11 __ STA P4 
00:88c5 : a9 10 __ LDA #$10
00:88c7 : 85 12 __ STA P5 
00:88c9 : 20 32 10 JSR $1032 
00:88cc : e6 10 __ INC P3 
00:88ce : a5 14 __ LDA P7 ; (subtitle + 0)
00:88d0 : 85 11 __ STA P4 
00:88d2 : a5 15 __ LDA P8 ; (subtitle + 1)
00:88d4 : 85 12 __ STA P5 
00:88d6 : 20 1b 0f JSR $0f1b 
00:88d9 : a5 16 __ LDA P9 ; (time + 0)
00:88db : d0 1d __ BNE $88fa ; (headertext.s7 + 0)
.s5:
00:88dd : a9 3c __ LDA #$3c
00:88df : 85 0d __ STA P0 
00:88e1 : a9 12 __ LDA #$12
00:88e3 : 85 0e __ STA P1 
00:88e5 : 20 ad 10 JSR $10ad 
00:88e8 : 38 __ __ SEC
00:88e9 : a9 28 __ LDA #$28
00:88eb : e5 1b __ SBC ACCU + 0 
00:88ed : 85 0f __ STA P2 
00:88ef : a9 3c __ LDA #$3c
00:88f1 : 85 11 __ STA P4 
00:88f3 : a9 12 __ LDA #$12
00:88f5 : 85 12 __ STA P5 
00:88f7 : 4c 17 0f JMP $0f17 
.s7:
00:88fa : 20 f2 10 JSR $10f2 
00:88fd : a9 d6 __ LDA #$d6
00:88ff : 85 0d __ STA P0 
00:8901 : a9 49 __ LDA #$49
00:8903 : 85 0e __ STA P1 
00:8905 : 20 ad 10 JSR $10ad 
00:8908 : a9 d6 __ LDA #$d6
00:890a : 85 11 __ STA P4 
00:890c : a9 49 __ LDA #$49
00:890e : 85 12 __ STA P5 
00:8910 : 38 __ __ SEC
00:8911 : a9 28 __ LDA #$28
00:8913 : e5 1b __ SBC ACCU + 0 
00:8915 : 85 0f __ STA P2 
.s6:
00:8917 : a9 01 __ LDA #$01
00:8919 : 85 10 __ STA P3 
--------------------------------------------------------------------
cwin_putat_string_reverse@proxy: ; cwin_putat_string_reverse@proxy
00:891b : ad 5c 49 LDA $495c ; (cfg.colors.header2 + 0)
00:891e : 85 13 __ STA P6 
00:8920 : 4c 32 10 JMP $1032 
--------------------------------------------------------------------
cwin_console_newline: ; cwin_console_newline(struct CharWin*)->void
; 177, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
00:8923 : a9 00 __ LDA #$00
00:8925 : 8d 68 49 STA $4968 ; (cw.cx + 0)
00:8928 : ad 69 49 LDA $4969 ; (cw.cy + 0)
00:892b : aa __ __ TAX
00:892c : 18 __ __ CLC
00:892d : 69 01 __ ADC #$01
00:892f : 8d 69 49 STA $4969 ; (cw.cy + 0)
00:8932 : cd 67 49 CMP $4967 ; (cw.wy + 0)
00:8935 : f0 01 __ BEQ $8938 ; (cwin_console_newline.s5 + 0)
.s3:
00:8937 : 60 __ __ RTS
.s5:
00:8938 : 8e 69 49 STX $4969 ; (cw.cy + 0)
00:893b : ce 6b 49 DEC $496b ; (cw.ly + 0)
00:893e : ad 66 49 LDA $4966 ; (cw.wx + 0)
00:8941 : 85 49 __ STA T7 + 0 
00:8943 : ad 6c 49 LDA $496c ; (cw.sp + 0)
00:8946 : 85 43 __ STA T0 + 0 
00:8948 : ad 6d 49 LDA $496d ; (cw.sp + 1)
00:894b : 85 44 __ STA T0 + 1 
00:894d : ad 6e 49 LDA $496e ; (cw.cp + 0)
00:8950 : 85 1b __ STA ACCU + 0 
00:8952 : ad 6f 49 LDA $496f ; (cw.cp + 1)
00:8955 : a2 00 __ LDX #$00
00:8957 : f0 0f __ BEQ $8968 ; (cwin_console_newline.l6 + 0)
.s9:
00:8959 : a5 47 __ LDA T3 + 0 
00:895b : 85 43 __ STA T0 + 0 
00:895d : a5 48 __ LDA T3 + 1 
00:895f : 85 44 __ STA T0 + 1 
00:8961 : a5 45 __ LDA T2 + 0 
00:8963 : 85 1b __ STA ACCU + 0 
00:8965 : a5 46 __ LDA T2 + 1 
00:8967 : e8 __ __ INX
.l6:
00:8968 : 85 1c __ STA ACCU + 1 
00:896a : ad 67 49 LDA $4967 ; (cw.wy + 0)
00:896d : 38 __ __ SEC
00:896e : e9 01 __ SBC #$01
00:8970 : 90 06 __ BCC $8978 ; (cwin_console_newline.s8 + 0)
.s11:
00:8972 : 85 0e __ STA P1 
00:8974 : e4 0e __ CPX P1 
00:8976 : b0 2e __ BCS $89a6 ; (cwin_console_newline.s7 + 0)
.s8:
00:8978 : a5 1b __ LDA ACCU + 0 
00:897a : 69 28 __ ADC #$28
00:897c : 85 45 __ STA T2 + 0 
00:897e : a5 1c __ LDA ACCU + 1 
00:8980 : 69 00 __ ADC #$00
00:8982 : 85 46 __ STA T2 + 1 
00:8984 : 18 __ __ CLC
00:8985 : a5 43 __ LDA T0 + 0 
00:8987 : 69 28 __ ADC #$28
00:8989 : 85 47 __ STA T3 + 0 
00:898b : a5 44 __ LDA T0 + 1 
00:898d : 69 00 __ ADC #$00
00:898f : 85 48 __ STA T3 + 1 
00:8991 : a5 49 __ LDA T7 + 0 
00:8993 : f0 c4 __ BEQ $8959 ; (cwin_console_newline.s9 + 0)
.s10:
00:8995 : a0 00 __ LDY #$00
.l12:
00:8997 : b1 47 __ LDA (T3 + 0),y 
00:8999 : 91 43 __ STA (T0 + 0),y 
00:899b : b1 45 __ LDA (T2 + 0),y 
00:899d : 91 1b __ STA (ACCU + 0),y 
00:899f : c8 __ __ INY
00:89a0 : c4 49 __ CPY T7 + 0 
00:89a2 : 90 f3 __ BCC $8997 ; (cwin_console_newline.l12 + 0)
00:89a4 : b0 b3 __ BCS $8959 ; (cwin_console_newline.s9 + 0)
.s7:
00:89a6 : a5 49 __ LDA T7 + 0 
00:89a8 : 85 0f __ STA P2 
00:89aa : a9 00 __ LDA #$00
00:89ac : 85 0d __ STA P0 
00:89ae : a9 01 __ LDA #$01
00:89b0 : 85 10 __ STA P3 
00:89b2 : 85 12 __ STA P5 
00:89b4 : ad 8c 3d LDA $3d8c 
00:89b7 : 49 20 __ EOR #$20
00:89b9 : 85 11 __ STA P4 
--------------------------------------------------------------------
cwin_fill_rect_raw: ; cwin_fill_rect_raw(struct CharWin*,u8,u8,u8,u8,u8,u8)->void
; 174, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
00:89bb : a5 0f __ LDA P2 ; (w + 0)
00:89bd : d0 01 __ BNE $89c0 ; (cwin_fill_rect_raw.s5 + 0)
.s3:
00:89bf : 60 __ __ RTS
.s5:
00:89c0 : a5 0e __ LDA P1 ; (y + 0)
00:89c2 : 0a __ __ ASL
00:89c3 : a8 __ __ TAY
00:89c4 : ad 6c 49 LDA $496c ; (cw.sp + 0)
00:89c7 : 79 50 3d ADC $3d50,y 
00:89ca : aa __ __ TAX
00:89cb : ad 6d 49 LDA $496d ; (cw.sp + 1)
00:89ce : 79 51 3d ADC $3d51,y 
00:89d1 : 85 1c __ STA ACCU + 1 
00:89d3 : 8a __ __ TXA
00:89d4 : 18 __ __ CLC
00:89d5 : 65 0d __ ADC P0 ; (x + 0)
00:89d7 : 85 1b __ STA ACCU + 0 
00:89d9 : 90 03 __ BCC $89de ; (cwin_fill_rect_raw.s10 + 0)
.s9:
00:89db : e6 1c __ INC ACCU + 1 
00:89dd : 18 __ __ CLC
.s10:
00:89de : ad 6e 49 LDA $496e ; (cw.cp + 0)
00:89e1 : 79 50 3d ADC $3d50,y 
00:89e4 : aa __ __ TAX
00:89e5 : ad 6f 49 LDA $496f ; (cw.cp + 1)
00:89e8 : 79 51 3d ADC $3d51,y 
00:89eb : a8 __ __ TAY
00:89ec : 8a __ __ TXA
00:89ed : 18 __ __ CLC
00:89ee : 65 0d __ ADC P0 ; (x + 0)
00:89f0 : 85 43 __ STA T3 + 0 
00:89f2 : 90 01 __ BCC $89f5 ; (cwin_fill_rect_raw.s12 + 0)
.s11:
00:89f4 : c8 __ __ INY
.s12:
00:89f5 : 84 44 __ STY T3 + 1 
00:89f7 : a6 10 __ LDX P3 ; (h + 0)
.l6:
00:89f9 : a0 00 __ LDY #$00
.l7:
00:89fb : a5 11 __ LDA P4 ; (ch + 0)
00:89fd : 91 1b __ STA (ACCU + 0),y 
00:89ff : a5 12 __ LDA P5 ; (color + 0)
00:8a01 : 91 43 __ STA (T3 + 0),y 
00:8a03 : c8 __ __ INY
00:8a04 : c4 0f __ CPY P2 ; (w + 0)
00:8a06 : 90 f3 __ BCC $89fb ; (cwin_fill_rect_raw.l7 + 0)
.s8:
00:8a08 : a5 43 __ LDA T3 + 0 
00:8a0a : 69 27 __ ADC #$27
00:8a0c : 85 43 __ STA T3 + 0 
00:8a0e : 90 03 __ BCC $8a13 ; (cwin_fill_rect_raw.s14 + 0)
.s13:
00:8a10 : e6 44 __ INC T3 + 1 
00:8a12 : 18 __ __ CLC
.s14:
00:8a13 : a5 1b __ LDA ACCU + 0 
00:8a15 : 69 28 __ ADC #$28
00:8a17 : 85 1b __ STA ACCU + 0 
00:8a19 : 90 02 __ BCC $8a1d ; (cwin_fill_rect_raw.s16 + 0)
.s15:
00:8a1b : e6 1c __ INC ACCU + 1 
.s16:
00:8a1d : ca __ __ DEX
00:8a1e : d0 d9 __ BNE $89f9 ; (cwin_fill_rect_raw.l6 + 0)
00:8a20 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_putat_string_reverse@proxy: ; cwin_putat_string_reverse@proxy
00:8a21 : a9 00 __ LDA #$00
00:8a23 : 85 0f __ STA P2 
00:8a25 : a9 38 __ LDA #$38
00:8a27 : 85 11 __ STA P4 
00:8a29 : a9 87 __ LDA #$87
00:8a2b : 85 12 __ STA P5 
00:8a2d : ad 5f 49 LDA $495f ; (cfg.colors.key + 0)
00:8a30 : 85 13 __ STA P6 
--------------------------------------------------------------------
cwin_putat_string_reverse: ; cwin_putat_string_reverse(struct CharWin*,u8,u8,const u8*,u8)->void
;  12, "/home/xahmol/git/UBoot64-v2/src/core.h"
.s4:
00:8a32 : 20 a5 10 JSR $10a5 
00:8a35 : a9 63 __ LDA #$63
00:8a37 : c5 1b __ CMP ACCU + 0 
00:8a39 : b0 06 __ BCS $8a41 ; (cwin_putat_string_reverse.s5 + 0)
.s10:
00:8a3b : 85 1b __ STA ACCU + 0 
.s9:
00:8a3d : a0 00 __ LDY #$00
00:8a3f : f0 4b __ BEQ $8a8c ; (cwin_putat_string_reverse.l11 + 0)
.s5:
00:8a41 : a5 1b __ LDA ACCU + 0 
00:8a43 : d0 f8 __ BNE $8a3d ; (cwin_putat_string_reverse.s9 + 0)
.s6:
00:8a45 : a9 00 __ LDA #$00
00:8a47 : a6 1b __ LDX ACCU + 0 
00:8a49 : 9d 72 49 STA $4972,x ; (linebuffer[0] + 0)
00:8a4c : a5 10 __ LDA P3 ; (y + 0)
00:8a4e : 0a __ __ ASL
00:8a4f : aa __ __ TAX
00:8a50 : bd 50 3d LDA $3d50,x 
00:8a53 : 65 0f __ ADC P2 ; (x + 0)
00:8a55 : 85 1b __ STA ACCU + 0 
00:8a57 : bd 51 3d LDA $3d51,x 
00:8a5a : 69 00 __ ADC #$00
00:8a5c : 85 1c __ STA ACCU + 1 
00:8a5e : ad 6c 49 LDA $496c ; (cw.sp + 0)
00:8a61 : 65 1b __ ADC ACCU + 0 
00:8a63 : 85 43 __ STA T1 + 0 
00:8a65 : ad 6d 49 LDA $496d ; (cw.sp + 1)
00:8a68 : 65 1c __ ADC ACCU + 1 
00:8a6a : 85 44 __ STA T1 + 1 
00:8a6c : ad 6e 49 LDA $496e ; (cw.cp + 0)
00:8a6f : 18 __ __ CLC
00:8a70 : 65 1b __ ADC ACCU + 0 
00:8a72 : 85 1b __ STA ACCU + 0 
00:8a74 : ad 6f 49 LDA $496f ; (cw.cp + 1)
00:8a77 : 65 1c __ ADC ACCU + 1 
00:8a79 : 85 1c __ STA ACCU + 1 
00:8a7b : a0 00 __ LDY #$00
00:8a7d : f0 07 __ BEQ $8a86 ; (cwin_putat_string_reverse.l7 + 0)
.s8:
00:8a7f : 91 43 __ STA (T1 + 0),y 
00:8a81 : a5 13 __ LDA P6 ; (color + 0)
00:8a83 : 91 1b __ STA (ACCU + 0),y 
00:8a85 : c8 __ __ INY
.l7:
00:8a86 : b9 72 49 LDA $4972,y ; (linebuffer[0] + 0)
00:8a89 : d0 f4 __ BNE $8a7f ; (cwin_putat_string_reverse.s8 + 0)
.s3:
00:8a8b : 60 __ __ RTS
.l11:
00:8a8c : b1 11 __ LDA (P4),y ; (str + 0)
00:8a8e : 4a __ __ LSR
00:8a8f : 4a __ __ LSR
00:8a90 : 4a __ __ LSR
00:8a91 : 4a __ __ LSR
00:8a92 : 4a __ __ LSR
00:8a93 : aa __ __ TAX
00:8a94 : bd 82 3d LDA $3d82,x 
00:8a97 : 51 11 __ EOR (P4),y ; (str + 0)
00:8a99 : 09 80 __ ORA #$80
00:8a9b : 99 72 49 STA $4972,y ; (linebuffer[0] + 0)
00:8a9e : c8 __ __ INY
00:8a9f : c4 1b __ CPY ACCU + 0 
00:8aa1 : 90 e9 __ BCC $8a8c ; (cwin_putat_string_reverse.l11 + 0)
00:8aa3 : b0 a0 __ BCS $8a45 ; (cwin_putat_string_reverse.s6 + 0)
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
00:8aa5 : a5 11 __ LDA P4 
00:8aa7 : 85 0d __ STA P0 
00:8aa9 : a5 12 __ LDA P5 
00:8aab : 85 0e __ STA P1 
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
;  12, "/home/xahmol/oscar64/include/string.h"
.s4:
00:8aad : a9 00 __ LDA #$00
00:8aaf : 85 1b __ STA ACCU + 0 
00:8ab1 : 85 1c __ STA ACCU + 1 
00:8ab3 : a8 __ __ TAY
00:8ab4 : b1 0d __ LDA (P0),y ; (str + 0)
00:8ab6 : f0 10 __ BEQ $8ac8 ; (strlen.s3 + 0)
.s6:
00:8ab8 : a2 00 __ LDX #$00
.l7:
00:8aba : c8 __ __ INY
00:8abb : d0 03 __ BNE $8ac0 ; (strlen.s9 + 0)
.s8:
00:8abd : e6 0e __ INC P1 ; (str + 1)
00:8abf : e8 __ __ INX
.s9:
00:8ac0 : b1 0d __ LDA (P0),y ; (str + 0)
00:8ac2 : d0 f6 __ BNE $8aba ; (strlen.l7 + 0)
.s5:
00:8ac4 : 86 1c __ STX ACCU + 1 
00:8ac6 : 84 1b __ STY ACCU + 0 
.s3:
00:8ac8 : 60 __ __ RTS
--------------------------------------------------------------------
00:8ac9 : __ __ __ BYT 75 62 4f 4f 54 36 34 3a 20 20 62 4f 4f 54 20 6d : ubOOT64:  bOOT m
00:8ad9 : __ __ __ BYT 45 4e 55 20 46 4f 52 20 75 4c 54 49 4d 41 54 45 : ENU FOR uLTIMATE
00:8ae9 : __ __ __ BYT 20 44 45 56 49 43 45 53 00                      :  DEVICES.
--------------------------------------------------------------------
uii_get_time: ; uii_get_time()->void
;  21, "/home/xahmol/git/UBoot64-v2/include/ultimate_time_lib.h"
.s4:
00:8af2 : a9 00 __ LDA #$00
00:8af4 : 85 10 __ STA P3 
00:8af6 : 8d dd 7f STA $7fdd ; (cmd[0] + 0)
00:8af9 : a9 02 __ LDA #$02
00:8afb : 85 0f __ STA P2 
00:8afd : a9 01 __ LDA #$01
00:8aff : 8d 8a 3d STA $3d8a 
00:8b02 : a9 26 __ LDA #$26
00:8b04 : 8d de 7f STA $7fde ; (cmd[0] + 1)
00:8b07 : a9 dd __ LDA #$dd
00:8b09 : 85 0d __ STA P0 
00:8b0b : a9 7f __ LDA #$7f
00:8b0d : 85 0e __ STA P1 
00:8b0f : 20 53 11 JSR $1153 
00:8b12 : 20 ce 11 JSR $11ce 
00:8b15 : 20 0c 12 JSR $120c 
--------------------------------------------------------------------
uii_accept: ; uii_accept()->void
; 174, "/home/xahmol/git/UBoot64-v2/include/ultimate_common_lib.h"
.s4:
00:8b18 : ad 1c df LDA $df1c 
00:8b1b : 09 02 __ ORA #$02
00:8b1d : 8d 1c df STA $df1c 
.l5:
00:8b20 : ad 1c df LDA $df1c 
00:8b23 : 29 02 __ AND #$02
00:8b25 : d0 f9 __ BNE $8b20 ; (uii_accept.l5 + 0)
.s3:
00:8b27 : 60 __ __ RTS
--------------------------------------------------------------------
uii_read_file: ; uii_read_file(u16)->void
;  34, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
00:8b28 : a9 00 __ LDA #$00
00:8b2a : 85 10 __ STA P3 
00:8b2c : 8d db 7f STA $7fdb ; (cmd[0] + 0)
00:8b2f : 8d dd 7f STA $7fdd ; (cmd[0] + 2)
00:8b32 : 8d de 7f STA $7fde ; (cmd[0] + 3)
00:8b35 : a9 01 __ LDA #$01
00:8b37 : 8d 8a 3d STA $3d8a 
00:8b3a : a9 04 __ LDA #$04
00:8b3c : 85 0f __ STA P2 
00:8b3e : 8d dc 7f STA $7fdc ; (cmd[0] + 1)
00:8b41 : a5 11 __ LDA P4 ; (length + 0)
00:8b43 : 8d dd 7f STA $7fdd ; (cmd[0] + 2)
00:8b46 : a5 12 __ LDA P5 ; (length + 1)
00:8b48 : 8d de 7f STA $7fde ; (cmd[0] + 3)
00:8b4b : a9 db __ LDA #$db
00:8b4d : 85 0d __ STA P0 
00:8b4f : a9 7f __ LDA #$7f
00:8b51 : 85 0e __ STA P1 
--------------------------------------------------------------------
uii_sendcommand: ; uii_sendcommand(u8*,u16)->void
; 173, "/home/xahmol/git/UBoot64-v2/include/ultimate_common_lib.h"
.s4:
00:8b53 : ad 8a 3d LDA $3d8a 
00:8b56 : a0 00 __ LDY #$00
00:8b58 : 84 1b __ STY ACCU + 0 
00:8b5a : 84 1c __ STY ACCU + 1 
00:8b5c : 91 0d __ STA (P0),y ; (bytes + 0)
.l5:
00:8b5e : ad 1c df LDA $df1c 
00:8b61 : 29 20 __ AND #$20
00:8b63 : d0 f9 __ BNE $8b5e ; (uii_sendcommand.l5 + 0)
.s6:
00:8b65 : ad 1c df LDA $df1c 
00:8b68 : 29 10 __ AND #$10
00:8b6a : d0 f2 __ BNE $8b5e ; (uii_sendcommand.l5 + 0)
.s7:
00:8b6c : a5 1c __ LDA ACCU + 1 
00:8b6e : c5 10 __ CMP P3 ; (count + 1)
00:8b70 : d0 04 __ BNE $8b76 ; (uii_sendcommand.s16 + 0)
.s15:
00:8b72 : a5 1b __ LDA ACCU + 0 
00:8b74 : c5 0f __ CMP P2 ; (count + 0)
.s16:
00:8b76 : b0 2e __ BCS $8ba6 ; (uii_sendcommand.s8 + 0)
.s12:
00:8b78 : a5 0d __ LDA P0 ; (bytes + 0)
00:8b7a : 65 1b __ ADC ACCU + 0 
00:8b7c : 85 43 __ STA T3 + 0 
00:8b7e : a5 0e __ LDA P1 ; (bytes + 1)
00:8b80 : 65 1c __ ADC ACCU + 1 
00:8b82 : 85 44 __ STA T3 + 1 
00:8b84 : a6 1b __ LDX ACCU + 0 
.l13:
00:8b86 : a0 00 __ LDY #$00
00:8b88 : b1 43 __ LDA (T3 + 0),y 
00:8b8a : 8d 1d df STA $df1d 
00:8b8d : e6 43 __ INC T3 + 0 
00:8b8f : d0 02 __ BNE $8b93 ; (uii_sendcommand.s19 + 0)
.s18:
00:8b91 : e6 44 __ INC T3 + 1 
.s19:
00:8b93 : e8 __ __ INX
00:8b94 : d0 02 __ BNE $8b98 ; (uii_sendcommand.s21 + 0)
.s20:
00:8b96 : e6 1c __ INC ACCU + 1 
.s21:
00:8b98 : a5 1c __ LDA ACCU + 1 
00:8b9a : c5 10 __ CMP P3 ; (count + 1)
00:8b9c : 90 e8 __ BCC $8b86 ; (uii_sendcommand.l13 + 0)
.s22:
00:8b9e : d0 04 __ BNE $8ba4 ; (uii_sendcommand.s17 + 0)
.s14:
00:8ba0 : e4 0f __ CPX P2 ; (count + 0)
00:8ba2 : 90 e2 __ BCC $8b86 ; (uii_sendcommand.l13 + 0)
.s17:
00:8ba4 : 86 1b __ STX ACCU + 0 
.s8:
00:8ba6 : ad 1c df LDA $df1c 
00:8ba9 : 09 01 __ ORA #$01
00:8bab : 8d 1c df STA $df1c 
00:8bae : ad 1c df LDA $df1c 
00:8bb1 : 29 04 __ AND #$04
00:8bb3 : f0 0a __ BEQ $8bbf ; (uii_sendcommand.l9 + 0)
.s11:
00:8bb5 : ad 1c df LDA $df1c 
00:8bb8 : 09 08 __ ORA #$08
00:8bba : 8d 1c df STA $df1c 
00:8bbd : b0 9f __ BCS $8b5e ; (uii_sendcommand.l5 + 0)
.l9:
00:8bbf : ad 1c df LDA $df1c 
00:8bc2 : 29 20 __ AND #$20
00:8bc4 : d0 07 __ BNE $8bcd ; (uii_sendcommand.s3 + 0)
.s10:
00:8bc6 : ad 1c df LDA $df1c 
00:8bc9 : 29 10 __ AND #$10
00:8bcb : d0 f2 __ BNE $8bbf ; (uii_sendcommand.l9 + 0)
.s3:
00:8bcd : 60 __ __ RTS
--------------------------------------------------------------------
uii_readdata: ; uii_readdata()->u16
; 179, "/home/xahmol/git/UBoot64-v2/include/ultimate_common_lib.h"
.s4:
00:8bce : a9 00 __ LDA #$00
00:8bd0 : 8d d6 49 STA $49d6 ; (uii_data[0] + 0)
00:8bd3 : a2 d6 __ LDX #$d6
00:8bd5 : 86 43 __ STX T1 + 0 
00:8bd7 : a8 __ __ TAY
00:8bd8 : f0 12 __ BEQ $8bec ; (uii_readdata.l5 + 0)
.s8:
00:8bda : 8a __ __ TXA
00:8bdb : 18 __ __ CLC
00:8bdc : 69 49 __ ADC #$49
00:8bde : 85 44 __ STA T1 + 1 
00:8be0 : ad 1e df LDA $df1e 
00:8be3 : 91 43 __ STA (T1 + 0),y 
00:8be5 : 98 __ __ TYA
00:8be6 : 69 01 __ ADC #$01
00:8be8 : a8 __ __ TAY
00:8be9 : 8a __ __ TXA
00:8bea : 69 00 __ ADC #$00
.l5:
00:8bec : aa __ __ TAX
00:8bed : 2c 1c df BIT $df1c 
00:8bf0 : 10 07 __ BPL $8bf9 ; (uii_readdata.s6 + 0)
.s7:
00:8bf2 : e0 02 __ CPX #$02
00:8bf4 : d0 e4 __ BNE $8bda ; (uii_readdata.s8 + 0)
.s9:
00:8bf6 : 98 __ __ TYA
00:8bf7 : d0 e1 __ BNE $8bda ; (uii_readdata.s8 + 0)
.s6:
00:8bf9 : 86 1c __ STX ACCU + 1 
00:8bfb : 84 1b __ STY ACCU + 0 
00:8bfd : a9 d6 __ LDA #$d6
00:8bff : 85 43 __ STA T1 + 0 
00:8c01 : 8a __ __ TXA
00:8c02 : 18 __ __ CLC
00:8c03 : 69 49 __ ADC #$49
00:8c05 : 85 44 __ STA T1 + 1 
00:8c07 : a9 00 __ LDA #$00
00:8c09 : 91 43 __ STA (T1 + 0),y 
.s3:
00:8c0b : 60 __ __ RTS
--------------------------------------------------------------------
uii_readstatus: ; uii_readstatus()->void
; 180, "/home/xahmol/git/UBoot64-v2/include/ultimate_common_lib.h"
.s4:
00:8c0c : a9 00 __ LDA #$00
00:8c0e : 8d d7 4b STA $4bd7 ; (uii_status[0] + 0)
00:8c11 : a2 d7 __ LDX #$d7
00:8c13 : 86 1b __ STX ACCU + 0 
00:8c15 : a8 __ __ TAY
00:8c16 : f0 0d __ BEQ $8c25 ; (uii_readstatus.l5 + 0)
.s8:
00:8c18 : ad 1f df LDA $df1f 
00:8c1b : 91 1b __ STA (ACCU + 0),y 
00:8c1d : 98 __ __ TYA
00:8c1e : 18 __ __ CLC
00:8c1f : 69 01 __ ADC #$01
00:8c21 : a8 __ __ TAY
00:8c22 : 8a __ __ TXA
00:8c23 : 69 00 __ ADC #$00
.l5:
00:8c25 : aa __ __ TAX
00:8c26 : 18 __ __ CLC
00:8c27 : 69 4b __ ADC #$4b
00:8c29 : 85 1c __ STA ACCU + 1 
00:8c2b : ad 1c df LDA $df1c 
00:8c2e : 29 40 __ AND #$40
00:8c30 : f0 07 __ BEQ $8c39 ; (uii_readstatus.s6 + 0)
.s7:
00:8c32 : e0 01 __ CPX #$01
00:8c34 : d0 e2 __ BNE $8c18 ; (uii_readstatus.s8 + 0)
.s9:
00:8c36 : 98 __ __ TYA
00:8c37 : d0 df __ BNE $8c18 ; (uii_readstatus.s8 + 0)
.s6:
00:8c39 : 91 1b __ STA (ACCU + 0),y 
.s3:
00:8c3b : 60 __ __ RTS
--------------------------------------------------------------------
00:8c3c : __ __ __ BYT 56 32 2e 30 2e 30 2d 32 30 32 36 30 34 32 37 2d : V2.0.0-20260427-
00:8c4c : __ __ __ BYT 31 37 31 35 00                                  : 1715.
--------------------------------------------------------------------
00:8c51 : __ __ __ BYT 73 54 41 52 54 49 4e 47 2e 2e 2e 2e 00          : sTARTING.....
--------------------------------------------------------------------
cwin_put_string@proxy: ; cwin_put_string@proxy
00:8c5e : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:8c61 : 85 11 __ STA P4 
--------------------------------------------------------------------
cwin_put_string: ; cwin_put_string(struct CharWin*,const u8*,u8)->void
;  64, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
00:8c63 : ad 68 49 LDA $4968 ; (cw.cx + 0)
00:8c66 : 85 0d __ STA P0 
00:8c68 : ad 69 49 LDA $4969 ; (cw.cy + 0)
00:8c6b : 85 0e __ STA P1 
00:8c6d : 20 8f 12 JSR $128f 
00:8c70 : 18 __ __ CLC
00:8c71 : 6d 68 49 ADC $4968 ; (cw.cx + 0)
00:8c74 : cd 66 49 CMP $4966 ; (cw.wx + 0)
00:8c77 : 90 05 __ BCC $8c7e ; (cwin_put_string.s3 + 0)
.s5:
00:8c79 : a9 00 __ LDA #$00
00:8c7b : ee 69 49 INC $4969 ; (cw.cy + 0)
.s3:
00:8c7e : 8d 68 49 STA $4968 ; (cw.cx + 0)
00:8c81 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_putat_string@proxy: ; cwin_putat_string@proxy
00:8c82 : a9 00 __ LDA #$00
00:8c84 : 85 0d __ STA P0 
00:8c86 : a9 17 __ LDA #$17
00:8c88 : 85 0e __ STA P1 
00:8c8a : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:8c8d : 85 11 __ STA P4 
--------------------------------------------------------------------
cwin_putat_string: ; cwin_putat_string(struct CharWin*,u8,u8,const u8*,u8)->u8
;  90, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
00:8c8f : a5 0e __ LDA P1 ; (y + 0)
00:8c91 : 0a __ __ ASL
00:8c92 : aa __ __ TAX
00:8c93 : bd 50 3d LDA $3d50,x 
00:8c96 : 65 0d __ ADC P0 ; (x + 0)
00:8c98 : 85 1b __ STA ACCU + 0 
00:8c9a : bd 51 3d LDA $3d51,x 
00:8c9d : 69 00 __ ADC #$00
00:8c9f : 85 1c __ STA ACCU + 1 
00:8ca1 : ad 6c 49 LDA $496c ; (cw.sp + 0)
00:8ca4 : 65 1b __ ADC ACCU + 0 
00:8ca6 : 85 43 __ STA T1 + 0 
00:8ca8 : ad 6d 49 LDA $496d ; (cw.sp + 1)
00:8cab : 65 1c __ ADC ACCU + 1 
00:8cad : 85 44 __ STA T1 + 1 
00:8caf : ad 6e 49 LDA $496e ; (cw.cp + 0)
00:8cb2 : 18 __ __ CLC
00:8cb3 : 65 1b __ ADC ACCU + 0 
00:8cb5 : 85 1b __ STA ACCU + 0 
00:8cb7 : ad 6f 49 LDA $496f ; (cw.cp + 1)
00:8cba : 65 1c __ ADC ACCU + 1 
00:8cbc : 85 1c __ STA ACCU + 1 
00:8cbe : a0 00 __ LDY #$00
00:8cc0 : b1 0f __ LDA (P2),y ; (str + 0)
00:8cc2 : f0 16 __ BEQ $8cda ; (cwin_putat_string.s5 + 0)
.l6:
00:8cc4 : 4a __ __ LSR
00:8cc5 : 4a __ __ LSR
00:8cc6 : 4a __ __ LSR
00:8cc7 : 4a __ __ LSR
00:8cc8 : 4a __ __ LSR
00:8cc9 : aa __ __ TAX
00:8cca : bd 8b 3d LDA $3d8b,x 
00:8ccd : 51 0f __ EOR (P2),y ; (str + 0)
00:8ccf : 91 43 __ STA (T1 + 0),y 
00:8cd1 : a5 11 __ LDA P4 ; (color + 0)
00:8cd3 : 91 1b __ STA (ACCU + 0),y 
00:8cd5 : c8 __ __ INY
00:8cd6 : b1 0f __ LDA (P2),y ; (str + 0)
00:8cd8 : d0 ea __ BNE $8cc4 ; (cwin_putat_string.l6 + 0)
.s5:
00:8cda : 98 __ __ TYA
.s3:
00:8cdb : 60 __ __ RTS
--------------------------------------------------------------------
00:8cdc : __ __ __ BYT 64 45 54 45 43 54 49 4e 47 20 41 4e 44 20 52 45 : dETECTING AND RE
00:8cec : __ __ __ BYT 41 44 49 4e 47 2e 2e 2e 00                      : ADING....
--------------------------------------------------------------------
uii_abort: ; uii_abort()->void
; 178, "/home/xahmol/git/UBoot64-v2/include/ultimate_common_lib.h"
.s4:
00:8cf5 : ad 1c df LDA $df1c 
00:8cf8 : 09 04 __ ORA #$04
00:8cfa : 8d 1c df STA $df1c 
.s3:
00:8cfd : 60 __ __ RTS
--------------------------------------------------------------------
00:8cfe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
00:8cff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
00:8d00 : __ __ __ BYT 6e 4f 20 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d : nO uLTIMATE cOMM
00:8d10 : __ __ __ BYT 41 4e 44 20 69 4e 54 45 52 46 41 43 45 20 45 4e : AND iNTERFACE EN
00:8d20 : __ __ __ BYT 41 42 4c 45 44 2e 00                            : ABLED..
--------------------------------------------------------------------
DoDemoMode: ; DoDemoMode()->void
; 435, "/home/xahmol/git/UBoot64-v2/src/core.c"
.s4:
00:8d27 : ad e4 4c LDA $4ce4 ; (uii_devinfo[0].exist + 0)
00:8d2a : f0 40 __ BEQ $8d6c ; (DoDemoMode.s5 + 0)
.s24:
00:8d2c : ad e6 4c LDA $4ce6 ; (uii_devinfo[0].power + 0)
00:8d2f : f0 3b __ BEQ $8d6c ; (DoDemoMode.s5 + 0)
.s25:
00:8d31 : ad e7 4c LDA $4ce7 ; (uii_devinfo[0].id + 0)
00:8d34 : c9 08 __ CMP #$08
00:8d36 : f0 34 __ BEQ $8d6c ; (DoDemoMode.s5 + 0)
.s26:
00:8d38 : 20 9e 2a JSR $2a9e 
00:8d3b : ad d7 4b LDA $4bd7 ; (uii_status[0] + 0)
00:8d3e : c9 30 __ CMP #$30
00:8d40 : d0 07 __ BNE $8d49 ; (DoDemoMode.s27 + 0)
.s29:
00:8d42 : ad d8 4b LDA $4bd8 ; (uii_status[0] + 1)
00:8d45 : c9 30 __ CMP #$30
00:8d47 : f0 07 __ BEQ $8d50 ; (DoDemoMode.s30 + 0)
.s27:
00:8d49 : a9 28 __ LDA #$28
00:8d4b : a0 c7 __ LDY #$c7
00:8d4d : 4c 54 13 JMP $1354 
.s30:
00:8d50 : a9 28 __ LDA #$28
00:8d52 : a0 c3 __ LDY #$c3
.s28:
00:8d54 : 8c e5 7f STY $7fe5 ; (sstack + 6)
00:8d57 : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:8d5a : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:8d5d : 85 18 __ STA P11 
00:8d5f : a9 be __ LDA #$be
00:8d61 : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:8d64 : a9 2c __ LDA #$2c
00:8d66 : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:8d69 : 20 25 15 JSR $1525 
.s5:
00:8d6c : ad e8 4c LDA $4ce8 ; (uii_devinfo[0] + 4)
00:8d6f : f0 40 __ BEQ $8db1 ; (DoDemoMode.s6 + 0)
.s17:
00:8d71 : ad ea 4c LDA $4cea ; (uii_devinfo[0] + 6)
00:8d74 : f0 3b __ BEQ $8db1 ; (DoDemoMode.s6 + 0)
.s18:
00:8d76 : ad eb 4c LDA $4ceb ; (uii_devinfo[0] + 7)
00:8d79 : c9 08 __ CMP #$08
00:8d7b : f0 34 __ BEQ $8db1 ; (DoDemoMode.s6 + 0)
.s19:
00:8d7d : 20 c7 2a JSR $2ac7 
00:8d80 : ad d7 4b LDA $4bd7 ; (uii_status[0] + 0)
00:8d83 : c9 30 __ CMP #$30
00:8d85 : d0 07 __ BNE $8d8e ; (DoDemoMode.s20 + 0)
.s22:
00:8d87 : ad d8 4b LDA $4bd8 ; (uii_status[0] + 1)
00:8d8a : c9 30 __ CMP #$30
00:8d8c : f0 07 __ BEQ $8d95 ; (DoDemoMode.s23 + 0)
.s20:
00:8d8e : a9 28 __ LDA #$28
00:8d90 : a0 c7 __ LDY #$c7
00:8d92 : 4c 99 13 JMP $1399 
.s23:
00:8d95 : a9 28 __ LDA #$28
00:8d97 : a0 c3 __ LDY #$c3
.s21:
00:8d99 : 8c e5 7f STY $7fe5 ; (sstack + 6)
00:8d9c : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:8d9f : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:8da2 : 85 18 __ STA P11 
00:8da4 : a9 d5 __ LDA #$d5
00:8da6 : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:8da9 : a9 2c __ LDA #$2c
00:8dab : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:8dae : 20 25 15 JSR $1525 
.s6:
00:8db1 : 20 f0 27 JSR $27f0 
00:8db4 : aa __ __ TAX
00:8db5 : f0 63 __ BEQ $8e1a ; (DoDemoMode.s7 + 0)
.l8:
00:8db7 : a9 ec __ LDA #$ec
00:8db9 : 85 0f __ STA P2 
00:8dbb : a9 2c __ LDA #$2c
00:8dbd : 85 10 __ STA P3 
00:8dbf : 20 5e 12 JSR $125e 
00:8dc2 : a0 01 __ LDY #$01
00:8dc4 : ad 19 53 LDA $5319 ; (iec_devices[0] + 1)
00:8dc7 : f0 2e __ BEQ $8df7 ; (DoDemoMode.l10 + 0)
.l12:
00:8dc9 : c9 04 __ CMP #$04
00:8dcb : b0 2a __ BCS $8df7 ; (DoDemoMode.l10 + 0)
.s13:
00:8dcd : 84 51 __ STY T3 + 0 
00:8dcf : 98 __ __ TYA
00:8dd0 : c0 16 __ CPY #$16
00:8dd2 : d0 04 __ BNE $8dd8 ; (DoDemoMode.s14 + 0)
.s16:
00:8dd4 : a9 04 __ LDA #$04
00:8dd6 : d0 03 __ BNE $8ddb ; (DoDemoMode.s15 + 0)
.s14:
00:8dd8 : 18 __ __ CLC
00:8dd9 : 69 08 __ ADC #$08
.s15:
00:8ddb : 8d e5 7f STA $7fe5 ; (sstack + 6)
00:8dde : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:8de1 : 85 18 __ STA P11 
00:8de3 : a9 00 __ LDA #$00
00:8de5 : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:8de8 : a9 db __ LDA #$db
00:8dea : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:8ded : a9 28 __ LDA #$28
00:8def : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:8df2 : 20 25 15 JSR $1525 
00:8df5 : a4 51 __ LDY T3 + 0 
.l10:
00:8df7 : c8 __ __ INY
00:8df8 : c0 17 __ CPY #$17
00:8dfa : b0 07 __ BCS $8e03 ; (DoDemoMode.s11 + 0)
.s9:
00:8dfc : b9 18 53 LDA $5318,y ; (iec_devices[0] + 0)
00:8dff : f0 f6 __ BEQ $8df7 ; (DoDemoMode.l10 + 0)
00:8e01 : d0 c6 __ BNE $8dc9 ; (DoDemoMode.l12 + 0)
.s11:
00:8e03 : a9 00 __ LDA #$00
00:8e05 : 85 0f __ STA P2 
00:8e07 : a9 2d __ LDA #$2d
00:8e09 : 85 10 __ STA P3 
00:8e0b : 20 5e 12 JSR $125e 
00:8e0e : 20 25 14 JSR $1425 
00:8e11 : 20 50 14 JSR $1450 
00:8e14 : 20 f0 27 JSR $27f0 
00:8e17 : aa __ __ TAX
00:8e18 : d0 9d __ BNE $8db7 ; (DoDemoMode.l8 + 0)
.s7:
00:8e1a : a9 0f __ LDA #$0f
00:8e1c : 85 0f __ STA P2 
00:8e1e : a9 2d __ LDA #$2d
00:8e20 : 85 10 __ STA P3 
00:8e22 : 20 5e 12 JSR $125e 
--------------------------------------------------------------------
cwin_cursor_newline: ; cwin_cursor_newline(struct CharWin*)->void
;  44, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
00:8e25 : ad 69 49 LDA $4969 ; (cw.cy + 0)
00:8e28 : 18 __ __ CLC
00:8e29 : 69 01 __ ADC #$01
00:8e2b : a8 __ __ TAY
00:8e2c : a9 00 __ LDA #$00
00:8e2e : 8d 68 49 STA $4968 ; (cw.cx + 0)
00:8e31 : 2a __ __ ROL
00:8e32 : d0 08 __ BNE $8e3c ; (cwin_cursor_newline.s3 + 0)
.s6:
00:8e34 : cc 67 49 CPY $4967 ; (cw.wy + 0)
00:8e37 : b0 03 __ BCS $8e3c ; (cwin_cursor_newline.s3 + 0)
.s5:
00:8e39 : ee 69 49 INC $4969 ; (cw.cy + 0)
.s3:
00:8e3c : 60 __ __ RTS
--------------------------------------------------------------------
00:8e3d : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 20 54 4f 20 45 58 49 : pRESS KEY TO EXI
00:8e4d : __ __ __ BYT 54 2e 00                                        : T..
--------------------------------------------------------------------
cwin_getch: ; cwin_getch()->i16
; 147, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
00:8e50 : 20 e4 ff JSR $ffe4 
00:8e53 : c9 00 __ CMP #$00
00:8e55 : f0 f9 __ BEQ $8e50 ; (cwin_getch.s4 + 0)
00:8e57 : 85 1b __ STA ACCU + 0 
00:8e59 : a9 00 __ LDA #$00
00:8e5b : 85 1c __ STA ACCU + 1 
.s3:
00:8e5d : 60 __ __ RTS
--------------------------------------------------------------------
uii_change_dir@proxy: ; uii_change_dir@proxy
00:8e5e : a9 93 __ LDA #$93
00:8e60 : 85 11 __ STA P4 
00:8e62 : a9 3d __ LDA #$3d
00:8e64 : 85 12 __ STA P5 
--------------------------------------------------------------------
uii_change_dir: ; uii_change_dir(u8*)->void
;  25, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
00:8e66 : 20 a5 10 JSR $10a5 
00:8e69 : 18 __ __ CLC
00:8e6a : a5 1b __ LDA ACCU + 0 
00:8e6c : 69 02 __ ADC #$02
00:8e6e : 85 1b __ STA ACCU + 0 
00:8e70 : 90 02 __ BCC $8e74 ; (uii_change_dir.s11 + 0)
.s10:
00:8e72 : e6 1c __ INC ACCU + 1 
.s11:
00:8e74 : 20 a0 38 JSR $38a0 
00:8e77 : a5 1c __ LDA ACCU + 1 
00:8e79 : 05 1b __ ORA ACCU + 0 
00:8e7b : d0 01 __ BNE $8e7e ; (uii_change_dir.s5 + 0)
.s3:
00:8e7d : 60 __ __ RTS
.s5:
00:8e7e : a5 1c __ LDA ACCU + 1 
00:8e80 : 85 46 __ STA T2 + 1 
00:8e82 : a5 1b __ LDA ACCU + 0 
00:8e84 : 85 45 __ STA T2 + 0 
00:8e86 : a9 00 __ LDA #$00
00:8e88 : a8 __ __ TAY
00:8e89 : 91 1b __ STA (ACCU + 0),y 
00:8e8b : a9 11 __ LDA #$11
00:8e8d : c8 __ __ INY
00:8e8e : 91 1b __ STA (ACCU + 0),y 
00:8e90 : a9 00 __ LDA #$00
00:8e92 : 85 47 __ STA T3 + 0 
00:8e94 : 85 48 __ STA T3 + 1 
.l12:
00:8e96 : 20 49 3d JSR $3d49 
00:8e99 : a5 48 __ LDA T3 + 1 
00:8e9b : c5 1c __ CMP ACCU + 1 
00:8e9d : d0 5c __ BNE $8efb ; (uii_change_dir.s9 + 0)
.s8:
00:8e9f : a5 47 __ LDA T3 + 0 
00:8ea1 : c5 1b __ CMP ACCU + 0 
00:8ea3 : 90 2d __ BCC $8ed2 ; (uii_change_dir.s7 + 0)
.s6:
00:8ea5 : a5 12 __ LDA P5 ; (directory + 1)
00:8ea7 : 85 0e __ STA P1 
00:8ea9 : a9 01 __ LDA #$01
00:8eab : 8d 8a 3d STA $3d8a 
00:8eae : 20 ad 10 JSR $10ad 
00:8eb1 : a5 45 __ LDA T2 + 0 
00:8eb3 : 85 0d __ STA P0 
00:8eb5 : a5 46 __ LDA T2 + 1 
00:8eb7 : 85 0e __ STA P1 
00:8eb9 : 18 __ __ CLC
00:8eba : a5 1b __ LDA ACCU + 0 
00:8ebc : 69 02 __ ADC #$02
00:8ebe : 85 0f __ STA P2 
00:8ec0 : a5 1c __ LDA ACCU + 1 
00:8ec2 : 69 00 __ ADC #$00
00:8ec4 : 85 10 __ STA P3 
00:8ec6 : 20 53 11 JSR $1153 
00:8ec9 : 20 98 39 JSR $3998 
00:8ecc : 20 0c 12 JSR $120c 
00:8ecf : 4c 18 11 JMP $1118 
.s7:
00:8ed2 : 85 43 __ STA T0 + 0 
00:8ed4 : 18 __ __ CLC
00:8ed5 : a5 12 __ LDA P5 ; (directory + 1)
00:8ed7 : 65 48 __ ADC T3 + 1 
00:8ed9 : 85 44 __ STA T0 + 1 
00:8edb : a4 11 __ LDY P4 ; (directory + 0)
00:8edd : b1 43 __ LDA (T0 + 0),y 
00:8edf : aa __ __ TAX
00:8ee0 : 18 __ __ CLC
00:8ee1 : a5 45 __ LDA T2 + 0 
00:8ee3 : 65 47 __ ADC T3 + 0 
00:8ee5 : 85 43 __ STA T0 + 0 
00:8ee7 : a5 46 __ LDA T2 + 1 
00:8ee9 : 65 48 __ ADC T3 + 1 
00:8eeb : 85 44 __ STA T0 + 1 
00:8eed : 8a __ __ TXA
00:8eee : a0 02 __ LDY #$02
00:8ef0 : 91 43 __ STA (T0 + 0),y 
00:8ef2 : e6 47 __ INC T3 + 0 
00:8ef4 : d0 a0 __ BNE $8e96 ; (uii_change_dir.l12 + 0)
.s13:
00:8ef6 : e6 48 __ INC T3 + 1 
00:8ef8 : 4c 96 14 JMP $1496 
.s9:
00:8efb : b0 a8 __ BCS $8ea5 ; (uii_change_dir.s6 + 0)
.s14:
00:8efd : a5 47 __ LDA T3 + 0 
00:8eff : 90 d1 __ BCC $8ed2 ; (uii_change_dir.s7 + 0)
--------------------------------------------------------------------
errorexit: ; errorexit(const u8*)->void
;   7, "/home/xahmol/git/UBoot64-v2/src/core.h"
.s4:
00:8f01 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:8f04 : 85 18 __ STA P11 
00:8f06 : a9 66 __ LDA #$66
00:8f08 : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:8f0b : a9 1b __ LDA #$1b
00:8f0d : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:8f10 : ad eb 7f LDA $7feb ; (sstack + 12)
00:8f13 : 8d e5 7f STA $7fe5 ; (sstack + 6)
00:8f16 : ad ec 7f LDA $7fec ; (sstack + 13)
00:8f19 : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:8f1c : 20 25 15 JSR $1525 
00:8f1f : 20 50 14 JSR $1450 
00:8f22 : 4c 00 c0 JMP $c000 
--------------------------------------------------------------------
cwin_console_printf: ; cwin_console_printf(struct CharWin*,u8,const u8*)->void
; 206, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
00:8f25 : ad e3 7f LDA $7fe3 ; (sstack + 4)
00:8f28 : 8d df 7f STA $7fdf ; (sstack + 0)
00:8f2b : a9 ff __ LDA #$ff
00:8f2d : 85 16 __ STA P9 
00:8f2f : a9 7e __ LDA #$7e
00:8f31 : 85 17 __ STA P10 
00:8f33 : ad e4 7f LDA $7fe4 ; (sstack + 5)
00:8f36 : 8d e0 7f STA $7fe0 ; (sstack + 1)
00:8f39 : a9 e5 __ LDA #$e5
00:8f3b : 8d e1 7f STA $7fe1 ; (sstack + 2)
00:8f3e : a9 7f __ LDA #$7f
00:8f40 : 8d e2 7f STA $7fe2 ; (sstack + 3)
00:8f43 : 20 f1 15 JSR $15f1 
00:8f46 : a5 18 __ LDA P11 ; (color + 0)
00:8f48 : 85 15 __ STA P8 
00:8f4a : a9 ff __ LDA #$ff
00:8f4c : 85 13 __ STA P6 
00:8f4e : a9 7e __ LDA #$7e
00:8f50 : 85 14 __ STA P7 
--------------------------------------------------------------------
cwin_console_write_string: ; cwin_console_write_string(struct CharWin*,const u8*,u8)->void
; 183, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
00:8f52 : ad 68 49 LDA $4968 ; (cw.cx + 0)
00:8f55 : 8d 6a 49 STA $496a ; (cw.lx + 0)
00:8f58 : ad 69 49 LDA $4969 ; (cw.cy + 0)
00:8f5b : 8d 6b 49 STA $496b ; (cw.ly + 0)
00:8f5e : a9 00 __ LDA #$00
00:8f60 : 85 4a __ STA T4 + 0 
00:8f62 : f0 02 __ BEQ $8f66 ; (cwin_console_write_string.l5 + 0)
.s9:
00:8f64 : e6 4a __ INC T4 + 0 
.l5:
00:8f66 : a4 4a __ LDY T4 + 0 
00:8f68 : b1 13 __ LDA (P6),y ; (chars + 0)
00:8f6a : d0 01 __ BNE $8f6d ; (cwin_console_write_string.s6 + 0)
.s3:
00:8f6c : 60 __ __ RTS
.s6:
00:8f6d : c9 0a __ CMP #$0a
00:8f6f : d0 06 __ BNE $8f77 ; (cwin_console_write_string.s7 + 0)
.s11:
00:8f71 : 20 23 0f JSR $0f23 
00:8f74 : 4c 64 15 JMP $1564 
.s7:
00:8f77 : 85 4b __ STA T5 + 0 
00:8f79 : ad 68 49 LDA $4968 ; (cw.cx + 0)
00:8f7c : cd 66 49 CMP $4966 ; (cw.wx + 0)
00:8f7f : d0 03 __ BNE $8f84 ; (cwin_console_write_string.s8 + 0)
.s10:
00:8f81 : 20 23 0f JSR $0f23 
.s8:
00:8f84 : ad 69 49 LDA $4969 ; (cw.cy + 0)
00:8f87 : 0a __ __ ASL
00:8f88 : aa __ __ TAX
00:8f89 : bd 50 3d LDA $3d50,x 
00:8f8c : 6d 68 49 ADC $4968 ; (cw.cx + 0)
00:8f8f : 85 43 __ STA T0 + 0 
00:8f91 : bd 51 3d LDA $3d51,x 
00:8f94 : 69 00 __ ADC #$00
00:8f96 : 85 44 __ STA T0 + 1 
00:8f98 : a5 4b __ LDA T5 + 0 
00:8f9a : 4a __ __ LSR
00:8f9b : 4a __ __ LSR
00:8f9c : 4a __ __ LSR
00:8f9d : 4a __ __ LSR
00:8f9e : 4a __ __ LSR
00:8f9f : aa __ __ TAX
00:8fa0 : ad 6c 49 LDA $496c ; (cw.sp + 0)
00:8fa3 : 18 __ __ CLC
00:8fa4 : 65 43 __ ADC T0 + 0 
00:8fa6 : 85 45 __ STA T1 + 0 
00:8fa8 : ad 6d 49 LDA $496d ; (cw.sp + 1)
00:8fab : 65 44 __ ADC T0 + 1 
00:8fad : 85 46 __ STA T1 + 1 
00:8faf : bd 8b 3d LDA $3d8b,x 
00:8fb2 : 45 4b __ EOR T5 + 0 
00:8fb4 : a0 00 __ LDY #$00
00:8fb6 : 91 45 __ STA (T1 + 0),y 
00:8fb8 : ad 6e 49 LDA $496e ; (cw.cp + 0)
00:8fbb : 18 __ __ CLC
00:8fbc : 65 43 __ ADC T0 + 0 
00:8fbe : 85 45 __ STA T1 + 0 
00:8fc0 : ad 6f 49 LDA $496f ; (cw.cp + 1)
00:8fc3 : 65 44 __ ADC T0 + 1 
00:8fc5 : 85 46 __ STA T1 + 1 
00:8fc7 : a5 15 __ LDA P8 ; (color + 0)
00:8fc9 : 91 45 __ STA (T1 + 0),y 
00:8fcb : ee 68 49 INC $4968 ; (cw.cx + 0)
00:8fce : 4c 64 15 JMP $1564 
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
;  20, "/home/xahmol/oscar64/include/stdio.h"
.s4:
00:8fd1 : ad e3 7f LDA $7fe3 ; (sstack + 4)
00:8fd4 : 85 16 __ STA P9 
00:8fd6 : ad e4 7f LDA $7fe4 ; (sstack + 5)
00:8fd9 : 85 17 __ STA P10 
00:8fdb : ad e5 7f LDA $7fe5 ; (sstack + 6)
00:8fde : 8d df 7f STA $7fdf ; (sstack + 0)
00:8fe1 : ad e6 7f LDA $7fe6 ; (sstack + 7)
00:8fe4 : 8d e0 7f STA $7fe0 ; (sstack + 1)
00:8fe7 : a9 e7 __ LDA #$e7
00:8fe9 : 8d e1 7f STA $7fe1 ; (sstack + 2)
00:8fec : a9 7f __ LDA #$7f
00:8fee : 8d e2 7f STA $7fe2 ; (sstack + 3)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 978, "/home/xahmol/oscar64/include/c64/charwin.c"
.s4:
00:8ff1 : ad df 7f LDA $7fdf ; (sstack + 0)
00:8ff4 : 85 48 __ STA T2 + 0 
00:8ff6 : a9 00 __ LDA #$00
00:8ff8 : 85 45 __ STA T4 + 0 
00:8ffa : ad e0 7f LDA $7fe0 ; (sstack + 1)
00:8ffd : 85 49 __ STA T2 + 1 
.l5:
00:8fff : a0 00 __ LDY #$00
00:9001 : b1 48 __ LDA (T2 + 0),y 
00:9003 : d0 1b __ BNE $9020 ; (sformat.s9 + 0)
.s6:
00:9005 : a4 45 __ LDY T4 + 0 
00:9007 : 91 16 __ STA (P9),y ; (buff + 0)
00:9009 : 98 __ __ TYA
00:900a : d0 07 __ BNE $9013 ; (sformat.s8 + 0)
.s7:
00:900c : a5 17 __ LDA P10 ; (buff + 1)
00:900e : a6 16 __ LDX P9 ; (buff + 0)
00:9010 : 4c 1b 16 JMP $161b 
.s8:
00:9013 : 18 __ __ CLC
00:9014 : 65 16 __ ADC P9 ; (buff + 0)
00:9016 : aa __ __ TAX
00:9017 : a5 17 __ LDA P10 ; (buff + 1)
00:9019 : 69 00 __ ADC #$00
.s3:
00:901b : 86 1b __ STX ACCU + 0 ; (fps + 0)
00:901d : 85 1c __ STA ACCU + 1 ; (fps + 1)
00:901f : 60 __ __ RTS
.s9:
00:9020 : c9 25 __ CMP #$25
00:9022 : f0 22 __ BEQ $9046 ; (sformat.s12 + 0)
.s10:
00:9024 : a4 45 __ LDY T4 + 0 
00:9026 : 91 16 __ STA (P9),y ; (buff + 0)
00:9028 : e6 48 __ INC T2 + 0 
00:902a : d0 02 __ BNE $902e ; (sformat.s101 + 0)
.s100:
00:902c : e6 49 __ INC T2 + 1 
.s101:
00:902e : c8 __ __ INY
00:902f : 84 45 __ STY T4 + 0 
00:9031 : 98 __ __ TYA
00:9032 : c0 28 __ CPY #$28
00:9034 : 90 c9 __ BCC $8fff ; (sformat.l5 + 0)
.s11:
00:9036 : 18 __ __ CLC
00:9037 : 65 16 __ ADC P9 ; (buff + 0)
00:9039 : 85 16 __ STA P9 ; (buff + 0)
00:903b : 90 02 __ BCC $903f ; (sformat.s103 + 0)
.s102:
00:903d : e6 17 __ INC P10 ; (buff + 1)
.s103:
00:903f : a9 00 __ LDA #$00
.s78:
00:9041 : 85 45 __ STA T4 + 0 
00:9043 : 4c ff 15 JMP $15ff 
.s12:
00:9046 : 8c ce 7f STY $7fce ; (si.prefix + 0)
00:9049 : a5 45 __ LDA T4 + 0 
00:904b : f0 0c __ BEQ $9059 ; (sformat.s13 + 0)
.s76:
00:904d : 84 45 __ STY T4 + 0 
00:904f : 18 __ __ CLC
00:9050 : 65 16 __ ADC P9 ; (buff + 0)
00:9052 : 85 16 __ STA P9 ; (buff + 0)
00:9054 : 90 02 __ BCC $9058 ; (sformat.s88 + 0)
.s87:
00:9056 : e6 17 __ INC P10 ; (buff + 1)
.s88:
00:9058 : 98 __ __ TYA
.s13:
00:9059 : 8d cc 7f STA $7fcc ; (si.sign + 0)
00:905c : 8d cd 7f STA $7fcd ; (si.left + 0)
00:905f : a0 01 __ LDY #$01
00:9061 : b1 48 __ LDA (T2 + 0),y 
00:9063 : a2 20 __ LDX #$20
00:9065 : 8e c7 7f STX $7fc7 ; (si.fill + 0)
00:9068 : a2 00 __ LDX #$00
00:906a : 8e c8 7f STX $7fc8 ; (si.width + 0)
00:906d : ca __ __ DEX
00:906e : 8e c9 7f STX $7fc9 ; (si.precision + 0)
00:9071 : a2 0a __ LDX #$0a
00:9073 : 8e cb 7f STX $7fcb ; (si.base + 0)
00:9076 : aa __ __ TAX
00:9077 : a9 02 __ LDA #$02
00:9079 : d0 07 __ BNE $9082 ; (sformat.l14 + 0)
.s72:
00:907b : a0 00 __ LDY #$00
00:907d : b1 48 __ LDA (T2 + 0),y 
00:907f : aa __ __ TAX
00:9080 : a9 01 __ LDA #$01
.l14:
00:9082 : 18 __ __ CLC
00:9083 : 65 48 __ ADC T2 + 0 
00:9085 : 85 48 __ STA T2 + 0 
00:9087 : 90 02 __ BCC $908b ; (sformat.s90 + 0)
.s89:
00:9089 : e6 49 __ INC T2 + 1 
.s90:
00:908b : 8a __ __ TXA
00:908c : e0 2b __ CPX #$2b
00:908e : d0 07 __ BNE $9097 ; (sformat.s15 + 0)
.s75:
00:9090 : a9 01 __ LDA #$01
00:9092 : 8d cc 7f STA $7fcc ; (si.sign + 0)
00:9095 : d0 e4 __ BNE $907b ; (sformat.s72 + 0)
.s15:
00:9097 : c9 30 __ CMP #$30
00:9099 : d0 06 __ BNE $90a1 ; (sformat.s16 + 0)
.s74:
00:909b : 8d c7 7f STA $7fc7 ; (si.fill + 0)
00:909e : 4c 7b 16 JMP $167b 
.s16:
00:90a1 : c9 23 __ CMP #$23
00:90a3 : d0 07 __ BNE $90ac ; (sformat.s17 + 0)
.s73:
00:90a5 : a9 01 __ LDA #$01
00:90a7 : 8d ce 7f STA $7fce ; (si.prefix + 0)
00:90aa : d0 cf __ BNE $907b ; (sformat.s72 + 0)
.s17:
00:90ac : c9 2d __ CMP #$2d
00:90ae : d0 07 __ BNE $90b7 ; (sformat.s18 + 0)
.s71:
00:90b0 : a9 01 __ LDA #$01
00:90b2 : 8d cd 7f STA $7fcd ; (si.left + 0)
00:90b5 : d0 c4 __ BNE $907b ; (sformat.s72 + 0)
.s18:
00:90b7 : 85 43 __ STA T1 + 0 
00:90b9 : c9 30 __ CMP #$30
00:90bb : 90 33 __ BCC $90f0 ; (sformat.s19 + 0)
.s66:
00:90bd : c9 3a __ CMP #$3a
00:90bf : b0 60 __ BCS $9121 ; (sformat.s20 + 0)
.s67:
00:90c1 : a0 00 __ LDY #$00
00:90c3 : 84 46 __ STY T0 + 0 
00:90c5 : c9 3a __ CMP #$3a
00:90c7 : b0 22 __ BCS $90eb ; (sformat.s69 + 0)
.l70:
00:90c9 : a5 46 __ LDA T0 + 0 
00:90cb : 0a __ __ ASL
00:90cc : 0a __ __ ASL
00:90cd : 18 __ __ CLC
00:90ce : 65 46 __ ADC T0 + 0 
00:90d0 : 0a __ __ ASL
00:90d1 : 18 __ __ CLC
00:90d2 : 65 43 __ ADC T1 + 0 
00:90d4 : 38 __ __ SEC
00:90d5 : e9 30 __ SBC #$30
00:90d7 : 85 46 __ STA T0 + 0 
00:90d9 : b1 48 __ LDA (T2 + 0),y 
00:90db : 85 43 __ STA T1 + 0 
00:90dd : e6 48 __ INC T2 + 0 
00:90df : d0 02 __ BNE $90e3 ; (sformat.s99 + 0)
.s98:
00:90e1 : e6 49 __ INC T2 + 1 
.s99:
00:90e3 : c9 30 __ CMP #$30
00:90e5 : 90 04 __ BCC $90eb ; (sformat.s69 + 0)
.s68:
00:90e7 : c9 3a __ CMP #$3a
00:90e9 : 90 de __ BCC $90c9 ; (sformat.l70 + 0)
.s69:
00:90eb : a6 46 __ LDX T0 + 0 
00:90ed : 8e c8 7f STX $7fc8 ; (si.width + 0)
.s19:
00:90f0 : c9 2e __ CMP #$2e
00:90f2 : d0 2d __ BNE $9121 ; (sformat.s20 + 0)
.s61:
00:90f4 : a9 00 __ LDA #$00
00:90f6 : f0 0e __ BEQ $9106 ; (sformat.l62 + 0)
.s65:
00:90f8 : a5 46 __ LDA T0 + 0 
00:90fa : 0a __ __ ASL
00:90fb : 0a __ __ ASL
00:90fc : 18 __ __ CLC
00:90fd : 65 46 __ ADC T0 + 0 
00:90ff : 0a __ __ ASL
00:9100 : 18 __ __ CLC
00:9101 : 65 43 __ ADC T1 + 0 
00:9103 : 38 __ __ SEC
00:9104 : e9 30 __ SBC #$30
.l62:
00:9106 : 85 46 __ STA T0 + 0 
00:9108 : a0 00 __ LDY #$00
00:910a : b1 48 __ LDA (T2 + 0),y 
00:910c : 85 43 __ STA T1 + 0 
00:910e : e6 48 __ INC T2 + 0 
00:9110 : d0 02 __ BNE $9114 ; (sformat.s92 + 0)
.s91:
00:9112 : e6 49 __ INC T2 + 1 
.s92:
00:9114 : c9 30 __ CMP #$30
00:9116 : 90 04 __ BCC $911c ; (sformat.s63 + 0)
.s64:
00:9118 : c9 3a __ CMP #$3a
00:911a : 90 dc __ BCC $90f8 ; (sformat.s65 + 0)
.s63:
00:911c : a6 46 __ LDX T0 + 0 
00:911e : 8e c9 7f STX $7fc9 ; (si.precision + 0)
.s20:
00:9121 : c9 64 __ CMP #$64
00:9123 : f0 0c __ BEQ $9131 ; (sformat.s60 + 0)
.s21:
00:9125 : c9 44 __ CMP #$44
00:9127 : f0 08 __ BEQ $9131 ; (sformat.s60 + 0)
.s22:
00:9129 : c9 69 __ CMP #$69
00:912b : f0 04 __ BEQ $9131 ; (sformat.s60 + 0)
.s23:
00:912d : c9 49 __ CMP #$49
00:912f : d0 07 __ BNE $9138 ; (sformat.s24 + 0)
.s60:
00:9131 : a9 01 __ LDA #$01
.s79:
00:9133 : 85 13 __ STA P6 
00:9135 : 4c c7 18 JMP $18c7 
.s24:
00:9138 : c9 75 __ CMP #$75
00:913a : f0 04 __ BEQ $9140 ; (sformat.s59 + 0)
.s25:
00:913c : c9 55 __ CMP #$55
00:913e : d0 04 __ BNE $9144 ; (sformat.s26 + 0)
.s59:
00:9140 : a9 00 __ LDA #$00
00:9142 : f0 ef __ BEQ $9133 ; (sformat.s79 + 0)
.s26:
00:9144 : c9 78 __ CMP #$78
00:9146 : f0 04 __ BEQ $914c ; (sformat.s57 + 0)
.s27:
00:9148 : c9 58 __ CMP #$58
00:914a : d0 13 __ BNE $915f ; (sformat.s28 + 0)
.s57:
00:914c : 29 e0 __ AND #$e0
00:914e : 09 01 __ ORA #$01
00:9150 : 8d ca 7f STA $7fca ; (si.cha + 0)
00:9153 : a9 00 __ LDA #$00
00:9155 : 85 13 __ STA P6 
00:9157 : a9 10 __ LDA #$10
00:9159 : 8d cb 7f STA $7fcb ; (si.base + 0)
00:915c : 4c c7 18 JMP $18c7 
.s28:
00:915f : c9 6c __ CMP #$6c
00:9161 : d0 03 __ BNE $9166 ; (sformat.s29 + 0)
00:9163 : 4c 40 18 JMP $1840 
.s29:
00:9166 : c9 4c __ CMP #$4c
00:9168 : f0 f9 __ BEQ $9163 ; (sformat.s28 + 4)
.s30:
00:916a : c9 73 __ CMP #$73
00:916c : f0 3e __ BEQ $91ac ; (sformat.s37 + 0)
.s31:
00:916e : c9 53 __ CMP #$53
00:9170 : f0 3a __ BEQ $91ac ; (sformat.s37 + 0)
.s32:
00:9172 : c9 63 __ CMP #$63
00:9174 : f0 15 __ BEQ $918b ; (sformat.s36 + 0)
.s33:
00:9176 : c9 43 __ CMP #$43
00:9178 : f0 11 __ BEQ $918b ; (sformat.s36 + 0)
.s34:
00:917a : aa __ __ TAX
00:917b : d0 03 __ BNE $9180 ; (sformat.s104 + 0)
00:917d : 4c ff 15 JMP $15ff 
.s104:
00:9180 : a0 00 __ LDY #$00
.s35:
00:9182 : a5 43 __ LDA T1 + 0 
00:9184 : 91 16 __ STA (P9),y ; (buff + 0)
00:9186 : a9 01 __ LDA #$01
00:9188 : 4c 41 16 JMP $1641 
.s36:
00:918b : ad e1 7f LDA $7fe1 ; (sstack + 2)
00:918e : 85 46 __ STA T0 + 0 
00:9190 : ad e2 7f LDA $7fe2 ; (sstack + 3)
00:9193 : 85 47 __ STA T0 + 1 
00:9195 : a0 00 __ LDY #$00
00:9197 : b1 46 __ LDA (T0 + 0),y 
00:9199 : 85 43 __ STA T1 + 0 
00:919b : a5 46 __ LDA T0 + 0 
00:919d : 69 01 __ ADC #$01
00:919f : 8d e1 7f STA $7fe1 ; (sstack + 2)
00:91a2 : a5 47 __ LDA T0 + 1 
00:91a4 : 69 00 __ ADC #$00
00:91a6 : 8d e2 7f STA $7fe2 ; (sstack + 3)
00:91a9 : 4c 82 17 JMP $1782 
.s37:
00:91ac : ad e1 7f LDA $7fe1 ; (sstack + 2)
00:91af : 85 46 __ STA T0 + 0 
00:91b1 : 69 01 __ ADC #$01
00:91b3 : 8d e1 7f STA $7fe1 ; (sstack + 2)
00:91b6 : ad e2 7f LDA $7fe2 ; (sstack + 3)
00:91b9 : 85 47 __ STA T0 + 1 
00:91bb : 69 00 __ ADC #$00
00:91bd : 8d e2 7f STA $7fe2 ; (sstack + 3)
00:91c0 : a0 00 __ LDY #$00
00:91c2 : 84 1b __ STY ACCU + 0 ; (fps + 0)
00:91c4 : b1 46 __ LDA (T0 + 0),y 
00:91c6 : aa __ __ TAX
00:91c7 : c8 __ __ INY
00:91c8 : b1 46 __ LDA (T0 + 0),y 
00:91ca : 86 46 __ STX T0 + 0 
00:91cc : 85 47 __ STA T0 + 1 
00:91ce : ad c8 7f LDA $7fc8 ; (si.width + 0)
00:91d1 : f0 0c __ BEQ $91df ; (sformat.s38 + 0)
.s84:
00:91d3 : 88 __ __ DEY
00:91d4 : b1 46 __ LDA (T0 + 0),y 
00:91d6 : f0 05 __ BEQ $91dd ; (sformat.s85 + 0)
.l44:
00:91d8 : c8 __ __ INY
00:91d9 : b1 46 __ LDA (T0 + 0),y 
00:91db : d0 fb __ BNE $91d8 ; (sformat.l44 + 0)
.s85:
00:91dd : 84 1b __ STY ACCU + 0 ; (fps + 0)
.s38:
00:91df : ad cd 7f LDA $7fcd ; (si.left + 0)
00:91e2 : 85 1c __ STA ACCU + 1 ; (fps + 1)
00:91e4 : d0 19 __ BNE $91ff ; (sformat.s39 + 0)
.s82:
00:91e6 : a6 1b __ LDX ACCU + 0 ; (fps + 0)
00:91e8 : ec c8 7f CPX $7fc8 ; (si.width + 0)
00:91eb : a0 00 __ LDY #$00
00:91ed : b0 0c __ BCS $91fb ; (sformat.s83 + 0)
.l43:
00:91ef : ad c7 7f LDA $7fc7 ; (si.fill + 0)
00:91f2 : 91 16 __ STA (P9),y ; (buff + 0)
00:91f4 : c8 __ __ INY
00:91f5 : e8 __ __ INX
00:91f6 : ec c8 7f CPX $7fc8 ; (si.width + 0)
00:91f9 : 90 f4 __ BCC $91ef ; (sformat.l43 + 0)
.s83:
00:91fb : 86 1b __ STX ACCU + 0 ; (fps + 0)
00:91fd : 84 45 __ STY T4 + 0 
.s39:
00:91ff : a0 00 __ LDY #$00
00:9201 : b1 46 __ LDA (T0 + 0),y 
00:9203 : f0 1a __ BEQ $921f ; (sformat.s40 + 0)
.s42:
00:9205 : e6 46 __ INC T0 + 0 
00:9207 : d0 02 __ BNE $920b ; (sformat.l77 + 0)
.s95:
00:9209 : e6 47 __ INC T0 + 1 
.l77:
00:920b : a4 45 __ LDY T4 + 0 
00:920d : 91 16 __ STA (P9),y ; (buff + 0)
00:920f : e6 45 __ INC T4 + 0 
00:9211 : a0 00 __ LDY #$00
00:9213 : b1 46 __ LDA (T0 + 0),y 
00:9215 : a8 __ __ TAY
00:9216 : e6 46 __ INC T0 + 0 
00:9218 : d0 02 __ BNE $921c ; (sformat.s97 + 0)
.s96:
00:921a : e6 47 __ INC T0 + 1 
.s97:
00:921c : 98 __ __ TYA
00:921d : d0 ec __ BNE $920b ; (sformat.l77 + 0)
.s40:
00:921f : a5 1c __ LDA ACCU + 1 ; (fps + 1)
00:9221 : d0 03 __ BNE $9226 ; (sformat.s81 + 0)
00:9223 : 4c ff 15 JMP $15ff 
.s81:
00:9226 : a6 1b __ LDX ACCU + 0 ; (fps + 0)
00:9228 : ec c8 7f CPX $7fc8 ; (si.width + 0)
00:922b : a4 45 __ LDY T4 + 0 
00:922d : b0 0c __ BCS $923b ; (sformat.s86 + 0)
.l41:
00:922f : ad c7 7f LDA $7fc7 ; (si.fill + 0)
00:9232 : 91 16 __ STA (P9),y ; (buff + 0)
00:9234 : c8 __ __ INY
00:9235 : e8 __ __ INX
00:9236 : ec c8 7f CPX $7fc8 ; (si.width + 0)
00:9239 : 90 f4 __ BCC $922f ; (sformat.l41 + 0)
.s86:
00:923b : 84 45 __ STY T4 + 0 
00:923d : 4c ff 15 JMP $15ff 
.s45:
00:9240 : ad e1 7f LDA $7fe1 ; (sstack + 2)
00:9243 : 85 46 __ STA T0 + 0 
00:9245 : 69 03 __ ADC #$03
00:9247 : 8d e1 7f STA $7fe1 ; (sstack + 2)
00:924a : ad e2 7f LDA $7fe2 ; (sstack + 3)
00:924d : 85 47 __ STA T0 + 1 
00:924f : 69 00 __ ADC #$00
00:9251 : 8d e2 7f STA $7fe2 ; (sstack + 3)
00:9254 : a0 00 __ LDY #$00
00:9256 : b1 48 __ LDA (T2 + 0),y 
00:9258 : aa __ __ TAX
00:9259 : e6 48 __ INC T2 + 0 
00:925b : d0 02 __ BNE $925f ; (sformat.s94 + 0)
.s93:
00:925d : e6 49 __ INC T2 + 1 
.s94:
00:925f : b1 46 __ LDA (T0 + 0),y 
00:9261 : 85 11 __ STA P4 
00:9263 : a0 01 __ LDY #$01
00:9265 : b1 46 __ LDA (T0 + 0),y 
00:9267 : 85 12 __ STA P5 
00:9269 : c8 __ __ INY
00:926a : b1 46 __ LDA (T0 + 0),y 
00:926c : 85 13 __ STA P6 
00:926e : c8 __ __ INY
00:926f : b1 46 __ LDA (T0 + 0),y 
00:9271 : 85 14 __ STA P7 
00:9273 : e0 64 __ CPX #$64
00:9275 : f0 0c __ BEQ $9283 ; (sformat.s56 + 0)
.s46:
00:9277 : e0 44 __ CPX #$44
00:9279 : f0 08 __ BEQ $9283 ; (sformat.s56 + 0)
.s47:
00:927b : e0 69 __ CPX #$69
00:927d : f0 04 __ BEQ $9283 ; (sformat.s56 + 0)
.s48:
00:927f : e0 49 __ CPX #$49
00:9281 : d0 1c __ BNE $929f ; (sformat.s49 + 0)
.s56:
00:9283 : a9 01 __ LDA #$01
.s80:
00:9285 : 85 15 __ STA P8 
.s54:
00:9287 : a5 16 __ LDA P9 ; (buff + 0)
00:9289 : 85 0f __ STA P2 
00:928b : a5 17 __ LDA P10 ; (buff + 1)
00:928d : 85 10 __ STA P3 
00:928f : a9 c7 __ LDA #$c7
00:9291 : 85 0d __ STA P0 
00:9293 : a9 7f __ LDA #$7f
00:9295 : 85 0e __ STA P1 
00:9297 : 20 1c 1a JSR $1a1c 
00:929a : a5 1b __ LDA ACCU + 0 ; (fps + 0)
00:929c : 4c 41 16 JMP $1641 
.s49:
00:929f : e0 75 __ CPX #$75
00:92a1 : f0 04 __ BEQ $92a7 ; (sformat.s55 + 0)
.s50:
00:92a3 : e0 55 __ CPX #$55
00:92a5 : d0 04 __ BNE $92ab ; (sformat.s51 + 0)
.s55:
00:92a7 : a9 00 __ LDA #$00
00:92a9 : f0 da __ BEQ $9285 ; (sformat.s80 + 0)
.s51:
00:92ab : e0 78 __ CPX #$78
00:92ad : f0 04 __ BEQ $92b3 ; (sformat.s53 + 0)
.s52:
00:92af : e0 58 __ CPX #$58
00:92b1 : d0 8a __ BNE $923d ; (sformat.s86 + 2)
.s53:
00:92b3 : a9 00 __ LDA #$00
00:92b5 : 85 15 __ STA P8 
00:92b7 : a9 10 __ LDA #$10
00:92b9 : 8d cb 7f STA $7fcb ; (si.base + 0)
00:92bc : 8a __ __ TXA
00:92bd : 29 e0 __ AND #$e0
00:92bf : 09 01 __ ORA #$01
00:92c1 : 8d ca 7f STA $7fca ; (si.cha + 0)
00:92c4 : 4c 87 18 JMP $1887 
.s58:
00:92c7 : a5 16 __ LDA P9 ; (buff + 0)
00:92c9 : 85 0f __ STA P2 
00:92cb : a5 17 __ LDA P10 ; (buff + 1)
00:92cd : 85 10 __ STA P3 
00:92cf : ad e1 7f LDA $7fe1 ; (sstack + 2)
00:92d2 : 85 46 __ STA T0 + 0 
00:92d4 : ad e2 7f LDA $7fe2 ; (sstack + 3)
00:92d7 : 85 47 __ STA T0 + 1 
00:92d9 : a0 00 __ LDY #$00
00:92db : b1 46 __ LDA (T0 + 0),y 
00:92dd : 85 11 __ STA P4 
00:92df : c8 __ __ INY
00:92e0 : b1 46 __ LDA (T0 + 0),y 
00:92e2 : 85 12 __ STA P5 
00:92e4 : 18 __ __ CLC
00:92e5 : a5 46 __ LDA T0 + 0 
00:92e7 : 69 02 __ ADC #$02
00:92e9 : 8d e1 7f STA $7fe1 ; (sstack + 2)
00:92ec : a5 47 __ LDA T0 + 1 
00:92ee : 69 00 __ ADC #$00
00:92f0 : 8d e2 7f STA $7fe2 ; (sstack + 3)
00:92f3 : a9 c7 __ LDA #$c7
00:92f5 : 85 0d __ STA P0 
00:92f7 : a9 7f __ LDA #$7f
00:92f9 : 85 0e __ STA P1 
00:92fb : 20 01 19 JSR $1901 
00:92fe : 4c 41 16 JMP $1641 
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "/home/xahmol/oscar64/include/stdio.c"
.s4:
00:9301 : a9 00 __ LDA #$00
00:9303 : 85 43 __ STA T5 + 0 
00:9305 : a0 04 __ LDY #$04
00:9307 : b1 0d __ LDA (P0),y ; (si + 0)
00:9309 : 85 44 __ STA T6 + 0 
00:930b : a5 13 __ LDA P6 ; (s + 0)
00:930d : f0 13 __ BEQ $9322 ; (nformi.s5 + 0)
.s33:
00:930f : 24 12 __ BIT P5 ; (v + 1)
00:9311 : 10 0f __ BPL $9322 ; (nformi.s5 + 0)
.s34:
00:9313 : 38 __ __ SEC
00:9314 : a9 00 __ LDA #$00
00:9316 : e5 11 __ SBC P4 ; (v + 0)
00:9318 : 85 11 __ STA P4 ; (v + 0)
00:931a : a9 00 __ LDA #$00
00:931c : e5 12 __ SBC P5 ; (v + 1)
00:931e : 85 12 __ STA P5 ; (v + 1)
00:9320 : e6 43 __ INC T5 + 0 
.s5:
00:9322 : a9 10 __ LDA #$10
00:9324 : 85 45 __ STA T7 + 0 
00:9326 : a5 11 __ LDA P4 ; (v + 0)
00:9328 : 05 12 __ ORA P5 ; (v + 1)
00:932a : f0 33 __ BEQ $935f ; (nformi.s6 + 0)
.s28:
00:932c : a5 11 __ LDA P4 ; (v + 0)
00:932e : 85 1b __ STA ACCU + 0 
00:9330 : a5 12 __ LDA P5 ; (v + 1)
00:9332 : 85 1c __ STA ACCU + 1 
.l29:
00:9334 : a5 44 __ LDA T6 + 0 
00:9336 : 85 03 __ STA WORK + 0 
00:9338 : a9 00 __ LDA #$00
00:933a : 85 04 __ STA WORK + 1 
00:933c : 20 8b 36 JSR $368b 
00:933f : a5 05 __ LDA WORK + 2 
00:9341 : c9 0a __ CMP #$0a
00:9343 : b0 04 __ BCS $9349 ; (nformi.s32 + 0)
.s30:
00:9345 : a9 30 __ LDA #$30
00:9347 : 90 06 __ BCC $934f ; (nformi.s31 + 0)
.s32:
00:9349 : a0 03 __ LDY #$03
00:934b : b1 0d __ LDA (P0),y ; (si + 0)
00:934d : e9 0a __ SBC #$0a
.s31:
00:934f : 18 __ __ CLC
00:9350 : 65 05 __ ADC WORK + 2 
00:9352 : a6 45 __ LDX T7 + 0 
00:9354 : 9d ce 7f STA $7fce,x ; (concat[0] + 241)
00:9357 : c6 45 __ DEC T7 + 0 
00:9359 : a5 1b __ LDA ACCU + 0 
00:935b : 05 1c __ ORA ACCU + 1 
00:935d : d0 d5 __ BNE $9334 ; (nformi.l29 + 0)
.s6:
00:935f : a0 02 __ LDY #$02
00:9361 : b1 0d __ LDA (P0),y ; (si + 0)
00:9363 : c9 ff __ CMP #$ff
00:9365 : d0 04 __ BNE $936b ; (nformi.s27 + 0)
.s7:
00:9367 : a9 0f __ LDA #$0f
00:9369 : d0 05 __ BNE $9370 ; (nformi.s39 + 0)
.s27:
00:936b : 38 __ __ SEC
00:936c : a9 10 __ LDA #$10
00:936e : f1 0d __ SBC (P0),y ; (si + 0)
.s39:
00:9370 : a8 __ __ TAY
00:9371 : c4 45 __ CPY T7 + 0 
00:9373 : b0 0d __ BCS $9382 ; (nformi.s8 + 0)
.s26:
00:9375 : a9 30 __ LDA #$30
.l40:
00:9377 : a6 45 __ LDX T7 + 0 
00:9379 : 9d ce 7f STA $7fce,x ; (concat[0] + 241)
00:937c : c6 45 __ DEC T7 + 0 
00:937e : c4 45 __ CPY T7 + 0 
00:9380 : 90 f5 __ BCC $9377 ; (nformi.l40 + 0)
.s8:
00:9382 : a0 07 __ LDY #$07
00:9384 : b1 0d __ LDA (P0),y ; (si + 0)
00:9386 : f0 1c __ BEQ $93a4 ; (nformi.s9 + 0)
.s24:
00:9388 : a5 44 __ LDA T6 + 0 
00:938a : c9 10 __ CMP #$10
00:938c : d0 16 __ BNE $93a4 ; (nformi.s9 + 0)
.s25:
00:938e : a0 03 __ LDY #$03
00:9390 : b1 0d __ LDA (P0),y ; (si + 0)
00:9392 : a8 __ __ TAY
00:9393 : a9 30 __ LDA #$30
00:9395 : a6 45 __ LDX T7 + 0 
00:9397 : 9d cd 7f STA $7fcd,x ; (concat[0] + 240)
00:939a : 98 __ __ TYA
00:939b : 69 16 __ ADC #$16
00:939d : 9d ce 7f STA $7fce,x ; (concat[0] + 241)
00:93a0 : ca __ __ DEX
00:93a1 : ca __ __ DEX
00:93a2 : 86 45 __ STX T7 + 0 
.s9:
00:93a4 : a9 00 __ LDA #$00
00:93a6 : 85 1b __ STA ACCU + 0 
00:93a8 : a5 43 __ LDA T5 + 0 
00:93aa : f0 0c __ BEQ $93b8 ; (nformi.s10 + 0)
.s23:
00:93ac : a9 2d __ LDA #$2d
.s22:
00:93ae : a6 45 __ LDX T7 + 0 
00:93b0 : 9d ce 7f STA $7fce,x ; (concat[0] + 241)
00:93b3 : c6 45 __ DEC T7 + 0 
00:93b5 : 4c c2 19 JMP $19c2 
.s10:
00:93b8 : a0 05 __ LDY #$05
00:93ba : b1 0d __ LDA (P0),y ; (si + 0)
00:93bc : f0 04 __ BEQ $93c2 ; (nformi.s11 + 0)
.s21:
00:93be : a9 2b __ LDA #$2b
00:93c0 : d0 ec __ BNE $93ae ; (nformi.s22 + 0)
.s11:
00:93c2 : a6 45 __ LDX T7 + 0 
00:93c4 : a0 06 __ LDY #$06
00:93c6 : b1 0d __ LDA (P0),y ; (si + 0)
00:93c8 : d0 2b __ BNE $93f5 ; (nformi.s17 + 0)
.l12:
00:93ca : 8a __ __ TXA
00:93cb : 18 __ __ CLC
00:93cc : a0 01 __ LDY #$01
00:93ce : 71 0d __ ADC (P0),y ; (si + 0)
00:93d0 : b0 04 __ BCS $93d6 ; (nformi.s15 + 0)
.s16:
00:93d2 : c9 11 __ CMP #$11
00:93d4 : 90 0a __ BCC $93e0 ; (nformi.s13 + 0)
.s15:
00:93d6 : a0 00 __ LDY #$00
00:93d8 : b1 0d __ LDA (P0),y ; (si + 0)
00:93da : 9d ce 7f STA $7fce,x ; (concat[0] + 241)
00:93dd : ca __ __ DEX
00:93de : b0 ea __ BCS $93ca ; (nformi.l12 + 0)
.s13:
00:93e0 : e0 10 __ CPX #$10
00:93e2 : b0 0e __ BCS $93f2 ; (nformi.s41 + 0)
.s14:
00:93e4 : 88 __ __ DEY
.l37:
00:93e5 : bd cf 7f LDA $7fcf,x ; (buffer[0] + 0)
00:93e8 : 91 0f __ STA (P2),y ; (str + 0)
00:93ea : c8 __ __ INY
00:93eb : e8 __ __ INX
00:93ec : e0 10 __ CPX #$10
00:93ee : 90 f5 __ BCC $93e5 ; (nformi.l37 + 0)
.s38:
00:93f0 : 84 1b __ STY ACCU + 0 
.s41:
00:93f2 : a5 1b __ LDA ACCU + 0 
.s3:
00:93f4 : 60 __ __ RTS
.s17:
00:93f5 : e0 10 __ CPX #$10
00:93f7 : b0 1a __ BCS $9413 ; (nformi.l18 + 0)
.s20:
00:93f9 : a0 00 __ LDY #$00
.l35:
00:93fb : bd cf 7f LDA $7fcf,x ; (buffer[0] + 0)
00:93fe : 91 0f __ STA (P2),y ; (str + 0)
00:9400 : c8 __ __ INY
00:9401 : e8 __ __ INX
00:9402 : e0 10 __ CPX #$10
00:9404 : 90 f5 __ BCC $93fb ; (nformi.l35 + 0)
.s36:
00:9406 : 84 1b __ STY ACCU + 0 
00:9408 : b0 09 __ BCS $9413 ; (nformi.l18 + 0)
.s19:
00:940a : 88 __ __ DEY
00:940b : b1 0d __ LDA (P0),y ; (si + 0)
00:940d : a4 1b __ LDY ACCU + 0 
00:940f : 91 0f __ STA (P2),y ; (str + 0)
00:9411 : e6 1b __ INC ACCU + 0 
.l18:
00:9413 : a5 1b __ LDA ACCU + 0 
00:9415 : a0 01 __ LDY #$01
00:9417 : d1 0d __ CMP (P0),y ; (si + 0)
00:9419 : 90 ef __ BCC $940a ; (nformi.s19 + 0)
00:941b : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "/home/xahmol/oscar64/include/stdio.c"
.s4:
00:941c : a9 00 __ LDA #$00
00:941e : 85 43 __ STA T4 + 0 
00:9420 : a5 15 __ LDA P8 ; (s + 0)
00:9422 : f0 1f __ BEQ $9443 ; (nforml.s5 + 0)
.s35:
00:9424 : 24 14 __ BIT P7 ; (v + 3)
00:9426 : 10 1b __ BPL $9443 ; (nforml.s5 + 0)
.s36:
00:9428 : 38 __ __ SEC
00:9429 : a9 00 __ LDA #$00
00:942b : e5 11 __ SBC P4 ; (v + 0)
00:942d : 85 11 __ STA P4 ; (v + 0)
00:942f : a9 00 __ LDA #$00
00:9431 : e5 12 __ SBC P5 ; (v + 1)
00:9433 : 85 12 __ STA P5 ; (v + 1)
00:9435 : a9 00 __ LDA #$00
00:9437 : e5 13 __ SBC P6 ; (v + 2)
00:9439 : 85 13 __ STA P6 ; (v + 2)
00:943b : a9 00 __ LDA #$00
00:943d : e5 14 __ SBC P7 ; (v + 3)
00:943f : 85 14 __ STA P7 ; (v + 3)
00:9441 : e6 43 __ INC T4 + 0 
.s5:
00:9443 : a9 10 __ LDA #$10
00:9445 : 85 44 __ STA T5 + 0 
00:9447 : a5 14 __ LDA P7 ; (v + 3)
00:9449 : f0 03 __ BEQ $944e ; (nforml.s31 + 0)
00:944b : 4c 16 1b JMP $1b16 
.s31:
00:944e : a5 13 __ LDA P6 ; (v + 2)
00:9450 : d0 f9 __ BNE $944b ; (nforml.s5 + 8)
.s32:
00:9452 : a5 12 __ LDA P5 ; (v + 1)
00:9454 : d0 f5 __ BNE $944b ; (nforml.s5 + 8)
.s33:
00:9456 : c5 11 __ CMP P4 ; (v + 0)
00:9458 : 90 f1 __ BCC $944b ; (nforml.s5 + 8)
.s6:
00:945a : a0 02 __ LDY #$02
00:945c : b1 0d __ LDA (P0),y ; (si + 0)
00:945e : c9 ff __ CMP #$ff
00:9460 : d0 04 __ BNE $9466 ; (nforml.s27 + 0)
.s7:
00:9462 : a9 0f __ LDA #$0f
00:9464 : d0 05 __ BNE $946b ; (nforml.s41 + 0)
.s27:
00:9466 : 38 __ __ SEC
00:9467 : a9 10 __ LDA #$10
00:9469 : f1 0d __ SBC (P0),y ; (si + 0)
.s41:
00:946b : a8 __ __ TAY
00:946c : c4 44 __ CPY T5 + 0 
00:946e : b0 0d __ BCS $947d ; (nforml.s8 + 0)
.s26:
00:9470 : a9 30 __ LDA #$30
.l42:
00:9472 : a6 44 __ LDX T5 + 0 
00:9474 : 9d ce 7f STA $7fce,x ; (concat[0] + 241)
00:9477 : c6 44 __ DEC T5 + 0 
00:9479 : c4 44 __ CPY T5 + 0 
00:947b : 90 f5 __ BCC $9472 ; (nforml.l42 + 0)
.s8:
00:947d : a0 07 __ LDY #$07
00:947f : b1 0d __ LDA (P0),y ; (si + 0)
00:9481 : f0 1d __ BEQ $94a0 ; (nforml.s9 + 0)
.s24:
00:9483 : a0 04 __ LDY #$04
00:9485 : b1 0d __ LDA (P0),y ; (si + 0)
00:9487 : c9 10 __ CMP #$10
00:9489 : d0 15 __ BNE $94a0 ; (nforml.s9 + 0)
.s25:
00:948b : 88 __ __ DEY
00:948c : b1 0d __ LDA (P0),y ; (si + 0)
00:948e : a8 __ __ TAY
00:948f : a9 30 __ LDA #$30
00:9491 : a6 44 __ LDX T5 + 0 
00:9493 : 9d cd 7f STA $7fcd,x ; (concat[0] + 240)
00:9496 : 98 __ __ TYA
00:9497 : 69 16 __ ADC #$16
00:9499 : 9d ce 7f STA $7fce,x ; (concat[0] + 241)
00:949c : ca __ __ DEX
00:949d : ca __ __ DEX
00:949e : 86 44 __ STX T5 + 0 
.s9:
00:94a0 : a9 00 __ LDA #$00
00:94a2 : 85 1b __ STA ACCU + 0 
00:94a4 : a5 43 __ LDA T4 + 0 
00:94a6 : f0 0c __ BEQ $94b4 ; (nforml.s10 + 0)
.s23:
00:94a8 : a9 2d __ LDA #$2d
.s22:
00:94aa : a6 44 __ LDX T5 + 0 
00:94ac : 9d ce 7f STA $7fce,x ; (concat[0] + 241)
00:94af : c6 44 __ DEC T5 + 0 
00:94b1 : 4c be 1a JMP $1abe 
.s10:
00:94b4 : a0 05 __ LDY #$05
00:94b6 : b1 0d __ LDA (P0),y ; (si + 0)
00:94b8 : f0 04 __ BEQ $94be ; (nforml.s11 + 0)
.s21:
00:94ba : a9 2b __ LDA #$2b
00:94bc : d0 ec __ BNE $94aa ; (nforml.s22 + 0)
.s11:
00:94be : a0 06 __ LDY #$06
00:94c0 : a6 44 __ LDX T5 + 0 
00:94c2 : b1 0d __ LDA (P0),y ; (si + 0)
00:94c4 : d0 29 __ BNE $94ef ; (nforml.s17 + 0)
.l12:
00:94c6 : 8a __ __ TXA
00:94c7 : 18 __ __ CLC
00:94c8 : a0 01 __ LDY #$01
00:94ca : 71 0d __ ADC (P0),y ; (si + 0)
00:94cc : b0 04 __ BCS $94d2 ; (nforml.s15 + 0)
.s16:
00:94ce : c9 11 __ CMP #$11
00:94d0 : 90 0a __ BCC $94dc ; (nforml.s13 + 0)
.s15:
00:94d2 : a0 00 __ LDY #$00
00:94d4 : b1 0d __ LDA (P0),y ; (si + 0)
00:94d6 : 9d ce 7f STA $7fce,x ; (concat[0] + 241)
00:94d9 : ca __ __ DEX
00:94da : b0 ea __ BCS $94c6 ; (nforml.l12 + 0)
.s13:
00:94dc : e0 10 __ CPX #$10
00:94de : b0 0e __ BCS $94ee ; (nforml.s3 + 0)
.s14:
00:94e0 : 88 __ __ DEY
.l39:
00:94e1 : bd cf 7f LDA $7fcf,x ; (buffer[0] + 0)
00:94e4 : 91 0f __ STA (P2),y ; (str + 0)
00:94e6 : c8 __ __ INY
00:94e7 : e8 __ __ INX
00:94e8 : e0 10 __ CPX #$10
00:94ea : 90 f5 __ BCC $94e1 ; (nforml.l39 + 0)
.s40:
00:94ec : 84 1b __ STY ACCU + 0 
.s3:
00:94ee : 60 __ __ RTS
.s17:
00:94ef : e0 10 __ CPX #$10
00:94f1 : b0 1a __ BCS $950d ; (nforml.l18 + 0)
.s20:
00:94f3 : a0 00 __ LDY #$00
.l37:
00:94f5 : bd cf 7f LDA $7fcf,x ; (buffer[0] + 0)
00:94f8 : 91 0f __ STA (P2),y ; (str + 0)
00:94fa : c8 __ __ INY
00:94fb : e8 __ __ INX
00:94fc : e0 10 __ CPX #$10
00:94fe : 90 f5 __ BCC $94f5 ; (nforml.l37 + 0)
.s38:
00:9500 : 84 1b __ STY ACCU + 0 
00:9502 : b0 09 __ BCS $950d ; (nforml.l18 + 0)
.s19:
00:9504 : 88 __ __ DEY
00:9505 : b1 0d __ LDA (P0),y ; (si + 0)
00:9507 : a4 1b __ LDY ACCU + 0 
00:9509 : 91 0f __ STA (P2),y ; (str + 0)
00:950b : e6 1b __ INC ACCU + 0 
.l18:
00:950d : a5 1b __ LDA ACCU + 0 
00:950f : a0 01 __ LDY #$01
00:9511 : d1 0d __ CMP (P0),y ; (si + 0)
00:9513 : 90 ef __ BCC $9504 ; (nforml.s19 + 0)
00:9515 : 60 __ __ RTS
.l28:
00:9516 : a0 04 __ LDY #$04
00:9518 : b1 0d __ LDA (P0),y ; (si + 0)
00:951a : 85 03 __ STA WORK + 0 
00:951c : a5 11 __ LDA P4 ; (v + 0)
00:951e : 85 1b __ STA ACCU + 0 
00:9520 : a5 12 __ LDA P5 ; (v + 1)
00:9522 : 85 1c __ STA ACCU + 1 
00:9524 : a5 13 __ LDA P6 ; (v + 2)
00:9526 : 85 1d __ STA ACCU + 2 
00:9528 : a5 14 __ LDA P7 ; (v + 3)
00:952a : 85 1e __ STA ACCU + 3 
00:952c : a9 00 __ LDA #$00
00:952e : 85 04 __ STA WORK + 1 
00:9530 : 85 05 __ STA WORK + 2 
00:9532 : 85 06 __ STA WORK + 3 
00:9534 : 20 85 37 JSR $3785 
00:9537 : a5 07 __ LDA WORK + 4 
00:9539 : c9 0a __ CMP #$0a
00:953b : b0 04 __ BCS $9541 ; (nforml.s34 + 0)
.s29:
00:953d : a9 30 __ LDA #$30
00:953f : 90 06 __ BCC $9547 ; (nforml.s30 + 0)
.s34:
00:9541 : a0 03 __ LDY #$03
00:9543 : b1 0d __ LDA (P0),y ; (si + 0)
00:9545 : e9 0a __ SBC #$0a
.s30:
00:9547 : 18 __ __ CLC
00:9548 : 65 07 __ ADC WORK + 4 
00:954a : a6 44 __ LDX T5 + 0 
00:954c : 9d ce 7f STA $7fce,x ; (concat[0] + 241)
00:954f : c6 44 __ DEC T5 + 0 
00:9551 : a5 1b __ LDA ACCU + 0 
00:9553 : 85 11 __ STA P4 ; (v + 0)
00:9555 : a5 1c __ LDA ACCU + 1 
00:9557 : 85 12 __ STA P5 ; (v + 1)
00:9559 : a5 1d __ LDA ACCU + 2 
00:955b : 85 13 __ STA P6 ; (v + 2)
00:955d : a5 1e __ LDA ACCU + 3 
00:955f : 85 14 __ STA P7 ; (v + 3)
00:9561 : d0 b3 __ BNE $9516 ; (nforml.l28 + 0)
00:9563 : 4c 4e 1a JMP $1a4e 
--------------------------------------------------------------------
00:9566 : __ __ __ BYT 0a 25 53 0a 70 52 45 53 53 20 4b 45 59 20 54 4f : .%S.pRESS KEY TO
00:9576 : __ __ __ BYT 20 45 58 49 54 20 54 4f 20 62 61 73 69 63 2e 0a :  EXIT TO basic..
00:9586 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
readconfigfile: ; readconfigfile()->void
;  11, "/home/xahmol/git/UBoot64-v2/src/fileio.h"
.s4:
00:9587 : 20 5e 14 JSR $145e 
00:958a : a9 01 __ LDA #$01
00:958c : 85 11 __ STA P4 
00:958e : 20 4c 1c JSR $1c4c 
00:9591 : 20 f7 1c JSR $1cf7 
00:9594 : aa __ __ TAX
00:9595 : d0 64 __ BNE $95fb ; (readconfigfile.s9 + 0)
.s5:
00:9597 : a9 63 __ LDA #$63
00:9599 : 85 11 __ STA P4 
00:959b : a9 00 __ LDA #$00
00:959d : 85 12 __ STA P5 
00:959f : 20 28 11 JSR $1128 
00:95a2 : a9 ac __ LDA #$ac
00:95a4 : 8d ed 7f STA $7fed ; (sstack + 14)
00:95a7 : a9 1f __ LDA #$1f
00:95a9 : 8d ee 7f STA $7fee ; (sstack + 15)
00:95ac : 20 24 1f JSR $1f24 
00:95af : 20 ce 11 JSR $11ce 
00:95b2 : 20 18 11 JSR $1118 
00:95b5 : a2 62 __ LDX #$62
.l6:
00:95b7 : bd d6 49 LDA $49d6,x ; (uii_data[0] + 0)
00:95ba : 9d 01 49 STA $4901,x ; (cfg.version + 0)
00:95bd : ca __ __ DEX
00:95be : 10 f7 __ BPL $95b7 ; (readconfigfile.l6 + 0)
.s7:
00:95c0 : ad d6 49 LDA $49d6 ; (uii_data[0] + 0)
00:95c3 : c9 02 __ CMP #$02
00:95c5 : b0 31 __ BCS $95f8 ; (readconfigfile.s13 + 0)
.s8:
00:95c7 : ad 32 4a LDA $4a32 ; (uii_data[0] + 92)
00:95ca : 85 18 __ STA P11 
00:95cc : a9 bb __ LDA #$bb
00:95ce : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:95d1 : a9 1f __ LDA #$1f
00:95d3 : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:95d6 : 20 25 15 JSR $1525 
00:95d9 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:95dc : 85 18 __ STA P11 
00:95de : a9 db __ LDA #$db
00:95e0 : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:95e3 : a9 1f __ LDA #$1f
00:95e5 : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:95e8 : 20 25 15 JSR $1525 
00:95eb : a9 fe __ LDA #$fe
00:95ed : 8d eb 7f STA $7feb ; (sstack + 12)
00:95f0 : a9 12 __ LDA #$12
00:95f2 : 8d ec 7f STA $7fec ; (sstack + 13)
00:95f5 : 20 01 15 JSR $1501 
.s13:
00:95f8 : 4c db 1d JMP $1ddb 
.s9:
00:95fb : ad 58 49 LDA $4958 ; (cfg.verbose + 0)
00:95fe : d0 11 __ BNE $9611 ; (readconfigfile.s12 + 0)
.s10:
00:9600 : ae 00 49 LDX $4900 ; (verbosecounter + 0)
00:9603 : 86 0d __ STX P0 
00:9605 : e8 __ __ INX
00:9606 : 8e 00 49 STX $4900 ; (verbosecounter + 0)
00:9609 : a5 0d __ LDA P0 
00:960b : 20 62 1d JSR $1d62 
00:960e : 4c 2d 1c JMP $1c2d 
.s12:
00:9611 : a9 00 __ LDA #$00
00:9613 : 8d 68 49 STA $4968 ; (cw.cx + 0)
00:9616 : a9 08 __ LDA #$08
00:9618 : 8d 69 49 STA $4969 ; (cw.cy + 0)
00:961b : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:961e : 85 18 __ STA P11 
00:9620 : a9 3a __ LDA #$3a
00:9622 : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:9625 : a9 1d __ LDA #$1d
00:9627 : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:962a : 20 25 15 JSR $1525 
.s11:
00:962d : 20 a9 1d JSR $1da9 
--------------------------------------------------------------------
cwin_fill_rect_raw@proxy: ; cwin_fill_rect_raw@proxy
00:9630 : a9 00 __ LDA #$00
00:9632 : 85 0d __ STA P0 
00:9634 : a9 08 __ LDA #$08
00:9636 : 85 0e __ STA P1 
00:9638 : a9 28 __ LDA #$28
00:963a : 85 0f __ STA P2 
00:963c : a9 01 __ LDA #$01
00:963e : 85 10 __ STA P3 
00:9640 : a9 20 __ LDA #$20
00:9642 : 85 11 __ STA P4 
00:9644 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:9647 : 85 12 __ STA P5 
00:9649 : 4c bb 0f JMP $0fbb 
--------------------------------------------------------------------
uii_open_file@proxy: ; uii_open_file@proxy
00:964c : a9 9b __ LDA #$9b
00:964e : 85 12 __ STA P5 
00:9650 : a9 3d __ LDA #$3d
00:9652 : 85 13 __ STA P6 
--------------------------------------------------------------------
uii_open_file: ; uii_open_file(u8,u8*)->void
;  31, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
00:9654 : 20 3e 3d JSR $3d3e 
00:9657 : 18 __ __ CLC
00:9658 : a5 1b __ LDA ACCU + 0 
00:965a : 69 03 __ ADC #$03
00:965c : 85 1b __ STA ACCU + 0 
00:965e : 90 02 __ BCC $9662 ; (uii_open_file.s11 + 0)
.s10:
00:9660 : e6 1c __ INC ACCU + 1 
.s11:
00:9662 : 20 a0 38 JSR $38a0 
00:9665 : a5 1c __ LDA ACCU + 1 
00:9667 : 05 1b __ ORA ACCU + 0 
00:9669 : d0 01 __ BNE $966c ; (uii_open_file.s5 + 0)
.s3:
00:966b : 60 __ __ RTS
.s5:
00:966c : a5 1c __ LDA ACCU + 1 
00:966e : 85 46 __ STA T2 + 1 
00:9670 : a5 1b __ LDA ACCU + 0 
00:9672 : 85 45 __ STA T2 + 0 
00:9674 : a9 00 __ LDA #$00
00:9676 : a8 __ __ TAY
00:9677 : 91 1b __ STA (ACCU + 0),y 
00:9679 : a9 02 __ LDA #$02
00:967b : c8 __ __ INY
00:967c : 91 1b __ STA (ACCU + 0),y 
00:967e : a5 11 __ LDA P4 ; (attrib + 0)
00:9680 : c8 __ __ INY
00:9681 : 91 1b __ STA (ACCU + 0),y 
00:9683 : a9 00 __ LDA #$00
00:9685 : 85 47 __ STA T3 + 0 
00:9687 : 85 48 __ STA T3 + 1 
.l12:
00:9689 : 20 37 3d JSR $3d37 
00:968c : a5 48 __ LDA T3 + 1 
00:968e : c5 1c __ CMP ACCU + 1 
00:9690 : d0 5f __ BNE $96f1 ; (uii_open_file.s9 + 0)
.s8:
00:9692 : a5 47 __ LDA T3 + 0 
00:9694 : c5 1b __ CMP ACCU + 0 
00:9696 : 90 30 __ BCC $96c8 ; (uii_open_file.s7 + 0)
.s6:
00:9698 : a5 13 __ LDA P6 ; (filename + 1)
00:969a : 85 0e __ STA P1 
00:969c : a9 01 __ LDA #$01
00:969e : 8d 8a 3d STA $3d8a 
00:96a1 : 20 ad 10 JSR $10ad 
00:96a4 : a5 45 __ LDA T2 + 0 
00:96a6 : 85 0d __ STA P0 
00:96a8 : a5 46 __ LDA T2 + 1 
00:96aa : 85 0e __ STA P1 
00:96ac : 18 __ __ CLC
00:96ad : a5 1b __ LDA ACCU + 0 
00:96af : 69 03 __ ADC #$03
00:96b1 : 85 0f __ STA P2 
00:96b3 : a5 1c __ LDA ACCU + 1 
00:96b5 : 69 00 __ ADC #$00
00:96b7 : 85 10 __ STA P3 
00:96b9 : 20 53 11 JSR $1153 
00:96bc : 20 98 39 JSR $3998 
00:96bf : 20 ce 11 JSR $11ce 
00:96c2 : 20 0c 12 JSR $120c 
00:96c5 : 4c 18 11 JMP $1118 
.s7:
00:96c8 : 85 43 __ STA T0 + 0 
00:96ca : 18 __ __ CLC
00:96cb : a5 13 __ LDA P6 ; (filename + 1)
00:96cd : 65 48 __ ADC T3 + 1 
00:96cf : 85 44 __ STA T0 + 1 
00:96d1 : a4 12 __ LDY P5 ; (filename + 0)
00:96d3 : b1 43 __ LDA (T0 + 0),y 
00:96d5 : aa __ __ TAX
00:96d6 : 18 __ __ CLC
00:96d7 : a5 45 __ LDA T2 + 0 
00:96d9 : 65 47 __ ADC T3 + 0 
00:96db : 85 43 __ STA T0 + 0 
00:96dd : a5 46 __ LDA T2 + 1 
00:96df : 65 48 __ ADC T3 + 1 
00:96e1 : 85 44 __ STA T0 + 1 
00:96e3 : 8a __ __ TXA
00:96e4 : a0 03 __ LDY #$03
00:96e6 : 91 43 __ STA (T0 + 0),y 
00:96e8 : e6 47 __ INC T3 + 0 
00:96ea : d0 9d __ BNE $9689 ; (uii_open_file.l12 + 0)
.s13:
00:96ec : e6 48 __ INC T3 + 1 
00:96ee : 4c 89 1c JMP $1c89 
.s9:
00:96f1 : b0 a5 __ BCS $9698 ; (uii_open_file.s6 + 0)
.s14:
00:96f3 : a5 47 __ LDA T3 + 0 
00:96f5 : 90 d1 __ BCC $96c8 ; (uii_open_file.s7 + 0)
--------------------------------------------------------------------
strcmp@proxy: ; strcmp@proxy
00:96f7 : a9 d7 __ LDA #$d7
00:96f9 : 85 0d __ STA P0 
00:96fb : a9 4b __ LDA #$4b
00:96fd : 85 0e __ STA P1 
00:96ff : a9 34 __ LDA #$34
00:9701 : 85 0f __ STA P2 
00:9703 : a9 1d __ LDA #$1d
00:9705 : 85 10 __ STA P3 
--------------------------------------------------------------------
strcmp: ; strcmp(const u8*,const u8*)->i8
;   8, "/home/xahmol/oscar64/include/string.h"
.s4:
00:9707 : a0 00 __ LDY #$00
00:9709 : b1 0d __ LDA (P0),y 
00:970b : f0 16 __ BEQ $9723 ; (strcmp.s4 + 28)
00:970d : d1 0f __ CMP (P2),y 
00:970f : d0 16 __ BNE $9727 ; (strcmp.s4 + 32)
00:9711 : c8 __ __ INY
00:9712 : b1 0d __ LDA (P0),y 
00:9714 : f0 0d __ BEQ $9723 ; (strcmp.s4 + 28)
00:9716 : d1 0f __ CMP (P2),y 
00:9718 : d0 0d __ BNE $9727 ; (strcmp.s4 + 32)
00:971a : c8 __ __ INY
00:971b : d0 ec __ BNE $9709 ; (strcmp.s4 + 2)
00:971d : e6 0e __ INC P1 
00:971f : e6 10 __ INC P3 
00:9721 : d0 e6 __ BNE $9709 ; (strcmp.s4 + 2)
00:9723 : d1 0f __ CMP (P2),y 
00:9725 : f0 08 __ BEQ $972f ; (strcmp.s4 + 40)
00:9727 : b0 04 __ BCS $972d ; (strcmp.s4 + 38)
00:9729 : a9 ff __ LDA #$ff
00:972b : 30 02 __ BMI $972f ; (strcmp.s4 + 40)
00:972d : a9 01 __ LDA #$01
00:972f : 85 1b __ STA ACCU + 0 
.s3:
00:9731 : a5 1b __ LDA ACCU + 0 
00:9733 : 60 __ __ RTS
--------------------------------------------------------------------
00:9734 : __ __ __ BYT 30 30 2c 4f 4b 00                               : 00,OK.
--------------------------------------------------------------------
00:973a : __ __ __ BYT 6e 4f 20 43 4f 4e 46 49 47 20 46 49 4c 45 20 46 : nO CONFIG FILE F
00:974a : __ __ __ BYT 4f 55 4e 44 2c 20 57 52 49 54 49 4e 47 20 44 45 : OUND, WRITING DE
00:975a : __ __ __ BYT 46 41 55 4c 54 53 2e 00                         : FAULTS..
--------------------------------------------------------------------
spinning: ; spinning(u8,u8,u8)->void
;  14, "/home/xahmol/git/UBoot64-v2/src/core.h"
.s4:
00:9762 : 29 03 __ AND #$03
00:9764 : a2 be __ LDX #$be
00:9766 : 8e db 7f STX $7fdb ; (spinner[0] + 0)
00:9769 : a2 bc __ LDX #$bc
00:976b : 8e dc 7f STX $7fdc ; (spinner[0] + 1)
00:976e : a2 ac __ LDX #$ac
00:9770 : 8e dd 7f STX $7fdd ; (spinner[0] + 2)
00:9773 : a2 bb __ LDX #$bb
00:9775 : 8e de 7f STX $7fde ; (spinner[0] + 3)
00:9778 : aa __ __ TAX
00:9779 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:977c : 85 1d __ STA ACCU + 2 
00:977e : ad 6c 49 LDA $496c ; (cw.sp + 0)
00:9781 : 85 1b __ STA ACCU + 0 
00:9783 : ad 6d 49 LDA $496d ; (cw.sp + 1)
00:9786 : 85 1c __ STA ACCU + 1 
00:9788 : bd db 7f LDA $7fdb,x ; (spinner[0] + 0)
00:978b : a8 __ __ TAY
00:978c : 4a __ __ LSR
00:978d : 4a __ __ LSR
00:978e : 4a __ __ LSR
00:978f : 4a __ __ LSR
00:9790 : 4a __ __ LSR
00:9791 : aa __ __ TAX
00:9792 : 98 __ __ TYA
00:9793 : 5d 8b 3d EOR $3d8b,x 
00:9796 : a0 91 __ LDY #$91
00:9798 : 91 1b __ STA (ACCU + 0),y 
00:979a : ad 6e 49 LDA $496e ; (cw.cp + 0)
00:979d : 85 1b __ STA ACCU + 0 
00:979f : ad 6f 49 LDA $496f ; (cw.cp + 1)
00:97a2 : 85 1c __ STA ACCU + 1 
00:97a4 : a5 1d __ LDA ACCU + 2 
00:97a6 : 91 1b __ STA (ACCU + 0),y 
.s3:
00:97a8 : 60 __ __ RTS
--------------------------------------------------------------------
writeconfigfile: ; writeconfigfile()->void
;  10, "/home/xahmol/git/UBoot64-v2/src/fileio.h"
.s4:
00:97a9 : a9 9b __ LDA #$9b
00:97ab : 85 11 __ STA P4 
00:97ad : a9 3d __ LDA #$3d
00:97af : 85 12 __ STA P5 
00:97b1 : 20 04 1e JSR $1e04 
00:97b4 : a9 06 __ LDA #$06
00:97b6 : 85 11 __ STA P4 
00:97b8 : 20 4c 1c JSR $1c4c 
00:97bb : a9 63 __ LDA #$63
00:97bd : 85 13 __ STA P6 
00:97bf : a9 49 __ LDA #$49
00:97c1 : 85 12 __ STA P5 
00:97c3 : a9 00 __ LDA #$00
00:97c5 : 85 14 __ STA P7 
00:97c7 : a9 01 __ LDA #$01
00:97c9 : 85 11 __ STA P4 
00:97cb : 20 9f 1e JSR $1e9f 
00:97ce : a9 9d __ LDA #$9d
00:97d0 : 8d ed 7f STA $7fed ; (sstack + 14)
00:97d3 : a9 1f __ LDA #$1f
00:97d5 : 8d ee 7f STA $7fee ; (sstack + 15)
00:97d8 : 20 24 1f JSR $1f24 
--------------------------------------------------------------------
uii_close_file: ; uii_close_file()->void
;  32, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
00:97db : a9 00 __ LDA #$00
00:97dd : 85 10 __ STA P3 
00:97df : 8d dd 7f STA $7fdd ; (cmd[0] + 0)
00:97e2 : a9 02 __ LDA #$02
00:97e4 : 85 0f __ STA P2 
00:97e6 : a9 01 __ LDA #$01
00:97e8 : 8d 8a 3d STA $3d8a 
00:97eb : a9 03 __ LDA #$03
00:97ed : 8d de 7f STA $7fde ; (cmd[0] + 1)
00:97f0 : a9 dd __ LDA #$dd
00:97f2 : 85 0d __ STA P0 
00:97f4 : a9 7f __ LDA #$7f
00:97f6 : 85 0e __ STA P1 
00:97f8 : 20 53 11 JSR $1153 
00:97fb : 20 ce 11 JSR $11ce 
00:97fe : 20 0c 12 JSR $120c 
00:9801 : 4c 18 11 JMP $1118 
--------------------------------------------------------------------
uii_delete_file: ; uii_delete_file(u8*)->void
;  38, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
00:9804 : 20 a5 10 JSR $10a5 
00:9807 : 18 __ __ CLC
00:9808 : a5 1b __ LDA ACCU + 0 
00:980a : 69 02 __ ADC #$02
00:980c : 85 1b __ STA ACCU + 0 
00:980e : 90 02 __ BCC $9812 ; (uii_delete_file.s11 + 0)
.s10:
00:9810 : e6 1c __ INC ACCU + 1 
.s11:
00:9812 : 20 a0 38 JSR $38a0 
00:9815 : a5 1c __ LDA ACCU + 1 
00:9817 : 05 1b __ ORA ACCU + 0 
00:9819 : d0 01 __ BNE $981c ; (uii_delete_file.s5 + 0)
.s3:
00:981b : 60 __ __ RTS
.s5:
00:981c : a5 1c __ LDA ACCU + 1 
00:981e : 85 46 __ STA T2 + 1 
00:9820 : a5 1b __ LDA ACCU + 0 
00:9822 : 85 45 __ STA T2 + 0 
00:9824 : a9 00 __ LDA #$00
00:9826 : a8 __ __ TAY
00:9827 : 91 1b __ STA (ACCU + 0),y 
00:9829 : a9 09 __ LDA #$09
00:982b : c8 __ __ INY
00:982c : 91 1b __ STA (ACCU + 0),y 
00:982e : a9 00 __ LDA #$00
00:9830 : 85 47 __ STA T3 + 0 
00:9832 : 85 48 __ STA T3 + 1 
.l12:
00:9834 : 20 49 3d JSR $3d49 
00:9837 : a5 48 __ LDA T3 + 1 
00:9839 : c5 1c __ CMP ACCU + 1 
00:983b : d0 5c __ BNE $9899 ; (uii_delete_file.s9 + 0)
.s8:
00:983d : a5 47 __ LDA T3 + 0 
00:983f : c5 1b __ CMP ACCU + 0 
00:9841 : 90 2d __ BCC $9870 ; (uii_delete_file.s7 + 0)
.s6:
00:9843 : a5 12 __ LDA P5 ; (filename + 1)
00:9845 : 85 0e __ STA P1 
00:9847 : a9 01 __ LDA #$01
00:9849 : 8d 8a 3d STA $3d8a 
00:984c : 20 ad 10 JSR $10ad 
00:984f : a5 45 __ LDA T2 + 0 
00:9851 : 85 0d __ STA P0 
00:9853 : a5 46 __ LDA T2 + 1 
00:9855 : 85 0e __ STA P1 
00:9857 : 18 __ __ CLC
00:9858 : a5 1b __ LDA ACCU + 0 
00:985a : 69 02 __ ADC #$02
00:985c : 85 0f __ STA P2 
00:985e : a5 1c __ LDA ACCU + 1 
00:9860 : 69 00 __ ADC #$00
00:9862 : 85 10 __ STA P3 
00:9864 : 20 53 11 JSR $1153 
00:9867 : 20 98 39 JSR $3998 
00:986a : 20 0c 12 JSR $120c 
00:986d : 4c 18 11 JMP $1118 
.s7:
00:9870 : 85 43 __ STA T0 + 0 
00:9872 : 18 __ __ CLC
00:9873 : a5 12 __ LDA P5 ; (filename + 1)
00:9875 : 65 48 __ ADC T3 + 1 
00:9877 : 85 44 __ STA T0 + 1 
00:9879 : a4 11 __ LDY P4 ; (filename + 0)
00:987b : b1 43 __ LDA (T0 + 0),y 
00:987d : aa __ __ TAX
00:987e : 18 __ __ CLC
00:987f : a5 45 __ LDA T2 + 0 
00:9881 : 65 47 __ ADC T3 + 0 
00:9883 : 85 43 __ STA T0 + 0 
00:9885 : a5 46 __ LDA T2 + 1 
00:9887 : 65 48 __ ADC T3 + 1 
00:9889 : 85 44 __ STA T0 + 1 
00:988b : 8a __ __ TXA
00:988c : a0 02 __ LDY #$02
00:988e : 91 43 __ STA (T0 + 0),y 
00:9890 : e6 47 __ INC T3 + 0 
00:9892 : d0 a0 __ BNE $9834 ; (uii_delete_file.l12 + 0)
.s13:
00:9894 : e6 48 __ INC T3 + 1 
00:9896 : 4c 34 1e JMP $1e34 
.s9:
00:9899 : b0 a8 __ BCS $9843 ; (uii_delete_file.s6 + 0)
.s14:
00:989b : a5 47 __ LDA T3 + 0 
00:989d : 90 d1 __ BCC $9870 ; (uii_delete_file.s7 + 0)
--------------------------------------------------------------------
uii_write_file: ; uii_write_file(u8*,u16)->void
;  33, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
00:989f : 18 __ __ CLC
00:98a0 : a5 13 __ LDA P6 ; (length + 0)
00:98a2 : 69 04 __ ADC #$04
00:98a4 : 85 45 __ STA T1 + 0 
00:98a6 : 85 1b __ STA ACCU + 0 
00:98a8 : a5 14 __ LDA P7 ; (length + 1)
00:98aa : 69 00 __ ADC #$00
00:98ac : 85 46 __ STA T1 + 1 
00:98ae : 85 1c __ STA ACCU + 1 
00:98b0 : 20 a0 38 JSR $38a0 
00:98b3 : a5 1c __ LDA ACCU + 1 
00:98b5 : 05 1b __ ORA ACCU + 0 
00:98b7 : d0 01 __ BNE $98ba ; (uii_write_file.s5 + 0)
.s3:
00:98b9 : 60 __ __ RTS
.s5:
00:98ba : a9 00 __ LDA #$00
00:98bc : a8 __ __ TAY
00:98bd : 91 1b __ STA (ACCU + 0),y 
00:98bf : a9 05 __ LDA #$05
00:98c1 : c8 __ __ INY
00:98c2 : 91 1b __ STA (ACCU + 0),y 
00:98c4 : a9 00 __ LDA #$00
00:98c6 : c8 __ __ INY
00:98c7 : 91 1b __ STA (ACCU + 0),y 
00:98c9 : c8 __ __ INY
00:98ca : 91 1b __ STA (ACCU + 0),y 
00:98cc : a5 13 __ LDA P6 ; (length + 0)
00:98ce : 05 14 __ ORA P7 ; (length + 1)
00:98d0 : f0 2e __ BEQ $9900 ; (uii_write_file.s6 + 0)
.s7:
00:98d2 : a5 13 __ LDA P6 ; (length + 0)
00:98d4 : 85 43 __ STA T0 + 0 
00:98d6 : a5 1b __ LDA ACCU + 0 
00:98d8 : 85 47 __ STA T2 + 0 
00:98da : a5 1c __ LDA ACCU + 1 
00:98dc : 85 48 __ STA T2 + 1 
00:98de : a6 14 __ LDX P7 ; (length + 1)
.l8:
00:98e0 : a0 00 __ LDY #$00
00:98e2 : b1 11 __ LDA (P4),y ; (data + 0)
00:98e4 : a0 04 __ LDY #$04
00:98e6 : 91 47 __ STA (T2 + 0),y 
00:98e8 : e6 47 __ INC T2 + 0 
00:98ea : d0 02 __ BNE $98ee ; (uii_write_file.s13 + 0)
.s12:
00:98ec : e6 48 __ INC T2 + 1 
.s13:
00:98ee : e6 11 __ INC P4 ; (data + 0)
00:98f0 : d0 02 __ BNE $98f4 ; (uii_write_file.s15 + 0)
.s14:
00:98f2 : e6 12 __ INC P5 ; (data + 1)
.s15:
00:98f4 : a5 43 __ LDA T0 + 0 
00:98f6 : d0 01 __ BNE $98f9 ; (uii_write_file.s10 + 0)
.s9:
00:98f8 : ca __ __ DEX
.s10:
00:98f9 : c6 43 __ DEC T0 + 0 
00:98fb : d0 e3 __ BNE $98e0 ; (uii_write_file.l8 + 0)
.s11:
00:98fd : 8a __ __ TXA
00:98fe : d0 e0 __ BNE $98e0 ; (uii_write_file.l8 + 0)
.s6:
00:9900 : a5 1b __ LDA ACCU + 0 
00:9902 : 85 0d __ STA P0 
00:9904 : a5 1c __ LDA ACCU + 1 
00:9906 : 85 0e __ STA P1 
00:9908 : a5 45 __ LDA T1 + 0 
00:990a : 85 0f __ STA P2 
00:990c : a5 46 __ LDA T1 + 1 
00:990e : 85 10 __ STA P3 
00:9910 : a9 01 __ LDA #$01
00:9912 : 8d 8a 3d STA $3d8a 
00:9915 : 20 53 11 JSR $1153 
00:9918 : 20 98 39 JSR $3998 
00:991b : 20 ce 11 JSR $11ce 
00:991e : 20 0c 12 JSR $120c 
00:9921 : 4c 18 11 JMP $1118 
--------------------------------------------------------------------
CheckStatus: ; CheckStatus(const u8*)->void
;  74, "/home/xahmol/git/UBoot64-v2/src/fileio.c"
.s4:
00:9924 : ad d7 4b LDA $4bd7 ; (uii_status[0] + 0)
00:9927 : c9 30 __ CMP #$30
00:9929 : d0 07 __ BNE $9932 ; (CheckStatus.s6 + 0)
.s5:
00:992b : ad d8 4b LDA $4bd8 ; (uii_status[0] + 1)
00:992e : c9 30 __ CMP #$30
00:9930 : f0 4a __ BEQ $997c ; (CheckStatus.s3 + 0)
.s6:
00:9932 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:9935 : 85 18 __ STA P11 
00:9937 : a9 7d __ LDA #$7d
00:9939 : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:993c : a9 1f __ LDA #$1f
00:993e : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:9941 : ad ed 7f LDA $7fed ; (sstack + 14)
00:9944 : 8d e5 7f STA $7fe5 ; (sstack + 6)
00:9947 : ad ee 7f LDA $7fee ; (sstack + 15)
00:994a : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:994d : 20 25 15 JSR $1525 
00:9950 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:9953 : 85 18 __ STA P11 
00:9955 : a9 d7 __ LDA #$d7
00:9957 : 8d e5 7f STA $7fe5 ; (sstack + 6)
00:995a : a9 4b __ LDA #$4b
00:995c : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:995f : a9 90 __ LDA #$90
00:9961 : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:9964 : a9 1f __ LDA #$1f
00:9966 : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:9969 : 20 25 15 JSR $1525 
00:996c : 20 f5 12 JSR $12f5 
00:996f : a9 fe __ LDA #$fe
00:9971 : 8d eb 7f STA $7feb ; (sstack + 12)
00:9974 : a9 12 __ LDA #$12
00:9976 : 8d ec 7f STA $7fec ; (sstack + 13)
00:9979 : 4c 01 15 JMP $1501 
.s3:
00:997c : 60 __ __ RTS
--------------------------------------------------------------------
00:997d : __ __ __ BYT 0a 69 2f 6f 20 45 52 52 4f 52 20 49 4e 20 25 53 : .i/o ERROR IN %S
00:998d : __ __ __ BYT 2e 0a 00                                        : ...
--------------------------------------------------------------------
00:9990 : __ __ __ BYT 0a 73 54 41 54 55 53 3a 20 25 53 0a 00          : .sTATUS: %S..
--------------------------------------------------------------------
00:999d : __ __ __ BYT 57 52 49 54 49 4e 47 20 43 4f 4e 46 49 47 00    : WRITING CONFIG.
--------------------------------------------------------------------
00:99ac : __ __ __ BYT 52 45 41 44 49 4e 47 20 43 4f 4e 46 49 47 00    : READING CONFIG.
--------------------------------------------------------------------
00:99bb : __ __ __ BYT 0a 6f 4c 44 20 43 4f 4e 46 49 47 55 52 41 54 49 : .oLD CONFIGURATI
00:99cb : __ __ __ BYT 4f 4e 20 46 49 4c 45 20 46 4f 52 4d 41 54 2e 00 : ON FILE FORMAT..
--------------------------------------------------------------------
00:99db : __ __ __ BYT 0a 72 55 4e 20 55 50 47 52 41 44 45 20 54 4f 4f : .rUN UPGRADE TOO
00:99eb : __ __ __ BYT 4c 20 46 49 52 53 54 2e 00                      : L FIRST..
--------------------------------------------------------------------
strncpy@proxy: ; strncpy@proxy
00:99f4 : a9 00 __ LDA #$00
00:99f6 : 85 12 __ STA P5 
00:99f8 : 4c c9 23 JMP $23c9 
--------------------------------------------------------------------
00:99fb : __ __ __ BYT 6f 4e 00                                        : oN.
--------------------------------------------------------------------
00:99fe : __ __ __ BYT 2f 00                                           : /.
--------------------------------------------------------------------
00:9a00 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d 41 4e 44 : uLTIMATE cOMMAND
00:9a10 : __ __ __ BYT 20 69 4e 54 45 52 46 41 43 45 20 44 45 54 45 43 :  iNTERFACE DETEC
00:9a20 : __ __ __ BYT 54 45 44 2e 00                                  : TED..
--------------------------------------------------------------------
00:9a25 : __ __ __ BYT 64 6f 73 20 56 45 52 53 49 4f 4e 3a 20 00       : dos VERSION: .
--------------------------------------------------------------------
reu_count_pages: ; reu_count_pages()->i16
;  48, "/home/xahmol/oscar64/include/c64/reu.h"
.s4:
00:9a33 : a9 00 __ LDA #$00
00:9a35 : 8d de 7f STA $7fde ; (c + 0)
00:9a38 : a9 de __ LDA #$de
00:9a3a : 8d 02 df STA $df02 
00:9a3d : a9 7f __ LDA #$7f
00:9a3f : 8d 03 df STA $df03 
00:9a42 : a9 00 __ LDA #$00
00:9a44 : 8d 04 df STA $df04 
00:9a47 : 8d 05 df STA $df05 
00:9a4a : 8d 06 df STA $df06 
00:9a4d : a2 01 __ LDX #$01
00:9a4f : 8e 07 df STX $df07 
00:9a52 : 8d 08 df STA $df08 
00:9a55 : 8d 0a df STA $df0a 
00:9a58 : a2 90 __ LDX #$90
00:9a5a : 8e 01 df STX $df01 
00:9a5d : a2 dd __ LDX #$dd
00:9a5f : 8e 02 df STX $df02 
00:9a62 : a2 7f __ LDX #$7f
00:9a64 : 8e 03 df STX $df03 
00:9a67 : 8d 04 df STA $df04 
00:9a6a : 8d 05 df STA $df05 
00:9a6d : 8d 06 df STA $df06 
00:9a70 : a2 01 __ LDX #$01
00:9a72 : 8e 07 df STX $df07 
00:9a75 : 8d 08 df STA $df08 
00:9a78 : 8d 0a df STA $df0a 
00:9a7b : a9 91 __ LDA #$91
00:9a7d : 8d 01 df STA $df01 
00:9a80 : ad dd 7f LDA $7fdd ; (d + 0)
00:9a83 : d0 52 __ BNE $9ad7 ; (reu_count_pages.s6 + 0)
.s5:
00:9a85 : a2 47 __ LDX #$47
00:9a87 : 8e de 7f STX $7fde ; (c + 0)
00:9a8a : a2 de __ LDX #$de
00:9a8c : 8e 02 df STX $df02 
00:9a8f : a2 7f __ LDX #$7f
00:9a91 : 8e 03 df STX $df03 
00:9a94 : 8d 04 df STA $df04 
00:9a97 : 8d 05 df STA $df05 
00:9a9a : 8d 06 df STA $df06 
00:9a9d : a2 01 __ LDX #$01
00:9a9f : 8e 07 df STX $df07 
00:9aa2 : 8d 08 df STA $df08 
00:9aa5 : 8d 0a df STA $df0a 
00:9aa8 : a2 90 __ LDX #$90
00:9aaa : 8e 01 df STX $df01 
00:9aad : a2 dd __ LDX #$dd
00:9aaf : 8e 02 df STX $df02 
00:9ab2 : a2 7f __ LDX #$7f
00:9ab4 : 8e 03 df STX $df03 
00:9ab7 : 8d 04 df STA $df04 
00:9aba : 8d 05 df STA $df05 
00:9abd : 8d 06 df STA $df06 
00:9ac0 : a2 01 __ LDX #$01
00:9ac2 : 8e 07 df STX $df07 
00:9ac5 : 8d 08 df STA $df08 
00:9ac8 : 8d 0a df STA $df0a 
00:9acb : a9 91 __ LDA #$91
00:9acd : 8d 01 df STA $df01 
00:9ad0 : ad dd 7f LDA $7fdd ; (d + 0)
00:9ad3 : c9 47 __ CMP #$47
00:9ad5 : f0 07 __ BEQ $9ade ; (reu_count_pages.s7 + 0)
.s6:
00:9ad7 : a9 00 __ LDA #$00
00:9ad9 : 85 1b __ STA ACCU + 0 
.s3:
00:9adb : 85 1c __ STA ACCU + 1 
00:9add : 60 __ __ RTS
.s7:
00:9ade : ca __ __ DEX
00:9adf : a0 01 __ LDY #$01
.l8:
00:9ae1 : a9 47 __ LDA #$47
00:9ae3 : 8d de 7f STA $7fde ; (c + 0)
00:9ae6 : a9 de __ LDA #$de
00:9ae8 : 8d 02 df STA $df02 
00:9aeb : a9 7f __ LDA #$7f
00:9aed : 8d 03 df STA $df03 
00:9af0 : a9 00 __ LDA #$00
00:9af2 : 8d 04 df STA $df04 
00:9af5 : 8d 05 df STA $df05 
00:9af8 : 8c 06 df STY $df06 
00:9afb : a9 01 __ LDA #$01
00:9afd : 8d 07 df STA $df07 
00:9b00 : a9 00 __ LDA #$00
00:9b02 : 8d 08 df STA $df08 
00:9b05 : 8d 0a df STA $df0a 
00:9b08 : a9 90 __ LDA #$90
00:9b0a : 8d 01 df STA $df01 
00:9b0d : a9 00 __ LDA #$00
00:9b0f : 8d de 7f STA $7fde ; (c + 0)
00:9b12 : a9 de __ LDA #$de
00:9b14 : 8d 02 df STA $df02 
00:9b17 : a9 7f __ LDA #$7f
00:9b19 : 8d 03 df STA $df03 
00:9b1c : a9 00 __ LDA #$00
00:9b1e : 8d 04 df STA $df04 
00:9b21 : 8d 05 df STA $df05 
00:9b24 : 8d 06 df STA $df06 
00:9b27 : a9 01 __ LDA #$01
00:9b29 : 8d 07 df STA $df07 
00:9b2c : a9 00 __ LDA #$00
00:9b2e : 8d 08 df STA $df08 
00:9b31 : 8d 0a df STA $df0a 
00:9b34 : a9 90 __ LDA #$90
00:9b36 : 8d 01 df STA $df01 
00:9b39 : a9 dd __ LDA #$dd
00:9b3b : 8d 02 df STA $df02 
00:9b3e : a9 7f __ LDA #$7f
00:9b40 : 8d 03 df STA $df03 
00:9b43 : a9 00 __ LDA #$00
00:9b45 : 8d 04 df STA $df04 
00:9b48 : 8d 05 df STA $df05 
00:9b4b : 8c 06 df STY $df06 
00:9b4e : a9 01 __ LDA #$01
00:9b50 : 8d 07 df STA $df07 
00:9b53 : a9 00 __ LDA #$00
00:9b55 : 8d 08 df STA $df08 
00:9b58 : 8d 0a df STA $df0a 
00:9b5b : a9 91 __ LDA #$91
00:9b5d : 8d 01 df STA $df01 
00:9b60 : ad dd 7f LDA $7fdd ; (d + 0)
00:9b63 : c9 47 __ CMP #$47
00:9b65 : f0 06 __ BEQ $9b6d ; (reu_count_pages.s9 + 0)
.s11:
00:9b67 : 84 1b __ STY ACCU + 0 
00:9b69 : 8a __ __ TXA
00:9b6a : 4c db 20 JMP $20db 
.s9:
00:9b6d : c8 __ __ INY
00:9b6e : d0 01 __ BNE $9b71 ; (reu_count_pages.s13 + 0)
.s12:
00:9b70 : e8 __ __ INX
.s13:
00:9b71 : 98 __ __ TYA
00:9b72 : f0 03 __ BEQ $9b77 ; (reu_count_pages.s10 + 0)
00:9b74 : 4c e1 20 JMP $20e1 
.s10:
00:9b77 : 85 1b __ STA ACCU + 0 
00:9b79 : a9 01 __ LDA #$01
00:9b7b : 4c db 20 JMP $20db 
--------------------------------------------------------------------
00:9b7e : __ __ __ BYT 0a 72 65 75 20 44 45 54 45 43 54 45 44 2c 20 53 : .reu DETECTED, S
00:9b8e : __ __ __ BYT 49 5a 45 3a 20 25 44 20 6b 62 0a 00             : IZE: %D kb..
--------------------------------------------------------------------
00:9b9a : __ __ __ BYT 6e 4f 20 72 65 75 20 44 45 54 45 43 54 45 44 2e : nO reu DETECTED.
00:9baa : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
read_slotsfile: ; read_slotsfile(u8)->void
;   9, "/home/xahmol/git/UBoot64-v2/src/fileio.h"
.s1:
00:9bab : a2 06 __ LDX #$06
00:9bad : b5 53 __ LDA T1 + 0,x 
00:9baf : 9d 04 7d STA $7d04,x ; (read_slotsfile@stack + 0)
00:9bb2 : ca __ __ DEX
00:9bb3 : 10 f8 __ BPL $9bad ; (read_slotsfile.s1 + 2)
.s4:
00:9bb5 : 20 5e 14 JSR $145e 
00:9bb8 : a9 01 __ LDA #$01
00:9bba : 85 11 __ STA P4 
00:9bbc : 20 32 3b JSR $3b32 
00:9bbf : 20 f7 1c JSR $1cf7 
00:9bc2 : ae f0 7f LDX $7ff0 ; (sstack + 17)
00:9bc5 : 86 59 __ STX T3 + 0 
00:9bc7 : aa __ __ TAX
00:9bc8 : f0 03 __ BEQ $9bcd ; (read_slotsfile.s5 + 0)
00:9bca : 4c 08 23 JMP $2308 
.s5:
00:9bcd : 85 53 __ STA T1 + 0 
00:9bcf : 85 54 __ STA T1 + 1 
00:9bd1 : 85 55 __ STA T1 + 2 
00:9bd3 : 85 56 __ STA T1 + 3 
.l16:
00:9bd5 : a5 55 __ LDA T1 + 2 
00:9bd7 : 38 __ __ SEC
00:9bd8 : d0 0a __ BNE $9be4 ; (read_slotsfile.s19 + 0)
.s17:
00:9bda : a5 54 __ LDA T1 + 1 
00:9bdc : c9 5f __ CMP #$5f
00:9bde : d0 04 __ BNE $9be4 ; (read_slotsfile.s19 + 0)
.s18:
00:9be0 : a5 53 __ LDA T1 + 0 
00:9be2 : c9 a0 __ CMP #$a0
.s19:
00:9be4 : b0 1f __ BCS $9c05 ; (read_slotsfile.s7 + 0)
.l9:
00:9be6 : a9 a0 __ LDA #$a0
00:9be8 : 85 11 __ STA P4 
00:9bea : a9 5f __ LDA #$5f
00:9bec : 85 12 __ STA P5 
00:9bee : 20 28 11 JSR $1128 
00:9bf1 : 2c 1c df BIT $df1c 
00:9bf4 : 30 5a __ BMI $9c50 ; (read_slotsfile.l12 + 0)
.s11:
00:9bf6 : ad 1c df LDA $df1c 
00:9bf9 : 29 30 __ AND #$30
00:9bfb : c9 30 __ CMP #$30
00:9bfd : f0 51 __ BEQ $9c50 ; (read_slotsfile.l12 + 0)
.s6:
00:9bff : a5 56 __ LDA T1 + 3 
00:9c01 : f0 d2 __ BEQ $9bd5 ; (read_slotsfile.l16 + 0)
.s26:
00:9c03 : 30 e1 __ BMI $9be6 ; (read_slotsfile.l9 + 0)
.s7:
00:9c05 : 20 db 1d JSR $1ddb 
00:9c08 : a9 00 __ LDA #$00
00:9c0a : 20 f8 25 JSR $25f8 
00:9c0d : ad c8 4d LDA $4dc8 ; (Slot.cfgvs + 0)
00:9c10 : c9 02 __ CMP #$02
00:9c12 : b0 31 __ BCS $9c45 ; (read_slotsfile.s3 + 0)
.s8:
00:9c14 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:9c17 : 85 18 __ STA P11 
00:9c19 : a9 bb __ LDA #$bb
00:9c1b : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:9c1e : a9 1f __ LDA #$1f
00:9c20 : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:9c23 : 20 25 15 JSR $1525 
00:9c26 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:9c29 : 85 18 __ STA P11 
00:9c2b : a9 db __ LDA #$db
00:9c2d : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:9c30 : a9 1f __ LDA #$1f
00:9c32 : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:9c35 : 20 25 15 JSR $1525 
00:9c38 : a9 fe __ LDA #$fe
00:9c3a : 8d eb 7f STA $7feb ; (sstack + 12)
00:9c3d : a9 12 __ LDA #$12
00:9c3f : 8d ec 7f STA $7fec ; (sstack + 13)
00:9c42 : 20 01 15 JSR $1501 
.s3:
00:9c45 : a2 06 __ LDX #$06
00:9c47 : bd 04 7d LDA $7d04,x ; (read_slotsfile@stack + 0)
00:9c4a : 95 53 __ STA T1 + 0,x 
00:9c4c : ca __ __ DEX
00:9c4d : 10 f8 __ BPL $9c47 ; (read_slotsfile.s3 + 2)
00:9c4f : 60 __ __ RTS
.l12:
00:9c50 : 20 ce 11 JSR $11ce 
00:9c53 : a5 1b __ LDA ACCU + 0 
00:9c55 : 85 57 __ STA T2 + 0 
00:9c57 : a5 1c __ LDA ACCU + 1 
00:9c59 : 85 58 __ STA T2 + 1 
00:9c5b : 20 18 11 JSR $1118 
00:9c5e : a9 d0 __ LDA #$d0
00:9c60 : 8d ed 7f STA $7fed ; (sstack + 14)
00:9c63 : a9 25 __ LDA #$25
00:9c65 : 8d ee 7f STA $7fee ; (sstack + 15)
00:9c68 : 20 24 1f JSR $1f24 
00:9c6b : a9 d6 __ LDA #$d6
00:9c6d : 8d 02 df STA $df02 
00:9c70 : a9 49 __ LDA #$49
00:9c72 : 8d 03 df STA $df03 
00:9c75 : a5 53 __ LDA T1 + 0 
00:9c77 : 8d 04 df STA $df04 
00:9c7a : a5 54 __ LDA T1 + 1 
00:9c7c : 8d 05 df STA $df05 
00:9c7f : a5 55 __ LDA T1 + 2 
00:9c81 : 8d 06 df STA $df06 
00:9c84 : a5 57 __ LDA T2 + 0 
00:9c86 : 8d 07 df STA $df07 
00:9c89 : 18 __ __ CLC
00:9c8a : 65 53 __ ADC T1 + 0 
00:9c8c : 85 53 __ STA T1 + 0 
00:9c8e : a5 58 __ LDA T2 + 1 
00:9c90 : 8d 08 df STA $df08 
00:9c93 : 65 54 __ ADC T1 + 1 
00:9c95 : 85 54 __ STA T1 + 1 
00:9c97 : 90 06 __ BCC $9c9f ; (read_slotsfile.s29 + 0)
.s30:
00:9c99 : e6 55 __ INC T1 + 2 
00:9c9b : d0 02 __ BNE $9c9f ; (read_slotsfile.s29 + 0)
.s28:
00:9c9d : e6 56 __ INC T1 + 3 
.s29:
00:9c9f : a9 00 __ LDA #$00
00:9ca1 : 8d 0a df STA $df0a 
00:9ca4 : a9 90 __ LDA #$90
00:9ca6 : 8d 01 df STA $df01 
00:9ca9 : a5 59 __ LDA T3 + 0 
00:9cab : d0 08 __ BNE $9cb5 ; (read_slotsfile.s13 + 0)
.s10:
00:9cad : 2c 1c df BIT $df1c 
00:9cb0 : 30 9e __ BMI $9c50 ; (read_slotsfile.l12 + 0)
00:9cb2 : 4c f6 21 JMP $21f6 
.s13:
00:9cb5 : ad 58 49 LDA $4958 ; (cfg.verbose + 0)
00:9cb8 : f0 38 __ BEQ $9cf2 ; (read_slotsfile.s14 + 0)
.s15:
00:9cba : a5 53 __ LDA T1 + 0 
00:9cbc : 8d e5 7f STA $7fe5 ; (sstack + 6)
00:9cbf : a5 54 __ LDA T1 + 1 
00:9cc1 : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:9cc4 : a5 55 __ LDA T1 + 2 
00:9cc6 : 8d e7 7f STA $7fe7 ; (sstack + 8)
00:9cc9 : a5 56 __ LDA T1 + 3 
00:9ccb : 8d e8 7f STA $7fe8 ; (sstack + 9)
00:9cce : a9 00 __ LDA #$00
00:9cd0 : 8d 68 49 STA $4968 ; (cw.cx + 0)
00:9cd3 : a9 08 __ LDA #$08
00:9cd5 : 8d 69 49 STA $4969 ; (cw.cy + 0)
00:9cd8 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:9cdb : 85 18 __ STA P11 
00:9cdd : a9 de __ LDA #$de
00:9cdf : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:9ce2 : a9 25 __ LDA #$25
00:9ce4 : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:9ce7 : 20 25 15 JSR $1525 
00:9cea : 2c 1c df BIT $df1c 
00:9ced : 10 c3 __ BPL $9cb2 ; (read_slotsfile.s10 + 5)
00:9cef : 4c 50 22 JMP $2250 
.s14:
00:9cf2 : ae 00 49 LDX $4900 ; (verbosecounter + 0)
00:9cf5 : 86 0d __ STX P0 
00:9cf7 : e8 __ __ INX
00:9cf8 : 8e 00 49 STX $4900 ; (verbosecounter + 0)
00:9cfb : a5 0d __ LDA P0 
00:9cfd : 20 62 1d JSR $1d62 
00:9d00 : 2c 1c df BIT $df1c 
00:9d03 : 30 ea __ BMI $9cef ; (read_slotsfile.s15 + 53)
00:9d05 : 4c f6 21 JMP $21f6 
.s20:
00:9d08 : a9 00 __ LDA #$00
00:9d0a : 85 0f __ STA P2 
00:9d0c : 85 10 __ STA P3 
00:9d0e : 20 9d 23 JSR $239d 
00:9d11 : a9 00 __ LDA #$00
00:9d13 : 85 53 __ STA T1 + 0 
00:9d15 : 85 12 __ STA P5 
00:9d17 : a9 0d __ LDA #$0d
00:9d19 : 85 11 __ STA P4 
00:9d1b : a9 02 __ LDA #$02
00:9d1d : 8d c8 4d STA $4dc8 ; (Slot.cfgvs + 0)
00:9d20 : a9 0b __ LDA #$0b
00:9d22 : 85 0d __ STA P0 
00:9d24 : a9 24 __ LDA #$24
00:9d26 : 85 10 __ STA P3 
00:9d28 : a9 53 __ LDA #$53
00:9d2a : 85 0e __ STA P1 
00:9d2c : a9 22 __ LDA #$22
00:9d2e : 85 0f __ STA P2 
00:9d30 : 20 c9 23 JSR $23c9 
00:9d33 : a5 59 __ LDA T3 + 0 
00:9d35 : d0 1c __ BNE $9d53 ; (read_slotsfile.l22 + 0)
.l27:
00:9d37 : 20 46 24 JSR $2446 
00:9d3a : e6 53 __ INC T1 + 0 
00:9d3c : a5 53 __ LDA T1 + 0 
00:9d3e : c9 12 __ CMP #$12
00:9d40 : 90 f5 __ BCC $9d37 ; (read_slotsfile.l27 + 0)
.s21:
00:9d42 : 20 30 1c JSR $1c30 
00:9d45 : a9 01 __ LDA #$01
00:9d47 : 8d ef 7f STA $7fef ; (sstack + 16)
00:9d4a : 20 83 24 JSR $2483 
00:9d4d : 20 db 1d JSR $1ddb 
00:9d50 : 4c 45 22 JMP $2245 
.l22:
00:9d53 : ad 58 49 LDA $4958 ; (cfg.verbose + 0)
00:9d56 : d0 11 __ BNE $9d69 ; (read_slotsfile.s25 + 0)
.s23:
00:9d58 : ae 00 49 LDX $4900 ; (verbosecounter + 0)
00:9d5b : 86 0d __ STX P0 
00:9d5d : e8 __ __ INX
00:9d5e : 8e 00 49 STX $4900 ; (verbosecounter + 0)
00:9d61 : a5 0d __ LDA P0 
00:9d63 : 20 62 1d JSR $1d62 
00:9d66 : 4c 8e 23 JMP $238e 
.s25:
00:9d69 : a9 08 __ LDA #$08
00:9d6b : 8d 69 49 STA $4969 ; (cw.cy + 0)
00:9d6e : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:9d71 : 85 18 __ STA P11 
00:9d73 : a9 30 __ LDA #$30
00:9d75 : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:9d78 : a9 24 __ LDA #$24
00:9d7a : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:9d7d : a6 53 __ LDX T1 + 0 
00:9d7f : e8 __ __ INX
00:9d80 : 8e e5 7f STX $7fe5 ; (sstack + 6)
00:9d83 : a9 00 __ LDA #$00
00:9d85 : 8d 68 49 STA $4968 ; (cw.cx + 0)
00:9d88 : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:9d8b : 20 25 15 JSR $1525 
.s24:
00:9d8e : a5 53 __ LDA T1 + 0 
00:9d90 : 20 46 24 JSR $2446 
00:9d93 : e6 53 __ INC T1 + 0 
00:9d95 : a5 53 __ LDA T1 + 0 
00:9d97 : c9 12 __ CMP #$12
00:9d99 : 90 b8 __ BCC $9d53 ; (read_slotsfile.l22 + 0)
00:9d9b : b0 a5 __ BCS $9d42 ; (read_slotsfile.s21 + 0)
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
00:9d9d : a9 c8 __ LDA #$c8
00:9d9f : 85 0d __ STA P0 
00:9da1 : a9 4d __ LDA #$4d
00:9da3 : 85 0e __ STA P1 
00:9da5 : a9 50 __ LDA #$50
00:9da7 : 85 11 __ STA P4 
00:9da9 : a9 05 __ LDA #$05
00:9dab : 85 12 __ STA P5 
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
;  28, "/home/xahmol/oscar64/include/string.h"
.s4:
00:9dad : a5 0f __ LDA P2 
00:9daf : a6 12 __ LDX P5 
00:9db1 : f0 0c __ BEQ $9dbf ; (memset.s4 + 18)
00:9db3 : a0 00 __ LDY #$00
00:9db5 : 91 0d __ STA (P0),y 
00:9db7 : c8 __ __ INY
00:9db8 : d0 fb __ BNE $9db5 ; (memset.s4 + 8)
00:9dba : e6 0e __ INC P1 
00:9dbc : ca __ __ DEX
00:9dbd : d0 f6 __ BNE $9db5 ; (memset.s4 + 8)
00:9dbf : a4 11 __ LDY P4 
00:9dc1 : f0 05 __ BEQ $9dc8 ; (memset.s3 + 0)
00:9dc3 : 88 __ __ DEY
00:9dc4 : 91 0d __ STA (P0),y 
00:9dc6 : d0 fb __ BNE $9dc3 ; (memset.s4 + 22)
.s3:
00:9dc8 : 60 __ __ RTS
--------------------------------------------------------------------
strncpy: ; strncpy(u8*,const u8*,i16)->void
;   6, "/home/xahmol/oscar64/include/string.h"
.s4:
00:9dc9 : a6 11 __ LDX P4 ; (n + 0)
.l5:
00:9dcb : 86 1b __ STX ACCU + 0 
00:9dcd : 8a __ __ TXA
00:9dce : 18 __ __ CLC
00:9dcf : 69 ff __ ADC #$ff
00:9dd1 : 85 1d __ STA ACCU + 2 
00:9dd3 : aa __ __ TAX
00:9dd4 : a5 12 __ LDA P5 ; (n + 1)
00:9dd6 : 85 1c __ STA ACCU + 1 
00:9dd8 : 69 ff __ ADC #$ff
00:9dda : 85 12 __ STA P5 ; (n + 1)
00:9ddc : a5 1b __ LDA ACCU + 0 
00:9dde : 05 1c __ ORA ACCU + 1 
00:9de0 : f0 15 __ BEQ $9df7 ; (strncpy.s6 + 0)
.s11:
00:9de2 : a0 00 __ LDY #$00
00:9de4 : b1 0f __ LDA (P2),y ; (src + 0)
00:9de6 : 91 0d __ STA (P0),y ; (dst + 0)
00:9de8 : e6 0f __ INC P2 ; (src + 0)
00:9dea : d0 02 __ BNE $9dee ; (strncpy.s14 + 0)
.s13:
00:9dec : e6 10 __ INC P3 ; (src + 1)
.s14:
00:9dee : e6 0d __ INC P0 ; (dst + 0)
00:9df0 : d0 02 __ BNE $9df4 ; (strncpy.s16 + 0)
.s15:
00:9df2 : e6 0e __ INC P1 ; (dst + 1)
.s16:
00:9df4 : a8 __ __ TAY
00:9df5 : d0 d4 __ BNE $9dcb ; (strncpy.l5 + 0)
.s6:
00:9df7 : a5 1c __ LDA ACCU + 1 
00:9df9 : 30 26 __ BMI $9e21 ; (strncpy.s3 + 0)
.s10:
00:9dfb : d0 06 __ BNE $9e03 ; (strncpy.s12 + 0)
.s9:
00:9dfd : a9 01 __ LDA #$01
00:9dff : c5 1b __ CMP ACCU + 0 
00:9e01 : b0 1e __ BCS $9e21 ; (strncpy.s3 + 0)
.s12:
00:9e03 : a6 12 __ LDX P5 ; (n + 1)
.l7:
00:9e05 : a9 00 __ LDA #$00
00:9e07 : a8 __ __ TAY
00:9e08 : 91 0d __ STA (P0),y ; (dst + 0)
00:9e0a : e6 0d __ INC P0 ; (dst + 0)
00:9e0c : d0 02 __ BNE $9e10 ; (strncpy.s18 + 0)
.s17:
00:9e0e : e6 0e __ INC P1 ; (dst + 1)
.s18:
00:9e10 : 18 __ __ CLC
00:9e11 : a5 1d __ LDA ACCU + 2 
00:9e13 : 69 ff __ ADC #$ff
00:9e15 : 85 1d __ STA ACCU + 2 
00:9e17 : 8a __ __ TXA
00:9e18 : 69 ff __ ADC #$ff
00:9e1a : 30 05 __ BMI $9e21 ; (strncpy.s3 + 0)
.s8:
00:9e1c : aa __ __ TAX
00:9e1d : 05 1d __ ORA ACCU + 2 
00:9e1f : d0 e4 __ BNE $9e05 ; (strncpy.l7 + 0)
.s3:
00:9e21 : 60 __ __ RTS
--------------------------------------------------------------------
00:9e22 : __ __ __ BYT 55 42 4f 4f 54 36 34 20 58 20 4d 4f 4c 00       : UBOOT64 X MOL.
--------------------------------------------------------------------
00:9e30 : __ __ __ BYT 63 52 45 41 54 49 4e 47 20 53 4c 4f 54 20 25 32 : cREATING SLOT %2
00:9e40 : __ __ __ BYT 44 00                                           : D.
--------------------------------------------------------------------
save_slot_to_reu@proxy: ; save_slot_to_reu@proxy
00:9e42 : a5 55 __ LDA $55 
00:9e44 : 85 0d __ STA P0 
--------------------------------------------------------------------
save_slot_to_reu: ; save_slot_to_reu(u8)->void
;   7, "/home/xahmol/git/UBoot64-v2/src/fileio.h"
.s4:
00:9e46 : c9 12 __ CMP #$12
00:9e48 : b0 38 __ BCS $9e82 ; (save_slot_to_reu.s3 + 0)
.s5:
00:9e4a : a2 c8 __ LDX #$c8
00:9e4c : 8e 02 df STX $df02 
00:9e4f : a2 4d __ LDX #$4d
00:9e51 : 8e 03 df STX $df03 
00:9e54 : a2 50 __ LDX #$50
00:9e56 : 86 1b __ STX ACCU + 0 
00:9e58 : a2 05 __ LDX #$05
00:9e5a : 86 1c __ STX ACCU + 1 
00:9e5c : 20 15 36 JSR $3615 
00:9e5f : a5 1b __ LDA ACCU + 0 
00:9e61 : 8d 04 df STA $df04 
00:9e64 : a5 1c __ LDA ACCU + 1 
00:9e66 : 8d 05 df STA $df05 
00:9e69 : a9 00 __ LDA #$00
00:9e6b : 8d 06 df STA $df06 
00:9e6e : a9 50 __ LDA #$50
00:9e70 : 8d 07 df STA $df07 
00:9e73 : a9 05 __ LDA #$05
00:9e75 : 8d 08 df STA $df08 
00:9e78 : a9 00 __ LDA #$00
00:9e7a : 8d 0a df STA $df0a 
00:9e7d : a9 90 __ LDA #$90
00:9e7f : 8d 01 df STA $df01 
.s3:
00:9e82 : 60 __ __ RTS
--------------------------------------------------------------------
write_slotsfile: ; write_slotsfile(u8)->void
;   8, "/home/xahmol/git/UBoot64-v2/src/fileio.h"
.s4:
00:9e83 : 20 5e 14 JSR $145e 
00:9e86 : a9 a6 __ LDA #$a6
00:9e88 : 85 11 __ STA P4 
00:9e8a : a9 3d __ LDA #$3d
00:9e8c : 85 12 __ STA P5 
00:9e8e : 20 04 1e JSR $1e04 
00:9e91 : a9 06 __ LDA #$06
00:9e93 : 85 11 __ STA P4 
00:9e95 : 20 32 3b JSR $3b32 
00:9e98 : a9 00 __ LDA #$00
00:9e9a : 85 4c __ STA T1 + 0 
00:9e9c : 85 4d __ STA T1 + 1 
00:9e9e : 85 4e __ STA T1 + 2 
00:9ea0 : 85 4f __ STA T1 + 3 
00:9ea2 : a9 f4 __ LDA #$f4
00:9ea4 : 85 50 __ STA T2 + 0 
00:9ea6 : a9 01 __ LDA #$01
00:9ea8 : 85 51 __ STA T2 + 1 
00:9eaa : ad ef 7f LDA $7fef ; (sstack + 16)
00:9ead : 85 52 __ STA T4 + 0 
00:9eaf : f0 46 __ BEQ $9ef7 ; (write_slotsfile.l5 + 0)
.l11:
00:9eb1 : ad 58 49 LDA $4958 ; (cfg.verbose + 0)
00:9eb4 : d0 11 __ BNE $9ec7 ; (write_slotsfile.s13 + 0)
.s12:
00:9eb6 : ae 00 49 LDX $4900 ; (verbosecounter + 0)
00:9eb9 : 86 0d __ STX P0 
00:9ebb : e8 __ __ INX
00:9ebc : 8e 00 49 STX $4900 ; (verbosecounter + 0)
00:9ebf : a5 0d __ LDA P0 
00:9ec1 : 20 62 1d JSR $1d62 
00:9ec4 : 4c f7 24 JMP $24f7 
.s13:
00:9ec7 : a5 4c __ LDA T1 + 0 
00:9ec9 : 8d e5 7f STA $7fe5 ; (sstack + 6)
00:9ecc : a5 4d __ LDA T1 + 1 
00:9ece : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:9ed1 : a5 4e __ LDA T1 + 2 
00:9ed3 : 8d e7 7f STA $7fe7 ; (sstack + 8)
00:9ed6 : a5 4f __ LDA T1 + 3 
00:9ed8 : 8d e8 7f STA $7fe8 ; (sstack + 9)
00:9edb : a9 00 __ LDA #$00
00:9edd : 8d 68 49 STA $4968 ; (cw.cx + 0)
00:9ee0 : a9 08 __ LDA #$08
00:9ee2 : 8d 69 49 STA $4969 ; (cw.cy + 0)
00:9ee5 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:9ee8 : 85 18 __ STA P11 
00:9eea : a9 a8 __ LDA #$a8
00:9eec : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:9eef : a9 25 __ LDA #$25
00:9ef1 : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:9ef4 : 20 25 15 JSR $1525 
.l5:
00:9ef7 : a9 00 __ LDA #$00
00:9ef9 : a2 fa __ LDX #$fa
.l7:
00:9efb : ca __ __ DEX
00:9efc : 9d 0b 7d STA $7d0b,x ; (save_buffer[0] + 0)
00:9eff : 9d 05 7e STA $7e05,x ; (save_buffer[0] + 250)
00:9f02 : d0 f7 __ BNE $9efb ; (write_slotsfile.l7 + 0)
.s6:
00:9f04 : 38 __ __ SEC
00:9f05 : a9 a0 __ LDA #$a0
00:9f07 : e5 4c __ SBC T1 + 0 
00:9f09 : a8 __ __ TAY
00:9f0a : a9 5f __ LDA #$5f
00:9f0c : e5 4d __ SBC T1 + 1 
00:9f0e : aa __ __ TAX
00:9f0f : a9 00 __ LDA #$00
00:9f11 : e5 4e __ SBC T1 + 2 
00:9f13 : 85 1d __ STA ACCU + 2 
00:9f15 : a9 00 __ LDA #$00
00:9f17 : e5 4f __ SBC T1 + 3 
00:9f19 : 38 __ __ SEC
00:9f1a : d0 0a __ BNE $9f26 ; (write_slotsfile.s22 + 0)
.s19:
00:9f1c : a5 1d __ LDA ACCU + 2 
00:9f1e : d0 06 __ BNE $9f26 ; (write_slotsfile.s22 + 0)
.s20:
00:9f20 : e0 01 __ CPX #$01
00:9f22 : d0 02 __ BNE $9f26 ; (write_slotsfile.s22 + 0)
.s21:
00:9f24 : c0 f4 __ CPY #$f4
.s22:
00:9f26 : b0 04 __ BCS $9f2c ; (write_slotsfile.s8 + 0)
.s18:
00:9f28 : 86 51 __ STX T2 + 1 
00:9f2a : 84 50 __ STY T2 + 0 
.s8:
00:9f2c : a5 50 __ LDA T2 + 0 
00:9f2e : 85 13 __ STA P6 
00:9f30 : 8d 07 df STA $df07 
00:9f33 : a5 51 __ LDA T2 + 1 
00:9f35 : 85 14 __ STA P7 
00:9f37 : 8d 08 df STA $df08 
00:9f3a : a9 0b __ LDA #$0b
00:9f3c : 85 11 __ STA P4 
00:9f3e : 8d 02 df STA $df02 
00:9f41 : a9 7d __ LDA #$7d
00:9f43 : 85 12 __ STA P5 
00:9f45 : 8d 03 df STA $df03 
00:9f48 : a5 4c __ LDA T1 + 0 
00:9f4a : 8d 04 df STA $df04 
00:9f4d : a5 4d __ LDA T1 + 1 
00:9f4f : 8d 05 df STA $df05 
00:9f52 : a9 00 __ LDA #$00
00:9f54 : 8d 06 df STA $df06 
00:9f57 : 8d 0a df STA $df0a 
00:9f5a : a9 91 __ LDA #$91
00:9f5c : 8d 01 df STA $df01 
00:9f5f : 20 9f 1e JSR $1e9f 
00:9f62 : a9 c2 __ LDA #$c2
00:9f64 : 8d ed 7f STA $7fed ; (sstack + 14)
00:9f67 : a9 25 __ LDA #$25
00:9f69 : 8d ee 7f STA $7fee ; (sstack + 15)
00:9f6c : 20 24 1f JSR $1f24 
00:9f6f : 18 __ __ CLC
00:9f70 : a5 4c __ LDA T1 + 0 
00:9f72 : 69 f4 __ ADC #$f4
00:9f74 : 85 4c __ STA T1 + 0 
00:9f76 : a5 4d __ LDA T1 + 1 
00:9f78 : 69 01 __ ADC #$01
00:9f7a : 85 4d __ STA T1 + 1 
00:9f7c : a5 4e __ LDA T1 + 2 
00:9f7e : 69 00 __ ADC #$00
00:9f80 : 85 4e __ STA T1 + 2 
00:9f82 : a5 4f __ LDA T1 + 3 
00:9f84 : 69 00 __ ADC #$00
00:9f86 : d0 1d __ BNE $9fa5 ; (write_slotsfile.s9 + 0)
.s14:
00:9f88 : 85 4f __ STA T1 + 3 
00:9f8a : a5 4e __ LDA T1 + 2 
00:9f8c : 38 __ __ SEC
00:9f8d : d0 0a __ BNE $9f99 ; (write_slotsfile.s17 + 0)
.s15:
00:9f8f : a5 4d __ LDA T1 + 1 
00:9f91 : c9 5f __ CMP #$5f
00:9f93 : d0 04 __ BNE $9f99 ; (write_slotsfile.s17 + 0)
.s16:
00:9f95 : a5 4c __ LDA T1 + 0 
00:9f97 : c9 a0 __ CMP #$a0
.s17:
00:9f99 : b0 0a __ BCS $9fa5 ; (write_slotsfile.s9 + 0)
.s10:
00:9f9b : a5 52 __ LDA T4 + 0 
00:9f9d : d0 03 __ BNE $9fa2 ; (write_slotsfile.s10 + 7)
00:9f9f : 4c f7 24 JMP $24f7 
00:9fa2 : 4c b1 24 JMP $24b1 
.s9:
00:9fa5 : 4c db 1d JMP $1ddb 
--------------------------------------------------------------------
00:9fa8 : __ __ __ BYT 77 52 49 54 49 4e 47 20 53 4c 4f 54 20 44 41 54 : wRITING SLOT DAT
00:9fb8 : __ __ __ BYT 41 20 41 54 20 25 4c 44 2e 00                   : A AT %LD..
--------------------------------------------------------------------
00:9fc2 : __ __ __ BYT 57 52 49 54 49 4e 47 20 53 4c 4f 54 53 00       : WRITING SLOTS.
--------------------------------------------------------------------
00:9fd0 : __ __ __ BYT 52 45 41 44 49 4e 47 20 53 4c 4f 54 53 00       : READING SLOTS.
--------------------------------------------------------------------
00:9fde : __ __ __ BYT 72 45 41 44 49 4e 47 20 53 4c 4f 54 20 44 41 54 : rEADING SLOT DAT
00:9fee : __ __ __ BYT 41 20 54 4f 20 25 4c 44 2e 00                   : A TO %LD..
--------------------------------------------------------------------
get_slot_from_reu: ; get_slot_from_reu(u8)->void
;   6, "/home/xahmol/git/UBoot64-v2/src/fileio.h"
.s4:
00:9ff8 : c9 12 __ CMP #$12
00:9ffa : b0 38 __ BCS $a034 ; (get_slot_from_reu.s3 + 0)
.s5:
00:9ffc : a2 c8 __ LDX #$c8
00:9ffe : 8e 02 df STX $df02 
00:a001 : a2 4d __ LDX #$4d
00:a003 : 8e 03 df STX $df03 
00:a006 : a2 50 __ LDX #$50
00:a008 : 86 1b __ STX ACCU + 0 
00:a00a : a2 05 __ LDX #$05
00:a00c : 86 1c __ STX ACCU + 1 
00:a00e : 20 15 36 JSR $3615 
00:a011 : a5 1b __ LDA ACCU + 0 
00:a013 : 8d 04 df STA $df04 
00:a016 : a5 1c __ LDA ACCU + 1 
00:a018 : 8d 05 df STA $df05 
00:a01b : a9 00 __ LDA #$00
00:a01d : 8d 06 df STA $df06 
00:a020 : a9 50 __ LDA #$50
00:a022 : 8d 07 df STA $df07 
00:a025 : a9 05 __ LDA #$05
00:a027 : 8d 08 df STA $df08 
00:a02a : a9 00 __ LDA #$00
00:a02c : 8d 0a df STA $df0a 
00:a02f : a9 91 __ LDA #$91
00:a031 : 8d 01 df STA $df01 
.s3:
00:a034 : 60 __ __ RTS
--------------------------------------------------------------------
uii_parse_deviceinfo: ; uii_parse_deviceinfo()->u8
;  47, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
00:a035 : a9 00 __ LDA #$00
00:a037 : 85 10 __ STA P3 
00:a039 : 8d dd 7f STA $7fdd ; (cmd[0] + 0)
00:a03c : a9 02 __ LDA #$02
00:a03e : 85 0f __ STA P2 
00:a040 : a9 04 __ LDA #$04
00:a042 : 8d 8a 3d STA $3d8a 
00:a045 : a9 29 __ LDA #$29
00:a047 : 8d de 7f STA $7fde ; (cmd[0] + 1)
00:a04a : a9 dd __ LDA #$dd
00:a04c : 85 0d __ STA P0 
00:a04e : a9 7f __ LDA #$7f
00:a050 : 85 0e __ STA P1 
00:a052 : 20 53 11 JSR $1153 
00:a055 : 20 ce 11 JSR $11ce 
00:a058 : 20 0c 12 JSR $120c 
00:a05b : 20 18 11 JSR $1118 
00:a05e : ad d7 4b LDA $4bd7 ; (uii_status[0] + 0)
00:a061 : c9 30 __ CMP #$30
00:a063 : d0 0c __ BNE $a071 ; (uii_parse_deviceinfo.s7 + 0)
.s5:
00:a065 : ad d8 4b LDA $4bd8 ; (uii_status[0] + 1)
00:a068 : c9 30 __ CMP #$30
00:a06a : d0 05 __ BNE $a071 ; (uii_parse_deviceinfo.s7 + 0)
.s6:
00:a06c : ad d6 49 LDA $49d6 ; (uii_data[0] + 0)
00:a06f : d0 05 __ BNE $a076 ; (uii_parse_deviceinfo.s8 + 0)
.s7:
00:a071 : a9 00 __ LDA #$00
.s3:
00:a073 : 85 1b __ STA ACCU + 0 
00:a075 : 60 __ __ RTS
.s8:
00:a076 : ac d7 49 LDY $49d7 ; (uii_data[0] + 1)
00:a079 : c0 0f __ CPY #$0f
00:a07b : 90 07 __ BCC $a084 ; (uii_parse_deviceinfo.s15 + 0)
.s9:
00:a07d : a9 02 __ LDA #$02
.s10:
00:a07f : 85 1b __ STA ACCU + 0 
00:a081 : 98 __ __ TYA
00:a082 : b0 3a __ BCS $a0be ; (uii_parse_deviceinfo.s18 + 0)
.s15:
00:a084 : 8c e5 4c STY $4ce5 ; (uii_devinfo[0].type + 0)
00:a087 : a9 01 __ LDA #$01
00:a089 : 8d e4 4c STA $4ce4 ; (uii_devinfo[0].exist + 0)
00:a08c : ad d9 49 LDA $49d9 ; (uii_data[0] + 3)
00:a08f : 8d e6 4c STA $4ce6 ; (uii_devinfo[0].power + 0)
00:a092 : ad d8 49 LDA $49d8 ; (uii_data[0] + 2)
00:a095 : 8d e7 4c STA $4ce7 ; (uii_devinfo[0].id + 0)
00:a098 : ac da 49 LDY $49da ; (uii_data[0] + 4)
00:a09b : c0 0f __ CPY #$0f
00:a09d : 90 04 __ BCC $a0a3 ; (uii_parse_deviceinfo.s17 + 0)
.s16:
00:a09f : a9 05 __ LDA #$05
00:a0a1 : b0 dc __ BCS $a07f ; (uii_parse_deviceinfo.s10 + 0)
.s17:
00:a0a3 : 8c e9 4c STY $4ce9 ; (uii_devinfo[0] + 5)
00:a0a6 : a9 01 __ LDA #$01
00:a0a8 : 8d e8 4c STA $4ce8 ; (uii_devinfo[0] + 4)
00:a0ab : ad dc 49 LDA $49dc ; (uii_data[0] + 6)
00:a0ae : 8d ea 4c STA $4cea ; (uii_devinfo[0] + 6)
00:a0b1 : ad db 49 LDA $49db ; (uii_data[0] + 5)
00:a0b4 : 8d eb 4c STA $4ceb ; (uii_devinfo[0] + 7)
00:a0b7 : a9 08 __ LDA #$08
00:a0b9 : 85 1b __ STA ACCU + 0 
00:a0bb : ad dd 49 LDA $49dd ; (uii_data[0] + 7)
.s18:
00:a0be : c9 0f __ CMP #$0f
00:a0c0 : d0 20 __ BNE $a0e2 ; (uii_parse_deviceinfo.s11 + 0)
.s14:
00:a0c2 : a9 01 __ LDA #$01
00:a0c4 : 8d ec 4c STA $4cec ; (uii_devinfo[0] + 8)
00:a0c7 : a9 0f __ LDA #$0f
00:a0c9 : 8d ed 4c STA $4ced ; (uii_devinfo[0] + 9)
00:a0cc : a6 1b __ LDX ACCU + 0 
00:a0ce : bd d7 49 LDA $49d7,x ; (uii_data[0] + 1)
00:a0d1 : 8d ee 4c STA $4cee ; (uii_devinfo[0] + 10)
00:a0d4 : bd d6 49 LDA $49d6,x ; (uii_data[0] + 0)
00:a0d7 : 8d ef 4c STA $4cef ; (uii_devinfo[0] + 11)
00:a0da : bd d8 49 LDA $49d8,x ; (uii_data[0] + 2)
00:a0dd : e8 __ __ INX
00:a0de : e8 __ __ INX
00:a0df : e8 __ __ INX
00:a0e0 : 86 1b __ STX ACCU + 0 
.s11:
00:a0e2 : c9 50 __ CMP #$50
00:a0e4 : d0 18 __ BNE $a0fe ; (uii_parse_deviceinfo.s12 + 0)
.s13:
00:a0e6 : a9 01 __ LDA #$01
00:a0e8 : 8d f0 4c STA $4cf0 ; (uii_devinfo[0] + 12)
00:a0eb : a9 50 __ LDA #$50
00:a0ed : 8d f1 4c STA $4cf1 ; (uii_devinfo[0] + 13)
00:a0f0 : a6 1b __ LDX ACCU + 0 
00:a0f2 : bd d7 49 LDA $49d7,x ; (uii_data[0] + 1)
00:a0f5 : 8d f2 4c STA $4cf2 ; (uii_devinfo[0] + 14)
00:a0f8 : bd d6 49 LDA $49d6,x ; (uii_data[0] + 0)
00:a0fb : 8d f3 4c STA $4cf3 ; (uii_devinfo[0] + 15)
.s12:
00:a0fe : a9 01 __ LDA #$01
00:a100 : 4c 73 26 JMP $2673 
--------------------------------------------------------------------
00:a103 : __ __ __ BYT 67 45 54 54 49 4e 47 20 44 45 56 49 43 45 20 49 : gETTING DEVICE I
00:a113 : __ __ __ BYT 4e 46 4f 20 46 41 49 4c 53 2e 00                : NFO FAILS..
--------------------------------------------------------------------
00:a11e : __ __ __ BYT 0a 72 45 43 4f 47 4e 49 53 45 44 20 75 4c 54 49 : .rECOGNISED uLTI
00:a12e : __ __ __ BYT 4d 41 54 45 20 44 45 56 49 43 45 53 3a 0a 00    : MATE DEVICES:..
--------------------------------------------------------------------
00:a13d : __ __ __ BYT 64 52 49 56 45 20 61 3a 20 69 64 20 25 32 44 20 : dRIVE a: id %2D 
00:a14d : __ __ __ BYT 70 4f 57 20 25 53 2c 20 25 53 0a 00             : pOW %S, %S..
--------------------------------------------------------------------
00:a159 : __ __ __ BYT 6f 46 46 00                                     : oFF.
--------------------------------------------------------------------
00:a15d : __ __ __ BYT 31 35 34 31 00                                  : 1541.
--------------------------------------------------------------------
00:a162 : __ __ __ BYT 31 35 37 31 00                                  : 1571.
--------------------------------------------------------------------
00:a167 : __ __ __ BYT 31 35 38 31 00                                  : 1581.
--------------------------------------------------------------------
00:a16c : __ __ __ BYT 53 6f 66 74 49 45 43 00                         : SoftIEC.
--------------------------------------------------------------------
00:a174 : __ __ __ BYT 50 72 69 6e 74 65 72 00                         : Printer.
--------------------------------------------------------------------
00:a17c : __ __ __ BYT 64 52 49 56 45 20 62 3a 20 69 64 20 25 32 44 20 : dRIVE b: id %2D 
00:a18c : __ __ __ BYT 70 4f 57 20 25 53 2c 20 25 53 0a 00             : pOW %S, %S..
--------------------------------------------------------------------
00:a198 : __ __ __ BYT 73 4f 46 54 69 65 63 3a 20 69 64 20 25 32 44 20 : sOFTiec: id %2D 
00:a1a8 : __ __ __ BYT 70 4f 57 20 25 53 0a 00                         : pOW %S..
--------------------------------------------------------------------
00:a1b0 : __ __ __ BYT 70 52 49 4e 54 45 52 3a 20 69 64 20 25 32 44 20 : pRINTER: id %2D 
00:a1c0 : __ __ __ BYT 70 4f 57 20 25 53 0a 00                         : pOW %S..
--------------------------------------------------------------------
00:a1c8 : __ __ __ BYT 69 64 53 20 4e 45 45 44 49 4e 47 20 4d 41 4e 55 : idS NEEDING MANU
00:a1d8 : __ __ __ BYT 41 4c 20 50 4f 57 45 52 20 53 57 49 54 43 48 49 : AL POWER SWITCHI
00:a1e8 : __ __ __ BYT 4e 47 3a 20 25 53 0a 00                         : NG: %S..
--------------------------------------------------------------------
CheckActiveIECdevices: ; CheckActiveIECdevices()->u8
;  17, "/home/xahmol/git/UBoot64-v2/src/core.h"
.s4:
00:a1f0 : a9 00 __ LDA #$00
00:a1f2 : a2 17 __ LDX #$17
.l5:
00:a1f4 : ca __ __ DEX
00:a1f5 : 9d 18 53 STA $5318,x ; (iec_devices[0] + 0)
00:a1f8 : d0 fa __ BNE $a1f4 ; (CheckActiveIECdevices.l5 + 0)
.s6:
00:a1fa : 20 35 26 JSR $2635 
00:a1fd : a9 00 __ LDA #$00
00:a1ff : 85 50 __ STA T5 + 0 
00:a201 : a5 1b __ LDA ACCU + 0 
00:a203 : d0 0d __ BNE $a212 ; (CheckActiveIECdevices.s8 + 0)
.s7:
00:a205 : a9 03 __ LDA #$03
00:a207 : 8d eb 7f STA $7feb ; (sstack + 12)
00:a20a : a9 27 __ LDA #$27
00:a20c : 8d ec 7f STA $7fec ; (sstack + 13)
00:a20f : 20 01 15 JSR $1501 
.s8:
00:a212 : a9 00 __ LDA #$00
00:a214 : 85 4d __ STA T1 + 0 
00:a216 : 85 4c __ STA T0 + 0 
00:a218 : a9 08 __ LDA #$08
00:a21a : 85 4e __ STA T2 + 0 
.l9:
00:a21c : a5 4e __ LDA T2 + 0 
00:a21e : 4c 23 28 JMP $2823 
.s15:
00:a221 : a9 04 __ LDA #$04
.l10:
00:a223 : 85 4f __ STA T3 + 0 
00:a225 : 20 68 28 JSR $2868 
00:a228 : aa __ __ TAX
00:a229 : d0 2c __ BNE $a257 ; (CheckActiveIECdevices.s18 + 0)
.s11:
00:a22b : a5 4f __ LDA T3 + 0 
00:a22d : 20 9d 28 JSR $289d 
00:a230 : aa __ __ TAX
00:a231 : f0 0f __ BEQ $a242 ; (CheckActiveIECdevices.s12 + 0)
.s16:
00:a233 : a9 01 __ LDA #$01
00:a235 : a6 4d __ LDX T1 + 0 
00:a237 : 9d 18 53 STA $5318,x ; (iec_devices[0] + 0)
00:a23a : a5 50 __ LDA T5 + 0 
00:a23c : f0 02 __ BEQ $a240 ; (CheckActiveIECdevices.s20 + 0)
.s21:
00:a23e : a9 01 __ LDA #$01
.s20:
00:a240 : 85 4c __ STA T0 + 0 
.s12:
00:a242 : e6 50 __ INC T5 + 0 
00:a244 : a5 50 __ LDA T5 + 0 
00:a246 : c9 17 __ CMP #$17
00:a248 : b0 0a __ BCS $a254 ; (CheckActiveIECdevices.s13 + 0)
.s14:
00:a24a : e6 4e __ INC T2 + 0 
00:a24c : e6 4d __ INC T1 + 0 
00:a24e : c9 16 __ CMP #$16
00:a250 : f0 cf __ BEQ $a221 ; (CheckActiveIECdevices.s15 + 0)
00:a252 : d0 c8 __ BNE $a21c ; (CheckActiveIECdevices.l9 + 0)
.s13:
00:a254 : a5 4c __ LDA T0 + 0 
.s3:
00:a256 : 60 __ __ RTS
.s18:
00:a257 : c9 02 __ CMP #$02
00:a259 : 90 e7 __ BCC $a242 ; (CheckActiveIECdevices.s12 + 0)
.s19:
00:a25b : a6 4d __ LDX T1 + 0 
00:a25d : 9d 18 53 STA $5318,x ; (iec_devices[0] + 0)
00:a260 : c9 03 __ CMP #$03
00:a262 : f0 da __ BEQ $a23e ; (CheckActiveIECdevices.s21 + 0)
.s17:
00:a264 : a9 00 __ LDA #$00
00:a266 : f0 d8 __ BEQ $a240 ; (CheckActiveIECdevices.s20 + 0)
--------------------------------------------------------------------
CheckIfUltimateOnID: ; CheckIfUltimateOnID(u8)->u8
;  16, "/home/xahmol/git/UBoot64-v2/src/core.h"
.s4:
00:a268 : 85 1b __ STA ACCU + 0 
00:a26a : a9 00 __ LDA #$00
00:a26c : a8 __ __ TAY
.l5:
00:a26d : 0a __ __ ASL
00:a26e : 0a __ __ ASL
00:a26f : aa __ __ TAX
00:a270 : a5 1b __ LDA ACCU + 0 
00:a272 : dd e7 4c CMP $4ce7,x ; (uii_devinfo[0].id + 0)
00:a275 : f0 09 __ BEQ $a280 ; (CheckIfUltimateOnID.s8 + 0)
.s6:
00:a277 : c8 __ __ INY
00:a278 : 98 __ __ TYA
00:a279 : c0 04 __ CPY #$04
00:a27b : 90 f0 __ BCC $a26d ; (CheckIfUltimateOnID.l5 + 0)
.s7:
00:a27d : a9 00 __ LDA #$00
.s3:
00:a27f : 60 __ __ RTS
.s8:
00:a280 : bd e5 4c LDA $4ce5,x ; (uii_devinfo[0].type + 0)
00:a283 : c9 0f __ CMP #$0f
00:a285 : b0 04 __ BCS $a28b ; (CheckIfUltimateOnID.s9 + 0)
.s11:
00:a287 : a9 04 __ LDA #$04
00:a289 : 90 02 __ BCC $a28d ; (CheckIfUltimateOnID.s10 + 0)
.s9:
00:a28b : a9 00 __ LDA #$00
.s10:
00:a28d : 85 1b __ STA ACCU + 0 
00:a28f : bd e6 4c LDA $4ce6,x ; (uii_devinfo[0].power + 0)
00:a292 : f0 04 __ BEQ $a298 ; (CheckIfUltimateOnID.s12 + 0)
.s13:
00:a294 : a9 03 __ LDA #$03
00:a296 : d0 02 __ BNE $a29a ; (CheckIfUltimateOnID.s14 + 0)
.s12:
00:a298 : a9 01 __ LDA #$01
.s14:
00:a29a : 05 1b __ ORA ACCU + 0 
00:a29c : 60 __ __ RTS
--------------------------------------------------------------------
iec_present: ; iec_present(u8)->u8
;  15, "/home/xahmol/git/UBoot64-v2/src/core.h"
.s4:
00:a29d : 85 0d __ STA P0 
00:a29f : a5 0d __ LDA P0 
00:a2a1 : a0 00 __ LDY #$00
00:a2a3 : 84 90 __ STY $90 
00:a2a5 : 20 b1 ff JSR $ffb1 
00:a2a8 : a9 ff __ LDA #$ff
00:a2aa : 20 93 ff JSR $ff93 
00:a2ad : a5 90 __ LDA $90 
00:a2af : 10 08 __ BPL $a2b9 ; (iec_present.s4 + 28)
00:a2b1 : 20 ae ff JSR $ffae 
00:a2b4 : a9 00 __ LDA #$00
00:a2b6 : 85 1b __ STA ACCU + 0 
00:a2b8 : 60 __ __ RTS
00:a2b9 : 20 ae ff JSR $ffae 
00:a2bc : a9 01 __ LDA #$01
00:a2be : 85 1b __ STA ACCU + 0 
.s3:
00:a2c0 : a5 1b __ LDA ACCU + 0 
00:a2c2 : 60 __ __ RTS
--------------------------------------------------------------------
00:a2c3 : __ __ __ BYT 79 45 53 00                                     : yES.
--------------------------------------------------------------------
00:a2c7 : __ __ __ BYT 6e 4f 00                                        : nO.
--------------------------------------------------------------------
00:a2ca : __ __ __ BYT 61 43 54 49 56 45 20 69 65 63 20 69 64 53 3a 20 : aCTIVE iec idS: 
00:a2da : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
00:a2db : __ __ __ BYT 25 30 32 44 20 00                               : %02D .
--------------------------------------------------------------------
uii_udpconnect: ; uii_udpconnect(u8*,u16)->u8
;  22, "/home/xahmol/git/UBoot64-v2/include/ultimate_network_lib.h"
.s4:
00:a2e1 : a9 03 __ LDA #$03
00:a2e3 : 85 0d __ STA P0 
00:a2e5 : 20 30 3d JSR $3d30 
00:a2e8 : a9 49 __ LDA #$49
00:a2ea : 85 0e __ STA P1 
00:a2ec : 18 __ __ CLC
00:a2ed : a5 1b __ LDA ACCU + 0 
00:a2ef : 69 05 __ ADC #$05
00:a2f1 : 85 1b __ STA ACCU + 0 
00:a2f3 : 90 02 __ BCC $a2f7 ; (uii_udpconnect.s10 + 0)
.s9:
00:a2f5 : e6 1c __ INC ACCU + 1 
.s10:
00:a2f7 : 20 a0 38 JSR $38a0 
00:a2fa : a5 1b __ LDA ACCU + 0 
00:a2fc : 85 45 __ STA T1 + 0 
00:a2fe : a5 1c __ LDA ACCU + 1 
00:a300 : 85 46 __ STA T1 + 1 
00:a302 : a9 00 __ LDA #$00
00:a304 : a8 __ __ TAY
00:a305 : 91 1b __ STA (ACCU + 0),y 
00:a307 : a9 08 __ LDA #$08
00:a309 : c8 __ __ INY
00:a30a : 91 1b __ STA (ACCU + 0),y 
00:a30c : a9 7b __ LDA #$7b
00:a30e : c8 __ __ INY
00:a30f : 91 1b __ STA (ACCU + 0),y 
00:a311 : a9 00 __ LDA #$00
00:a313 : c8 __ __ INY
00:a314 : 91 1b __ STA (ACCU + 0),y 
00:a316 : 20 ad 10 JSR $10ad 
00:a319 : ad 8a 3d LDA $3d8a 
00:a31c : 85 48 __ STA T5 + 0 
00:a31e : a5 1b __ LDA ACCU + 0 
00:a320 : 05 1c __ ORA ACCU + 1 
00:a322 : f0 23 __ BEQ $a347 ; (uii_udpconnect.s5 + 0)
.s6:
00:a324 : a9 00 __ LDA #$00
00:a326 : 85 47 __ STA T2 + 0 
.l8:
00:a328 : a9 49 __ LDA #$49
00:a32a : 85 0e __ STA P1 
00:a32c : a6 47 __ LDX T2 + 0 
00:a32e : 8a __ __ TXA
00:a32f : 18 __ __ CLC
00:a330 : 69 04 __ ADC #$04
00:a332 : a8 __ __ TAY
00:a333 : bd 03 49 LDA $4903,x ; (cfg.host[0] + 0)
00:a336 : 91 45 __ STA (T1 + 0),y 
00:a338 : 20 ad 10 JSR $10ad 
00:a33b : e6 47 __ INC T2 + 0 
00:a33d : a5 1c __ LDA ACCU + 1 
00:a33f : d0 e7 __ BNE $a328 ; (uii_udpconnect.l8 + 0)
.s7:
00:a341 : a5 47 __ LDA T2 + 0 
00:a343 : c5 1b __ CMP ACCU + 0 
00:a345 : 90 e1 __ BCC $a328 ; (uii_udpconnect.l8 + 0)
.s5:
00:a347 : 20 30 3d JSR $3d30 
00:a34a : a9 49 __ LDA #$49
00:a34c : 85 0e __ STA P1 
00:a34e : a9 03 __ LDA #$03
00:a350 : 8d 8a 3d STA $3d8a 
00:a353 : 18 __ __ CLC
00:a354 : a5 45 __ LDA T1 + 0 
00:a356 : 65 1b __ ADC ACCU + 0 
00:a358 : 85 43 __ STA T0 + 0 
00:a35a : a5 46 __ LDA T1 + 1 
00:a35c : 65 1c __ ADC ACCU + 1 
00:a35e : 85 44 __ STA T0 + 1 
00:a360 : a9 00 __ LDA #$00
00:a362 : a0 04 __ LDY #$04
00:a364 : 91 43 __ STA (T0 + 0),y 
00:a366 : 20 ad 10 JSR $10ad 
00:a369 : a5 45 __ LDA T1 + 0 
00:a36b : 85 0d __ STA P0 
00:a36d : a5 46 __ LDA T1 + 1 
00:a36f : 85 0e __ STA P1 
00:a371 : 18 __ __ CLC
00:a372 : a5 1b __ LDA ACCU + 0 
00:a374 : 69 05 __ ADC #$05
00:a376 : 85 0f __ STA P2 
00:a378 : a5 1c __ LDA ACCU + 1 
00:a37a : 69 00 __ ADC #$00
00:a37c : 85 10 __ STA P3 
00:a37e : 20 53 11 JSR $1153 
00:a381 : 20 98 39 JSR $3998 
00:a384 : 20 ce 11 JSR $11ce 
00:a387 : 20 0c 12 JSR $120c 
00:a38a : 20 18 11 JSR $1118 
00:a38d : a5 48 __ LDA T5 + 0 
00:a38f : 8d 8a 3d STA $3d8a 
00:a392 : ad d6 49 LDA $49d6 ; (uii_data[0] + 0)
.s3:
00:a395 : 60 __ __ RTS
--------------------------------------------------------------------
uii_socketclose: ; uii_socketclose(u8)->void
;  23, "/home/xahmol/git/UBoot64-v2/include/ultimate_network_lib.h"
.s4:
00:a396 : a9 00 __ LDA #$00
00:a398 : 85 10 __ STA P3 
00:a39a : 8d dc 7f STA $7fdc ; (cmd[0] + 0)
00:a39d : a9 09 __ LDA #$09
00:a39f : 8d dd 7f STA $7fdd ; (cmd[0] + 1)
00:a3a2 : a5 11 __ LDA P4 ; (socketid + 0)
00:a3a4 : 8d de 7f STA $7fde ; (cmd[0] + 2)
00:a3a7 : ad 8a 3d LDA $3d8a 
00:a3aa : 85 45 __ STA T1 + 0 
00:a3ac : a9 03 __ LDA #$03
00:a3ae : 85 0f __ STA P2 
00:a3b0 : 8d 8a 3d STA $3d8a 
00:a3b3 : a9 dc __ LDA #$dc
00:a3b5 : 85 0d __ STA P0 
00:a3b7 : a9 7f __ LDA #$7f
00:a3b9 : 85 0e __ STA P1 
00:a3bb : 20 53 11 JSR $1153 
00:a3be : 20 ce 11 JSR $11ce 
00:a3c1 : 20 0c 12 JSR $120c 
00:a3c4 : 20 18 11 JSR $1118 
00:a3c7 : a5 45 __ LDA T1 + 0 
00:a3c9 : 8d 8a 3d STA $3d8a 
.s3:
00:a3cc : 60 __ __ RTS
--------------------------------------------------------------------
uii_socketread: ; uii_socketread(u8,u16)->void
;  24, "/home/xahmol/git/UBoot64-v2/include/ultimate_network_lib.h"
.s4:
00:a3cd : a9 00 __ LDA #$00
00:a3cf : 85 10 __ STA P3 
00:a3d1 : 8d da 7f STA $7fda ; (cmd[0] + 0)
00:a3d4 : 8d dc 7f STA $7fdc ; (cmd[0] + 2)
00:a3d7 : 8d dd 7f STA $7fdd ; (cmd[0] + 3)
00:a3da : 8d de 7f STA $7fde ; (cmd[0] + 4)
00:a3dd : a9 05 __ LDA #$05
00:a3df : 85 0f __ STA P2 
00:a3e1 : a9 10 __ LDA #$10
00:a3e3 : 8d db 7f STA $7fdb ; (cmd[0] + 1)
00:a3e6 : a5 11 __ LDA P4 ; (socketid + 0)
00:a3e8 : 8d dc 7f STA $7fdc ; (cmd[0] + 2)
00:a3eb : a9 32 __ LDA #$32
00:a3ed : 8d dd 7f STA $7fdd ; (cmd[0] + 3)
00:a3f0 : a9 00 __ LDA #$00
00:a3f2 : 8d de 7f STA $7fde ; (cmd[0] + 4)
00:a3f5 : ad 8a 3d LDA $3d8a 
00:a3f8 : 85 45 __ STA T1 + 0 
00:a3fa : a9 03 __ LDA #$03
00:a3fc : 8d 8a 3d STA $3d8a 
00:a3ff : a9 da __ LDA #$da
00:a401 : 85 0d __ STA P0 
00:a403 : a9 7f __ LDA #$7f
00:a405 : 85 0e __ STA P1 
00:a407 : 20 53 11 JSR $1153 
00:a40a : 20 ce 11 JSR $11ce 
00:a40d : 20 0c 12 JSR $120c 
00:a410 : 20 18 11 JSR $1118 
00:a413 : a5 45 __ LDA T1 + 0 
00:a415 : 8d 8a 3d STA $3d8a 
.s3:
00:a418 : 60 __ __ RTS
--------------------------------------------------------------------
uii_set_time: ; uii_set_time(u8*)->void
;  22, "/home/xahmol/git/UBoot64-v2/include/ultimate_time_lib.h"
.s4:
00:a419 : a9 00 __ LDA #$00
00:a41b : 85 1c __ STA ACCU + 1 
00:a41d : 85 10 __ STA P3 
00:a41f : a9 08 __ LDA #$08
00:a421 : 85 0f __ STA P2 
00:a423 : 85 1b __ STA ACCU + 0 
00:a425 : a9 01 __ LDA #$01
00:a427 : 8d 8a 3d STA $3d8a 
00:a42a : 20 a0 38 JSR $38a0 
00:a42d : a5 1b __ LDA ACCU + 0 
00:a42f : 85 0d __ STA P0 
00:a431 : a5 1c __ LDA ACCU + 1 
00:a433 : 85 0e __ STA P1 
00:a435 : a9 00 __ LDA #$00
00:a437 : a8 __ __ TAY
00:a438 : 91 0d __ STA (P0),y 
00:a43a : a9 27 __ LDA #$27
00:a43c : c8 __ __ INY
00:a43d : 91 0d __ STA (P0),y 
00:a43f : 88 __ __ DEY
00:a440 : b1 11 __ LDA (P4),y ; (data + 0)
00:a442 : a0 02 __ LDY #$02
00:a444 : 91 0d __ STA (P0),y 
00:a446 : 88 __ __ DEY
00:a447 : b1 11 __ LDA (P4),y ; (data + 0)
00:a449 : a0 03 __ LDY #$03
00:a44b : 91 0d __ STA (P0),y 
00:a44d : 88 __ __ DEY
00:a44e : b1 11 __ LDA (P4),y ; (data + 0)
00:a450 : a0 04 __ LDY #$04
00:a452 : 91 0d __ STA (P0),y 
00:a454 : 88 __ __ DEY
00:a455 : b1 11 __ LDA (P4),y ; (data + 0)
00:a457 : a0 05 __ LDY #$05
00:a459 : 91 0d __ STA (P0),y 
00:a45b : 88 __ __ DEY
00:a45c : b1 11 __ LDA (P4),y ; (data + 0)
00:a45e : a0 06 __ LDY #$06
00:a460 : 91 0d __ STA (P0),y 
00:a462 : 88 __ __ DEY
00:a463 : b1 11 __ LDA (P4),y ; (data + 0)
00:a465 : a0 07 __ LDY #$07
00:a467 : 91 0d __ STA (P0),y 
00:a469 : 20 53 11 JSR $1153 
00:a46c : 20 98 39 JSR $3998 
00:a46f : 20 0c 12 JSR $120c 
00:a472 : 4c 18 11 JMP $1118 
--------------------------------------------------------------------
uii_enable_drive_a: ; uii_enable_drive_a()->void
;  51, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
00:a475 : a9 00 __ LDA #$00
00:a477 : 85 10 __ STA P3 
00:a479 : 8d dd 7f STA $7fdd ; (cmd[0] + 0)
00:a47c : a9 02 __ LDA #$02
00:a47e : 85 0f __ STA P2 
00:a480 : a9 04 __ LDA #$04
00:a482 : 8d 8a 3d STA $3d8a 
00:a485 : a9 30 __ LDA #$30
00:a487 : 8d de 7f STA $7fde ; (cmd[0] + 1)
00:a48a : a9 dd __ LDA #$dd
00:a48c : 85 0d __ STA P0 
00:a48e : a9 7f __ LDA #$7f
00:a490 : 85 0e __ STA P1 
00:a492 : 20 53 11 JSR $1153 
00:a495 : 20 ce 11 JSR $11ce 
00:a498 : 20 0c 12 JSR $120c 
00:a49b : 4c 18 11 JMP $1118 
--------------------------------------------------------------------
uii_disable_drive_a: ; uii_disable_drive_a()->void
;  52, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
00:a49e : a9 00 __ LDA #$00
00:a4a0 : 85 10 __ STA P3 
00:a4a2 : 8d dd 7f STA $7fdd ; (cmd[0] + 0)
00:a4a5 : a9 02 __ LDA #$02
00:a4a7 : 85 0f __ STA P2 
00:a4a9 : a9 04 __ LDA #$04
00:a4ab : 8d 8a 3d STA $3d8a 
00:a4ae : a9 31 __ LDA #$31
00:a4b0 : 8d de 7f STA $7fde ; (cmd[0] + 1)
00:a4b3 : a9 dd __ LDA #$dd
00:a4b5 : 85 0d __ STA P0 
00:a4b7 : a9 7f __ LDA #$7f
00:a4b9 : 85 0e __ STA P1 
00:a4bb : 20 53 11 JSR $1153 
00:a4be : 20 ce 11 JSR $11ce 
00:a4c1 : 20 0c 12 JSR $120c 
00:a4c4 : 4c 18 11 JMP $1118 
--------------------------------------------------------------------
uii_disable_drive_b: ; uii_disable_drive_b()->void
;  54, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
00:a4c7 : a9 00 __ LDA #$00
00:a4c9 : 85 10 __ STA P3 
00:a4cb : 8d dd 7f STA $7fdd ; (cmd[0] + 0)
00:a4ce : a9 02 __ LDA #$02
00:a4d0 : 85 0f __ STA P2 
00:a4d2 : a9 04 __ LDA #$04
00:a4d4 : 8d 8a 3d STA $3d8a 
00:a4d7 : a9 33 __ LDA #$33
00:a4d9 : 8d de 7f STA $7fde ; (cmd[0] + 1)
00:a4dc : a9 dd __ LDA #$dd
00:a4de : 85 0d __ STA P0 
00:a4e0 : a9 7f __ LDA #$7f
00:a4e2 : 85 0e __ STA P1 
00:a4e4 : 20 53 11 JSR $1153 
00:a4e7 : 20 ce 11 JSR $11ce 
00:a4ea : 20 0c 12 JSR $120c 
00:a4ed : 4c 18 11 JMP $1118 
--------------------------------------------------------------------
uii_mount_disk@proxy: ; uii_mount_disk@proxy
00:a4f0 : a5 53 __ LDA $53 
00:a4f2 : 85 11 __ STA P4 
--------------------------------------------------------------------
uii_mount_disk: ; uii_mount_disk(u8,u8*)->void
;  28, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
00:a4f4 : 20 3e 3d JSR $3d3e 
00:a4f7 : 18 __ __ CLC
00:a4f8 : a5 1b __ LDA ACCU + 0 
00:a4fa : 69 03 __ ADC #$03
00:a4fc : 85 1b __ STA ACCU + 0 
00:a4fe : 90 02 __ BCC $a502 ; (uii_mount_disk.s11 + 0)
.s10:
00:a500 : e6 1c __ INC ACCU + 1 
.s11:
00:a502 : 20 a0 38 JSR $38a0 
00:a505 : a5 1c __ LDA ACCU + 1 
00:a507 : 05 1b __ ORA ACCU + 0 
00:a509 : d0 01 __ BNE $a50c ; (uii_mount_disk.s5 + 0)
.s3:
00:a50b : 60 __ __ RTS
.s5:
00:a50c : a5 1c __ LDA ACCU + 1 
00:a50e : 85 46 __ STA T2 + 1 
00:a510 : a5 1b __ LDA ACCU + 0 
00:a512 : 85 45 __ STA T2 + 0 
00:a514 : a9 00 __ LDA #$00
00:a516 : a8 __ __ TAY
00:a517 : 91 1b __ STA (ACCU + 0),y 
00:a519 : a9 23 __ LDA #$23
00:a51b : c8 __ __ INY
00:a51c : 91 1b __ STA (ACCU + 0),y 
00:a51e : a5 11 __ LDA P4 ; (id + 0)
00:a520 : c8 __ __ INY
00:a521 : 91 1b __ STA (ACCU + 0),y 
00:a523 : a9 00 __ LDA #$00
00:a525 : 85 47 __ STA T3 + 0 
00:a527 : 85 48 __ STA T3 + 1 
.l12:
00:a529 : 20 37 3d JSR $3d37 
00:a52c : a5 48 __ LDA T3 + 1 
00:a52e : c5 1c __ CMP ACCU + 1 
00:a530 : d0 5f __ BNE $a591 ; (uii_mount_disk.s9 + 0)
.s8:
00:a532 : a5 47 __ LDA T3 + 0 
00:a534 : c5 1b __ CMP ACCU + 0 
00:a536 : 90 30 __ BCC $a568 ; (uii_mount_disk.s7 + 0)
.s6:
00:a538 : a5 13 __ LDA P6 ; (filename + 1)
00:a53a : 85 0e __ STA P1 
00:a53c : a9 01 __ LDA #$01
00:a53e : 8d 8a 3d STA $3d8a 
00:a541 : 20 ad 10 JSR $10ad 
00:a544 : a5 45 __ LDA T2 + 0 
00:a546 : 85 0d __ STA P0 
00:a548 : a5 46 __ LDA T2 + 1 
00:a54a : 85 0e __ STA P1 
00:a54c : 18 __ __ CLC
00:a54d : a5 1b __ LDA ACCU + 0 
00:a54f : 69 03 __ ADC #$03
00:a551 : 85 0f __ STA P2 
00:a553 : a5 1c __ LDA ACCU + 1 
00:a555 : 69 00 __ ADC #$00
00:a557 : 85 10 __ STA P3 
00:a559 : 20 53 11 JSR $1153 
00:a55c : 20 98 39 JSR $3998 
00:a55f : 20 ce 11 JSR $11ce 
00:a562 : 20 0c 12 JSR $120c 
00:a565 : 4c 18 11 JMP $1118 
.s7:
00:a568 : 85 43 __ STA T0 + 0 
00:a56a : 18 __ __ CLC
00:a56b : a5 13 __ LDA P6 ; (filename + 1)
00:a56d : 65 48 __ ADC T3 + 1 
00:a56f : 85 44 __ STA T0 + 1 
00:a571 : a4 12 __ LDY P5 ; (filename + 0)
00:a573 : b1 43 __ LDA (T0 + 0),y 
00:a575 : aa __ __ TAX
00:a576 : 18 __ __ CLC
00:a577 : a5 45 __ LDA T2 + 0 
00:a579 : 65 47 __ ADC T3 + 0 
00:a57b : 85 43 __ STA T0 + 0 
00:a57d : a5 46 __ LDA T2 + 1 
00:a57f : 65 48 __ ADC T3 + 1 
00:a581 : 85 44 __ STA T0 + 1 
00:a583 : 8a __ __ TXA
00:a584 : a0 03 __ LDY #$03
00:a586 : 91 43 __ STA (T0 + 0),y 
00:a588 : e6 47 __ INC T3 + 0 
00:a58a : d0 9d __ BNE $a529 ; (uii_mount_disk.l12 + 0)
.s13:
00:a58c : e6 48 __ INC T3 + 1 
00:a58e : 4c 29 2b JMP $2b29 
.s9:
00:a591 : b0 a5 __ BCS $a538 ; (uii_mount_disk.s6 + 0)
.s14:
00:a593 : a5 47 __ LDA T3 + 0 
00:a595 : 90 d1 __ BCC $a568 ; (uii_mount_disk.s7 + 0)
--------------------------------------------------------------------
uii_load_reu: ; uii_load_reu(u8)->void
;  45, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
00:a597 : a9 0a __ LDA #$0a
00:a599 : 85 0f __ STA P2 
00:a59b : a9 00 __ LDA #$00
00:a59d : 85 10 __ STA P3 
00:a59f : a9 01 __ LDA #$01
00:a5a1 : 8d 8a 3d STA $3d8a 
00:a5a4 : a2 09 __ LDX #$09
.l5:
00:a5a6 : bd b1 3d LDA $3db1,x 
00:a5a9 : 9d d5 7f STA $7fd5,x ; (cmd[0] + 0)
00:a5ac : ca __ __ DEX
00:a5ad : 10 f7 __ BPL $a5a6 ; (uii_load_reu.l5 + 0)
.s6:
00:a5af : a9 d5 __ LDA #$d5
00:a5b1 : 85 0d __ STA P0 
00:a5b3 : a9 7f __ LDA #$7f
00:a5b5 : 85 0e __ STA P1 
00:a5b7 : 20 53 11 JSR $1153 
00:a5ba : 20 ce 11 JSR $11ce 
00:a5bd : 20 0c 12 JSR $120c 
00:a5c0 : 4c 18 11 JMP $1118 
--------------------------------------------------------------------
execute: ; execute(u8*,u8,u8,u8*)->void
;  20, "/home/xahmol/git/UBoot64-v2/src/core.h"
.s1:
00:a5c3 : a5 53 __ LDA T2 + 0 
00:a5c5 : 8d f9 7e STA $7ef9 ; (execute@stack + 0)
00:a5c8 : a5 54 __ LDA T4 + 0 
00:a5ca : 8d fa 7e STA $7efa ; (execute@stack + 1)
.s4:
00:a5cd : a9 02 __ LDA #$02
00:a5cf : 85 52 __ STA T1 + 0 
00:a5d1 : 85 54 __ STA T4 + 0 
00:a5d3 : ad fc 7f LDA $7ffc ; (sstack + 29)
00:a5d6 : 85 53 __ STA T2 + 0 
00:a5d8 : 29 10 __ AND #$10
00:a5da : f0 03 __ BEQ $a5df ; (execute.s5 + 0)
.s12:
00:a5dc : 20 27 13 JSR $1327 
.s5:
00:a5df : a9 0d __ LDA #$0d
00:a5e1 : 8d 00 4d STA $4d00 ; (execute_commands[0] + 0)
00:a5e4 : 8d 01 4d STA $4d01 ; (execute_commands[0] + 1)
00:a5e7 : ad fd 7f LDA $7ffd ; (sstack + 30)
00:a5ea : 85 0d __ STA P0 
00:a5ec : ad fe 7f LDA $7ffe ; (sstack + 31)
00:a5ef : 85 0e __ STA P1 
00:a5f1 : a5 53 __ LDA T2 + 0 
00:a5f3 : 29 02 __ AND #$02
00:a5f5 : 85 53 __ STA T2 + 0 
00:a5f7 : 20 ad 10 JSR $10ad 
00:a5fa : a5 1b __ LDA ACCU + 0 
00:a5fc : 05 1c __ ORA ACCU + 1 
00:a5fe : f0 35 __ BEQ $a635 ; (execute.s6 + 0)
.s11:
00:a600 : ad fd 7f LDA $7ffd ; (sstack + 30)
00:a603 : 85 0f __ STA P2 
00:a605 : ad fe 7f LDA $7ffe ; (sstack + 31)
00:a608 : 85 10 __ STA P3 
00:a60a : a9 50 __ LDA #$50
00:a60c : 85 11 __ STA P4 
00:a60e : a9 4d __ LDA #$4d
00:a610 : 85 0e __ STA P1 
00:a612 : a9 02 __ LDA #$02
00:a614 : 85 0d __ STA P0 
00:a616 : 20 f4 1f JSR $1ff4 
00:a619 : ad fd 7f LDA $7ffd ; (sstack + 30)
00:a61c : 85 0d __ STA P0 
00:a61e : ad fe 7f LDA $7ffe ; (sstack + 31)
00:a621 : 85 0e __ STA P1 
00:a623 : 20 ad 10 JSR $10ad 
00:a626 : a9 0d __ LDA #$0d
00:a628 : a6 1b __ LDX ACCU + 0 
00:a62a : 9d 02 4d STA $4d02,x ; (execute_commands[0] + 2)
00:a62d : 8a __ __ TXA
00:a62e : 18 __ __ CLC
00:a62f : 69 03 __ ADC #$03
00:a631 : 85 52 __ STA T1 + 0 
00:a633 : e6 54 __ INC T4 + 0 
.s6:
00:a635 : 18 __ __ CLC
00:a636 : a9 00 __ LDA #$00
00:a638 : 65 52 __ ADC T1 + 0 
00:a63a : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:a63d : a9 4d __ LDA #$4d
00:a63f : 69 00 __ ADC #$00
00:a641 : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:a644 : a5 53 __ LDA T2 + 0 
00:a646 : d0 07 __ BNE $a64f ; (execute.s10 + 0)
.s7:
00:a648 : a9 2d __ LDA #$2d
00:a64a : a0 5c __ LDY #$5c
00:a64c : 4c 53 2c JMP $2c53 
.s10:
00:a64f : a9 2d __ LDA #$2d
00:a651 : a0 3d __ LDY #$3d
.s8:
00:a653 : 8c e5 7f STY $7fe5 ; (sstack + 6)
00:a656 : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:a659 : ad f9 7f LDA $7ff9 ; (sstack + 26)
00:a65c : 8d e7 7f STA $7fe7 ; (sstack + 8)
00:a65f : ad fa 7f LDA $7ffa ; (sstack + 27)
00:a662 : 8d e8 7f STA $7fe8 ; (sstack + 9)
00:a665 : a9 0d __ LDA #$0d
00:a667 : 8d eb 7f STA $7feb ; (sstack + 12)
00:a66a : 8d ed 7f STA $7fed ; (sstack + 14)
00:a66d : 8d ef 7f STA $7fef ; (sstack + 16)
00:a670 : 8d f1 7f STA $7ff1 ; (sstack + 18)
00:a673 : 8d f3 7f STA $7ff3 ; (sstack + 20)
00:a676 : 8d f5 7f STA $7ff5 ; (sstack + 22)
00:a679 : a9 00 __ LDA #$00
00:a67b : 8d ea 7f STA $7fea ; (sstack + 11)
00:a67e : 8d ec 7f STA $7fec ; (sstack + 13)
00:a681 : 8d ee 7f STA $7fee ; (sstack + 15)
00:a684 : 8d f0 7f STA $7ff0 ; (sstack + 17)
00:a687 : 8d f2 7f STA $7ff2 ; (sstack + 19)
00:a68a : 8d f4 7f STA $7ff4 ; (sstack + 21)
00:a68d : 8d f6 7f STA $7ff6 ; (sstack + 23)
00:a690 : 8d f7 7f STA $7ff7 ; (sstack + 24)
00:a693 : 8d f8 7f STA $7ff8 ; (sstack + 25)
00:a696 : ad fb 7f LDA $7ffb ; (sstack + 28)
00:a699 : 8d e9 7f STA $7fe9 ; (sstack + 10)
00:a69c : 20 d1 15 JSR $15d1 
00:a69f : a9 0d __ LDA #$0d
00:a6a1 : a0 00 __ LDY #$00
.l13:
00:a6a3 : 99 d8 4c STA $4cd8,y ; (execute_keys[0] + 0)
00:a6a6 : c8 __ __ INY
00:a6a7 : c4 54 __ CPY T4 + 0 
00:a6a9 : 90 f8 __ BCC $a6a3 ; (execute.l13 + 0)
.s9:
00:a6ab : a9 00 __ LDA #$00
00:a6ad : 99 d8 4c STA $4cd8,y ; (execute_keys[0] + 0)
00:a6b0 : 20 00 c0 JSR $c000 
.s3:
00:a6b3 : ad f9 7e LDA $7ef9 ; (execute@stack + 0)
00:a6b6 : 85 53 __ STA T2 + 0 
00:a6b8 : ad fa 7e LDA $7efa ; (execute@stack + 1)
00:a6bb : 85 54 __ STA T4 + 0 
00:a6bd : 60 __ __ RTS
--------------------------------------------------------------------
00:a6be : __ __ __ BYT 70 4f 57 45 52 20 4f 46 46 20 44 52 49 56 45 20 : pOWER OFF DRIVE 
00:a6ce : __ __ __ BYT 61 3a 20 25 53 0a 00                            : a: %S..
--------------------------------------------------------------------
00:a6d5 : __ __ __ BYT 70 4f 57 45 52 20 4f 46 46 20 44 52 49 56 45 20 : pOWER OFF DRIVE 
00:a6e5 : __ __ __ BYT 62 3a 20 25 53 0a 00                            : b: %S..
--------------------------------------------------------------------
00:a6ec : __ __ __ BYT 73 57 49 54 43 48 20 4f 46 46 20 69 64 20 00    : sWITCH OFF id .
--------------------------------------------------------------------
00:a6fb : __ __ __ BYT 31 35 34 30 00                                  : 1540.
--------------------------------------------------------------------
00:a700 : __ __ __ BYT 41 4e 44 20 50 52 45 53 53 20 4b 45 59 2e 00    : AND PRESS KEY..
--------------------------------------------------------------------
00:a70f : __ __ __ BYT 73 55 43 43 45 53 53 20 49 4e 20 50 4f 57 45 52 : sUCCESS IN POWER
00:a71f : __ __ __ BYT 49 4e 47 20 44 4f 57 4e 20 41 4c 4c 20 44 52 49 : ING DOWN ALL DRI
00:a72f : __ __ __ BYT 56 45 53 20 42 55 54 20 69 64 20 38 2e 00       : VES BUT id 8..
--------------------------------------------------------------------
00:a73d : __ __ __ BYT 4c 4f 41 44 22 25 53 22 2c 25 49 2c 31 25 43 25 : LOAD"%S",%I,1%C%
00:a74d : __ __ __ BYT 43 25 43 25 43 25 43 52 55 4e 25 43 25 43 00    : C%C%C%CRUN%C%C.
--------------------------------------------------------------------
00:a75c : __ __ __ BYT 4c 4f 41 44 22 25 53 22 2c 25 49 25 43 25 43 25 : LOAD"%S",%I%C%C%
00:a76c : __ __ __ BYT 43 25 43 25 43 52 55 4e 25 43 25 43 00          : C%C%CRUN%C%C.
--------------------------------------------------------------------
cmd: ; cmd(const u8,const u8*)->u8
;  18, "/home/xahmol/git/UBoot64-v2/src/core.h"
.s4:
00:a779 : a5 11 __ LDA P4 ; (cmd + 0)
00:a77b : 85 0d __ STA P0 
00:a77d : a5 12 __ LDA P5 ; (cmd + 1)
00:a77f : 85 0e __ STA P1 
00:a781 : 20 03 2e JSR $2e03 
00:a784 : a9 0f __ LDA #$0f
00:a786 : 85 0d __ STA P0 
00:a788 : 85 0f __ STA P2 
00:a78a : 20 19 2e JSR $2e19 
00:a78d : aa __ __ TAX
00:a78e : f0 0c __ BEQ $a79c ; (cmd.s16 + 0)
.s5:
00:a790 : a9 00 __ LDA #$00
00:a792 : 8d 3f 53 STA $533f ; (DOSstatus[0] + 0)
00:a795 : ad 3e 53 LDA $533e ; (krnio_pstatus[0] + 15)
00:a798 : c9 40 __ CMP #$40
00:a79a : d0 0b __ BNE $a7a7 ; (cmd.s6 + 0)
.s16:
00:a79c : a9 0f __ LDA #$0f
00:a79e : 20 c3 ff JSR $ffc3 
.s15:
00:a7a1 : 20 b7 ff JSR $ffb7 
.s3:
00:a7a4 : 85 1b __ STA ACCU + 0 
00:a7a6 : 60 __ __ RTS
.s6:
00:a7a7 : a9 0f __ LDA #$0f
00:a7a9 : 20 4b 2e JSR $2e4b 
00:a7ac : aa __ __ TAX
00:a7ad : d0 1c __ BNE $a7cb ; (cmd.s9 + 0)
.s7:
00:a7af : a9 0f __ LDA #$0f
00:a7b1 : 20 c3 ff JSR $ffc3 
.s8:
00:a7b4 : ad 3f 53 LDA $533f ; (DOSstatus[0] + 0)
00:a7b7 : 0a __ __ ASL
00:a7b8 : 0a __ __ ASL
00:a7b9 : 18 __ __ CLC
00:a7ba : 6d 3f 53 ADC $533f ; (DOSstatus[0] + 0)
00:a7bd : 0a __ __ ASL
00:a7be : 38 __ __ SEC
00:a7bf : e9 e0 __ SBC #$e0
00:a7c1 : 18 __ __ CLC
00:a7c2 : 6d 40 53 ADC $5340 ; (DOSstatus[0] + 1)
00:a7c5 : 38 __ __ SEC
00:a7c6 : e9 30 __ SBC #$30
00:a7c8 : 4c a4 2d JMP $2da4 
.s9:
00:a7cb : a9 00 __ LDA #$00
00:a7cd : 85 44 __ STA T2 + 0 
.l10:
00:a7cf : a5 44 __ LDA T2 + 0 
00:a7d1 : c9 28 __ CMP #$28
00:a7d3 : b0 20 __ BCS $a7f5 ; (cmd.s11 + 0)
.s12:
00:a7d5 : 20 cf ff JSR $ffcf 
00:a7d8 : 85 43 __ STA T0 + 0 
00:a7da : 20 b7 ff JSR $ffb7 
00:a7dd : 8d 3e 53 STA $533e ; (krnio_pstatus[0] + 15)
00:a7e0 : aa __ __ TAX
00:a7e1 : f0 04 __ BEQ $a7e7 ; (cmd.s13 + 0)
.s14:
00:a7e3 : c9 40 __ CMP #$40
00:a7e5 : d0 0e __ BNE $a7f5 ; (cmd.s11 + 0)
.s13:
00:a7e7 : a5 43 __ LDA T0 + 0 
00:a7e9 : a6 44 __ LDX T2 + 0 
00:a7eb : 9d 3f 53 STA $533f,x ; (DOSstatus[0] + 0)
00:a7ee : e6 44 __ INC T2 + 0 
00:a7f0 : ad 3e 53 LDA $533e ; (krnio_pstatus[0] + 15)
00:a7f3 : f0 da __ BEQ $a7cf ; (cmd.l10 + 0)
.s11:
00:a7f5 : 20 cc ff JSR $ffcc 
00:a7f8 : a9 0f __ LDA #$0f
00:a7fa : 20 c3 ff JSR $ffc3 
00:a7fd : a5 44 __ LDA T2 + 0 
00:a7ff : d0 b3 __ BNE $a7b4 ; (cmd.s8 + 0)
00:a801 : f0 9e __ BEQ $a7a1 ; (cmd.s15 + 0)
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
;  29, "/home/xahmol/oscar64/include/c64/kernalio.h"
.s4:
00:a803 : a5 0d __ LDA P0 
00:a805 : 05 0e __ ORA P1 
00:a807 : f0 08 __ BEQ $a811 ; (krnio_setnam.s4 + 14)
00:a809 : a0 ff __ LDY #$ff
00:a80b : c8 __ __ INY
00:a80c : b1 0d __ LDA (P0),y 
00:a80e : d0 fb __ BNE $a80b ; (krnio_setnam.s4 + 8)
00:a810 : 98 __ __ TYA
00:a811 : a6 0d __ LDX P0 
00:a813 : a4 0e __ LDY P1 
00:a815 : 20 bd ff JSR $ffbd 
.s3:
00:a818 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open@proxy: ; krnio_open@proxy
00:a819 : a5 10 __ LDA P3 
00:a81b : 85 0e __ STA P1 
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
;  35, "/home/xahmol/oscar64/include/c64/kernalio.h"
.s4:
00:a81d : a9 00 __ LDA #$00
00:a81f : a6 0d __ LDX P0 ; (fnum + 0)
00:a821 : 9d 2f 53 STA $532f,x ; (krnio_pstatus[0] + 0)
00:a824 : a9 00 __ LDA #$00
00:a826 : 85 1b __ STA ACCU + 0 
00:a828 : 85 1c __ STA ACCU + 1 
00:a82a : a5 0d __ LDA P0 ; (fnum + 0)
00:a82c : a6 0e __ LDX P1 
00:a82e : a4 0f __ LDY P2 ; (channel + 0)
00:a830 : 20 ba ff JSR $ffba 
00:a833 : 20 c0 ff JSR $ffc0 
00:a836 : 90 08 __ BCC $a840 ; (krnio_open.s4 + 35)
00:a838 : a5 0d __ LDA P0 ; (fnum + 0)
00:a83a : 20 c3 ff JSR $ffc3 
00:a83d : 4c 44 2e JMP $2e44 
00:a840 : a9 01 __ LDA #$01
00:a842 : 85 1b __ STA ACCU + 0 
00:a844 : a5 1b __ LDA ACCU + 0 
00:a846 : f0 02 __ BEQ $a84a ; (krnio_open.s3 + 0)
.s5:
00:a848 : a9 01 __ LDA #$01
.s3:
00:a84a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
;  55, "/home/xahmol/oscar64/include/c64/kernalio.h"
.s4:
00:a84b : aa __ __ TAX
00:a84c : 20 c6 ff JSR $ffc6 
00:a84f : a9 00 __ LDA #$00
00:a851 : 2a __ __ ROL
00:a852 : 49 01 __ EOR #$01
.s3:
00:a854 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_putat_char_raw: ; cwin_putat_char_raw(struct CharWin*,u8,u8,u8,u8)->void
;  95, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
00:a855 : ad 6c 49 LDA $496c ; (cw.sp + 0)
00:a858 : 18 __ __ CLC
00:a859 : 65 0d __ ADC P0 ; (x + 0)
00:a85b : 85 1b __ STA ACCU + 0 
00:a85d : ad 6d 49 LDA $496d ; (cw.sp + 1)
00:a860 : 69 00 __ ADC #$00
00:a862 : 85 1c __ STA ACCU + 1 
00:a864 : a5 0e __ LDA P1 ; (ch + 0)
00:a866 : a0 50 __ LDY #$50
00:a868 : 91 1b __ STA (ACCU + 0),y 
00:a86a : ad 6e 49 LDA $496e ; (cw.cp + 0)
00:a86d : 18 __ __ CLC
00:a86e : 65 0d __ ADC P0 ; (x + 0)
00:a870 : 85 1b __ STA ACCU + 0 
00:a872 : ad 6f 49 LDA $496f ; (cw.cp + 1)
00:a875 : 69 00 __ ADC #$00
00:a877 : 85 1c __ STA ACCU + 1 
00:a879 : a5 0f __ LDA P2 ; (color + 0)
00:a87b : 91 1b __ STA (ACCU + 0),y 
.s3:
00:a87d : 60 __ __ RTS
--------------------------------------------------------------------
00:a87e : __ __ __ BYT 70 49 31 35 34 31 00                            : pI1541.
--------------------------------------------------------------------
00:a885 : __ __ __ BYT 31 35 34 31 00                                  : 1541.
--------------------------------------------------------------------
00:a88a : __ __ __ BYT 31 35 35 31 00                                  : 1551.
--------------------------------------------------------------------
00:a88f : __ __ __ BYT 31 35 37 30 00                                  : 1570.
--------------------------------------------------------------------
00:a894 : __ __ __ BYT 31 35 37 31 00                                  : 1571.
--------------------------------------------------------------------
00:a899 : __ __ __ BYT 31 35 38 31 00                                  : 1581.
--------------------------------------------------------------------
00:a89e : __ __ __ BYT 31 30 30 31 00                                  : 1001.
--------------------------------------------------------------------
00:a8a3 : __ __ __ BYT 32 30 33 31 00                                  : 2031.
--------------------------------------------------------------------
00:a8a8 : __ __ __ BYT 38 30 34 30 00                                  : 8040.
--------------------------------------------------------------------
00:a8ad : __ __ __ BYT 53 44 32 49 45 43 00                            : SD2IEC.
--------------------------------------------------------------------
00:a8b4 : __ __ __ BYT 43 4d 44 00                                     : CMD.
--------------------------------------------------------------------
00:a8b8 : __ __ __ BYT 56 49 43 45 00                                  : VICE.
--------------------------------------------------------------------
00:a8bd : __ __ __ BYT 55 36 34 00                                     : U64.
--------------------------------------------------------------------
uii_get_path: ; uii_get_path()->void
;  22, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
00:a8c1 : a9 00 __ LDA #$00
00:a8c3 : 85 10 __ STA P3 
00:a8c5 : 8d dd 7f STA $7fdd ; (cmd[0] + 0)
00:a8c8 : a9 02 __ LDA #$02
00:a8ca : 85 0f __ STA P2 
00:a8cc : a9 01 __ LDA #$01
00:a8ce : 8d 8a 3d STA $3d8a 
00:a8d1 : a9 12 __ LDA #$12
00:a8d3 : 8d de 7f STA $7fde ; (cmd[0] + 1)
00:a8d6 : a9 dd __ LDA #$dd
00:a8d8 : 85 0d __ STA P0 
00:a8da : a9 7f __ LDA #$7f
00:a8dc : 85 0e __ STA P1 
00:a8de : 20 53 11 JSR $1153 
00:a8e1 : 20 ce 11 JSR $11ce 
00:a8e4 : 20 0c 12 JSR $120c 
00:a8e7 : 4c 18 11 JMP $1118 
--------------------------------------------------------------------
pathconcat: ; pathconcat()->u8*
;  10, "/home/xahmol/git/UBoot64-v2/src/core.h"
.s4:
00:a8ea : a9 00 __ LDA #$00
00:a8ec : a8 __ __ TAY
.l14:
00:a8ed : 99 dd 7e STA $7edd,y ; (concat[0] + 0)
00:a8f0 : c8 __ __ INY
00:a8f1 : d0 fa __ BNE $a8ed ; (pathconcat.l14 + 0)
.s5:
00:a8f3 : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
00:a8f6 : f0 1d __ BEQ $a915 ; (pathconcat.s6 + 0)
.s12:
00:a8f8 : 20 c1 2e JSR $2ec1 
00:a8fb : a9 dd __ LDA #$dd
00:a8fd : 85 0d __ STA P0 
00:a8ff : a9 49 __ LDA #$49
00:a901 : 85 10 __ STA P3 
00:a903 : a9 7e __ LDA #$7e
00:a905 : 85 0e __ STA P1 
00:a907 : a9 ff __ LDA #$ff
00:a909 : 85 11 __ STA P4 
00:a90b : a9 d6 __ LDA #$d6
00:a90d : 85 0f __ STA P2 
00:a90f : 20 f4 1f JSR $1ff4 
00:a912 : 4c 8e 2f JMP $2f8e 
.s6:
00:a915 : a9 dd __ LDA #$dd
00:a917 : 85 0d __ STA P0 
00:a919 : a9 7e __ LDA #$7e
00:a91b : 85 0e __ STA P1 
00:a91d : ae 67 53 LDX $5367 ; (pathdevice + 0)
00:a920 : bd 45 55 LDA $5545,x ; (devicetype[0] + 0)
00:a923 : c9 0d __ CMP #$0d
00:a925 : f0 0b __ BEQ $a932 ; (pathconcat.s11 + 0)
.s7:
00:a927 : c9 0e __ CMP #$0e
00:a929 : f0 07 __ BEQ $a932 ; (pathconcat.s11 + 0)
.s8:
00:a92b : a9 2f __ LDA #$2f
00:a92d : a0 d4 __ LDY #$d4
00:a92f : 4c 36 2f JMP $2f36 
.s11:
00:a932 : a9 2f __ LDA #$2f
00:a934 : a0 cf __ LDY #$cf
.s9:
00:a936 : 84 0f __ STY P2 
00:a938 : 85 10 __ STA P3 
00:a93a : 20 9c 2f JSR $2f9c 
00:a93d : ad bc 3d LDA $3dbc 
00:a940 : f0 4c __ BEQ $a98e ; (pathconcat.s3 + 0)
.s10:
00:a942 : 85 45 __ STA T1 + 0 
00:a944 : a9 00 __ LDA #$00
00:a946 : 85 46 __ STA T3 + 0 
00:a948 : a9 57 __ LDA #$57
00:a94a : 85 47 __ STA T3 + 1 
.l13:
00:a94c : 20 ad 10 JSR $10ad 
00:a94f : a5 46 __ LDA T3 + 0 
00:a951 : 85 0f __ STA P2 
00:a953 : a9 7e __ LDA #$7e
00:a955 : 85 0e __ STA P1 
00:a957 : a5 47 __ LDA T3 + 1 
00:a959 : 85 10 __ STA P3 
00:a95b : 38 __ __ SEC
00:a95c : a9 00 __ LDA #$00
00:a95e : e5 1b __ SBC ACCU + 0 
00:a960 : aa __ __ TAX
00:a961 : a9 01 __ LDA #$01
00:a963 : e5 1c __ SBC ACCU + 1 
00:a965 : a8 __ __ TAY
00:a966 : 8a __ __ TXA
00:a967 : 38 __ __ SEC
00:a968 : e9 03 __ SBC #$03
00:a96a : 85 11 __ STA P4 
00:a96c : 98 __ __ TYA
00:a96d : e9 00 __ SBC #$00
00:a96f : 85 12 __ STA P5 
00:a971 : 20 d9 2f JSR $2fd9 
00:a974 : a9 fe __ LDA #$fe
00:a976 : 85 0f __ STA P2 
00:a978 : a9 1f __ LDA #$1f
00:a97a : 85 10 __ STA P3 
00:a97c : 20 9c 2f JSR $2f9c 
00:a97f : 18 __ __ CLC
00:a980 : a5 46 __ LDA T3 + 0 
00:a982 : 69 33 __ ADC #$33
00:a984 : 85 46 __ STA T3 + 0 
00:a986 : 90 02 __ BCC $a98a ; (pathconcat.s16 + 0)
.s15:
00:a988 : e6 47 __ INC T3 + 1 
.s16:
00:a98a : c6 45 __ DEC T1 + 0 
00:a98c : d0 be __ BNE $a94c ; (pathconcat.l13 + 0)
.s3:
00:a98e : a9 00 __ LDA #$00
00:a990 : 8d dc 7f STA $7fdc ; (concat[0] + 255)
00:a993 : a9 dd __ LDA #$dd
00:a995 : 85 1b __ STA ACCU + 0 
00:a997 : a9 7e __ LDA #$7e
00:a999 : 85 1c __ STA ACCU + 1 
00:a99b : 60 __ __ RTS
--------------------------------------------------------------------
strcat: ; strcat(u8*,const u8*)->void
;  14, "/home/xahmol/oscar64/include/string.h"
.s4:
00:a99c : a5 0d __ LDA P0 ; (dst + 0)
00:a99e : 85 1b __ STA ACCU + 0 
00:a9a0 : a5 0e __ LDA P1 ; (dst + 1)
00:a9a2 : 85 1c __ STA ACCU + 1 
00:a9a4 : a0 00 __ LDY #$00
00:a9a6 : b1 0d __ LDA (P0),y ; (dst + 0)
00:a9a8 : f0 0f __ BEQ $a9b9 ; (strcat.s5 + 0)
.s6:
00:a9aa : 84 1b __ STY ACCU + 0 
00:a9ac : a4 0d __ LDY P0 ; (dst + 0)
.l7:
00:a9ae : c8 __ __ INY
00:a9af : d0 02 __ BNE $a9b3 ; (strcat.s11 + 0)
.s10:
00:a9b1 : e6 1c __ INC ACCU + 1 
.s11:
00:a9b3 : b1 1b __ LDA (ACCU + 0),y 
00:a9b5 : d0 f7 __ BNE $a9ae ; (strcat.l7 + 0)
.s8:
00:a9b7 : 84 1b __ STY ACCU + 0 
.s5:
00:a9b9 : a8 __ __ TAY
.l9:
00:a9ba : b1 0f __ LDA (P2),y ; (src + 0)
00:a9bc : 91 1b __ STA (ACCU + 0),y 
00:a9be : aa __ __ TAX
00:a9bf : e6 0f __ INC P2 ; (src + 0)
00:a9c1 : d0 02 __ BNE $a9c5 ; (strcat.s13 + 0)
.s12:
00:a9c3 : e6 10 __ INC P3 ; (src + 1)
.s13:
00:a9c5 : e6 1b __ INC ACCU + 0 
00:a9c7 : d0 02 __ BNE $a9cb ; (strcat.s15 + 0)
.s14:
00:a9c9 : e6 1c __ INC ACCU + 1 
.s15:
00:a9cb : 8a __ __ TXA
00:a9cc : d0 ec __ BNE $a9ba ; (strcat.l9 + 0)
.s3:
00:a9ce : 60 __ __ RTS
--------------------------------------------------------------------
00:a9cf : __ __ __ BYT 43 44 3a 2f 00                                  : CD:/.
--------------------------------------------------------------------
00:a9d4 : __ __ __ BYT 43 44 2f 2f 00                                  : CD//.
--------------------------------------------------------------------
strncat: ; strncat(u8*,const u8*,i16)->void
;  16, "/home/xahmol/oscar64/include/string.h"
.s4:
00:a9d9 : a5 0d __ LDA P0 ; (dst + 0)
00:a9db : 85 1b __ STA ACCU + 0 
00:a9dd : a5 0e __ LDA P1 ; (dst + 1)
00:a9df : 85 1c __ STA ACCU + 1 
00:a9e1 : a0 00 __ LDY #$00
00:a9e3 : b1 0d __ LDA (P0),y ; (dst + 0)
00:a9e5 : f0 0f __ BEQ $a9f6 ; (strncat.s12 + 0)
.s9:
00:a9e7 : 84 1b __ STY ACCU + 0 
00:a9e9 : a4 0d __ LDY P0 ; (dst + 0)
.l10:
00:a9eb : c8 __ __ INY
00:a9ec : d0 02 __ BNE $a9f0 ; (strncat.s14 + 0)
.s13:
00:a9ee : e6 1c __ INC ACCU + 1 
.s14:
00:a9f0 : b1 1b __ LDA (ACCU + 0),y 
00:a9f2 : d0 f7 __ BNE $a9eb ; (strncat.l10 + 0)
.s11:
00:a9f4 : 84 1b __ STY ACCU + 0 
.s12:
00:a9f6 : a6 12 __ LDX P5 ; (n + 1)
.l5:
00:a9f8 : 8a __ __ TXA
00:a9f9 : 05 11 __ ORA P4 ; (n + 0)
00:a9fb : d0 09 __ BNE $aa06 ; (strncat.s8 + 0)
.s6:
00:a9fd : a8 __ __ TAY
00:a9fe : b1 1b __ LDA (ACCU + 0),y 
00:aa00 : f0 03 __ BEQ $aa05 ; (strncat.s3 + 0)
.s7:
00:aa02 : 98 __ __ TYA
00:aa03 : 91 1b __ STA (ACCU + 0),y 
.s3:
00:aa05 : 60 __ __ RTS
.s8:
00:aa06 : 18 __ __ CLC
00:aa07 : a5 11 __ LDA P4 ; (n + 0)
00:aa09 : 69 ff __ ADC #$ff
00:aa0b : 85 11 __ STA P4 ; (n + 0)
00:aa0d : 8a __ __ TXA
00:aa0e : 69 ff __ ADC #$ff
00:aa10 : aa __ __ TAX
00:aa11 : a0 00 __ LDY #$00
00:aa13 : b1 0f __ LDA (P2),y ; (src + 0)
00:aa15 : 91 1b __ STA (ACCU + 0),y 
00:aa17 : e6 0f __ INC P2 ; (src + 0)
00:aa19 : d0 02 __ BNE $aa1d ; (strncat.s16 + 0)
.s15:
00:aa1b : e6 10 __ INC P3 ; (src + 1)
.s16:
00:aa1d : e6 1b __ INC ACCU + 0 
00:aa1f : d0 02 __ BNE $aa23 ; (strncat.s18 + 0)
.s17:
00:aa21 : e6 1c __ INC ACCU + 1 
.s18:
00:aa23 : a8 __ __ TAY
00:aa24 : d0 d2 __ BNE $a9f8 ; (strncat.l5 + 0)
00:aa26 : 60 __ __ RTS
--------------------------------------------------------------------
00:aa27 : __ __ __ BYT 73 65 71 00                                     : seq.
--------------------------------------------------------------------
00:aa2b : __ __ __ BYT 70 72 67 00                                     : prg.
--------------------------------------------------------------------
00:aa2f : __ __ __ BYT 75 72 73 00                                     : urs.
--------------------------------------------------------------------
00:aa33 : __ __ __ BYT 72 65 6c 00                                     : rel.
--------------------------------------------------------------------
00:aa37 : __ __ __ BYT 76 72 70 00                                     : vrp.
--------------------------------------------------------------------
00:aa3b : __ __ __ BYT 64 65 6c 00                                     : del.
--------------------------------------------------------------------
00:aa3f : __ __ __ BYT 63 62 6d 00                                     : cbm.
--------------------------------------------------------------------
00:aa43 : __ __ __ BYT 64 69 72 00                                     : dir.
--------------------------------------------------------------------
00:aa47 : __ __ __ BYT 6c 6e 6b 00                                     : lnk.
--------------------------------------------------------------------
00:aa4b : __ __ __ BYT 6f 74 68 00                                     : oth.
--------------------------------------------------------------------
00:aa4f : __ __ __ BYT 68 64 72 00                                     : hdr.
--------------------------------------------------------------------
00:aa53 : __ __ __ BYT 30 31 32 33 34 35 36 37 38 39 41 42 43 44 45 46 : 0123456789ABCDEF
00:aa63 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
getDeviceType: ; getDeviceType(const u8)->void
;  19, "/home/xahmol/git/UBoot64-v2/src/core.h"
.s4:
00:aa64 : a5 13 __ LDA P6 ; (device + 0)
00:aa66 : c9 20 __ CMP #$20
00:aa68 : 90 01 __ BCC $aa6b ; (getDeviceType.s5 + 0)
00:aa6a : 60 __ __ RTS
.s5:
00:aa6b : 85 10 __ STA P3 
00:aa6d : a9 1f __ LDA #$1f
00:aa6f : 85 11 __ STA P4 
00:aa71 : a9 31 __ LDA #$31
00:aa73 : 85 12 __ STA P5 
00:aa75 : 20 79 2d JSR $2d79 
00:aa78 : a5 1b __ LDA ACCU + 0 
00:aa7a : c9 49 __ CMP #$49
00:aa7c : f0 21 __ BEQ $aa9f ; (getDeviceType.s6 + 0)
.s20:
00:aa7e : a2 71 __ LDX #$71
00:aa80 : 8e 81 54 STX $5481 ; (linebuffer2[0] + 0)
00:aa83 : a2 00 __ LDX #$00
00:aa85 : 8e 84 54 STX $5484 ; (linebuffer2[0] + 3)
00:aa88 : 4a __ __ LSR
00:aa89 : 4a __ __ LSR
00:aa8a : 4a __ __ LSR
00:aa8b : 4a __ __ LSR
00:aa8c : aa __ __ TAX
00:aa8d : bd 53 30 LDA $3053,x 
00:aa90 : 8d 82 54 STA $5482 ; (linebuffer2[0] + 1)
00:aa93 : a5 1b __ LDA ACCU + 0 
00:aa95 : 29 0f __ AND #$0f
00:aa97 : aa __ __ TAX
00:aa98 : bd 53 30 LDA $3053,x 
00:aa9b : 8d 83 54 STA $5483 ; (linebuffer2[0] + 2)
00:aa9e : 60 __ __ RTS
.s6:
00:aa9f : a9 01 __ LDA #$01
00:aaa1 : 85 1d __ STA ACCU + 2 
.l7:
00:aaa3 : 0a __ __ ASL
00:aaa4 : aa __ __ TAX
00:aaa5 : bd c3 3d LDA $3dc3,x 
00:aaa8 : 85 43 __ STA T0 + 0 
00:aaaa : bd c4 3d LDA $3dc4,x 
00:aaad : 85 44 __ STA T0 + 1 
00:aaaf : a0 00 __ LDY #$00
00:aab1 : b1 43 __ LDA (T0 + 0),y 
00:aab3 : f0 53 __ BEQ $ab08 ; (getDeviceType.s8 + 0)
.s9:
00:aab5 : ad 3f 53 LDA $533f ; (DOSstatus[0] + 0)
00:aab8 : f0 3f __ BEQ $aaf9 ; (getDeviceType.s10 + 0)
.s11:
00:aaba : a9 3f __ LDA #$3f
00:aabc : 85 1b __ STA ACCU + 0 
00:aabe : a9 53 __ LDA #$53
00:aac0 : 85 1c __ STA ACCU + 1 
00:aac2 : a6 43 __ LDX T0 + 0 
.l12:
00:aac4 : 86 45 __ STX T2 + 0 
00:aac6 : a5 44 __ LDA T0 + 1 
00:aac8 : 85 46 __ STA T2 + 1 
00:aaca : a5 1b __ LDA ACCU + 0 
00:aacc : 85 47 __ STA T3 + 0 
00:aace : a5 1c __ LDA ACCU + 1 
00:aad0 : 85 48 __ STA T3 + 1 
.l13:
00:aad2 : a0 00 __ LDY #$00
00:aad4 : b1 1b __ LDA (ACCU + 0),y 
00:aad6 : f0 0a __ BEQ $aae2 ; (getDeviceType.s14 + 0)
.s17:
00:aad8 : b1 45 __ LDA (T2 + 0),y 
00:aada : f0 26 __ BEQ $ab02 ; (getDeviceType.s15 + 0)
.s18:
00:aadc : b1 1b __ LDA (ACCU + 0),y 
00:aade : d1 45 __ CMP (T2 + 0),y 
00:aae0 : f0 2e __ BEQ $ab10 ; (getDeviceType.s19 + 0)
.s14:
00:aae2 : b1 45 __ LDA (T2 + 0),y 
00:aae4 : f0 1c __ BEQ $ab02 ; (getDeviceType.s15 + 0)
.s16:
00:aae6 : 18 __ __ CLC
00:aae7 : a5 47 __ LDA T3 + 0 
00:aae9 : 69 01 __ ADC #$01
00:aaeb : 85 1b __ STA ACCU + 0 
00:aaed : a5 48 __ LDA T3 + 1 
00:aaef : 69 00 __ ADC #$00
00:aaf1 : 85 1c __ STA ACCU + 1 
00:aaf3 : a0 01 __ LDY #$01
00:aaf5 : b1 47 __ LDA (T3 + 0),y 
00:aaf7 : d0 cb __ BNE $aac4 ; (getDeviceType.l12 + 0)
.s10:
00:aaf9 : e6 1d __ INC ACCU + 2 
00:aafb : a5 1d __ LDA ACCU + 2 
00:aafd : c9 0f __ CMP #$0f
00:aaff : 90 a2 __ BCC $aaa3 ; (getDeviceType.l7 + 0)
.s3:
00:ab01 : 60 __ __ RTS
.s15:
00:ab02 : a5 47 __ LDA T3 + 0 
00:ab04 : 05 48 __ ORA T3 + 1 
00:ab06 : f0 f1 __ BEQ $aaf9 ; (getDeviceType.s10 + 0)
.s8:
00:ab08 : a5 1d __ LDA ACCU + 2 
00:ab0a : a6 13 __ LDX P6 ; (device + 0)
00:ab0c : 9d 45 55 STA $5545,x ; (devicetype[0] + 0)
00:ab0f : 60 __ __ RTS
.s19:
00:ab10 : e6 45 __ INC T2 + 0 
00:ab12 : d0 02 __ BNE $ab16 ; (getDeviceType.s22 + 0)
.s21:
00:ab14 : e6 46 __ INC T2 + 1 
.s22:
00:ab16 : e6 1b __ INC ACCU + 0 
00:ab18 : d0 b8 __ BNE $aad2 ; (getDeviceType.l13 + 0)
.s23:
00:ab1a : e6 1c __ INC ACCU + 1 
00:ab1c : 4c d2 30 JMP $30d2 
--------------------------------------------------------------------
00:ab1f : __ __ __ BYT 55 49 00                                        : UI.
--------------------------------------------------------------------
uii_unmount_disk@proxy: ; uii_unmount_disk@proxy
00:ab22 : ad c1 3d LDA $3dc1 
00:ab25 : 85 11 __ STA P4 
--------------------------------------------------------------------
uii_unmount_disk: ; uii_unmount_disk(u8)->void
;  29, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
00:ab27 : a9 00 __ LDA #$00
00:ab29 : 85 10 __ STA P3 
00:ab2b : 8d dc 7f STA $7fdc ; (cmd[0] + 0)
00:ab2e : 8d de 7f STA $7fde ; (cmd[0] + 2)
00:ab31 : a9 03 __ LDA #$03
00:ab33 : 85 0f __ STA P2 
00:ab35 : a9 01 __ LDA #$01
00:ab37 : 8d 8a 3d STA $3d8a 
00:ab3a : a9 24 __ LDA #$24
00:ab3c : 8d dd 7f STA $7fdd ; (cmd[0] + 1)
00:ab3f : a5 11 __ LDA P4 ; (id + 0)
00:ab41 : 8d de 7f STA $7fde ; (cmd[0] + 2)
00:ab44 : a9 dc __ LDA #$dc
00:ab46 : 85 0d __ STA P0 
00:ab48 : a9 7f __ LDA #$7f
00:ab4a : 85 0e __ STA P1 
00:ab4c : 20 53 11 JSR $1153 
00:ab4f : 20 ce 11 JSR $11ce 
00:ab52 : 20 0c 12 JSR $120c 
00:ab55 : 4c 18 11 JMP $1118 
--------------------------------------------------------------------
getkey@proxy: ; getkey@proxy
00:ab58 : a9 02 __ LDA #$02
00:ab5a : 85 0d __ STA P0 
--------------------------------------------------------------------
getkey: ; getkey(u8)->u8
;  11, "/home/xahmol/git/UBoot64-v2/src/core.h"
.s4:
00:ab5c : a5 0d __ LDA P0 ; (mask + 0)
00:ab5e : 29 01 __ AND #$01
00:ab60 : 85 43 __ STA T1 + 0 
00:ab62 : a5 0d __ LDA P0 ; (mask + 0)
00:ab64 : 29 40 __ AND #$40
00:ab66 : 85 44 __ STA T2 + 0 
00:ab68 : a5 0d __ LDA P0 ; (mask + 0)
00:ab6a : 29 20 __ AND #$20
00:ab6c : 85 45 __ STA T3 + 0 
00:ab6e : a5 0d __ LDA P0 ; (mask + 0)
00:ab70 : 29 08 __ AND #$08
00:ab72 : 85 46 __ STA T4 + 0 
00:ab74 : a5 0d __ LDA P0 ; (mask + 0)
00:ab76 : 29 10 __ AND #$10
00:ab78 : 85 47 __ STA T5 + 0 
00:ab7a : a5 0d __ LDA P0 ; (mask + 0)
00:ab7c : 29 04 __ AND #$04
00:ab7e : 85 48 __ STA T6 + 0 
00:ab80 : a5 0d __ LDA P0 ; (mask + 0)
00:ab82 : 29 02 __ AND #$02
00:ab84 : 85 49 __ STA T7 + 0 
00:ab86 : 24 0d __ BIT P0 ; (mask + 0)
00:ab88 : 10 6e __ BPL $abf8 ; (getkey.l27 + 0)
.l5:
00:ab8a : 20 50 14 JSR $1450 
00:ab8d : a5 43 __ LDA T1 + 0 
00:ab8f : f0 0a __ BEQ $ab9b ; (getkey.s8 + 0)
.s6:
00:ab91 : a5 1b __ LDA ACCU + 0 
00:ab93 : c9 30 __ CMP #$30
00:ab95 : 90 04 __ BCC $ab9b ; (getkey.s8 + 0)
.s7:
00:ab97 : c9 3a __ CMP #$3a
00:ab99 : 90 5c __ BCC $abf7 ; (getkey.s3 + 0)
.s8:
00:ab9b : a5 49 __ LDA T7 + 0 
00:ab9d : f0 0a __ BEQ $aba9 ; (getkey.s11 + 0)
.s9:
00:ab9f : a5 1b __ LDA ACCU + 0 
00:aba1 : c9 20 __ CMP #$20
00:aba3 : 90 04 __ BCC $aba9 ; (getkey.s11 + 0)
.s10:
00:aba5 : c9 60 __ CMP #$60
00:aba7 : 90 4e __ BCC $abf7 ; (getkey.s3 + 0)
.s11:
00:aba9 : a5 48 __ LDA T6 + 0 
00:abab : f0 09 __ BEQ $abb6 ; (getkey.s14 + 0)
.s12:
00:abad : a5 1b __ LDA ACCU + 0 
00:abaf : c9 60 __ CMP #$60
00:abb1 : 90 03 __ BCC $abb6 ; (getkey.s14 + 0)
.s13:
00:abb3 : aa __ __ TAX
00:abb4 : 10 41 __ BPL $abf7 ; (getkey.s3 + 0)
.s14:
00:abb6 : a5 47 __ LDA T5 + 0 
00:abb8 : f0 0a __ BEQ $abc4 ; (getkey.s17 + 0)
.s15:
00:abba : a5 1b __ LDA ACCU + 0 
00:abbc : c9 1d __ CMP #$1d
00:abbe : f0 37 __ BEQ $abf7 ; (getkey.s3 + 0)
.s16:
00:abc0 : c9 9d __ CMP #$9d
00:abc2 : f0 33 __ BEQ $abf7 ; (getkey.s3 + 0)
.s17:
00:abc4 : a5 46 __ LDA T4 + 0 
00:abc6 : f0 0a __ BEQ $abd2 ; (getkey.s20 + 0)
.s18:
00:abc8 : a5 1b __ LDA ACCU + 0 
00:abca : c9 11 __ CMP #$11
00:abcc : f0 29 __ BEQ $abf7 ; (getkey.s3 + 0)
.s19:
00:abce : c9 91 __ CMP #$91
00:abd0 : f0 25 __ BEQ $abf7 ; (getkey.s3 + 0)
.s20:
00:abd2 : a5 45 __ LDA T3 + 0 
00:abd4 : f0 0a __ BEQ $abe0 ; (getkey.s23 + 0)
.s21:
00:abd6 : a5 1b __ LDA ACCU + 0 
00:abd8 : c9 14 __ CMP #$14
00:abda : f0 1b __ BEQ $abf7 ; (getkey.s3 + 0)
.s22:
00:abdc : c9 94 __ CMP #$94
00:abde : f0 17 __ BEQ $abf7 ; (getkey.s3 + 0)
.s23:
00:abe0 : a5 44 __ LDA T2 + 0 
00:abe2 : d0 05 __ BNE $abe9 ; (getkey.s24 + 0)
.s48:
00:abe4 : a5 1b __ LDA ACCU + 0 
00:abe6 : 4c ef 31 JMP $31ef 
.s24:
00:abe9 : a5 1b __ LDA ACCU + 0 
00:abeb : c9 0d __ CMP #$0d
00:abed : f0 08 __ BEQ $abf7 ; (getkey.s3 + 0)
.s25:
00:abef : c9 4e __ CMP #$4e
00:abf1 : f0 04 __ BEQ $abf7 ; (getkey.s3 + 0)
.s26:
00:abf3 : c9 59 __ CMP #$59
00:abf5 : d0 93 __ BNE $ab8a ; (getkey.l5 + 0)
.s3:
00:abf7 : 60 __ __ RTS
.l27:
00:abf8 : 20 50 14 JSR $1450 
00:abfb : a5 43 __ LDA T1 + 0 
00:abfd : f0 0a __ BEQ $ac09 ; (getkey.s30 + 0)
.s28:
00:abff : a5 1b __ LDA ACCU + 0 
00:ac01 : c9 30 __ CMP #$30
00:ac03 : 90 04 __ BCC $ac09 ; (getkey.s30 + 0)
.s29:
00:ac05 : c9 3a __ CMP #$3a
00:ac07 : 90 ee __ BCC $abf7 ; (getkey.s3 + 0)
.s30:
00:ac09 : a5 49 __ LDA T7 + 0 
00:ac0b : f0 0a __ BEQ $ac17 ; (getkey.s33 + 0)
.s31:
00:ac0d : a5 1b __ LDA ACCU + 0 
00:ac0f : c9 20 __ CMP #$20
00:ac11 : 90 04 __ BCC $ac17 ; (getkey.s33 + 0)
.s32:
00:ac13 : c9 60 __ CMP #$60
00:ac15 : 90 e0 __ BCC $abf7 ; (getkey.s3 + 0)
.s33:
00:ac17 : a5 48 __ LDA T6 + 0 
00:ac19 : f0 09 __ BEQ $ac24 ; (getkey.s36 + 0)
.s34:
00:ac1b : a5 1b __ LDA ACCU + 0 
00:ac1d : c9 60 __ CMP #$60
00:ac1f : 90 03 __ BCC $ac24 ; (getkey.s36 + 0)
.s35:
00:ac21 : aa __ __ TAX
00:ac22 : 10 d3 __ BPL $abf7 ; (getkey.s3 + 0)
.s36:
00:ac24 : a5 47 __ LDA T5 + 0 
00:ac26 : f0 0a __ BEQ $ac32 ; (getkey.s39 + 0)
.s37:
00:ac28 : a5 1b __ LDA ACCU + 0 
00:ac2a : c9 1d __ CMP #$1d
00:ac2c : f0 c9 __ BEQ $abf7 ; (getkey.s3 + 0)
.s38:
00:ac2e : c9 9d __ CMP #$9d
00:ac30 : f0 c5 __ BEQ $abf7 ; (getkey.s3 + 0)
.s39:
00:ac32 : a5 46 __ LDA T4 + 0 
00:ac34 : f0 0a __ BEQ $ac40 ; (getkey.s42 + 0)
.s40:
00:ac36 : a5 1b __ LDA ACCU + 0 
00:ac38 : c9 11 __ CMP #$11
00:ac3a : f0 bb __ BEQ $abf7 ; (getkey.s3 + 0)
.s41:
00:ac3c : c9 91 __ CMP #$91
00:ac3e : f0 b7 __ BEQ $abf7 ; (getkey.s3 + 0)
.s42:
00:ac40 : a5 45 __ LDA T3 + 0 
00:ac42 : f0 0a __ BEQ $ac4e ; (getkey.s45 + 0)
.s43:
00:ac44 : a5 1b __ LDA ACCU + 0 
00:ac46 : c9 14 __ CMP #$14
00:ac48 : f0 ad __ BEQ $abf7 ; (getkey.s3 + 0)
.s44:
00:ac4a : c9 94 __ CMP #$94
00:ac4c : f0 a9 __ BEQ $abf7 ; (getkey.s3 + 0)
.s45:
00:ac4e : a5 44 __ LDA T2 + 0 
00:ac50 : f0 a6 __ BEQ $abf8 ; (getkey.l27 + 0)
.s46:
00:ac52 : a5 1b __ LDA ACCU + 0 
00:ac54 : c9 0d __ CMP #$0d
00:ac56 : d0 a0 __ BNE $abf8 ; (getkey.l27 + 0)
00:ac58 : 60 __ __ RTS
--------------------------------------------------------------------
textInput: ; textInput(u8,u8,u8,u8*,u8,u8)->void
;  21, "/home/xahmol/git/UBoot64-v2/src/core.h"
.s1:
00:ac59 : a5 53 __ LDA T9 + 0 
00:ac5b : 8d f1 7e STA $7ef1 ; (textInput@stack + 0)
00:ac5e : a5 54 __ LDA T10 + 0 
00:ac60 : 8d f2 7e STA $7ef2 ; (textInput@stack + 1)
00:ac63 : a5 55 __ LDA T11 + 0 
00:ac65 : 8d f3 7e STA $7ef3 ; (textInput@stack + 2)
.s4:
00:ac68 : ad ed 7f LDA $7fed ; (sstack + 14)
00:ac6b : 85 4d __ STA T2 + 0 
00:ac6d : 85 0d __ STA P0 
00:ac6f : ad ee 7f LDA $7fee ; (sstack + 15)
00:ac72 : 85 4e __ STA T2 + 1 
00:ac74 : 85 0e __ STA P1 
00:ac76 : 20 ad 10 JSR $10ad 
00:ac79 : a5 1b __ LDA ACCU + 0 
00:ac7b : 85 4f __ STA T3 + 0 
00:ac7d : ad ef 7f LDA $7fef ; (sstack + 16)
00:ac80 : 85 53 __ STA T9 + 0 
00:ac82 : ad ec 7f LDA $7fec ; (sstack + 13)
00:ac85 : 85 54 __ STA T10 + 0 
00:ac87 : ad eb 7f LDA $7feb ; (sstack + 12)
00:ac8a : 85 55 __ STA T11 + 0 
.l5:
00:ac8c : 18 __ __ CLC
00:ac8d : a5 4f __ LDA T3 + 0 
00:ac8f : 69 01 __ ADC #$01
00:ac91 : b0 0a __ BCS $ac9d ; (textInput.s42 + 0)
.s43:
00:ac93 : c5 54 __ CMP T10 + 0 
00:ac95 : 90 02 __ BCC $ac99 ; (textInput.s6 + 0)
.s47:
00:ac97 : d0 04 __ BNE $ac9d ; (textInput.s42 + 0)
.s6:
00:ac99 : a9 00 __ LDA #$00
00:ac9b : f0 03 __ BEQ $aca0 ; (textInput.s7 + 0)
.s42:
00:ac9d : 38 __ __ SEC
00:ac9e : e5 54 __ SBC T10 + 0 
.s7:
00:aca0 : 85 4c __ STA T0 + 0 
00:aca2 : 20 1a 3d JSR $3d1a 
00:aca5 : a5 55 __ LDA T11 + 0 
00:aca7 : 85 0e __ STA P1 
00:aca9 : 8d 69 49 STA $4969 ; (cw.cy + 0)
00:acac : a5 54 __ LDA T10 + 0 
00:acae : 85 0f __ STA P2 
00:acb0 : a9 00 __ LDA #$00
00:acb2 : 85 0d __ STA P0 
00:acb4 : 8d 68 49 STA $4968 ; (cw.cx + 0)
00:acb7 : a9 01 __ LDA #$01
00:acb9 : 85 10 __ STA P3 
00:acbb : 20 fa 3c JSR $3cfa 
00:acbe : a5 0e __ LDA P1 
00:acc0 : 8d 69 49 STA $4969 ; (cw.cy + 0)
00:acc3 : 18 __ __ CLC
00:acc4 : a5 4c __ LDA T0 + 0 
00:acc6 : 65 4d __ ADC T2 + 0 
00:acc8 : 85 50 __ STA T6 + 0 
00:acca : 85 0f __ STA P2 
00:accc : a5 4e __ LDA T2 + 1 
00:acce : 69 00 __ ADC #$00
00:acd0 : 85 51 __ STA T6 + 1 
00:acd2 : 85 10 __ STA P3 
00:acd4 : a9 72 __ LDA #$72
00:acd6 : 85 0d __ STA P0 
00:acd8 : a9 49 __ LDA #$49
00:acda : 85 0e __ STA P1 
00:acdc : a6 54 __ LDX T10 + 0 
00:acde : ca __ __ DEX
00:acdf : 86 52 __ STX T8 + 0 
00:ace1 : 86 11 __ STX P4 
00:ace3 : a9 00 __ LDA #$00
00:ace5 : 8d 68 49 STA $4968 ; (cw.cx + 0)
00:ace8 : 85 12 __ STA P5 
00:acea : 20 c9 23 JSR $23c9 
00:aced : a9 72 __ LDA #$72
00:acef : 8d e5 7f STA $7fe5 ; (sstack + 6)
00:acf2 : a9 49 __ LDA #$49
00:acf4 : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:acf7 : a9 00 __ LDA #$00
00:acf9 : a6 54 __ LDX T10 + 0 
00:acfb : 9d 71 49 STA $4971,x ; (vspriteScreen + 1)
00:acfe : ad 5e 49 LDA $495e ; (cfg.colors.text_input + 0)
00:ad01 : 85 18 __ STA P11 
00:ad03 : a9 69 __ LDA #$69
00:ad05 : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:ad08 : a9 34 __ LDA #$34
00:ad0a : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:ad0d : 20 25 15 JSR $1525 
00:ad10 : a5 55 __ LDA T11 + 0 
00:ad12 : 8d 69 49 STA $4969 ; (cw.cy + 0)
00:ad15 : 38 __ __ SEC
00:ad16 : a5 4f __ LDA T3 + 0 
00:ad18 : e5 4c __ SBC T0 + 0 
00:ad1a : 8d 68 49 STA $4968 ; (cw.cx + 0)
00:ad1d : a9 01 __ LDA #$01
00:ad1f : 20 6c 34 JSR $346c 
00:ad22 : 20 50 14 JSR $1450 
00:ad25 : a5 1b __ LDA ACCU + 0 
00:ad27 : c9 1b __ CMP #$1b
00:ad29 : d0 03 __ BNE $ad2e ; (textInput.s8 + 0)
00:ad2b : 4c 30 34 JMP $3430 
.s8:
00:ad2e : b0 03 __ BCS $ad33 ; (textInput.s9 + 0)
00:ad30 : 4c c1 33 JMP $33c1 
.s9:
00:ad33 : c9 94 __ CMP #$94
00:ad35 : d0 3a __ BNE $ad71 ; (textInput.s10 + 0)
.s25:
00:ad37 : 20 1a 3d JSR $3d1a 
00:ad3a : a5 1b __ LDA ACCU + 0 
00:ad3c : c5 53 __ CMP T9 + 0 
00:ad3e : 90 03 __ BCC $ad43 ; (textInput.s26 + 0)
00:ad40 : 4c 8c 32 JMP $328c 
.s26:
00:ad43 : aa __ __ TAX
00:ad44 : f0 fa __ BEQ $ad40 ; (textInput.s25 + 9)
.s27:
00:ad46 : a5 4f __ LDA T3 + 0 
00:ad48 : c5 1b __ CMP ACCU + 0 
00:ad4a : b0 f4 __ BCS $ad40 ; (textInput.s25 + 9)
.s28:
00:ad4c : a5 1b __ LDA ACCU + 0 
00:ad4e : 69 01 __ ADC #$01
00:ad50 : c5 4f __ CMP T3 + 0 
00:ad52 : 90 14 __ BCC $ad68 ; (textInput.s29 + 0)
.s46:
00:ad54 : 85 1b __ STA ACCU + 0 
00:ad56 : a8 __ __ TAY
.l30:
00:ad57 : b1 4d __ LDA (T2 + 0),y 
00:ad59 : c8 __ __ INY
00:ad5a : 91 4d __ STA (T2 + 0),y 
00:ad5c : a5 1b __ LDA ACCU + 0 
00:ad5e : f0 08 __ BEQ $ad68 ; (textInput.s29 + 0)
.s31:
00:ad60 : c6 1b __ DEC ACCU + 0 
00:ad62 : a4 1b __ LDY ACCU + 0 
00:ad64 : c4 4f __ CPY T3 + 0 
00:ad66 : b0 ef __ BCS $ad57 ; (textInput.l30 + 0)
.s29:
00:ad68 : a9 20 __ LDA #$20
.s44:
00:ad6a : a4 4f __ LDY T3 + 0 
00:ad6c : 91 4d __ STA (T2 + 0),y 
00:ad6e : 4c 8c 32 JMP $328c 
.s10:
00:ad71 : 90 2d __ BCC $ada0 ; (textInput.s19 + 0)
.s11:
00:ad73 : c9 9d __ CMP #$9d
00:ad75 : d0 09 __ BNE $ad80 ; (textInput.s12 + 0)
.s17:
00:ad77 : a5 4f __ LDA T3 + 0 
00:ad79 : f0 f3 __ BEQ $ad6e ; (textInput.s44 + 4)
.s18:
00:ad7b : c6 4f __ DEC T3 + 0 
00:ad7d : 4c 8c 32 JMP $328c 
.s12:
00:ad80 : c9 20 __ CMP #$20
00:ad82 : 90 f9 __ BCC $ad7d ; (textInput.s18 + 2)
.s16:
00:ad84 : aa __ __ TAX
00:ad85 : 10 04 __ BPL $ad8b ; (textInput.s14 + 0)
.s13:
00:ad87 : c9 a0 __ CMP #$a0
00:ad89 : 90 f2 __ BCC $ad7d ; (textInput.s18 + 2)
.s14:
00:ad8b : a4 4f __ LDY T3 + 0 
00:ad8d : c4 53 __ CPY T9 + 0 
00:ad8f : b0 ec __ BCS $ad7d ; (textInput.s18 + 2)
.s15:
00:ad91 : b1 4d __ LDA (T2 + 0),y 
00:ad93 : aa __ __ TAX
00:ad94 : a5 1b __ LDA ACCU + 0 
00:ad96 : 91 4d __ STA (T2 + 0),y 
00:ad98 : e6 4f __ INC T3 + 0 
00:ad9a : 8a __ __ TXA
00:ad9b : f0 cd __ BEQ $ad6a ; (textInput.s44 + 0)
00:ad9d : 4c 8c 32 JMP $328c 
.s19:
00:ada0 : c9 1d __ CMP #$1d
00:ada2 : d0 dc __ BNE $ad80 ; (textInput.s12 + 0)
.s20:
00:ada4 : 20 1a 3d JSR $3d1a 
00:ada7 : a5 1c __ LDA ACCU + 1 
00:ada9 : 30 f2 __ BMI $ad9d ; (textInput.s15 + 12)
.s24:
00:adab : d0 0f __ BNE $adbc ; (textInput.s45 + 0)
.s23:
00:adad : a5 4f __ LDA T3 + 0 
00:adaf : c5 1b __ CMP ACCU + 0 
00:adb1 : b0 ea __ BCS $ad9d ; (textInput.s15 + 12)
.s21:
00:adb3 : c5 53 __ CMP T9 + 0 
00:adb5 : b0 e6 __ BCS $ad9d ; (textInput.s15 + 12)
.s22:
00:adb7 : e6 4f __ INC T3 + 0 
00:adb9 : 4c 8c 32 JMP $328c 
.s45:
00:adbc : a5 4f __ LDA T3 + 0 
00:adbe : 4c b3 33 JMP $33b3 
.s32:
00:adc1 : c9 0d __ CMP #$0d
00:adc3 : d0 62 __ BNE $ae27 ; (textInput.s33 + 0)
.s41:
00:adc5 : 20 1a 3d JSR $3d1a 
00:adc8 : a9 00 __ LDA #$00
00:adca : 85 0d __ STA P0 
00:adcc : a4 1b __ LDY ACCU + 0 
00:adce : 91 4d __ STA (T2 + 0),y 
00:add0 : 20 6c 34 JSR $346c 
00:add3 : a5 55 __ LDA T11 + 0 
00:add5 : 85 0e __ STA P1 
00:add7 : 8d 69 49 STA $4969 ; (cw.cy + 0)
00:adda : a5 54 __ LDA T10 + 0 
00:addc : 85 0f __ STA P2 
00:adde : a9 01 __ LDA #$01
00:ade0 : 85 10 __ STA P3 
00:ade2 : a9 00 __ LDA #$00
00:ade4 : 8d 68 49 STA $4968 ; (cw.cx + 0)
00:ade7 : 20 fa 3c JSR $3cfa 
00:adea : a5 50 __ LDA T6 + 0 
00:adec : 85 0f __ STA P2 
00:adee : a9 72 __ LDA #$72
00:adf0 : 85 0d __ STA P0 
00:adf2 : a9 49 __ LDA #$49
00:adf4 : 85 0e __ STA P1 
00:adf6 : a5 51 __ LDA T6 + 1 
00:adf8 : 85 10 __ STA P3 
00:adfa : a5 52 __ LDA T8 + 0 
00:adfc : 85 11 __ STA P4 
00:adfe : 20 f4 1f JSR $1ff4 
00:ae01 : a9 72 __ LDA #$72
00:ae03 : 8d e5 7f STA $7fe5 ; (sstack + 6)
00:ae06 : a9 49 __ LDA #$49
00:ae08 : 8d e6 7f STA $7fe6 ; (sstack + 7)
00:ae0b : a9 00 __ LDA #$00
00:ae0d : a6 54 __ LDX T10 + 0 
00:ae0f : 9d 71 49 STA $4971,x ; (vspriteScreen + 1)
00:ae12 : ad 5e 49 LDA $495e ; (cfg.colors.text_input + 0)
00:ae15 : 85 18 __ STA P11 
00:ae17 : a9 69 __ LDA #$69
00:ae19 : 8d e3 7f STA $7fe3 ; (sstack + 4)
00:ae1c : a9 34 __ LDA #$34
00:ae1e : 8d e4 7f STA $7fe4 ; (sstack + 5)
00:ae21 : 20 25 15 JSR $1525 
00:ae24 : 4c 35 34 JMP $3435 
.s33:
00:ae27 : b0 1c __ BCS $ae45 ; (textInput.s34 + 0)
.s39:
00:ae29 : c9 03 __ CMP #$03
00:ae2b : f0 03 __ BEQ $ae30 ; (textInput.s40 + 0)
00:ae2d : 4c 80 33 JMP $3380 
.s40:
00:ae30 : a9 00 __ LDA #$00
00:ae32 : 20 6c 34 JSR $346c 
.s3:
00:ae35 : ad f1 7e LDA $7ef1 ; (textInput@stack + 0)
00:ae38 : 85 53 __ STA T9 + 0 
00:ae3a : ad f2 7e LDA $7ef2 ; (textInput@stack + 1)
00:ae3d : 85 54 __ STA T10 + 0 
00:ae3f : ad f3 7e LDA $7ef3 ; (textInput@stack + 2)
00:ae42 : 85 55 __ STA T11 + 0 
00:ae44 : 60 __ __ RTS
.s34:
00:ae45 : c9 14 __ CMP #$14
00:ae47 : d0 e4 __ BNE $ae2d ; (textInput.s39 + 4)
.s35:
00:ae49 : a5 4f __ LDA T3 + 0 
00:ae4b : d0 03 __ BNE $ae50 ; (textInput.s36 + 0)
00:ae4d : 4c 8c 32 JMP $328c 
.s36:
00:ae50 : c6 4f __ DEC T3 + 0 
00:ae52 : a5 4f __ LDA T3 + 0 
00:ae54 : 85 1b __ STA ACCU + 0 
00:ae56 : 4c 5b 34 JMP $345b 
.s38:
00:ae59 : e6 1b __ INC ACCU + 0 
.l37:
00:ae5b : a4 1b __ LDY ACCU + 0 
00:ae5d : c8 __ __ INY
00:ae5e : b1 4d __ LDA (T2 + 0),y 
00:ae60 : 88 __ __ DEY
00:ae61 : 91 4d __ STA (T2 + 0),y 
00:ae63 : aa __ __ TAX
00:ae64 : d0 f3 __ BNE $ae59 ; (textInput.s38 + 0)
00:ae66 : 4c 8c 32 JMP $328c 
--------------------------------------------------------------------
00:ae69 : __ __ __ BYT 25 53 00                                        : %S.
--------------------------------------------------------------------
cwin_cursor_show: ; cwin_cursor_show(struct CharWin*,bool)->void
;  29, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
00:ae6c : aa __ __ TAX
00:ae6d : ad 69 49 LDA $4969 ; (cw.cy + 0)
00:ae70 : 0a __ __ ASL
00:ae71 : a8 __ __ TAY
00:ae72 : ad 6c 49 LDA $496c ; (cw.sp + 0)
00:ae75 : 79 50 3d ADC $3d50,y 
00:ae78 : 85 1b __ STA ACCU + 0 
00:ae7a : ad 6d 49 LDA $496d ; (cw.sp + 1)
00:ae7d : 79 51 3d ADC $3d51,y 
00:ae80 : 85 1c __ STA ACCU + 1 
00:ae82 : ac 68 49 LDY $4968 ; (cw.cx + 0)
00:ae85 : 8a __ __ TXA
00:ae86 : d0 07 __ BNE $ae8f ; (cwin_cursor_show.s7 + 0)
.s5:
00:ae88 : b1 1b __ LDA (ACCU + 0),y 
00:ae8a : 29 7f __ AND #$7f
00:ae8c : 91 1b __ STA (ACCU + 0),y 
00:ae8e : 60 __ __ RTS
.s7:
00:ae8f : b1 1b __ LDA (ACCU + 0),y 
00:ae91 : 09 80 __ ORA #$80
.s6:
00:ae93 : 91 1b __ STA (ACCU + 0),y 
.s3:
00:ae95 : 60 __ __ RTS
--------------------------------------------------------------------
memcpy@proxy: ; memcpy@proxy
00:ae96 : a9 c8 __ LDA #$c8
00:ae98 : 85 0d __ STA P0 
00:ae9a : a9 4d __ LDA #$4d
00:ae9c : 85 0e __ STA P1 
00:ae9e : a9 b4 __ LDA #$b4
00:aea0 : 85 0f __ STA P2 
00:aea2 : a9 77 __ LDA #$77
00:aea4 : 85 10 __ STA P3 
00:aea6 : a9 50 __ LDA #$50
00:aea8 : 85 11 __ STA P4 
00:aeaa : a9 05 __ LDA #$05
00:aeac : 85 12 __ STA P5 
--------------------------------------------------------------------
memcpy: ; memcpy(void*,const void*,i16)->void
;  30, "/home/xahmol/oscar64/include/string.h"
.s4:
00:aeae : a6 12 __ LDX P5 
00:aeb0 : f0 10 __ BEQ $aec2 ; (memcpy.s4 + 20)
00:aeb2 : a0 00 __ LDY #$00
00:aeb4 : b1 0f __ LDA (P2),y 
00:aeb6 : 91 0d __ STA (P0),y 
00:aeb8 : c8 __ __ INY
00:aeb9 : d0 f9 __ BNE $aeb4 ; (memcpy.s4 + 6)
00:aebb : e6 10 __ INC P3 
00:aebd : e6 0e __ INC P1 
00:aebf : ca __ __ DEX
00:aec0 : d0 f2 __ BNE $aeb4 ; (memcpy.s4 + 6)
00:aec2 : a4 11 __ LDY P4 
00:aec4 : f0 0e __ BEQ $aed4 ; (memcpy.s3 + 0)
00:aec6 : 88 __ __ DEY
00:aec7 : f0 07 __ BEQ $aed0 ; (memcpy.s4 + 34)
00:aec9 : b1 0f __ LDA (P2),y 
00:aecb : 91 0d __ STA (P0),y 
00:aecd : 88 __ __ DEY
00:aece : d0 f9 __ BNE $aec9 ; (memcpy.s4 + 27)
00:aed0 : b1 0f __ LDA (P2),y 
00:aed2 : 91 0d __ STA (P0),y 
.s3:
00:aed4 : 60 __ __ RTS
--------------------------------------------------------------------
strtol: ; strtol(const u8*,const u8**,u8)->i32
;  42, "/home/xahmol/oscar64/include/stdlib.h"
.s4:
00:aed5 : a5 10 __ LDA P3 ; (endp + 1)
00:aed7 : 05 0f __ ORA P2 ; (endp + 0)
00:aed9 : f0 0b __ BEQ $aee6 ; (strtol.s5 + 0)
.s32:
00:aedb : a5 0d __ LDA P0 ; (s + 0)
00:aedd : a0 00 __ LDY #$00
00:aedf : 91 0f __ STA (P2),y ; (endp + 0)
00:aee1 : a5 0e __ LDA P1 ; (s + 1)
00:aee3 : c8 __ __ INY
00:aee4 : 91 0f __ STA (P2),y ; (endp + 0)
.s5:
00:aee6 : a0 00 __ LDY #$00
00:aee8 : b1 0d __ LDA (P0),y ; (s + 0)
00:aeea : aa __ __ TAX
00:aeeb : a9 0a __ LDA #$0a
00:aeed : 85 47 __ STA T4 + 0 
.l6:
00:aeef : 8a __ __ TXA
00:aef0 : e0 21 __ CPX #$21
00:aef2 : a8 __ __ TAY
00:aef3 : b0 18 __ BCS $af0d ; (strtol.s7 + 0)
.s29:
00:aef5 : f0 0d __ BEQ $af04 ; (strtol.s30 + 0)
.s31:
00:aef7 : a0 01 __ LDY #$01
00:aef9 : b1 0d __ LDA (P0),y ; (s + 0)
00:aefb : aa __ __ TAX
00:aefc : e6 0d __ INC P0 ; (s + 0)
00:aefe : d0 ef __ BNE $aeef ; (strtol.l6 + 0)
.s35:
00:af00 : e6 0e __ INC P1 ; (s + 1)
00:af02 : 90 eb __ BCC $aeef ; (strtol.l6 + 0)
.s30:
00:af04 : 85 1b __ STA ACCU + 0 
00:af06 : 85 1c __ STA ACCU + 1 
00:af08 : 85 1d __ STA ACCU + 2 
00:af0a : 85 1e __ STA ACCU + 3 
.s3:
00:af0c : 60 __ __ RTS
.s7:
00:af0d : c9 2d __ CMP #$2d
00:af0f : d0 06 __ BNE $af17 ; (strtol.s8 + 0)
.s28:
00:af11 : a9 ff __ LDA #$ff
00:af13 : 85 48 __ STA T5 + 0 
00:af15 : d0 0b __ BNE $af22 ; (strtol.s27 + 0)
.s8:
00:af17 : 85 43 __ STA T2 + 0 
00:af19 : a9 00 __ LDA #$00
00:af1b : 85 48 __ STA T5 + 0 
00:af1d : 8a __ __ TXA
00:af1e : e0 2b __ CPX #$2b
00:af20 : d0 0c __ BNE $af2e ; (strtol.s9 + 0)
.s27:
00:af22 : a0 01 __ LDY #$01
00:af24 : b1 0d __ LDA (P0),y ; (s + 0)
00:af26 : 85 43 __ STA T2 + 0 
00:af28 : e6 0d __ INC P0 ; (s + 0)
00:af2a : d0 02 __ BNE $af2e ; (strtol.s9 + 0)
.s34:
00:af2c : e6 0e __ INC P1 ; (s + 1)
.s9:
00:af2e : c9 30 __ CMP #$30
00:af30 : d0 34 __ BNE $af66 ; (strtol.s10 + 0)
.s24:
00:af32 : a5 0d __ LDA P0 ; (s + 0)
00:af34 : 85 1b __ STA ACCU + 0 
00:af36 : 69 00 __ ADC #$00
00:af38 : 85 0d __ STA P0 ; (s + 0)
00:af3a : a5 0e __ LDA P1 ; (s + 1)
00:af3c : 85 1c __ STA ACCU + 1 
00:af3e : 69 00 __ ADC #$00
00:af40 : 85 0e __ STA P1 ; (s + 1)
00:af42 : a0 01 __ LDY #$01
00:af44 : b1 1b __ LDA (ACCU + 0),y 
00:af46 : c9 78 __ CMP #$78
00:af48 : f0 06 __ BEQ $af50 ; (strtol.s26 + 0)
.s25:
00:af4a : 85 43 __ STA T2 + 0 
00:af4c : c9 58 __ CMP #$58
00:af4e : d0 16 __ BNE $af66 ; (strtol.s10 + 0)
.s26:
00:af50 : a5 1b __ LDA ACCU + 0 
00:af52 : 69 01 __ ADC #$01
00:af54 : 85 0d __ STA P0 ; (s + 0)
00:af56 : a5 1c __ LDA ACCU + 1 
00:af58 : 69 00 __ ADC #$00
00:af5a : 85 0e __ STA P1 ; (s + 1)
00:af5c : a9 10 __ LDA #$10
00:af5e : 85 47 __ STA T4 + 0 
00:af60 : a0 02 __ LDY #$02
00:af62 : b1 1b __ LDA (ACCU + 0),y 
00:af64 : 85 43 __ STA T2 + 0 
.s10:
00:af66 : a9 00 __ LDA #$00
00:af68 : 85 1b __ STA ACCU + 0 
00:af6a : 85 1c __ STA ACCU + 1 
00:af6c : 85 1d __ STA ACCU + 2 
00:af6e : 85 1e __ STA ACCU + 3 
00:af70 : a5 43 __ LDA T2 + 0 
00:af72 : c9 30 __ CMP #$30
00:af74 : 90 31 __ BCC $afa7 ; (strtol.s13 + 0)
.l22:
00:af76 : c9 3a __ CMP #$3a
00:af78 : b0 0b __ BCS $af85 ; (strtol.s11 + 0)
.s23:
00:af7a : e9 2f __ SBC #$2f
00:af7c : 85 43 __ STA T2 + 0 
00:af7e : a9 00 __ LDA #$00
00:af80 : e9 00 __ SBC #$00
00:af82 : 4c d7 35 JMP $35d7 
.s11:
00:af85 : c9 61 __ CMP #$61
00:af87 : 90 12 __ BCC $af9b ; (strtol.s12 + 0)
.s20:
00:af89 : c9 67 __ CMP #$67
00:af8b : b0 0e __ BCS $af9b ; (strtol.s12 + 0)
.s21:
00:af8d : a9 a9 __ LDA #$a9
.s33:
00:af8f : 18 __ __ CLC
00:af90 : 65 43 __ ADC T2 + 0 
00:af92 : 85 43 __ STA T2 + 0 
00:af94 : a9 00 __ LDA #$00
00:af96 : 69 ff __ ADC #$ff
00:af98 : 4c d7 35 JMP $35d7 
.s12:
00:af9b : c9 41 __ CMP #$41
00:af9d : 90 08 __ BCC $afa7 ; (strtol.s13 + 0)
.s17:
00:af9f : c9 47 __ CMP #$47
00:afa1 : b0 04 __ BCS $afa7 ; (strtol.s13 + 0)
.s18:
00:afa3 : a9 c9 __ LDA #$c9
00:afa5 : 90 e8 __ BCC $af8f ; (strtol.s33 + 0)
.s13:
00:afa7 : 24 48 __ BIT T5 + 0 
00:afa9 : 10 19 __ BPL $afc4 ; (strtol.s14 + 0)
.s16:
00:afab : 38 __ __ SEC
00:afac : a9 00 __ LDA #$00
00:afae : e5 1b __ SBC ACCU + 0 
00:afb0 : 85 1b __ STA ACCU + 0 
00:afb2 : a9 00 __ LDA #$00
00:afb4 : e5 1c __ SBC ACCU + 1 
00:afb6 : 85 1c __ STA ACCU + 1 
00:afb8 : a9 00 __ LDA #$00
00:afba : e5 1d __ SBC ACCU + 2 
00:afbc : 85 1d __ STA ACCU + 2 
00:afbe : a9 00 __ LDA #$00
00:afc0 : e5 1e __ SBC ACCU + 3 
00:afc2 : 85 1e __ STA ACCU + 3 
.s14:
00:afc4 : a5 10 __ LDA P3 ; (endp + 1)
00:afc6 : 05 0f __ ORA P2 ; (endp + 0)
00:afc8 : d0 01 __ BNE $afcb ; (strtol.s15 + 0)
00:afca : 60 __ __ RTS
.s15:
00:afcb : a5 0d __ LDA P0 ; (s + 0)
00:afcd : a0 00 __ LDY #$00
00:afcf : 91 0f __ STA (P2),y ; (endp + 0)
00:afd1 : a5 0e __ LDA P1 ; (s + 1)
00:afd3 : c8 __ __ INY
00:afd4 : 91 0f __ STA (P2),y ; (endp + 0)
00:afd6 : 60 __ __ RTS
.s19:
00:afd7 : 85 44 __ STA T2 + 1 
00:afd9 : a5 0d __ LDA P0 ; (s + 0)
00:afdb : 85 45 __ STA T3 + 0 
00:afdd : 18 __ __ CLC
00:afde : 69 01 __ ADC #$01
00:afe0 : 85 0d __ STA P0 ; (s + 0)
00:afe2 : a5 0e __ LDA P1 ; (s + 1)
00:afe4 : 85 46 __ STA T3 + 1 
00:afe6 : 69 00 __ ADC #$00
00:afe8 : 85 0e __ STA P1 ; (s + 1)
00:afea : a5 47 __ LDA T4 + 0 
00:afec : 20 4d 36 JSR $364d 
00:afef : 18 __ __ CLC
00:aff0 : a5 43 __ LDA T2 + 0 
00:aff2 : 65 07 __ ADC WORK + 4 
00:aff4 : 85 1b __ STA ACCU + 0 
00:aff6 : a5 44 __ LDA T2 + 1 
00:aff8 : 65 08 __ ADC WORK + 5 
00:affa : 85 1c __ STA ACCU + 1 
00:affc : a5 09 __ LDA WORK + 6 
00:affe : 69 00 __ ADC #$00
00:b000 : 85 1d __ STA ACCU + 2 
00:b002 : a5 0a __ LDA WORK + 7 
00:b004 : 69 00 __ ADC #$00
00:b006 : 85 1e __ STA ACCU + 3 
00:b008 : a0 01 __ LDY #$01
00:b00a : b1 45 __ LDA (T3 + 0),y 
00:b00c : 85 43 __ STA T2 + 0 
00:b00e : c9 30 __ CMP #$30
00:b010 : 90 95 __ BCC $afa7 ; (strtol.s13 + 0)
00:b012 : 4c 76 35 JMP $3576 
--------------------------------------------------------------------
mul16by8: ; mul16by8
00:b015 : 4a __ __ LSR
00:b016 : f0 2e __ BEQ $b046 ; (mul16by8 + 49)
00:b018 : a2 00 __ LDX #$00
00:b01a : a0 00 __ LDY #$00
00:b01c : 90 13 __ BCC $b031 ; (mul16by8 + 28)
00:b01e : a4 1b __ LDY ACCU + 0 
00:b020 : a6 1c __ LDX ACCU + 1 
00:b022 : b0 0d __ BCS $b031 ; (mul16by8 + 28)
00:b024 : 85 02 __ STA $02 
00:b026 : 18 __ __ CLC
00:b027 : 98 __ __ TYA
00:b028 : 65 1b __ ADC ACCU + 0 
00:b02a : a8 __ __ TAY
00:b02b : 8a __ __ TXA
00:b02c : 65 1c __ ADC ACCU + 1 
00:b02e : aa __ __ TAX
00:b02f : a5 02 __ LDA $02 
00:b031 : 06 1b __ ASL ACCU + 0 
00:b033 : 26 1c __ ROL ACCU + 1 
00:b035 : 4a __ __ LSR
00:b036 : 90 f9 __ BCC $b031 ; (mul16by8 + 28)
00:b038 : d0 ea __ BNE $b024 ; (mul16by8 + 15)
00:b03a : 18 __ __ CLC
00:b03b : 98 __ __ TYA
00:b03c : 65 1b __ ADC ACCU + 0 
00:b03e : 85 1b __ STA ACCU + 0 
00:b040 : 8a __ __ TXA
00:b041 : 65 1c __ ADC ACCU + 1 
00:b043 : 85 1c __ STA ACCU + 1 
00:b045 : 60 __ __ RTS
00:b046 : b0 04 __ BCS $b04c ; (mul16by8 + 55)
00:b048 : 85 1b __ STA ACCU + 0 
00:b04a : 85 1c __ STA ACCU + 1 
00:b04c : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
00:b04d : a0 00 __ LDY #$00
00:b04f : 84 07 __ STY WORK + 4 
00:b051 : 84 08 __ STY WORK + 5 
00:b053 : 84 09 __ STY WORK + 6 
00:b055 : 4a __ __ LSR
00:b056 : b0 0d __ BCS $b065 ; (mul32by8 + 24)
00:b058 : f0 26 __ BEQ $b080 ; (mul32by8 + 51)
00:b05a : 06 1b __ ASL ACCU + 0 
00:b05c : 26 1c __ ROL ACCU + 1 
00:b05e : 26 1d __ ROL ACCU + 2 
00:b060 : 26 1e __ ROL ACCU + 3 
00:b062 : 4a __ __ LSR
00:b063 : 90 f5 __ BCC $b05a ; (mul32by8 + 13)
00:b065 : aa __ __ TAX
00:b066 : 18 __ __ CLC
00:b067 : a5 07 __ LDA WORK + 4 
00:b069 : 65 1b __ ADC ACCU + 0 
00:b06b : 85 07 __ STA WORK + 4 
00:b06d : a5 08 __ LDA WORK + 5 
00:b06f : 65 1c __ ADC ACCU + 1 
00:b071 : 85 08 __ STA WORK + 5 
00:b073 : a5 09 __ LDA WORK + 6 
00:b075 : 65 1d __ ADC ACCU + 2 
00:b077 : 85 09 __ STA WORK + 6 
00:b079 : 98 __ __ TYA
00:b07a : 65 1e __ ADC ACCU + 3 
00:b07c : a8 __ __ TAY
00:b07d : 8a __ __ TXA
00:b07e : d0 da __ BNE $b05a ; (mul32by8 + 13)
00:b080 : 84 0a __ STY WORK + 7 
00:b082 : 60 __ __ RTS
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
00:b083 : a9 90 __ LDA #$90
00:b085 : 85 03 __ STA WORK + 0 
00:b087 : a9 01 __ LDA #$01
00:b089 : 85 04 __ STA WORK + 1 
--------------------------------------------------------------------
divmod: ; divmod
00:b08b : a5 1c __ LDA ACCU + 1 
00:b08d : d0 31 __ BNE $b0c0 ; (divmod + 53)
00:b08f : a5 04 __ LDA WORK + 1 
00:b091 : d0 1e __ BNE $b0b1 ; (divmod + 38)
00:b093 : 85 06 __ STA WORK + 3 
00:b095 : a2 04 __ LDX #$04
00:b097 : 06 1b __ ASL ACCU + 0 
00:b099 : 2a __ __ ROL
00:b09a : c5 03 __ CMP WORK + 0 
00:b09c : 90 02 __ BCC $b0a0 ; (divmod + 21)
00:b09e : e5 03 __ SBC WORK + 0 
00:b0a0 : 26 1b __ ROL ACCU + 0 
00:b0a2 : 2a __ __ ROL
00:b0a3 : c5 03 __ CMP WORK + 0 
00:b0a5 : 90 02 __ BCC $b0a9 ; (divmod + 30)
00:b0a7 : e5 03 __ SBC WORK + 0 
00:b0a9 : 26 1b __ ROL ACCU + 0 
00:b0ab : ca __ __ DEX
00:b0ac : d0 eb __ BNE $b099 ; (divmod + 14)
00:b0ae : 85 05 __ STA WORK + 2 
00:b0b0 : 60 __ __ RTS
00:b0b1 : a5 1b __ LDA ACCU + 0 
00:b0b3 : 85 05 __ STA WORK + 2 
00:b0b5 : a5 1c __ LDA ACCU + 1 
00:b0b7 : 85 06 __ STA WORK + 3 
00:b0b9 : a9 00 __ LDA #$00
00:b0bb : 85 1b __ STA ACCU + 0 
00:b0bd : 85 1c __ STA ACCU + 1 
00:b0bf : 60 __ __ RTS
00:b0c0 : a5 04 __ LDA WORK + 1 
00:b0c2 : d0 1f __ BNE $b0e3 ; (divmod + 88)
00:b0c4 : a5 03 __ LDA WORK + 0 
00:b0c6 : 30 1b __ BMI $b0e3 ; (divmod + 88)
00:b0c8 : a9 00 __ LDA #$00
00:b0ca : 85 06 __ STA WORK + 3 
00:b0cc : a2 10 __ LDX #$10
00:b0ce : 06 1b __ ASL ACCU + 0 
00:b0d0 : 26 1c __ ROL ACCU + 1 
00:b0d2 : 2a __ __ ROL
00:b0d3 : c5 03 __ CMP WORK + 0 
00:b0d5 : 90 02 __ BCC $b0d9 ; (divmod + 78)
00:b0d7 : e5 03 __ SBC WORK + 0 
00:b0d9 : 26 1b __ ROL ACCU + 0 
00:b0db : 26 1c __ ROL ACCU + 1 
00:b0dd : ca __ __ DEX
00:b0de : d0 f2 __ BNE $b0d2 ; (divmod + 71)
00:b0e0 : 85 05 __ STA WORK + 2 
00:b0e2 : 60 __ __ RTS
00:b0e3 : a9 00 __ LDA #$00
00:b0e5 : 85 05 __ STA WORK + 2 
00:b0e7 : 85 06 __ STA WORK + 3 
00:b0e9 : 84 02 __ STY $02 
00:b0eb : a0 10 __ LDY #$10
00:b0ed : 18 __ __ CLC
00:b0ee : 26 1b __ ROL ACCU + 0 
00:b0f0 : 26 1c __ ROL ACCU + 1 
00:b0f2 : 26 05 __ ROL WORK + 2 
00:b0f4 : 26 06 __ ROL WORK + 3 
00:b0f6 : 38 __ __ SEC
00:b0f7 : a5 05 __ LDA WORK + 2 
00:b0f9 : e5 03 __ SBC WORK + 0 
00:b0fb : aa __ __ TAX
00:b0fc : a5 06 __ LDA WORK + 3 
00:b0fe : e5 04 __ SBC WORK + 1 
00:b100 : 90 04 __ BCC $b106 ; (divmod + 123)
00:b102 : 86 05 __ STX WORK + 2 
00:b104 : 85 06 __ STA WORK + 3 
00:b106 : 88 __ __ DEY
00:b107 : d0 e5 __ BNE $b0ee ; (divmod + 99)
00:b109 : 26 1b __ ROL ACCU + 0 
00:b10b : 26 1c __ ROL ACCU + 1 
00:b10d : a4 02 __ LDY $02 
00:b10f : 60 __ __ RTS
--------------------------------------------------------------------
divs32@proxy: ; divs32@proxy
00:b110 : a9 3c __ LDA #$3c
00:b112 : 85 03 __ STA WORK + 0 
--------------------------------------------------------------------
divs32: ; divs32
00:b114 : 24 1e __ BIT ACCU + 3 
00:b116 : 10 0d __ BPL $b125 ; (divs32 + 17)
00:b118 : 20 2f 37 JSR $372f 
00:b11b : 24 06 __ BIT WORK + 3 
00:b11d : 10 0d __ BPL $b12c ; (divs32 + 24)
00:b11f : 20 49 37 JSR $3749 
00:b122 : 4c 85 37 JMP $3785 
00:b125 : 24 06 __ BIT WORK + 3 
00:b127 : 10 f9 __ BPL $b122 ; (divs32 + 14)
00:b129 : 20 49 37 JSR $3749 
00:b12c : 20 85 37 JSR $3785 
--------------------------------------------------------------------
negaccu32: ; negaccu32
00:b12f : 38 __ __ SEC
00:b130 : a9 00 __ LDA #$00
00:b132 : e5 1b __ SBC ACCU + 0 
00:b134 : 85 1b __ STA ACCU + 0 
00:b136 : a9 00 __ LDA #$00
00:b138 : e5 1c __ SBC ACCU + 1 
00:b13a : 85 1c __ STA ACCU + 1 
00:b13c : a9 00 __ LDA #$00
00:b13e : e5 1d __ SBC ACCU + 2 
00:b140 : 85 1d __ STA ACCU + 2 
00:b142 : a9 00 __ LDA #$00
00:b144 : e5 1e __ SBC ACCU + 3 
00:b146 : 85 1e __ STA ACCU + 3 
00:b148 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
00:b149 : 38 __ __ SEC
00:b14a : a9 00 __ LDA #$00
00:b14c : e5 03 __ SBC WORK + 0 
00:b14e : 85 03 __ STA WORK + 0 
00:b150 : a9 00 __ LDA #$00
00:b152 : e5 04 __ SBC WORK + 1 
00:b154 : 85 04 __ STA WORK + 1 
00:b156 : a9 00 __ LDA #$00
00:b158 : e5 05 __ SBC WORK + 2 
00:b15a : 85 05 __ STA WORK + 2 
00:b15c : a9 00 __ LDA #$00
00:b15e : e5 06 __ SBC WORK + 3 
00:b160 : 85 06 __ STA WORK + 3 
00:b162 : 60 __ __ RTS
--------------------------------------------------------------------
mods32@proxy: ; mods32@proxy
00:b163 : a9 3c __ LDA #$3c
00:b165 : 85 03 __ STA WORK + 0 
--------------------------------------------------------------------
mods32: ; mods32
00:b167 : 24 1e __ BIT ACCU + 3 
00:b169 : 10 13 __ BPL $b17e ; (mods32 + 23)
00:b16b : 20 2f 37 JSR $372f 
00:b16e : 24 06 __ BIT WORK + 3 
00:b170 : 10 03 __ BPL $b175 ; (mods32 + 14)
00:b172 : 20 49 37 JSR $3749 
00:b175 : 20 85 37 JSR $3785 
00:b178 : 4c 86 38 JMP $3886 
00:b17b : 4c 85 37 JMP $3785 
00:b17e : 24 06 __ BIT WORK + 3 
00:b180 : 10 f9 __ BPL $b17b ; (mods32 + 20)
00:b182 : 20 49 37 JSR $3749 
--------------------------------------------------------------------
divmod32: ; divmod32
00:b185 : 84 02 __ STY $02 
00:b187 : a0 20 __ LDY #$20
00:b189 : a9 00 __ LDA #$00
00:b18b : 85 07 __ STA WORK + 4 
00:b18d : 85 08 __ STA WORK + 5 
00:b18f : 85 09 __ STA WORK + 6 
00:b191 : 85 0a __ STA WORK + 7 
00:b193 : a5 05 __ LDA WORK + 2 
00:b195 : 05 06 __ ORA WORK + 3 
00:b197 : d0 78 __ BNE $b211 ; (divmod32 + 140)
00:b199 : a5 04 __ LDA WORK + 1 
00:b19b : d0 27 __ BNE $b1c4 ; (divmod32 + 63)
00:b19d : 18 __ __ CLC
00:b19e : 26 1b __ ROL ACCU + 0 
00:b1a0 : 26 1c __ ROL ACCU + 1 
00:b1a2 : 26 1d __ ROL ACCU + 2 
00:b1a4 : 26 1e __ ROL ACCU + 3 
00:b1a6 : 2a __ __ ROL
00:b1a7 : 90 05 __ BCC $b1ae ; (divmod32 + 41)
00:b1a9 : e5 03 __ SBC WORK + 0 
00:b1ab : 38 __ __ SEC
00:b1ac : b0 06 __ BCS $b1b4 ; (divmod32 + 47)
00:b1ae : c5 03 __ CMP WORK + 0 
00:b1b0 : 90 02 __ BCC $b1b4 ; (divmod32 + 47)
00:b1b2 : e5 03 __ SBC WORK + 0 
00:b1b4 : 88 __ __ DEY
00:b1b5 : d0 e7 __ BNE $b19e ; (divmod32 + 25)
00:b1b7 : 85 07 __ STA WORK + 4 
00:b1b9 : 26 1b __ ROL ACCU + 0 
00:b1bb : 26 1c __ ROL ACCU + 1 
00:b1bd : 26 1d __ ROL ACCU + 2 
00:b1bf : 26 1e __ ROL ACCU + 3 
00:b1c1 : a4 02 __ LDY $02 
00:b1c3 : 60 __ __ RTS
00:b1c4 : a5 1e __ LDA ACCU + 3 
00:b1c6 : d0 10 __ BNE $b1d8 ; (divmod32 + 83)
00:b1c8 : a6 1d __ LDX ACCU + 2 
00:b1ca : 86 1e __ STX ACCU + 3 
00:b1cc : a6 1c __ LDX ACCU + 1 
00:b1ce : 86 1d __ STX ACCU + 2 
00:b1d0 : a6 1b __ LDX ACCU + 0 
00:b1d2 : 86 1c __ STX ACCU + 1 
00:b1d4 : 85 1b __ STA ACCU + 0 
00:b1d6 : a0 18 __ LDY #$18
00:b1d8 : 18 __ __ CLC
00:b1d9 : 26 1b __ ROL ACCU + 0 
00:b1db : 26 1c __ ROL ACCU + 1 
00:b1dd : 26 1d __ ROL ACCU + 2 
00:b1df : 26 1e __ ROL ACCU + 3 
00:b1e1 : 26 07 __ ROL WORK + 4 
00:b1e3 : 26 08 __ ROL WORK + 5 
00:b1e5 : 90 0c __ BCC $b1f3 ; (divmod32 + 110)
00:b1e7 : a5 07 __ LDA WORK + 4 
00:b1e9 : e5 03 __ SBC WORK + 0 
00:b1eb : aa __ __ TAX
00:b1ec : a5 08 __ LDA WORK + 5 
00:b1ee : e5 04 __ SBC WORK + 1 
00:b1f0 : 38 __ __ SEC
00:b1f1 : b0 0c __ BCS $b1ff ; (divmod32 + 122)
00:b1f3 : 38 __ __ SEC
00:b1f4 : a5 07 __ LDA WORK + 4 
00:b1f6 : e5 03 __ SBC WORK + 0 
00:b1f8 : aa __ __ TAX
00:b1f9 : a5 08 __ LDA WORK + 5 
00:b1fb : e5 04 __ SBC WORK + 1 
00:b1fd : 90 04 __ BCC $b203 ; (divmod32 + 126)
00:b1ff : 86 07 __ STX WORK + 4 
00:b201 : 85 08 __ STA WORK + 5 
00:b203 : 88 __ __ DEY
00:b204 : d0 d3 __ BNE $b1d9 ; (divmod32 + 84)
00:b206 : 26 1b __ ROL ACCU + 0 
00:b208 : 26 1c __ ROL ACCU + 1 
00:b20a : 26 1d __ ROL ACCU + 2 
00:b20c : 26 1e __ ROL ACCU + 3 
00:b20e : a4 02 __ LDY $02 
00:b210 : 60 __ __ RTS
00:b211 : a0 10 __ LDY #$10
00:b213 : a5 1e __ LDA ACCU + 3 
00:b215 : 85 08 __ STA WORK + 5 
00:b217 : a5 1d __ LDA ACCU + 2 
00:b219 : 85 07 __ STA WORK + 4 
00:b21b : a9 00 __ LDA #$00
00:b21d : 85 1d __ STA ACCU + 2 
00:b21f : 85 1e __ STA ACCU + 3 
00:b221 : 18 __ __ CLC
00:b222 : 26 1b __ ROL ACCU + 0 
00:b224 : 26 1c __ ROL ACCU + 1 
00:b226 : 26 07 __ ROL WORK + 4 
00:b228 : 26 08 __ ROL WORK + 5 
00:b22a : 26 09 __ ROL WORK + 6 
00:b22c : 26 0a __ ROL WORK + 7 
00:b22e : a5 07 __ LDA WORK + 4 
00:b230 : c5 03 __ CMP WORK + 0 
00:b232 : a5 08 __ LDA WORK + 5 
00:b234 : e5 04 __ SBC WORK + 1 
00:b236 : a5 09 __ LDA WORK + 6 
00:b238 : e5 05 __ SBC WORK + 2 
00:b23a : aa __ __ TAX
00:b23b : a5 0a __ LDA WORK + 7 
00:b23d : e5 06 __ SBC WORK + 3 
00:b23f : 90 11 __ BCC $b252 ; (divmod32 + 205)
00:b241 : 86 09 __ STX WORK + 6 
00:b243 : 85 0a __ STA WORK + 7 
00:b245 : a5 07 __ LDA WORK + 4 
00:b247 : e5 03 __ SBC WORK + 0 
00:b249 : 85 07 __ STA WORK + 4 
00:b24b : a5 08 __ LDA WORK + 5 
00:b24d : e5 04 __ SBC WORK + 1 
00:b24f : 85 08 __ STA WORK + 5 
00:b251 : 38 __ __ SEC
00:b252 : 88 __ __ DEY
00:b253 : d0 cd __ BNE $b222 ; (divmod32 + 157)
00:b255 : 26 1b __ ROL ACCU + 0 
00:b257 : 26 1c __ ROL ACCU + 1 
00:b259 : a4 02 __ LDY $02 
00:b25b : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32b: ; negtmp32b
00:b286 : 38 __ __ SEC
00:b287 : a9 00 __ LDA #$00
00:b289 : e5 07 __ SBC WORK + 4 
00:b28b : 85 07 __ STA WORK + 4 
00:b28d : a9 00 __ LDA #$00
00:b28f : e5 08 __ SBC WORK + 5 
00:b291 : 85 08 __ STA WORK + 5 
00:b293 : a9 00 __ LDA #$00
00:b295 : e5 09 __ SBC WORK + 6 
00:b297 : 85 09 __ STA WORK + 6 
00:b299 : a9 00 __ LDA #$00
00:b29b : e5 0a __ SBC WORK + 7 
00:b29d : 85 0a __ STA WORK + 7 
00:b29f : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
00:b2a0 : 18 __ __ CLC
00:b2a1 : a5 1b __ LDA ACCU + 0 
00:b2a3 : 69 0d __ ADC #$0d
00:b2a5 : 29 fc __ AND #$fc
00:b2a7 : 85 03 __ STA WORK + 0 
00:b2a9 : a5 1c __ LDA ACCU + 1 
00:b2ab : 69 00 __ ADC #$00
00:b2ad : 85 04 __ STA WORK + 1 
00:b2af : ad eb 54 LDA $54eb ; (HeapNode.end + 0)
00:b2b2 : d0 26 __ BNE $b2da ; (crt_malloc + 58)
00:b2b4 : a9 00 __ LDA #$00
00:b2b6 : 8d 9a 58 STA $589a 
00:b2b9 : 8d 9b 58 STA $589b 
00:b2bc : ee eb 54 INC $54eb ; (HeapNode.end + 0)
00:b2bf : a9 98 __ LDA #$98
00:b2c1 : 09 02 __ ORA #$02
00:b2c3 : 8d e9 54 STA $54e9 ; (HeapNode.next + 0)
00:b2c6 : a9 58 __ LDA #$58
00:b2c8 : 8d ea 54 STA $54ea ; (HeapNode.next + 1)
00:b2cb : 38 __ __ SEC
00:b2cc : a9 00 __ LDA #$00
00:b2ce : e9 02 __ SBC #$02
00:b2d0 : 8d 9c 58 STA $589c 
00:b2d3 : a9 70 __ LDA #$70
00:b2d5 : e9 00 __ SBC #$00
00:b2d7 : 8d 9d 58 STA $589d 
00:b2da : a9 e9 __ LDA #$e9
00:b2dc : a2 54 __ LDX #$54
00:b2de : 85 1d __ STA ACCU + 2 
00:b2e0 : 86 1e __ STX ACCU + 3 
00:b2e2 : 18 __ __ CLC
00:b2e3 : a0 00 __ LDY #$00
00:b2e5 : b1 1d __ LDA (ACCU + 2),y 
00:b2e7 : 85 1b __ STA ACCU + 0 
00:b2e9 : 65 03 __ ADC WORK + 0 
00:b2eb : 85 05 __ STA WORK + 2 
00:b2ed : c8 __ __ INY
00:b2ee : b1 1d __ LDA (ACCU + 2),y 
00:b2f0 : 85 1c __ STA ACCU + 1 
00:b2f2 : f0 20 __ BEQ $b314 ; (crt_malloc + 116)
00:b2f4 : 65 04 __ ADC WORK + 1 
00:b2f6 : 85 06 __ STA WORK + 3 
00:b2f8 : b0 14 __ BCS $b30e ; (crt_malloc + 110)
00:b2fa : a0 02 __ LDY #$02
00:b2fc : b1 1b __ LDA (ACCU + 0),y 
00:b2fe : c5 05 __ CMP WORK + 2 
00:b300 : c8 __ __ INY
00:b301 : b1 1b __ LDA (ACCU + 0),y 
00:b303 : e5 06 __ SBC WORK + 3 
00:b305 : b0 0f __ BCS $b316 ; (crt_malloc + 118)
00:b307 : a5 1b __ LDA ACCU + 0 
00:b309 : a6 1c __ LDX ACCU + 1 
00:b30b : 4c de 38 JMP $38de 
00:b30e : a9 00 __ LDA #$00
00:b310 : 85 1b __ STA ACCU + 0 
00:b312 : 85 1c __ STA ACCU + 1 
00:b314 : 02 __ __ INV
00:b315 : 60 __ __ RTS
00:b316 : a5 05 __ LDA WORK + 2 
00:b318 : 85 07 __ STA WORK + 4 
00:b31a : a5 06 __ LDA WORK + 3 
00:b31c : 85 08 __ STA WORK + 5 
00:b31e : a0 02 __ LDY #$02
00:b320 : a5 07 __ LDA WORK + 4 
00:b322 : d1 1b __ CMP (ACCU + 0),y 
00:b324 : d0 15 __ BNE $b33b ; (crt_malloc + 155)
00:b326 : c8 __ __ INY
00:b327 : a5 08 __ LDA WORK + 5 
00:b329 : d1 1b __ CMP (ACCU + 0),y 
00:b32b : d0 0e __ BNE $b33b ; (crt_malloc + 155)
00:b32d : a0 00 __ LDY #$00
00:b32f : b1 1b __ LDA (ACCU + 0),y 
00:b331 : 91 1d __ STA (ACCU + 2),y 
00:b333 : c8 __ __ INY
00:b334 : b1 1b __ LDA (ACCU + 0),y 
00:b336 : 91 1d __ STA (ACCU + 2),y 
00:b338 : 4c 58 39 JMP $3958 
00:b33b : a0 00 __ LDY #$00
00:b33d : b1 1b __ LDA (ACCU + 0),y 
00:b33f : 91 07 __ STA (WORK + 4),y 
00:b341 : a5 07 __ LDA WORK + 4 
00:b343 : 91 1d __ STA (ACCU + 2),y 
00:b345 : c8 __ __ INY
00:b346 : b1 1b __ LDA (ACCU + 0),y 
00:b348 : 91 07 __ STA (WORK + 4),y 
00:b34a : a5 08 __ LDA WORK + 5 
00:b34c : 91 1d __ STA (ACCU + 2),y 
00:b34e : c8 __ __ INY
00:b34f : b1 1b __ LDA (ACCU + 0),y 
00:b351 : 91 07 __ STA (WORK + 4),y 
00:b353 : c8 __ __ INY
00:b354 : b1 1b __ LDA (ACCU + 0),y 
00:b356 : 91 07 __ STA (WORK + 4),y 
00:b358 : a0 00 __ LDY #$00
00:b35a : a5 05 __ LDA WORK + 2 
00:b35c : 91 1b __ STA (ACCU + 0),y 
00:b35e : c8 __ __ INY
00:b35f : a5 06 __ LDA WORK + 3 
00:b361 : 91 1b __ STA (ACCU + 0),y 
00:b363 : a0 02 __ LDY #$02
00:b365 : a9 bd __ LDA #$bd
00:b367 : 91 1b __ STA (ACCU + 0),y 
00:b369 : c8 __ __ INY
00:b36a : 91 1b __ STA (ACCU + 0),y 
00:b36c : c8 __ __ INY
00:b36d : 91 1b __ STA (ACCU + 0),y 
00:b36f : c8 __ __ INY
00:b370 : 91 1b __ STA (ACCU + 0),y 
00:b372 : 38 __ __ SEC
00:b373 : a5 05 __ LDA WORK + 2 
00:b375 : e9 04 __ SBC #$04
00:b377 : 85 05 __ STA WORK + 2 
00:b379 : b0 02 __ BCS $b37d ; (crt_malloc + 221)
00:b37b : c6 06 __ DEC WORK + 3 
00:b37d : a9 be __ LDA #$be
00:b37f : a0 00 __ LDY #$00
00:b381 : 91 05 __ STA (WORK + 2),y 
00:b383 : c8 __ __ INY
00:b384 : 91 05 __ STA (WORK + 2),y 
00:b386 : c8 __ __ INY
00:b387 : 91 05 __ STA (WORK + 2),y 
00:b389 : c8 __ __ INY
00:b38a : 91 05 __ STA (WORK + 2),y 
00:b38c : 18 __ __ CLC
00:b38d : a5 1b __ LDA ACCU + 0 
00:b38f : 69 06 __ ADC #$06
00:b391 : 85 1b __ STA ACCU + 0 
00:b393 : 90 02 __ BCC $b397 ; (crt_malloc + 247)
00:b395 : e6 1c __ INC ACCU + 1 
00:b397 : 60 __ __ RTS
--------------------------------------------------------------------
crt_free@proxy: ; crt_free@proxy
00:b398 : a5 0d __ LDA P0 
00:b39a : 85 1b __ STA ACCU + 0 
00:b39c : a5 0e __ LDA P1 
00:b39e : 85 1c __ STA ACCU + 1 
--------------------------------------------------------------------
crt_free: ; crt_free
00:b3a0 : a5 1b __ LDA ACCU + 0 
00:b3a2 : 05 1c __ ORA ACCU + 1 
00:b3a4 : d0 01 __ BNE $b3a7 ; (crt_free + 7)
00:b3a6 : 60 __ __ RTS
00:b3a7 : 38 __ __ SEC
00:b3a8 : a5 1b __ LDA ACCU + 0 
00:b3aa : 29 03 __ AND #$03
00:b3ac : d0 56 __ BNE $b404 ; (crt_free + 100)
00:b3ae : a5 1b __ LDA ACCU + 0 
00:b3b0 : e9 06 __ SBC #$06
00:b3b2 : 85 1b __ STA ACCU + 0 
00:b3b4 : b0 02 __ BCS $b3b8 ; (crt_free + 24)
00:b3b6 : c6 1c __ DEC ACCU + 1 
00:b3b8 : a0 02 __ LDY #$02
00:b3ba : a9 bd __ LDA #$bd
00:b3bc : d1 1b __ CMP (ACCU + 0),y 
00:b3be : d0 44 __ BNE $b404 ; (crt_free + 100)
00:b3c0 : c8 __ __ INY
00:b3c1 : d1 1b __ CMP (ACCU + 0),y 
00:b3c3 : d0 3f __ BNE $b404 ; (crt_free + 100)
00:b3c5 : c8 __ __ INY
00:b3c6 : d1 1b __ CMP (ACCU + 0),y 
00:b3c8 : d0 3a __ BNE $b404 ; (crt_free + 100)
00:b3ca : c8 __ __ INY
00:b3cb : d1 1b __ CMP (ACCU + 0),y 
00:b3cd : d0 35 __ BNE $b404 ; (crt_free + 100)
00:b3cf : a0 00 __ LDY #$00
00:b3d1 : 38 __ __ SEC
00:b3d2 : b1 1b __ LDA (ACCU + 0),y 
00:b3d4 : e9 04 __ SBC #$04
00:b3d6 : 85 03 __ STA WORK + 0 
00:b3d8 : c8 __ __ INY
00:b3d9 : b1 1b __ LDA (ACCU + 0),y 
00:b3db : e9 00 __ SBC #$00
00:b3dd : 85 04 __ STA WORK + 1 
00:b3df : a0 00 __ LDY #$00
00:b3e1 : a9 be __ LDA #$be
00:b3e3 : d1 03 __ CMP (WORK + 0),y 
00:b3e5 : d0 1d __ BNE $b404 ; (crt_free + 100)
00:b3e7 : c8 __ __ INY
00:b3e8 : d1 03 __ CMP (WORK + 0),y 
00:b3ea : d0 18 __ BNE $b404 ; (crt_free + 100)
00:b3ec : c8 __ __ INY
00:b3ed : d1 03 __ CMP (WORK + 0),y 
00:b3ef : d0 13 __ BNE $b404 ; (crt_free + 100)
00:b3f1 : c8 __ __ INY
00:b3f2 : d1 03 __ CMP (WORK + 0),y 
00:b3f4 : d0 0e __ BNE $b404 ; (crt_free + 100)
00:b3f6 : a5 1c __ LDA ACCU + 1 
00:b3f8 : a6 1b __ LDX ACCU + 0 
00:b3fa : c9 58 __ CMP #$58
00:b3fc : 90 06 __ BCC $b404 ; (crt_free + 100)
00:b3fe : d0 05 __ BNE $b405 ; (crt_free + 101)
00:b400 : e0 98 __ CPX #$98
00:b402 : b0 01 __ BCS $b405 ; (crt_free + 101)
00:b404 : 02 __ __ INV
00:b405 : c9 70 __ CMP #$70
00:b407 : 90 06 __ BCC $b40f ; (crt_free + 111)
00:b409 : d0 f9 __ BNE $b404 ; (crt_free + 100)
00:b40b : e0 00 __ CPX #$00
00:b40d : b0 f5 __ BCS $b404 ; (crt_free + 100)
00:b40f : a0 02 __ LDY #$02
00:b411 : a9 bf __ LDA #$bf
00:b413 : 91 1b __ STA (ACCU + 0),y 
00:b415 : c8 __ __ INY
00:b416 : 91 1b __ STA (ACCU + 0),y 
00:b418 : a0 00 __ LDY #$00
00:b41a : b1 1b __ LDA (ACCU + 0),y 
00:b41c : 85 1d __ STA ACCU + 2 
00:b41e : c8 __ __ INY
00:b41f : b1 1b __ LDA (ACCU + 0),y 
00:b421 : 85 1e __ STA ACCU + 3 
00:b423 : a9 e9 __ LDA #$e9
00:b425 : a2 54 __ LDX #$54
00:b427 : 85 05 __ STA WORK + 2 
00:b429 : 86 06 __ STX WORK + 3 
00:b42b : a0 01 __ LDY #$01
00:b42d : b1 05 __ LDA (WORK + 2),y 
00:b42f : f0 28 __ BEQ $b459 ; (crt_free + 185)
00:b431 : aa __ __ TAX
00:b432 : 88 __ __ DEY
00:b433 : b1 05 __ LDA (WORK + 2),y 
00:b435 : e4 1e __ CPX ACCU + 3 
00:b437 : 90 ee __ BCC $b427 ; (crt_free + 135)
00:b439 : d0 1e __ BNE $b459 ; (crt_free + 185)
00:b43b : c5 1d __ CMP ACCU + 2 
00:b43d : 90 e8 __ BCC $b427 ; (crt_free + 135)
00:b43f : d0 18 __ BNE $b459 ; (crt_free + 185)
00:b441 : a0 00 __ LDY #$00
00:b443 : b1 1d __ LDA (ACCU + 2),y 
00:b445 : 91 1b __ STA (ACCU + 0),y 
00:b447 : c8 __ __ INY
00:b448 : b1 1d __ LDA (ACCU + 2),y 
00:b44a : 91 1b __ STA (ACCU + 0),y 
00:b44c : c8 __ __ INY
00:b44d : b1 1d __ LDA (ACCU + 2),y 
00:b44f : 91 1b __ STA (ACCU + 0),y 
00:b451 : c8 __ __ INY
00:b452 : b1 1d __ LDA (ACCU + 2),y 
00:b454 : 91 1b __ STA (ACCU + 0),y 
00:b456 : 4c 6e 3a JMP $3a6e 
00:b459 : a0 00 __ LDY #$00
00:b45b : b1 05 __ LDA (WORK + 2),y 
00:b45d : 91 1b __ STA (ACCU + 0),y 
00:b45f : c8 __ __ INY
00:b460 : b1 05 __ LDA (WORK + 2),y 
00:b462 : 91 1b __ STA (ACCU + 0),y 
00:b464 : c8 __ __ INY
00:b465 : a5 1d __ LDA ACCU + 2 
00:b467 : 91 1b __ STA (ACCU + 0),y 
00:b469 : c8 __ __ INY
00:b46a : a5 1e __ LDA ACCU + 3 
00:b46c : 91 1b __ STA (ACCU + 0),y 
00:b46e : a0 02 __ LDY #$02
00:b470 : b1 05 __ LDA (WORK + 2),y 
00:b472 : c5 1b __ CMP ACCU + 0 
00:b474 : d0 1d __ BNE $b493 ; (crt_free + 243)
00:b476 : c8 __ __ INY
00:b477 : b1 05 __ LDA (WORK + 2),y 
00:b479 : c5 1c __ CMP ACCU + 1 
00:b47b : d0 16 __ BNE $b493 ; (crt_free + 243)
00:b47d : a0 00 __ LDY #$00
00:b47f : b1 1b __ LDA (ACCU + 0),y 
00:b481 : 91 05 __ STA (WORK + 2),y 
00:b483 : c8 __ __ INY
00:b484 : b1 1b __ LDA (ACCU + 0),y 
00:b486 : 91 05 __ STA (WORK + 2),y 
00:b488 : c8 __ __ INY
00:b489 : b1 1b __ LDA (ACCU + 0),y 
00:b48b : 91 05 __ STA (WORK + 2),y 
00:b48d : c8 __ __ INY
00:b48e : b1 1b __ LDA (ACCU + 0),y 
00:b490 : 91 05 __ STA (WORK + 2),y 
00:b492 : 60 __ __ RTS
00:b493 : a0 00 __ LDY #$00
00:b495 : a5 1b __ LDA ACCU + 0 
00:b497 : 91 05 __ STA (WORK + 2),y 
00:b499 : c8 __ __ INY
00:b49a : a5 1c __ LDA ACCU + 1 
00:b49c : 91 05 __ STA (WORK + 2),y 
00:b49e : 60 __ __ RTS
--------------------------------------------------------------------
__multab51L:
00:b49f : __ __ __ BYT 00 33 66 99 cc ff 32 65                         : .3f...2e
--------------------------------------------------------------------
__multab51H:
00:b4a7 : __ __ __ BYT 00 00 00 00 00 00 01 01                         : ........
--------------------------------------------------------------------
getkey@proxy: ; getkey@proxy
00:b4af : a9 80 __ LDA #$80
00:b4b1 : 85 0d __ STA P0 
00:b4b3 : 4c 5c 31 JMP $315c 
--------------------------------------------------------------------
headertext@proxy: ; headertext@proxy
00:b4b6 : a9 75 __ LDA #$75
00:b4b8 : 85 14 __ STA P7 
00:b4ba : a9 8e __ LDA #$8e
00:b4bc : 85 15 __ STA P8 
00:b4be : 4c 9a 0e JMP $0e9a 
--------------------------------------------------------------------
strncpy@proxy: ; strncpy@proxy
00:b4c1 : a9 00 __ LDA #$00
00:b4c3 : 85 0f __ STA P2 
00:b4c5 : a9 55 __ LDA #$55
00:b4c7 : 85 10 __ STA P3 
00:b4c9 : a9 33 __ LDA #$33
00:b4cb : 85 11 __ STA P4 
00:b4cd : a9 00 __ LDA #$00
00:b4cf : 85 12 __ STA P5 
00:b4d1 : 4c c9 23 JMP $23c9 
--------------------------------------------------------------------
strncpy@proxy: ; strncpy@proxy
00:b4d4 : a9 00 __ LDA #$00
00:b4d6 : 85 0d __ STA P0 
00:b4d8 : a9 3e __ LDA #$3e
00:b4da : 85 0e __ STA P1 
00:b4dc : a9 00 __ LDA #$00
00:b4de : 85 11 __ STA P4 
00:b4e0 : a9 01 __ LDA #$01
00:b4e2 : 85 12 __ STA P5 
00:b4e4 : 4c c9 23 JMP $23c9 
--------------------------------------------------------------------
strncpy@proxy: ; strncpy@proxy
00:b4e7 : a9 33 __ LDA #$33
00:b4e9 : 85 11 __ STA P4 
00:b4eb : a9 00 __ LDA #$00
00:b4ed : 85 12 __ STA P5 
00:b4ef : 4c c9 23 JMP $23c9 
--------------------------------------------------------------------
strncpy@proxy: ; strncpy@proxy
00:b4f2 : a5 1b __ LDA ACCU + 0 
00:b4f4 : 85 0f __ STA P2 
00:b4f6 : a5 1c __ LDA ACCU + 1 
00:b4f8 : 85 10 __ STA P3 
00:b4fa : 4c c9 23 JMP $23c9 
--------------------------------------------------------------------
strncpy@proxy: ; strncpy@proxy
00:b4fd : a9 00 __ LDA #$00
00:b4ff : 85 0d __ STA P0 
00:b501 : a9 3f __ LDA #$3f
00:b503 : 85 0e __ STA P1 
00:b505 : a9 d6 __ LDA #$d6
00:b507 : 85 0f __ STA P2 
00:b509 : a9 49 __ LDA #$49
00:b50b : 85 10 __ STA P3 
00:b50d : a9 00 __ LDA #$00
00:b50f : 85 11 __ STA P4 
00:b511 : a9 01 __ LDA #$01
00:b513 : 85 12 __ STA P5 
00:b515 : 4c c9 23 JMP $23c9 
--------------------------------------------------------------------
strncpy@proxy: ; strncpy@proxy
00:b518 : a9 c9 __ LDA #$c9
00:b51a : 85 0d __ STA P0 
00:b51c : a9 7e __ LDA #$7e
00:b51e : 85 0e __ STA P1 
00:b520 : a9 00 __ LDA #$00
00:b522 : 85 12 __ STA P5 
00:b524 : 4c c9 23 JMP $23c9 
--------------------------------------------------------------------
uii_change_dir@proxy: ; uii_change_dir@proxy
00:b527 : a9 a3 __ LDA #$a3
00:b529 : 85 11 __ STA P4 
00:b52b : a9 50 __ LDA #$50
00:b52d : 85 12 __ STA P5 
00:b52f : 4c 66 14 JMP $1466 
--------------------------------------------------------------------
uii_open_file@proxy: ; uii_open_file@proxy
00:b532 : a9 a6 __ LDA #$a6
00:b534 : 85 12 __ STA P5 
00:b536 : a9 3d __ LDA #$3d
00:b538 : 85 13 __ STA P6 
00:b53a : 4c 54 1c JMP $1c54 
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
00:b53d : a9 64 __ LDA #$64
00:b53f : 85 03 __ STA WORK + 0 
00:b541 : a9 00 __ LDA #$00
00:b543 : 85 04 __ STA WORK + 1 
00:b545 : 4c 8b 36 JMP $368b 
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
00:b548 : a9 6d __ LDA #$6d
00:b54a : 85 03 __ STA WORK + 0 
00:b54c : a9 01 __ LDA #$01
00:b54e : 85 04 __ STA WORK + 1 
00:b550 : 4c 8b 36 JMP $368b 
--------------------------------------------------------------------
cwin_putat_string@proxy: ; cwin_putat_string@proxy
00:b553 : a9 42 __ LDA #$42
00:b555 : 85 0f __ STA P2 
00:b557 : a9 9b __ LDA #$9b
00:b559 : 85 10 __ STA P3 
00:b55b : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:b55e : 85 11 __ STA P4 
00:b560 : 4c 8f 12 JMP $128f 
--------------------------------------------------------------------
cwin_putat_string@proxy: ; cwin_putat_string@proxy
00:b563 : a9 05 __ LDA #$05
00:b565 : 85 0d __ STA P0 
00:b567 : a9 15 __ LDA #$15
00:b569 : 85 0e __ STA P1 
00:b56b : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:b56e : 85 11 __ STA P4 
00:b570 : 4c 8f 12 JMP $128f 
--------------------------------------------------------------------
cwin_putat_string@proxy: ; cwin_putat_string@proxy
00:b573 : a9 05 __ LDA #$05
00:b575 : 85 0d __ STA P0 
00:b577 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:b57a : 85 11 __ STA P4 
00:b57c : 4c 8f 12 JMP $128f 
--------------------------------------------------------------------
cwin_putat_string@proxy: ; cwin_putat_string@proxy
00:b57f : a9 00 __ LDA #$00
00:b581 : 85 0d __ STA P0 
00:b583 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:b586 : 85 11 __ STA P4 
00:b588 : 4c 8f 12 JMP $128f 
--------------------------------------------------------------------
cwin_putat_string@proxy: ; cwin_putat_string@proxy
00:b58b : a9 00 __ LDA #$00
00:b58d : 85 0d __ STA P0 
00:b58f : a9 72 __ LDA #$72
00:b591 : 85 0f __ STA P2 
00:b593 : a9 49 __ LDA #$49
00:b595 : 85 10 __ STA P3 
00:b597 : ad 60 49 LDA $4960 ; (cfg.colors.diritem_normal + 0)
00:b59a : 85 11 __ STA P4 
00:b59c : 4c 8f 12 JMP $128f 
--------------------------------------------------------------------
cwin_putat_string@proxy: ; cwin_putat_string@proxy
00:b59f : a9 12 __ LDA #$12
00:b5a1 : 85 0d __ STA P0 
00:b5a3 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:b5a6 : 85 11 __ STA P4 
00:b5a8 : 4c 8f 12 JMP $128f 
--------------------------------------------------------------------
cwin_putat_string@proxy: ; cwin_putat_string@proxy
00:b5ab : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:b5ae : 85 11 __ STA P4 
00:b5b0 : 4c 8f 12 JMP $128f 
--------------------------------------------------------------------
cwin_putat_string@proxy: ; cwin_putat_string@proxy
00:b5b3 : a9 18 __ LDA #$18
00:b5b5 : 85 0e __ STA P1 
00:b5b7 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:b5ba : 85 11 __ STA P4 
00:b5bc : 4c 8f 12 JMP $128f 
--------------------------------------------------------------------
cwin_putat_string@proxy: ; cwin_putat_string@proxy
00:b5bf : a9 15 __ LDA #$15
00:b5c1 : 85 0e __ STA P1 
00:b5c3 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:b5c6 : 85 11 __ STA P4 
00:b5c8 : 4c 8f 12 JMP $128f 
--------------------------------------------------------------------
cwin_putat_string@proxy: ; cwin_putat_string@proxy
00:b5cb : a9 19 __ LDA #$19
00:b5cd : 85 0d __ STA P0 
00:b5cf : a9 15 __ LDA #$15
00:b5d1 : 85 0e __ STA P1 
00:b5d3 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:b5d6 : 85 11 __ STA P4 
00:b5d8 : 4c 8f 12 JMP $128f 
--------------------------------------------------------------------
cwin_putat_string@proxy: ; cwin_putat_string@proxy
00:b5db : a9 17 __ LDA #$17
00:b5dd : 85 0e __ STA P1 
00:b5df : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:b5e2 : 85 11 __ STA P4 
00:b5e4 : 4c 8f 12 JMP $128f 
--------------------------------------------------------------------
cwin_putat_string@proxy: ; cwin_putat_string@proxy
00:b5e7 : a9 16 __ LDA #$16
00:b5e9 : 85 0e __ STA P1 
00:b5eb : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:b5ee : 85 11 __ STA P4 
00:b5f0 : 4c 8f 12 JMP $128f 
--------------------------------------------------------------------
cwin_putat_string@proxy: ; cwin_putat_string@proxy
00:b5f3 : a9 00 __ LDA #$00
00:b5f5 : 85 0d __ STA P0 
00:b5f7 : a9 16 __ LDA #$16
00:b5f9 : 85 0e __ STA P1 
00:b5fb : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:b5fe : 85 11 __ STA P4 
00:b600 : 4c 8f 12 JMP $128f 
--------------------------------------------------------------------
cwin_putat_string@proxy: ; cwin_putat_string@proxy
00:b603 : a5 4c __ LDA $4c 
00:b605 : 85 0e __ STA P1 
00:b607 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:b60a : 85 11 __ STA P4 
00:b60c : 4c 8f 12 JMP $128f 
--------------------------------------------------------------------
cwin_putat_string@proxy: ; cwin_putat_string@proxy
00:b60f : a5 4f __ LDA $4f 
00:b611 : 85 0e __ STA P1 
00:b613 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:b616 : 85 11 __ STA P4 
00:b618 : 4c 8f 12 JMP $128f 
--------------------------------------------------------------------
cwin_putat_string_reverse@proxy: ; cwin_putat_string_reverse@proxy
00:b61b : a9 00 __ LDA #$00
00:b61d : 85 0f __ STA P2 
00:b61f : ad 5f 49 LDA $495f ; (cfg.colors.key + 0)
00:b622 : 85 13 __ STA P6 
00:b624 : 4c 32 10 JMP $1032 
--------------------------------------------------------------------
cwin_putat_string_reverse@proxy: ; cwin_putat_string_reverse@proxy
00:b627 : a9 00 __ LDA #$00
00:b629 : 85 0f __ STA P2 
00:b62b : a9 14 __ LDA #$14
00:b62d : 85 10 __ STA P3 
00:b62f : ad 5f 49 LDA $495f ; (cfg.colors.key + 0)
00:b632 : 85 13 __ STA P6 
00:b634 : 4c 32 10 JMP $1032 
--------------------------------------------------------------------
cwin_putat_string_reverse@proxy: ; cwin_putat_string_reverse@proxy
00:b637 : a9 00 __ LDA #$00
00:b639 : 85 0f __ STA P2 
00:b63b : a9 11 __ LDA #$11
00:b63d : 85 11 __ STA P4 
00:b63f : a9 87 __ LDA #$87
00:b641 : 85 12 __ STA P5 
00:b643 : ad 5f 49 LDA $495f ; (cfg.colors.key + 0)
00:b646 : 85 13 __ STA P6 
00:b648 : 4c 32 10 JMP $1032 
--------------------------------------------------------------------
cwin_putat_string_reverse@proxy: ; cwin_putat_string_reverse@proxy
00:b64b : a9 00 __ LDA #$00
00:b64d : 85 0f __ STA P2 
00:b64f : a9 12 __ LDA #$12
00:b651 : 85 10 __ STA P3 
00:b653 : ad 5f 49 LDA $495f ; (cfg.colors.key + 0)
00:b656 : 85 13 __ STA P6 
00:b658 : 4c 32 10 JMP $1032 
--------------------------------------------------------------------
cwin_putat_string_reverse@proxy: ; cwin_putat_string_reverse@proxy
00:b65b : a9 00 __ LDA #$00
00:b65d : 85 0f __ STA P2 
00:b65f : a9 72 __ LDA #$72
00:b661 : 85 11 __ STA P4 
00:b663 : a9 49 __ LDA #$49
00:b665 : 85 12 __ STA P5 
00:b667 : ad 61 49 LDA $4961 ; (cfg.colors.diritem_select + 0)
00:b66a : 85 13 __ STA P6 
00:b66c : 4c 32 10 JMP $1032 
--------------------------------------------------------------------
cwin_putat_string_reverse@proxy: ; cwin_putat_string_reverse@proxy
00:b66f : a9 38 __ LDA #$38
00:b671 : 85 11 __ STA P4 
00:b673 : a9 87 __ LDA #$87
00:b675 : 85 12 __ STA P5 
00:b677 : ad 5f 49 LDA $495f ; (cfg.colors.key + 0)
00:b67a : 85 13 __ STA P6 
00:b67c : 4c 32 10 JMP $1032 
--------------------------------------------------------------------
cwin_putat_string_reverse@proxy: ; cwin_putat_string_reverse@proxy
00:b67f : a9 25 __ LDA #$25
00:b681 : 85 11 __ STA P4 
00:b683 : a9 87 __ LDA #$87
00:b685 : 85 12 __ STA P5 
00:b687 : ad 5f 49 LDA $495f ; (cfg.colors.key + 0)
00:b68a : 85 13 __ STA P6 
00:b68c : 4c 32 10 JMP $1032 
--------------------------------------------------------------------
cwin_putat_string_reverse@proxy: ; cwin_putat_string_reverse@proxy
00:b68f : ad 5f 49 LDA $495f ; (cfg.colors.key + 0)
00:b692 : 85 13 __ STA P6 
00:b694 : 4c 32 10 JMP $1032 
--------------------------------------------------------------------
cwin_putat_string_reverse@proxy: ; cwin_putat_string_reverse@proxy
00:b697 : a9 14 __ LDA #$14
00:b699 : 85 0f __ STA P2 
00:b69b : a9 15 __ LDA #$15
00:b69d : 85 10 __ STA P3 
00:b69f : a9 00 __ LDA #$00
00:b6a1 : 85 11 __ STA P4 
00:b6a3 : a9 87 __ LDA #$87
00:b6a5 : 85 12 __ STA P5 
00:b6a7 : ad 5f 49 LDA $495f ; (cfg.colors.key + 0)
00:b6aa : 85 13 __ STA P6 
00:b6ac : 4c 32 10 JMP $1032 
--------------------------------------------------------------------
cwin_putat_string_reverse@proxy: ; cwin_putat_string_reverse@proxy
00:b6af : a9 00 __ LDA #$00
00:b6b1 : 85 0f __ STA P2 
00:b6b3 : a9 15 __ LDA #$15
00:b6b5 : 85 10 __ STA P3 
00:b6b7 : a9 ec __ LDA #$ec
00:b6b9 : 85 11 __ STA P4 
00:b6bb : a9 86 __ LDA #$86
00:b6bd : 85 12 __ STA P5 
00:b6bf : ad 5f 49 LDA $495f ; (cfg.colors.key + 0)
00:b6c2 : 85 13 __ STA P6 
00:b6c4 : 4c 32 10 JMP $1032 
--------------------------------------------------------------------
cwin_fill_rect_raw@proxy: ; cwin_fill_rect_raw@proxy
00:b6c7 : a9 01 __ LDA #$01
00:b6c9 : 85 10 __ STA P3 
00:b6cb : a9 a0 __ LDA #$a0
00:b6cd : 85 11 __ STA P4 
00:b6cf : 4c bb 0f JMP $0fbb 
--------------------------------------------------------------------
cwin_fill_rect_raw@proxy: ; cwin_fill_rect_raw@proxy
00:b6d2 : a9 00 __ LDA #$00
00:b6d4 : 85 0d __ STA P0 
00:b6d6 : a9 02 __ LDA #$02
00:b6d8 : 85 0e __ STA P1 
00:b6da : a9 28 __ LDA #$28
00:b6dc : 85 0f __ STA P2 
00:b6de : a9 20 __ LDA #$20
00:b6e0 : 85 11 __ STA P4 
00:b6e2 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:b6e5 : 85 12 __ STA P5 
00:b6e7 : 4c bb 0f JMP $0fbb 
--------------------------------------------------------------------
cwin_fill_rect_raw@proxy: ; cwin_fill_rect_raw@proxy
00:b6ea : a9 28 __ LDA #$28
00:b6ec : 85 0f __ STA P2 
00:b6ee : a9 20 __ LDA #$20
00:b6f0 : 85 11 __ STA P4 
00:b6f2 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:b6f5 : 85 12 __ STA P5 
00:b6f7 : 4c bb 0f JMP $0fbb 
--------------------------------------------------------------------
cwin_fill_rect_raw@proxy: ; cwin_fill_rect_raw@proxy
00:b6fa : a9 20 __ LDA #$20
00:b6fc : 85 11 __ STA P4 
00:b6fe : ad 5e 49 LDA $495e ; (cfg.colors.text_input + 0)
00:b701 : 85 12 __ STA P5 
00:b703 : 4c bb 0f JMP $0fbb 
--------------------------------------------------------------------
cwin_fill_rect_raw@proxy: ; cwin_fill_rect_raw@proxy
00:b706 : a9 03 __ LDA #$03
00:b708 : 85 0e __ STA P1 
00:b70a : a9 16 __ LDA #$16
00:b70c : 85 10 __ STA P3 
00:b70e : a9 20 __ LDA #$20
00:b710 : 85 11 __ STA P4 
00:b712 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
00:b715 : 85 12 __ STA P5 
00:b717 : 4c bb 0f JMP $0fbb 
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
00:b71a : a5 4d __ LDA $4d 
00:b71c : 85 0d __ STA P0 
00:b71e : a5 4e __ LDA $4e 
00:b720 : 85 0e __ STA P1 
00:b722 : 4c ad 10 JMP $10ad 
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
00:b725 : a9 c9 __ LDA #$c9
00:b727 : 85 0d __ STA P0 
00:b729 : a9 4e __ LDA #$4e
00:b72b : 85 0e __ STA P1 
00:b72d : 4c ad 10 JMP $10ad 
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
00:b730 : a9 49 __ LDA #$49
00:b732 : 85 0e __ STA P1 
00:b734 : 4c ad 10 JMP $10ad 
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
00:b737 : a5 13 __ LDA P6 
00:b739 : 85 0e __ STA P1 
00:b73b : 4c ad 10 JMP $10ad 
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
00:b73e : a5 12 __ LDA P5 
00:b740 : 85 0d __ STA P0 
00:b742 : a5 13 __ LDA P6 
00:b744 : 85 0e __ STA P1 
00:b746 : 4c ad 10 JMP $10ad 
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
00:b749 : a5 12 __ LDA P5 
00:b74b : 85 0e __ STA P1 
00:b74d : 4c ad 10 JMP $10ad 
--------------------------------------------------------------------
mul40:
00:b750 : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
00:b760 : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
00:b770 : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
00:b780 : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
p2smap:
00:b782 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
uii_target:
00:b78a : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p2smap:
00:b78b : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
configpath:
00:b793 : __ __ __ BYT 2f 55 53 42 2a 2f 00 00                         : /USB*/..
--------------------------------------------------------------------
configfilename:
00:b79b : __ __ __ BYT 44 4d 42 43 46 47 2e 43 46 47 00                : DMBCFG.CFG.
--------------------------------------------------------------------
slotfilename:
00:b7a6 : __ __ __ BYT 44 4d 42 53 4c 54 2e 43 46 47 00                : DMBSLT.CFG.
--------------------------------------------------------------------
00:b7b1 : __ __ __ BYT 00 21 00 00 00 00 ff ff ff 01                   : .!........
--------------------------------------------------------------------
trace:
00:b7bb : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
depth:
00:b7bc : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
reuflag:
00:b7bd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
mountflag:
00:b7be : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
comma1:
00:b7bf : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
demomode:
00:b7c0 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
imageaid:
00:b7c1 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
device:
00:b7c2 : __ __ __ BYT 08                                              : .
--------------------------------------------------------------------
drivetype:
00:b7c3 : __ __ __ BYT ff 12 7e 2e fb 2c 85 2e 8a 2e 8f 2e 94 2e 99 2e : ..~..,..........
00:b7d3 : __ __ __ BYT 9e 2e a3 2e a8 2e ad 2e b4 2e b8 2e bd 2e       : ..............
--------------------------------------------------------------------
reg_types:
00:b7e1 : __ __ __ BYT 27 30 2b 30 2f 30 33 30 37 30                   : '0+0/03070
--------------------------------------------------------------------
oth_types:
00:b7eb : __ __ __ BYT 3b 30 3f 30 43 30 47 30 4b 30 4f 30             : ;0?0C0G0K0O0
--------------------------------------------------------------------
imagebpath:
00:b800 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b810 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b820 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b830 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b840 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b850 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b860 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b870 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b880 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b890 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b8a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b8b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b8c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b8d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b8e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b8f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
imageapath:
00:b900 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b910 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b920 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b930 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b940 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b950 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b960 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b970 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b980 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b990 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b9a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b9b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b9c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b9d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b9e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:b9f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
imageaname:
00:ba00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:ba10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:ba20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:ba30 : __ __ __ BYT 00 00 00                                        : ...
--------------------------------------------------------------------
imagebname:
00:ba33 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:ba43 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:ba53 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
00:ba63 : __ __ __ BYT 00 00 00                                        : ...
--------------------------------------------------------------------
time_main: ; time_main()->void
;  12, "/home/xahmol/git/UBoot64-v2/src/u-time.h"
.s1:
01:8000 : a2 05 __ LDX #$05
01:8002 : b5 53 __ LDA T0 + 0,x 
01:8004 : 9d c0 7e STA $7ec0,x ; (time_main@stack + 0)
01:8007 : ca __ __ DEX
01:8008 : 10 f8 __ BPL $8002 ; (time_main.s1 + 2)
.s4:
01:800a : ae 02 49 LDX $4902 ; (cfg.timeon + 0)
01:800d : ca __ __ DEX
01:800e : f0 0b __ BEQ $801b ; (time_main.s5 + 0)
.s3:
01:8010 : a2 05 __ LDX #$05
01:8012 : bd c0 7e LDA $7ec0,x ; (time_main@stack + 0)
01:8015 : 95 53 __ STA T0 + 0,x 
01:8017 : ca __ __ DEX
01:8018 : 10 f8 __ BPL $8012 ; (time_main.s3 + 2)
01:801a : 60 __ __ RTS
.s5:
01:801b : a2 32 __ LDX #$32
.l6:
01:801d : bd 7d 9e LDA $9e7d,x 
01:8020 : 9d cc 7e STA $7ecc,x ; (fullcmd[0] + 0)
01:8023 : ca __ __ DEX
01:8024 : 10 f7 __ BPL $801d ; (time_main.l6 + 0)
.s7:
01:8026 : ad 58 49 LDA $4958 ; (cfg.verbose + 0)
01:8029 : d0 11 __ BNE $803c ; (time_main.s37 + 0)
.s8:
01:802b : ae 00 49 LDX $4900 ; (verbosecounter + 0)
01:802e : 86 0d __ STX P0 
01:8030 : e8 __ __ INX
01:8031 : 8e 00 49 STX $4900 ; (verbosecounter + 0)
01:8034 : a5 0d __ LDA P0 
01:8036 : 20 62 1d JSR $1d62 
01:8039 : 4c 4d 80 JMP $804d ; (time_main.s9 + 0)
.s37:
01:803c : a9 07 __ LDA #$07
01:803e : 85 18 __ STA P11 
01:8040 : a9 50 __ LDA #$50
01:8042 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8045 : a9 82 __ LDA #$82
01:8047 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:804a : 20 25 15 JSR $1525 
.s9:
01:804d : 20 f2 10 JSR $10f2 
01:8050 : ad 58 49 LDA $4958 ; (cfg.verbose + 0)
01:8053 : d0 11 __ BNE $8066 ; (time_main.s36 + 0)
.s10:
01:8055 : ae 00 49 LDX $4900 ; (verbosecounter + 0)
01:8058 : 86 0d __ STX P0 
01:805a : e8 __ __ INX
01:805b : 8e 00 49 STX $4900 ; (verbosecounter + 0)
01:805e : a5 0d __ LDA P0 
01:8060 : 20 62 1d JSR $1d62 
01:8063 : 4c 98 80 JMP $8098 ; (time_main.s11 + 0)
.s36:
01:8066 : a9 07 __ LDA #$07
01:8068 : 85 18 __ STA P11 
01:806a : a9 75 __ LDA #$75
01:806c : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:806f : a9 82 __ LDA #$82
01:8071 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8074 : a9 d6 __ LDA #$d6
01:8076 : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:8079 : a9 49 __ LDA #$49
01:807b : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:807e : 20 25 15 JSR $1525 
01:8081 : a9 8c __ LDA #$8c
01:8083 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8086 : a9 82 __ LDA #$82
01:8088 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:808b : a9 03 __ LDA #$03
01:808d : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:8090 : a9 49 __ LDA #$49
01:8092 : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:8095 : 20 25 15 JSR $1525 
.s11:
01:8098 : 20 e1 28 JSR $28e1 
01:809b : 85 57 __ STA T1 + 0 
01:809d : 20 9f 82 JSR $829f ; (CheckStatusTime.s4 + 0)
01:80a0 : a5 1b __ LDA ACCU + 0 
01:80a2 : f0 03 __ BEQ $80a7 ; (time_main.s12 + 0)
01:80a4 : 4c 49 82 JMP $8249 ; (time_main.s34 + 0)
.s12:
01:80a7 : ad 58 49 LDA $4958 ; (cfg.verbose + 0)
01:80aa : d0 11 __ BNE $80bd ; (time_main.s35 + 0)
.s13:
01:80ac : ae 00 49 LDX $4900 ; (verbosecounter + 0)
01:80af : 86 0d __ STX P0 
01:80b1 : e8 __ __ INX
01:80b2 : 8e 00 49 STX $4900 ; (verbosecounter + 0)
01:80b5 : a5 0d __ LDA P0 
01:80b7 : 20 62 1d JSR $1d62 
01:80ba : 4c ce 80 JMP $80ce ; (time_main.s14 + 0)
.s35:
01:80bd : a9 07 __ LDA #$07
01:80bf : 85 18 __ STA P11 
01:80c1 : a9 39 __ LDA #$39
01:80c3 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:80c6 : a9 83 __ LDA #$83
01:80c8 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:80cb : 20 25 15 JSR $1525 
.s14:
01:80ce : a9 33 __ LDA #$33
01:80d0 : 85 0f __ STA P2 
01:80d2 : a9 03 __ LDA #$03
01:80d4 : 8d 8a 3d STA $3d8a 
01:80d7 : a9 00 __ LDA #$00
01:80d9 : 85 10 __ STA P3 
01:80db : a5 57 __ LDA T1 + 0 
01:80dd : 8d ce 7e STA $7ece ; (fullcmd[0] + 2)
01:80e0 : a9 cc __ LDA #$cc
01:80e2 : 85 0d __ STA P0 
01:80e4 : a9 7e __ LDA #$7e
01:80e6 : 85 0e __ STA P1 
01:80e8 : 20 53 11 JSR $1153 
01:80eb : 20 0c 12 JSR $120c 
01:80ee : 20 18 11 JSR $1118 
01:80f1 : 20 9f 82 JSR $829f ; (CheckStatusTime.s4 + 0)
01:80f4 : a9 01 __ LDA #$01
01:80f6 : 85 58 __ STA T3 + 0 
01:80f8 : a5 1b __ LDA ACCU + 0 
01:80fa : d0 a8 __ BNE $80a4 ; (time_main.s11 + 12)
.l15:
01:80fc : a9 00 __ LDA #$00
01:80fe : 8d 09 dc STA $dc09 
01:8101 : 8d 08 dc STA $dc08 
.l16:
01:8104 : ad 09 dc LDA $dc09 
01:8107 : f0 fb __ BEQ $8104 ; (time_main.l16 + 0)
.s17:
01:8109 : ad 58 49 LDA $4958 ; (cfg.verbose + 0)
01:810c : d0 11 __ BNE $811f ; (time_main.s33 + 0)
.s18:
01:810e : ae 00 49 LDX $4900 ; (verbosecounter + 0)
01:8111 : 86 0d __ STX P0 
01:8113 : e8 __ __ INX
01:8114 : 8e 00 49 STX $4900 ; (verbosecounter + 0)
01:8117 : a5 0d __ LDA P0 
01:8119 : 20 62 1d JSR $1d62 
01:811c : 4c 3a 81 JMP $813a ; (time_main.s19 + 0)
.s33:
01:811f : a9 07 __ LDA #$07
01:8121 : 85 18 __ STA P11 
01:8123 : a9 4e __ LDA #$4e
01:8125 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8128 : a9 83 __ LDA #$83
01:812a : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:812d : a5 58 __ LDA T3 + 0 
01:812f : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:8132 : a9 00 __ LDA #$00
01:8134 : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:8137 : 20 25 15 JSR $1525 
.s19:
01:813a : a5 57 __ LDA T1 + 0 
01:813c : 85 11 __ STA P4 
01:813e : 20 cd 29 JSR $29cd 
01:8141 : ad d7 4b LDA $4bd7 ; (uii_status[0] + 0)
01:8144 : c9 30 __ CMP #$30
01:8146 : d0 07 __ BNE $814f ; (time_main.s20 + 0)
.s32:
01:8148 : ad d8 4b LDA $4bd8 ; (uii_status[0] + 1)
01:814b : c9 30 __ CMP #$30
01:814d : f0 08 __ BEQ $8157 ; (time_main.s21 + 0)
.s20:
01:814f : e6 58 __ INC T3 + 0 
01:8151 : a5 58 __ LDA T3 + 0 
01:8153 : c9 05 __ CMP #$05
01:8155 : 90 a5 __ BCC $80fc ; (time_main.l15 + 0)
.s21:
01:8157 : 20 9f 82 JSR $829f ; (CheckStatusTime.s4 + 0)
01:815a : a5 57 __ LDA T1 + 0 
01:815c : 85 11 __ STA P4 
01:815e : a5 1b __ LDA ACCU + 0 
01:8160 : f0 06 __ BEQ $8168 ; (time_main.s22 + 0)
.s31:
01:8162 : 20 96 29 JSR $2996 
01:8165 : 4c 10 80 JMP $8010 ; (time_main.s3 + 0)
.s22:
01:8168 : ad fb 49 LDA $49fb ; (uii_data[0] + 37)
01:816b : 38 __ __ SEC
01:816c : e9 80 __ SBC #$80
01:816e : 85 53 __ STA T0 + 0 
01:8170 : ad fa 49 LDA $49fa ; (uii_data[0] + 36)
01:8173 : e9 7e __ SBC #$7e
01:8175 : 85 54 __ STA T0 + 1 
01:8177 : ad f9 49 LDA $49f9 ; (uii_data[0] + 35)
01:817a : e9 aa __ SBC #$aa
01:817c : 85 55 __ STA T0 + 2 
01:817e : ad f8 49 LDA $49f8 ; (uii_data[0] + 34)
01:8181 : e9 83 __ SBC #$83
01:8183 : 85 56 __ STA T0 + 3 
01:8185 : 20 96 29 JSR $2996 
01:8188 : ad 58 49 LDA $4958 ; (cfg.verbose + 0)
01:818b : d0 11 __ BNE $819e ; (time_main.s30 + 0)
.s23:
01:818d : ae 00 49 LDX $4900 ; (verbosecounter + 0)
01:8190 : 86 0d __ STX P0 
01:8192 : e8 __ __ INX
01:8193 : 8e 00 49 STX $4900 ; (verbosecounter + 0)
01:8196 : a5 0d __ LDA P0 
01:8198 : 20 62 1d JSR $1d62 
01:819b : 4c c3 81 JMP $81c3 ; (time_main.s24 + 0)
.s30:
01:819e : a5 53 __ LDA T0 + 0 
01:81a0 : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:81a3 : a9 07 __ LDA #$07
01:81a5 : 85 18 __ STA P11 
01:81a7 : a5 54 __ LDA T0 + 1 
01:81a9 : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:81ac : a5 55 __ LDA T0 + 2 
01:81ae : 8d e7 7f STA $7fe7 ; (sstack + 8)
01:81b1 : a5 56 __ LDA T0 + 3 
01:81b3 : 8d e8 7f STA $7fe8 ; (sstack + 9)
01:81b6 : a9 69 __ LDA #$69
01:81b8 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:81bb : a9 83 __ LDA #$83
01:81bd : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:81c0 : 20 25 15 JSR $1525 
.s24:
01:81c3 : a5 53 __ LDA T0 + 0 
01:81c5 : 85 0d __ STA P0 
01:81c7 : a5 54 __ LDA T0 + 1 
01:81c9 : 85 0e __ STA P1 
01:81cb : a5 55 __ LDA T0 + 2 
01:81cd : 85 0f __ STA P2 
01:81cf : a5 56 __ LDA T0 + 3 
01:81d1 : 85 10 __ STA P3 
01:81d3 : 20 79 83 JSR $8379 ; (UNIX_epoch_to_UII_time.s1 + 0)
01:81d6 : a5 1b __ LDA ACCU + 0 
01:81d8 : 85 11 __ STA P4 
01:81da : a5 1c __ LDA ACCU + 1 
01:81dc : 85 12 __ STA P5 
01:81de : 20 19 2a JSR $2a19 
01:81e1 : ad 58 49 LDA $4958 ; (cfg.verbose + 0)
01:81e4 : d0 11 __ BNE $81f7 ; (time_main.s29 + 0)
.s25:
01:81e6 : ae 00 49 LDX $4900 ; (verbosecounter + 0)
01:81e9 : 86 0d __ STX P0 
01:81eb : e8 __ __ INX
01:81ec : 8e 00 49 STX $4900 ; (verbosecounter + 0)
01:81ef : a5 0d __ LDA P0 
01:81f1 : 20 62 1d JSR $1d62 
01:81f4 : 4c 12 82 JMP $8212 ; (time_main.s26 + 0)
.s29:
01:81f7 : a9 07 __ LDA #$07
01:81f9 : 85 18 __ STA P11 
01:81fb : a9 d7 __ LDA #$d7
01:81fd : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:8200 : a9 4b __ LDA #$4b
01:8202 : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:8205 : a9 7a __ LDA #$7a
01:8207 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:820a : a9 85 __ LDA #$85
01:820c : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:820f : 20 25 15 JSR $1525 
.s26:
01:8212 : 20 f2 10 JSR $10f2 
01:8215 : ad 58 49 LDA $4958 ; (cfg.verbose + 0)
01:8218 : d0 11 __ BNE $822b ; (time_main.s28 + 0)
.s27:
01:821a : ae 00 49 LDX $4900 ; (verbosecounter + 0)
01:821d : 86 0d __ STX P0 
01:821f : e8 __ __ INX
01:8220 : 8e 00 49 STX $4900 ; (verbosecounter + 0)
01:8223 : a5 0d __ LDA P0 
01:8225 : 20 62 1d JSR $1d62 
01:8228 : 4c 10 80 JMP $8010 ; (time_main.s3 + 0)
.s28:
01:822b : a9 07 __ LDA #$07
01:822d : 85 18 __ STA P11 
01:822f : a9 86 __ LDA #$86
01:8231 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8234 : a9 85 __ LDA #$85
01:8236 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8239 : a9 d6 __ LDA #$d6
01:823b : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:823e : a9 49 __ LDA #$49
01:8240 : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:8243 : 20 25 15 JSR $1525 
01:8246 : 4c 10 80 JMP $8010 ; (time_main.s3 + 0)
.s34:
01:8249 : a5 57 __ LDA T1 + 0 
01:824b : 85 11 __ STA P4 
01:824d : 4c 62 81 JMP $8162 ; (time_main.s31 + 0)
--------------------------------------------------------------------
01:8250 : __ __ __ BYT 0a 75 50 44 41 54 49 4e 47 20 75 69 69 2b 20 54 : .uPDATING uii+ T
01:8260 : __ __ __ BYT 49 4d 45 20 46 52 4f 4d 20 6e 74 70 20 73 45 52 : IME FROM ntp sER
01:8270 : __ __ __ BYT 56 45 52 2e 00                                  : VER..
--------------------------------------------------------------------
01:8275 : __ __ __ BYT 0a 75 4c 54 49 4d 41 54 45 20 44 41 54 45 54 49 : .uLTIMATE DATETI
01:8285 : __ __ __ BYT 4d 45 3a 20 25 53 00                            : ME: %S.
--------------------------------------------------------------------
01:828c : __ __ __ BYT 0a 63 4f 4e 4e 45 43 54 49 4e 47 20 54 4f 3a 20 : .cONNECTING TO: 
01:829c : __ __ __ BYT 25 53 00                                        : %S.
--------------------------------------------------------------------
CheckStatusTime: ; CheckStatusTime()->u8
;   9, "/home/xahmol/git/UBoot64-v2/src/u-time.h"
.s4:
01:829f : ad d7 4b LDA $4bd7 ; (uii_status[0] + 0)
01:82a2 : c9 30 __ CMP #$30
01:82a4 : d0 0c __ BNE $82b2 ; (CheckStatusTime.s7 + 0)
.s5:
01:82a6 : ad d8 4b LDA $4bd8 ; (uii_status[0] + 1)
01:82a9 : c9 30 __ CMP #$30
01:82ab : d0 05 __ BNE $82b2 ; (CheckStatusTime.s7 + 0)
.s6:
01:82ad : a9 00 __ LDA #$00
.s3:
01:82af : 85 1b __ STA ACCU + 0 
01:82b1 : 60 __ __ RTS
.s7:
01:82b2 : ad 58 49 LDA $4958 ; (cfg.verbose + 0)
01:82b5 : d0 11 __ BNE $82c8 ; (CheckStatusTime.s9 + 0)
.s8:
01:82b7 : ae 00 49 LDX $4900 ; (verbosecounter + 0)
01:82ba : 86 0d __ STX P0 
01:82bc : e8 __ __ INX
01:82bd : 8e 00 49 STX $4900 ; (verbosecounter + 0)
01:82c0 : a5 0d __ LDA P0 
01:82c2 : 20 62 1d JSR $1d62 
01:82c5 : 4c fa 82 JMP $82fa ; (CheckStatusTime.s10 + 0)
.s9:
01:82c8 : a9 07 __ LDA #$07
01:82ca : 85 18 __ STA P11 
01:82cc : a9 00 __ LDA #$00
01:82ce : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:82d1 : a9 83 __ LDA #$83
01:82d3 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:82d6 : 20 25 15 JSR $1525 
01:82d9 : a9 d7 __ LDA #$d7
01:82db : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:82de : a9 4b __ LDA #$4b
01:82e0 : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:82e3 : a9 25 __ LDA #$25
01:82e5 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:82e8 : a9 83 __ LDA #$83
01:82ea : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:82ed : a9 d6 __ LDA #$d6
01:82ef : 8d e7 7f STA $7fe7 ; (sstack + 8)
01:82f2 : a9 49 __ LDA #$49
01:82f4 : 8d e8 7f STA $7fe8 ; (sstack + 9)
01:82f7 : 20 25 15 JSR $1525 
.s10:
01:82fa : a9 01 __ LDA #$01
01:82fc : d0 b1 __ BNE $82af ; (CheckStatusTime.s3 + 0)
--------------------------------------------------------------------
01:82fe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
01:8300 : __ __ __ BYT 0a 65 52 52 4f 52 20 47 45 54 54 49 4e 47 20 54 : .eRROR GETTING T
01:8310 : __ __ __ BYT 49 4d 45 20 46 52 4f 4d 20 6e 74 70 20 53 45 52 : IME FROM ntp SER
01:8320 : __ __ __ BYT 56 45 52 2e 00                                  : VER..
--------------------------------------------------------------------
01:8325 : __ __ __ BYT 0a 73 54 41 54 55 53 3a 20 25 53 20 64 41 54 41 : .sTATUS: %S dATA
01:8335 : __ __ __ BYT 3a 25 53 00                                     : :%S.
--------------------------------------------------------------------
01:8339 : __ __ __ BYT 0a 73 45 4e 44 49 4e 47 20 6e 74 70 20 52 45 51 : .sENDING ntp REQ
01:8349 : __ __ __ BYT 55 45 53 54 00                                  : UEST.
--------------------------------------------------------------------
01:834e : __ __ __ BYT 0a 72 45 41 44 49 4e 47 20 52 45 53 55 4c 54 20 : .rEADING RESULT 
01:835e : __ __ __ BYT 41 54 54 45 4d 50 54 20 25 44 00                : ATTEMPT %D.
--------------------------------------------------------------------
01:8369 : __ __ __ BYT 0a 75 4e 49 58 20 45 50 4f 43 48 20 25 4c 55 00 : .uNIX EPOCH %LU.
--------------------------------------------------------------------
UNIX_epoch_to_UII_time: ; UNIX_epoch_to_UII_time(i32)->u8*
;  10, "/home/xahmol/git/UBoot64-v2/src/u-time.h"
.s1:
01:8379 : a5 53 __ LDA T5 + 0 
01:837b : 8d d2 7f STA $7fd2 ; (UNIX_epoch_to_UII_time@stack + 0)
01:837e : a5 54 __ LDA T5 + 1 
01:8380 : 8d d3 7f STA $7fd3 ; (UNIX_epoch_to_UII_time@stack + 1)
.s4:
01:8383 : ad 54 49 LDA $4954 ; (cfg.secondsfromutc + 0)
01:8386 : 18 __ __ CLC
01:8387 : 65 0d __ ADC P0 ; (epoch + 0)
01:8389 : 85 43 __ STA T0 + 0 
01:838b : 85 1b __ STA ACCU + 0 
01:838d : ad 55 49 LDA $4955 ; (cfg.secondsfromutc + 1)
01:8390 : 65 0e __ ADC P1 ; (epoch + 1)
01:8392 : 85 44 __ STA T0 + 1 
01:8394 : 85 1c __ STA ACCU + 1 
01:8396 : ad 56 49 LDA $4956 ; (cfg.secondsfromutc + 2)
01:8399 : 65 0f __ ADC P2 ; (epoch + 2)
01:839b : 85 45 __ STA T0 + 2 
01:839d : 85 1d __ STA ACCU + 2 
01:839f : ad 57 49 LDA $4957 ; (cfg.secondsfromutc + 3)
01:83a2 : 65 10 __ ADC P3 ; (epoch + 3)
01:83a4 : 85 46 __ STA T0 + 3 
01:83a6 : 85 1e __ STA ACCU + 3 
01:83a8 : a9 00 __ LDA #$00
01:83aa : 85 04 __ STA WORK + 1 
01:83ac : 85 05 __ STA WORK + 2 
01:83ae : 85 06 __ STA WORK + 3 
01:83b0 : 20 10 37 JSR $3710 
01:83b3 : a5 1b __ LDA ACCU + 0 
01:83b5 : 85 47 __ STA T1 + 0 
01:83b7 : a5 1c __ LDA ACCU + 1 
01:83b9 : 85 48 __ STA T1 + 1 
01:83bb : a5 1d __ LDA ACCU + 2 
01:83bd : 85 49 __ STA T1 + 2 
01:83bf : a5 1e __ LDA ACCU + 3 
01:83c1 : 85 4a __ STA T1 + 3 
01:83c3 : a9 00 __ LDA #$00
01:83c5 : 85 04 __ STA WORK + 1 
01:83c7 : 85 05 __ STA WORK + 2 
01:83c9 : 85 06 __ STA WORK + 3 
01:83cb : 20 10 37 JSR $3710 
01:83ce : a5 1b __ LDA ACCU + 0 
01:83d0 : 85 4b __ STA T2 + 0 
01:83d2 : a5 1c __ LDA ACCU + 1 
01:83d4 : 85 4c __ STA T2 + 1 
01:83d6 : a5 1d __ LDA ACCU + 2 
01:83d8 : 85 4d __ STA T2 + 2 
01:83da : a5 1e __ LDA ACCU + 3 
01:83dc : 85 4e __ STA T2 + 3 
01:83de : a9 00 __ LDA #$00
01:83e0 : 85 04 __ STA WORK + 1 
01:83e2 : 85 05 __ STA WORK + 2 
01:83e4 : 85 06 __ STA WORK + 3 
01:83e6 : a9 18 __ LDA #$18
01:83e8 : 85 03 __ STA WORK + 0 
01:83ea : 20 67 37 JSR $3767 
01:83ed : a5 07 __ LDA WORK + 4 
01:83ef : 85 4f __ STA T3 + 0 
01:83f1 : a5 47 __ LDA T1 + 0 
01:83f3 : 85 1b __ STA ACCU + 0 
01:83f5 : a5 48 __ LDA T1 + 1 
01:83f7 : 85 1c __ STA ACCU + 1 
01:83f9 : a5 49 __ LDA T1 + 2 
01:83fb : 85 1d __ STA ACCU + 2 
01:83fd : a5 4a __ LDA T1 + 3 
01:83ff : 85 1e __ STA ACCU + 3 
01:8401 : a9 00 __ LDA #$00
01:8403 : 85 04 __ STA WORK + 1 
01:8405 : 85 05 __ STA WORK + 2 
01:8407 : 85 06 __ STA WORK + 3 
01:8409 : 20 63 37 JSR $3763 
01:840c : a5 07 __ LDA WORK + 4 
01:840e : 85 47 __ STA T1 + 0 
01:8410 : a5 43 __ LDA T0 + 0 
01:8412 : 85 1b __ STA ACCU + 0 
01:8414 : a5 44 __ LDA T0 + 1 
01:8416 : 85 1c __ STA ACCU + 1 
01:8418 : a5 45 __ LDA T0 + 2 
01:841a : 85 1d __ STA ACCU + 2 
01:841c : a5 46 __ LDA T0 + 3 
01:841e : 85 1e __ STA ACCU + 3 
01:8420 : a9 00 __ LDA #$00
01:8422 : 85 04 __ STA WORK + 1 
01:8424 : 85 05 __ STA WORK + 2 
01:8426 : 85 06 __ STA WORK + 3 
01:8428 : 20 63 37 JSR $3763 
01:842b : a5 07 __ LDA WORK + 4 
01:842d : 85 43 __ STA T0 + 0 
01:842f : a9 00 __ LDA #$00
01:8431 : 85 52 __ STA T7 + 0 
01:8433 : 85 04 __ STA WORK + 1 
01:8435 : 85 05 __ STA WORK + 2 
01:8437 : 85 06 __ STA WORK + 3 
01:8439 : a5 4b __ LDA T2 + 0 
01:843b : 85 1b __ STA ACCU + 0 
01:843d : a5 4c __ LDA T2 + 1 
01:843f : 85 1c __ STA ACCU + 1 
01:8441 : a5 4d __ LDA T2 + 2 
01:8443 : 85 1d __ STA ACCU + 2 
01:8445 : a5 4e __ LDA T2 + 3 
01:8447 : 85 1e __ STA ACCU + 3 
01:8449 : a9 18 __ LDA #$18
01:844b : 85 03 __ STA WORK + 0 
01:844d : 20 14 37 JSR $3714 
01:8450 : a5 1b __ LDA ACCU + 0 
01:8452 : 85 4b __ STA T2 + 0 
01:8454 : a5 1c __ LDA ACCU + 1 
01:8456 : 85 4c __ STA T2 + 1 
01:8458 : 20 48 3b JSR $3b48 
01:845b : 18 __ __ CLC
01:845c : a5 1b __ LDA ACCU + 0 
01:845e : 69 b2 __ ADC #$b2
01:8460 : 85 50 __ STA T4 + 0 
01:8462 : a5 1c __ LDA ACCU + 1 
01:8464 : 69 07 __ ADC #$07
01:8466 : 85 51 __ STA T4 + 1 
01:8468 : a9 07 __ LDA #$07
01:846a : c5 51 __ CMP T4 + 1 
01:846c : f0 04 __ BEQ $8472 ; (UNIX_epoch_to_UII_time.s21 + 0)
.s22:
01:846e : 90 08 __ BCC $8478 ; (UNIX_epoch_to_UII_time.s14 + 0)
01:8470 : b0 4f __ BCS $84c1 ; (UNIX_epoch_to_UII_time.s5 + 0)
.s21:
01:8472 : a5 50 __ LDA T4 + 0 
01:8474 : c9 b5 __ CMP #$b5
01:8476 : 90 49 __ BCC $84c1 ; (UNIX_epoch_to_UII_time.s5 + 0)
.s14:
01:8478 : a9 b4 __ LDA #$b4
01:847a : 85 53 __ STA T5 + 0 
01:847c : a9 07 __ LDA #$07
01:847e : 85 54 __ STA T5 + 1 
.l15:
01:8480 : a5 53 __ LDA T5 + 0 
01:8482 : 29 03 __ AND #$03
01:8484 : d0 0f __ BNE $8495 ; (UNIX_epoch_to_UII_time.s16 + 0)
.s20:
01:8486 : a5 53 __ LDA T5 + 0 
01:8488 : 85 1b __ STA ACCU + 0 
01:848a : a5 54 __ LDA T5 + 1 
01:848c : 85 1c __ STA ACCU + 1 
01:848e : 20 3d 3b JSR $3b3d 
01:8491 : a5 05 __ LDA WORK + 2 
01:8493 : d0 11 __ BNE $84a6 ; (UNIX_epoch_to_UII_time.s19 + 0)
.s16:
01:8495 : a5 53 __ LDA T5 + 0 
01:8497 : 85 1b __ STA ACCU + 0 
01:8499 : a5 54 __ LDA T5 + 1 
01:849b : 85 1c __ STA ACCU + 1 
01:849d : 20 83 36 JSR $3683 
01:84a0 : a5 05 __ LDA WORK + 2 
01:84a2 : 05 06 __ ORA WORK + 3 
01:84a4 : d0 02 __ BNE $84a8 ; (UNIX_epoch_to_UII_time.s17 + 0)
.s19:
01:84a6 : e6 52 __ INC T7 + 0 
.s17:
01:84a8 : 18 __ __ CLC
01:84a9 : a5 53 __ LDA T5 + 0 
01:84ab : 69 04 __ ADC #$04
01:84ad : 85 53 __ STA T5 + 0 
01:84af : a5 54 __ LDA T5 + 1 
01:84b1 : 69 00 __ ADC #$00
01:84b3 : 85 54 __ STA T5 + 1 
01:84b5 : c5 51 __ CMP T4 + 1 
01:84b7 : 90 c7 __ BCC $8480 ; (UNIX_epoch_to_UII_time.l15 + 0)
.s25:
01:84b9 : d0 06 __ BNE $84c1 ; (UNIX_epoch_to_UII_time.s5 + 0)
.s18:
01:84bb : a5 53 __ LDA T5 + 0 
01:84bd : c5 50 __ CMP T4 + 0 
01:84bf : 90 bf __ BCC $8480 ; (UNIX_epoch_to_UII_time.l15 + 0)
.s5:
01:84c1 : 38 __ __ SEC
01:84c2 : a5 4b __ LDA T2 + 0 
01:84c4 : e5 52 __ SBC T7 + 0 
01:84c6 : 85 1b __ STA ACCU + 0 
01:84c8 : a5 4c __ LDA T2 + 1 
01:84ca : e9 00 __ SBC #$00
01:84cc : 85 1c __ STA ACCU + 1 
01:84ce : 20 48 3b JSR $3b48 
01:84d1 : 18 __ __ CLC
01:84d2 : a5 05 __ LDA WORK + 2 
01:84d4 : 69 01 __ ADC #$01
01:84d6 : 85 50 __ STA T4 + 0 
01:84d8 : a5 06 __ LDA WORK + 3 
01:84da : 69 00 __ ADC #$00
01:84dc : 85 51 __ STA T4 + 1 
01:84de : 18 __ __ CLC
01:84df : a5 1b __ LDA ACCU + 0 
01:84e1 : 69 b2 __ ADC #$b2
01:84e3 : 85 4b __ STA T2 + 0 
01:84e5 : a5 1c __ LDA ACCU + 1 
01:84e7 : 69 07 __ ADC #$07
01:84e9 : 85 4c __ STA T2 + 1 
01:84eb : a5 4b __ LDA T2 + 0 
01:84ed : 29 03 __ AND #$03
01:84ef : d0 0f __ BNE $8500 ; (UNIX_epoch_to_UII_time.s6 + 0)
.s13:
01:84f1 : a5 4b __ LDA T2 + 0 
01:84f3 : 85 1b __ STA ACCU + 0 
01:84f5 : a5 4c __ LDA T2 + 1 
01:84f7 : 85 1c __ STA ACCU + 1 
01:84f9 : 20 3d 3b JSR $3b3d 
01:84fc : a5 05 __ LDA WORK + 2 
01:84fe : d0 15 __ BNE $8515 ; (UNIX_epoch_to_UII_time.s24 + 0)
.s6:
01:8500 : a5 4b __ LDA T2 + 0 
01:8502 : 85 1b __ STA ACCU + 0 
01:8504 : a5 4c __ LDA T2 + 1 
01:8506 : 85 1c __ STA ACCU + 1 
01:8508 : 20 83 36 JSR $3683 
01:850b : a5 05 __ LDA WORK + 2 
01:850d : 05 06 __ ORA WORK + 3 
01:850f : f0 04 __ BEQ $8515 ; (UNIX_epoch_to_UII_time.s24 + 0)
.s23:
01:8511 : a9 1c __ LDA #$1c
01:8513 : d0 02 __ BNE $8517 ; (UNIX_epoch_to_UII_time.s7 + 0)
.s24:
01:8515 : a9 1d __ LDA #$1d
.s7:
01:8517 : 8d b1 9e STA $9eb1 ; (month_days[0] + 1)
01:851a : a0 00 __ LDY #$00
01:851c : 84 53 __ STY T5 + 0 
01:851e : a2 00 __ LDX #$00
01:8520 : e4 51 __ CPX T4 + 1 
01:8522 : d0 04 __ BNE $8528 ; (UNIX_epoch_to_UII_time.l12 + 0)
.s11:
01:8524 : a5 53 __ LDA T5 + 0 
01:8526 : c5 50 __ CMP T4 + 0 
.l12:
01:8528 : b0 16 __ BCS $8540 ; (UNIX_epoch_to_UII_time.s10 + 0)
.s9:
01:852a : b9 b0 9e LDA $9eb0,y ; (month_days[0] + 0)
01:852d : 65 53 __ ADC T5 + 0 
01:852f : 85 53 __ STA T5 + 0 
01:8531 : 8a __ __ TXA
01:8532 : 69 00 __ ADC #$00
01:8534 : c8 __ __ INY
01:8535 : c0 0c __ CPY #$0c
01:8537 : b0 07 __ BCS $8540 ; (UNIX_epoch_to_UII_time.s10 + 0)
.s8:
01:8539 : aa __ __ TAX
01:853a : e4 51 __ CPX T4 + 1 
01:853c : d0 ea __ BNE $8528 ; (UNIX_epoch_to_UII_time.l12 + 0)
01:853e : f0 e4 __ BEQ $8524 ; (UNIX_epoch_to_UII_time.s11 + 0)
.s10:
01:8540 : 8c da 7f STY $7fda ; (settime[0] + 1)
01:8543 : a5 4f __ LDA T3 + 0 
01:8545 : 8d dc 7f STA $7fdc ; (settime[0] + 3)
01:8548 : a5 47 __ LDA T1 + 0 
01:854a : 8d dd 7f STA $7fdd ; (settime[0] + 4)
01:854d : a5 43 __ LDA T0 + 0 
01:854f : 8d de 7f STA $7fde ; (settime[0] + 5)
01:8552 : a5 4b __ LDA T2 + 0 
01:8554 : e9 6c __ SBC #$6c
01:8556 : 8d d9 7f STA $7fd9 ; (settime[0] + 0)
01:8559 : a5 53 __ LDA T5 + 0 
01:855b : 38 __ __ SEC
01:855c : f9 af 9e SBC $9eaf,y 
01:855f : 49 ff __ EOR #$ff
01:8561 : 38 __ __ SEC
01:8562 : 65 50 __ ADC T4 + 0 
01:8564 : 8d db 7f STA $7fdb ; (settime[0] + 2)
01:8567 : a9 d9 __ LDA #$d9
01:8569 : 85 1b __ STA ACCU + 0 
01:856b : a9 7f __ LDA #$7f
01:856d : 85 1c __ STA ACCU + 1 
.s3:
01:856f : ad d2 7f LDA $7fd2 ; (UNIX_epoch_to_UII_time@stack + 0)
01:8572 : 85 53 __ STA T5 + 0 
01:8574 : ad d3 7f LDA $7fd3 ; (UNIX_epoch_to_UII_time@stack + 1)
01:8577 : 85 54 __ STA T5 + 1 
01:8579 : 60 __ __ RTS
--------------------------------------------------------------------
01:857a : __ __ __ BYT 0a 73 54 41 54 55 53 3a 20 25 53 00             : .sTATUS: %S.
--------------------------------------------------------------------
01:8586 : __ __ __ BYT 0a 72 74 63 20 43 4c 4f 43 4b 20 53 45 54 20 54 : .rtc CLOCK SET T
01:8596 : __ __ __ BYT 4f 20 25 53 00                                  : O %S.
--------------------------------------------------------------------
mainmenu: ; mainmenu()->void
;   7, "/home/xahmol/git/UBoot64-v2/src/slotmenu.h"
.s4:
01:859b : 20 f2 0d JSR $0df2 
01:859e : a9 8d __ LDA #$8d
01:85a0 : 85 14 __ STA P7 
01:85a2 : a9 86 __ LDA #$86
01:85a4 : 85 15 __ STA P8 
01:85a6 : 20 9a 0e JSR $0e9a 
01:85a9 : a9 00 __ LDA #$00
01:85ab : 85 4b __ STA T2 + 0 
.l5:
01:85ad : 20 f8 25 JSR $25f8 
01:85b0 : 20 25 3d JSR $3d25 
01:85b3 : a5 1b __ LDA ACCU + 0 
01:85b5 : 05 1c __ ORA ACCU + 1 
01:85b7 : f0 1d __ BEQ $85d6 ; (mainmenu.s6 + 0)
.s19:
01:85b9 : a5 4b __ LDA T2 + 0 
01:85bb : 85 18 __ STA P11 
01:85bd : 20 a2 86 JSR $86a2 ; (menuslotnumnerprint.s4 + 0)
01:85c0 : a9 05 __ LDA #$05
01:85c2 : 85 0d __ STA P0 
01:85c4 : a9 c9 __ LDA #$c9
01:85c6 : 85 0f __ STA P2 
01:85c8 : a9 4e __ LDA #$4e
01:85ca : 85 10 __ STA P3 
01:85cc : 18 __ __ CLC
01:85cd : a5 18 __ LDA P11 
01:85cf : 69 03 __ ADC #$03
01:85d1 : 85 0e __ STA P1 
01:85d3 : 20 ab 3b JSR $3bab 
.s6:
01:85d6 : e6 4b __ INC T2 + 0 
01:85d8 : a5 4b __ LDA T2 + 0 
01:85da : c9 12 __ CMP #$12
01:85dc : 90 cf __ BCC $85ad ; (mainmenu.l5 + 0)
.s7:
01:85de : 20 af 3c JSR $3caf 
01:85e1 : a9 f1 __ LDA #$f1
01:85e3 : 85 0f __ STA P2 
01:85e5 : a9 86 __ LDA #$86
01:85e7 : 85 10 __ STA P3 
01:85e9 : 20 63 3b JSR $3b63 
01:85ec : 20 97 3c JSR $3c97 
01:85ef : a9 05 __ LDA #$05
01:85f1 : 85 0f __ STA P2 
01:85f3 : a9 87 __ LDA #$87
01:85f5 : 85 10 __ STA P3 
01:85f7 : 20 cb 3b JSR $3bcb 
01:85fa : a9 16 __ LDA #$16
01:85fc : 85 10 __ STA P3 
01:85fe : 20 37 3c JSR $3c37 
01:8601 : a9 16 __ LDA #$16
01:8603 : 85 0e __ STA P1 
01:8605 : a9 16 __ LDA #$16
01:8607 : 85 0f __ STA P2 
01:8609 : a9 87 __ LDA #$87
01:860b : 85 10 __ STA P3 
01:860d : 20 73 3b JSR $3b73 
01:8610 : a9 14 __ LDA #$14
01:8612 : 85 0f __ STA P2 
01:8614 : a9 16 __ LDA #$16
01:8616 : 85 10 __ STA P3 
01:8618 : 20 7f 3c JSR $3c7f 
01:861b : a9 19 __ LDA #$19
01:861d : 85 0d __ STA P0 
01:861f : a9 2a __ LDA #$2a
01:8621 : 85 0f __ STA P2 
01:8623 : a9 87 __ LDA #$87
01:8625 : 85 10 __ STA P3 
01:8627 : 20 e7 3b JSR $3be7 
01:862a : a9 17 __ LDA #$17
01:862c : 85 10 __ STA P3 
01:862e : 20 21 10 JSR $1021 
01:8631 : a9 17 __ LDA #$17
01:8633 : 85 0e __ STA P1 
01:8635 : a9 3d __ LDA #$3d
01:8637 : 85 0f __ STA P2 
01:8639 : a9 87 __ LDA #$87
01:863b : 85 10 __ STA P3 
01:863d : 20 73 3b JSR $3b73 
01:8640 : e6 0e __ INC P1 
01:8642 : a9 4b __ LDA #$4b
01:8644 : 85 0f __ STA P2 
01:8646 : a9 87 __ LDA #$87
01:8648 : 85 10 __ STA P3 
01:864a : 20 7f 3b JSR $3b7f 
.l8:
01:864d : 20 50 14 JSR $1450 
01:8650 : a5 1b __ LDA ACCU + 0 
01:8652 : c9 85 __ CMP #$85
01:8654 : f0 33 __ BEQ $8689 ; (mainmenu.s17 + 0)
.s9:
01:8656 : c9 89 __ CMP #$89
01:8658 : f0 2f __ BEQ $8689 ; (mainmenu.s17 + 0)
.s10:
01:865a : c9 86 __ CMP #$86
01:865c : f0 2b __ BEQ $8689 ; (mainmenu.s17 + 0)
.s11:
01:865e : c9 87 __ CMP #$87
01:8660 : f0 27 __ BEQ $8689 ; (mainmenu.s17 + 0)
.s12:
01:8662 : c9 88 __ CMP #$88
01:8664 : f0 23 __ BEQ $8689 ; (mainmenu.s17 + 0)
.s13:
01:8666 : c9 30 __ CMP #$30
01:8668 : 90 e3 __ BCC $864d ; (mainmenu.l8 + 0)
.s18:
01:866a : 85 4a __ STA T1 + 0 
01:866c : c9 3a __ CMP #$3a
01:866e : 90 08 __ BCC $8678 ; (mainmenu.s16 + 0)
.s14:
01:8670 : c9 41 __ CMP #$41
01:8672 : 90 d9 __ BCC $864d ; (mainmenu.l8 + 0)
.s15:
01:8674 : c9 5b __ CMP #$5b
01:8676 : b0 d5 __ BCS $864d ; (mainmenu.l8 + 0)
.s16:
01:8678 : 20 5d 87 JSR $875d ; (keytomenuslot.s4 + 0)
01:867b : 20 f8 25 JSR $25f8 
01:867e : 20 25 3d JSR $3d25 
01:8681 : a5 1b __ LDA ACCU + 0 
01:8683 : 05 1c __ ORA ACCU + 1 
01:8685 : f0 c6 __ BEQ $864d ; (mainmenu.l8 + 0)
.s20:
01:8687 : a5 4a __ LDA T1 + 0 
.s17:
01:8689 : 8d f4 4c STA $4cf4 ; (menuselect + 0)
.s3:
01:868c : 60 __ __ RTS
--------------------------------------------------------------------
01:868d : __ __ __ BYT 77 45 4c 43 4f 4d 45 20 54 4f 20 59 4f 55 52 20 : wELCOME TO YOUR 
01:869d : __ __ __ BYT 63 36 34 2e 00                                  : c64..
--------------------------------------------------------------------
menuslotnumnerprint: ; menuslotnumnerprint(u8)->void
; 114, "/home/xahmol/git/UBoot64-v2/src/slotmenu.c"
.s4:
01:86a2 : a5 18 __ LDA P11 ; (slotnumber + 0)
01:86a4 : 20 e2 86 JSR $86e2 ; (menuslotkey.s4 + 0)
01:86a7 : 8d e7 7f STA $7fe7 ; (sstack + 8)
01:86aa : a9 72 __ LDA #$72
01:86ac : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:86af : a9 49 __ LDA #$49
01:86b1 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:86b4 : a9 dc __ LDA #$dc
01:86b6 : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:86b9 : a9 86 __ LDA #$86
01:86bb : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:86be : a9 00 __ LDA #$00
01:86c0 : 8d e8 7f STA $7fe8 ; (sstack + 9)
01:86c3 : 20 d1 15 JSR $15d1 
01:86c6 : a9 00 __ LDA #$00
01:86c8 : 85 0f __ STA P2 
01:86ca : a9 72 __ LDA #$72
01:86cc : 85 11 __ STA P4 
01:86ce : a9 49 __ LDA #$49
01:86d0 : 85 12 __ STA P5 
01:86d2 : 18 __ __ CLC
01:86d3 : a5 18 __ LDA P11 ; (slotnumber + 0)
01:86d5 : 69 03 __ ADC #$03
01:86d7 : 85 10 __ STA P3 
01:86d9 : 4c 8f 3c JMP $3c8f 
--------------------------------------------------------------------
01:86dc : __ __ __ BYT 20 20 25 43 20 00                               :   %C .
--------------------------------------------------------------------
menuslotkey: ; menuslotkey(u8)->u8
;   4, "/home/xahmol/git/UBoot64-v2/src/slotmenu.h"
.s4:
01:86e2 : c9 0a __ CMP #$0a
01:86e4 : b0 03 __ BCS $86e9 ; (menuslotkey.s5 + 0)
.s6:
01:86e6 : 09 30 __ ORA #$30
01:86e8 : 60 __ __ RTS
.s5:
01:86e9 : 69 56 __ ADC #$56
.s3:
01:86eb : 60 __ __ RTS
--------------------------------------------------------------------
01:86ec : __ __ __ BYT 20 66 31 20 00                                  :  f1 .
--------------------------------------------------------------------
01:86f1 : __ __ __ BYT 66 49 4c 45 42 52 4f 57 53 45 52 00             : fILEBROWSER.
--------------------------------------------------------------------
01:86fd : __ __ __ BYT 62 00                                           : b.
--------------------------------------------------------------------
01:8700 : __ __ __ BYT 20 66 32 20 00                                  :  f2 .
--------------------------------------------------------------------
01:8705 : __ __ __ BYT 69 4e 46 4f 52 4d 41 54 49 4f 4e 00             : iNFORMATION.
--------------------------------------------------------------------
01:8711 : __ __ __ BYT 20 66 33 20 00                                  :  f3 .
--------------------------------------------------------------------
01:8716 : __ __ __ BYT 65 44 49 54 2f 6f 52 44 45 52 2f 64 45 4c 00    : eDIT/oRDER/dEL.
--------------------------------------------------------------------
01:8725 : __ __ __ BYT 20 66 35 20 00                                  :  f5 .
--------------------------------------------------------------------
01:872a : __ __ __ BYT 63 4f 4e 46 49 47 55 52 41 54 49 4f 4e 00       : cONFIGURATION.
--------------------------------------------------------------------
01:8738 : __ __ __ BYT 20 66 37 20 00                                  :  f7 .
--------------------------------------------------------------------
01:873d : __ __ __ BYT 71 55 49 54 20 54 4f 20 62 61 73 69 63 00       : qUIT TO basic.
--------------------------------------------------------------------
01:874b : __ __ __ BYT 6d 41 4b 45 20 59 4f 55 52 20 43 48 4f 49 43 45 : mAKE YOUR CHOICE
01:875b : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
keytomenuslot: ; keytomenuslot(u8)->u8
;   5, "/home/xahmol/git/UBoot64-v2/src/slotmenu.h"
.s4:
01:875d : c9 41 __ CMP #$41
01:875f : b0 03 __ BCS $8764 ; (keytomenuslot.s6 + 0)
.s5:
01:8761 : e9 2f __ SBC #$2f
01:8763 : 60 __ __ RTS
.s6:
01:8764 : e9 37 __ SBC #$37
.s3:
01:8766 : 60 __ __ RTS
--------------------------------------------------------------------
runbootfrommenu: ; runbootfrommenu(u8)->void
;  15, "/home/xahmol/git/UBoot64-v2/src/slotmenu.h"
.s1:
01:8767 : a5 53 __ LDA T0 + 0 
01:8769 : 8d f5 7e STA $7ef5 ; (runbootfrommenu@stack + 0)
.s4:
01:876c : ad ff 7f LDA $7fff ; (sstack + 32)
01:876f : 20 f8 25 JSR $25f8 
01:8772 : 20 f6 0d JSR $0df6 
01:8775 : a9 00 __ LDA #$00
01:8777 : 8d 68 49 STA $4968 ; (cw.cx + 0)
01:877a : 8d 69 49 STA $4969 ; (cw.cy + 0)
01:877d : ad a2 50 LDA $50a2 ; (Slot.command + 0)
01:8780 : 29 04 __ AND #$04
01:8782 : f0 52 __ BEQ $87d6 ; (runbootfrommenu.s5 + 0)
.s13:
01:8784 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8787 : 85 18 __ STA P11 
01:8789 : a9 be __ LDA #$be
01:878b : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:878e : a9 88 __ LDA #$88
01:8790 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8793 : a9 a3 __ LDA #$a3
01:8795 : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:8798 : a9 51 __ LDA #$51
01:879a : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:879d : ad d6 51 LDA $51d6 ; (Slot.image_a_id + 0)
01:87a0 : 8d e7 7f STA $7fe7 ; (sstack + 8)
01:87a3 : a9 00 __ LDA #$00
01:87a5 : 8d e8 7f STA $7fe8 ; (sstack + 9)
01:87a8 : 20 25 15 JSR $1525 
01:87ab : a9 00 __ LDA #$00
01:87ad : 8d ed 7f STA $7fed ; (sstack + 14)
01:87b0 : 20 cc 88 JSR $88cc ; (ToggleDrivePower.s4 + 0)
01:87b3 : ad d6 51 LDA $51d6 ; (Slot.image_a_id + 0)
01:87b6 : 85 53 __ STA T0 + 0 
01:87b8 : 20 27 3b JSR $3b27 
01:87bb : a9 a3 __ LDA #$a3
01:87bd : 85 12 __ STA P5 
01:87bf : a9 51 __ LDA #$51
01:87c1 : 85 13 __ STA P6 
01:87c3 : 20 f0 2a JSR $2af0 
01:87c6 : 20 a3 89 JSR $89a3 ; (ErrorCheckMmounting.s4 + 0)
01:87c9 : a9 00 __ LDA #$00
01:87cb : 8d 09 dc STA $dc09 
01:87ce : 8d 08 dc STA $dc08 
.l14:
01:87d1 : ad 09 dc LDA $dc09 
01:87d4 : f0 fb __ BEQ $87d1 ; (runbootfrommenu.l14 + 0)
.s5:
01:87d6 : ad a2 50 LDA $50a2 ; (Slot.command + 0)
01:87d9 : 29 08 __ AND #$08
01:87db : f0 5a __ BEQ $8837 ; (runbootfrommenu.s6 + 0)
.s11:
01:87dd : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:87e0 : 85 18 __ STA P11 
01:87e2 : a9 be __ LDA #$be
01:87e4 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:87e7 : a9 88 __ LDA #$88
01:87e9 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:87ec : a9 d7 __ LDA #$d7
01:87ee : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:87f1 : a9 52 __ LDA #$52
01:87f3 : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:87f6 : ad 0a 53 LDA $530a ; (Slot.image_b_id + 0)
01:87f9 : 8d e7 7f STA $7fe7 ; (sstack + 8)
01:87fc : a9 00 __ LDA #$00
01:87fe : 8d e8 7f STA $7fe8 ; (sstack + 9)
01:8801 : 20 25 15 JSR $1525 
01:8804 : a9 01 __ LDA #$01
01:8806 : 8d ed 7f STA $7fed ; (sstack + 14)
01:8809 : 20 cc 88 JSR $88cc ; (ToggleDrivePower.s4 + 0)
01:880c : ad 0a 53 LDA $530a ; (Slot.image_b_id + 0)
01:880f : 85 53 __ STA T0 + 0 
01:8811 : a9 d7 __ LDA #$d7
01:8813 : 85 11 __ STA P4 
01:8815 : a9 51 __ LDA #$51
01:8817 : 85 12 __ STA P5 
01:8819 : 20 66 14 JSR $1466 
01:881c : a9 d7 __ LDA #$d7
01:881e : 85 12 __ STA P5 
01:8820 : a9 52 __ LDA #$52
01:8822 : 85 13 __ STA P6 
01:8824 : 20 f0 2a JSR $2af0 
01:8827 : 20 a3 89 JSR $89a3 ; (ErrorCheckMmounting.s4 + 0)
01:882a : a9 00 __ LDA #$00
01:882c : 8d 09 dc STA $dc09 
01:882f : 8d 08 dc STA $dc08 
.l12:
01:8832 : ad 09 dc LDA $dc09 
01:8835 : f0 fb __ BEQ $8832 ; (runbootfrommenu.l12 + 0)
.s6:
01:8837 : ad a2 50 LDA $50a2 ; (Slot.command + 0)
01:883a : 29 02 __ AND #$02
01:883c : f0 3c __ BEQ $887a ; (runbootfrommenu.s7 + 0)
.s10:
01:883e : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8841 : 85 18 __ STA P11 
01:8843 : a9 4f __ LDA #$4f
01:8845 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8848 : a9 8a __ LDA #$8a
01:884a : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:884d : a9 6c __ LDA #$6c
01:884f : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:8852 : a9 4f __ LDA #$4f
01:8854 : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:8857 : 20 25 15 JSR $1525 
01:885a : 20 27 3b JSR $3b27 
01:885d : a9 01 __ LDA #$01
01:885f : 85 11 __ STA P4 
01:8861 : a9 4f __ LDA #$4f
01:8863 : 85 13 __ STA P6 
01:8865 : a9 6c __ LDA #$6c
01:8867 : 85 12 __ STA P5 
01:8869 : 20 54 1c JSR $1c54 
01:886c : ad 9f 50 LDA $509f ; (Slot.reusize + 0)
01:886f : 85 11 __ STA P4 
01:8871 : 20 97 2b JSR $2b97 
01:8874 : 20 db 1d JSR $1ddb 
01:8877 : 20 a3 89 JSR $89a3 ; (ErrorCheckMmounting.s4 + 0)
.s7:
01:887a : ad a0 50 LDA $50a0 ; (Slot.runboot + 0)
01:887d : 4a __ __ LSR
01:887e : 90 05 __ BCC $8885 ; (runbootfrommenu.s8 + 0)
.s9:
01:8880 : ad d6 51 LDA $51d6 ; (Slot.image_a_id + 0)
01:8883 : b0 13 __ BCS $8898 ; (runbootfrommenu.s15 + 0)
.s8:
01:8885 : ad a1 50 LDA $50a1 ; (Slot.device + 0)
01:8888 : 85 10 __ STA P3 
01:888a : a9 c9 __ LDA #$c9
01:888c : 85 11 __ STA P4 
01:888e : a9 4d __ LDA #$4d
01:8890 : 85 12 __ STA P5 
01:8892 : 20 79 2d JSR $2d79 
01:8895 : ad a1 50 LDA $50a1 ; (Slot.device + 0)
.s15:
01:8898 : 8d fb 7f STA $7ffb ; (sstack + 28)
01:889b : a9 e8 __ LDA #$e8
01:889d : 8d f9 7f STA $7ff9 ; (sstack + 26)
01:88a0 : a9 4e __ LDA #$4e
01:88a2 : 8d fa 7f STA $7ffa ; (sstack + 27)
01:88a5 : ad a0 50 LDA $50a0 ; (Slot.runboot + 0)
01:88a8 : 8d fc 7f STA $7ffc ; (sstack + 29)
01:88ab : a9 1b __ LDA #$1b
01:88ad : 8d fd 7f STA $7ffd ; (sstack + 30)
01:88b0 : a9 4f __ LDA #$4f
01:88b2 : 8d fe 7f STA $7ffe ; (sstack + 31)
01:88b5 : 20 c3 2b JSR $2bc3 
.s3:
01:88b8 : ad f5 7e LDA $7ef5 ; (runbootfrommenu@stack + 0)
01:88bb : 85 53 __ STA T0 + 0 
01:88bd : 60 __ __ RTS
--------------------------------------------------------------------
01:88be : __ __ __ BYT 25 53 20 4f 4e 20 69 64 20 25 44 2e 0a 00       : %S ON id %D...
--------------------------------------------------------------------
ToggleDrivePower: ; ToggleDrivePower(u8,u8)->void
; 379, "/home/xahmol/git/UBoot64-v2/src/slotmenu.c"
.s4:
01:88cc : 20 35 26 JSR $2635 
01:88cf : a5 1b __ LDA ACCU + 0 
01:88d1 : d0 03 __ BNE $88d6 ; (ToggleDrivePower.s6 + 0)
.s5:
01:88d3 : 20 a3 89 JSR $89a3 ; (ErrorCheckMmounting.s4 + 0)
.s6:
01:88d6 : ad ed 7f LDA $7fed ; (sstack + 14)
01:88d9 : 85 4d __ STA T3 + 0 
01:88db : 0a __ __ ASL
01:88dc : 0a __ __ ASL
01:88dd : 85 4c __ STA T1 + 0 
01:88df : aa __ __ TAX
01:88e0 : bd e4 4c LDA $4ce4,x ; (uii_devinfo[0].exist + 0)
01:88e3 : d0 03 __ BNE $88e8 ; (ToggleDrivePower.s10 + 0)
01:88e5 : 4c 91 89 JMP $8991 ; (ToggleDrivePower.s7 + 0)
.s10:
01:88e8 : a5 4d __ LDA T3 + 0 
01:88ea : d0 07 __ BNE $88f3 ; (ToggleDrivePower.s19 + 0)
.s11:
01:88ec : a9 89 __ LDA #$89
01:88ee : a0 fb __ LDY #$fb
01:88f0 : 4c f7 88 JMP $88f7 ; (ToggleDrivePower.s12 + 0)
.s19:
01:88f3 : a9 86 __ LDA #$86
01:88f5 : a0 fd __ LDY #$fd
.s12:
01:88f7 : 8c e5 7f STY $7fe5 ; (sstack + 6)
01:88fa : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:88fd : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8900 : 85 18 __ STA P11 
01:8902 : a9 f1 __ LDA #$f1
01:8904 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8907 : a9 89 __ LDA #$89
01:8909 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:890c : 20 25 15 JSR $1525 
01:890f : a6 4c __ LDX T1 + 0 
01:8911 : bd e6 4c LDA $4ce6,x ; (uii_devinfo[0].power + 0)
01:8914 : f0 15 __ BEQ $892b ; (ToggleDrivePower.s13 + 0)
.s18:
01:8916 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8919 : 85 18 __ STA P11 
01:891b : a9 42 __ LDA #$42
01:891d : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8920 : a9 8a __ LDA #$8a
01:8922 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8925 : 20 25 15 JSR $1525 
01:8928 : 4c 91 89 JMP $8991 ; (ToggleDrivePower.s7 + 0)
.s13:
01:892b : a5 4d __ LDA T3 + 0 
01:892d : d0 06 __ BNE $8935 ; (ToggleDrivePower.s17 + 0)
.s14:
01:892f : 20 75 2a JSR $2a75 
01:8932 : 4c 5e 89 JMP $895e ; (ToggleDrivePower.s15 + 0)
.s17:
01:8935 : a9 00 __ LDA #$00
01:8937 : 85 10 __ STA P3 
01:8939 : 8d fd 7e STA $7efd ; (cmd[0] + 0)
01:893c : a9 02 __ LDA #$02
01:893e : 85 0f __ STA P2 
01:8940 : a9 04 __ LDA #$04
01:8942 : 8d 8a 3d STA $3d8a 
01:8945 : a9 32 __ LDA #$32
01:8947 : 8d fe 7e STA $7efe ; (cmd[0] + 1)
01:894a : a9 fd __ LDA #$fd
01:894c : 85 0d __ STA P0 
01:894e : a9 7e __ LDA #$7e
01:8950 : 85 0e __ STA P1 
01:8952 : 20 53 11 JSR $1153 
01:8955 : 20 ce 11 JSR $11ce 
01:8958 : 20 0c 12 JSR $120c 
01:895b : 20 18 11 JSR $1118 
.s15:
01:895e : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8961 : 85 18 __ STA P11 
01:8963 : a9 15 __ LDA #$15
01:8965 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8968 : a9 8a __ LDA #$8a
01:896a : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:896d : 20 25 15 JSR $1525 
01:8970 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8973 : 85 18 __ STA P11 
01:8975 : a9 22 __ LDA #$22
01:8977 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:897a : a9 8a __ LDA #$8a
01:897c : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:897f : 20 25 15 JSR $1525 
01:8982 : a9 00 __ LDA #$00
01:8984 : 8d 09 dc STA $dc09 
01:8987 : 8d 08 dc STA $dc08 
.l16:
01:898a : ad 09 dc LDA $dc09 
01:898d : c9 02 __ CMP #$02
01:898f : 90 f9 __ BCC $898a ; (ToggleDrivePower.l16 + 0)
.s7:
01:8991 : ad d7 4b LDA $4bd7 ; (uii_status[0] + 0)
01:8994 : c9 30 __ CMP #$30
01:8996 : d0 07 __ BNE $899f ; (ToggleDrivePower.s9 + 0)
.s8:
01:8998 : ad d8 4b LDA $4bd8 ; (uii_status[0] + 1)
01:899b : c9 30 __ CMP #$30
01:899d : f0 03 __ BEQ $89a2 ; (ToggleDrivePower.s3 + 0)
.s9:
01:899f : 4c a3 89 JMP $89a3 ; (ErrorCheckMmounting.s4 + 0)
.s3:
01:89a2 : 60 __ __ RTS
--------------------------------------------------------------------
ErrorCheckMmounting: ; ErrorCheckMmounting()->void
; 357, "/home/xahmol/git/UBoot64-v2/src/slotmenu.c"
.s4:
01:89a3 : ad d7 4b LDA $4bd7 ; (uii_status[0] + 0)
01:89a6 : c9 30 __ CMP #$30
01:89a8 : d0 07 __ BNE $89b1 ; (ErrorCheckMmounting.s6 + 0)
.s5:
01:89aa : ad d8 4b LDA $4bd8 ; (uii_status[0] + 1)
01:89ad : c9 30 __ CMP #$30
01:89af : f0 3b __ BEQ $89ec ; (ErrorCheckMmounting.s3 + 0)
.s6:
01:89b1 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:89b4 : 85 18 __ STA P11 
01:89b6 : a9 00 __ LDA #$00
01:89b8 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:89bb : a9 8a __ LDA #$8a
01:89bd : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:89c0 : 20 25 15 JSR $1525 
01:89c3 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:89c6 : 85 18 __ STA P11 
01:89c8 : a9 d7 __ LDA #$d7
01:89ca : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:89cd : a9 4b __ LDA #$4b
01:89cf : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:89d2 : a9 ed __ LDA #$ed
01:89d4 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:89d7 : a9 89 __ LDA #$89
01:89d9 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:89dc : 20 25 15 JSR $1525 
01:89df : a9 fe __ LDA #$fe
01:89e1 : 8d eb 7f STA $7feb ; (sstack + 12)
01:89e4 : a9 82 __ LDA #$82
01:89e6 : 8d ec 7f STA $7fec ; (sstack + 13)
01:89e9 : 4c 01 15 JMP $1501 
.s3:
01:89ec : 60 __ __ RTS
--------------------------------------------------------------------
01:89ed : __ __ __ BYT 25 53 0a 00                                     : %S..
--------------------------------------------------------------------
01:89f1 : __ __ __ BYT 64 52 49 56 45 20 25 53 20 00                   : dRIVE %S .
--------------------------------------------------------------------
01:89fb : __ __ __ BYT 61 00                                           : a.
--------------------------------------------------------------------
01:89fd : __ __ __ BYT 25 43 00                                        : %C.
--------------------------------------------------------------------
01:8a00 : __ __ __ BYT 0a 65 52 52 4f 52 20 4f 4e 20 4d 4f 55 4e 54 49 : .eRROR ON MOUNTI
01:8a10 : __ __ __ BYT 4e 47 2e 0a 00                                  : NG...
--------------------------------------------------------------------
01:8a15 : __ __ __ BYT 50 4f 57 45 52 45 44 20 4f 4e 2e 0a 00          : POWERED ON...
--------------------------------------------------------------------
01:8a22 : __ __ __ BYT 77 41 49 54 49 4e 47 20 46 4f 52 20 44 52 49 56 : wAITING FOR DRIV
01:8a32 : __ __ __ BYT 45 20 54 4f 20 42 45 20 52 45 41 44 59 2e 0a 00 : E TO BE READY...
--------------------------------------------------------------------
01:8a42 : __ __ __ BYT 41 4c 52 45 41 44 59 20 4f 4e 2e 0a 00          : ALREADY ON...
--------------------------------------------------------------------
01:8a4f : __ __ __ BYT 72 65 75 20 46 49 4c 45 20 25 53 00             : reu FILE %S.
--------------------------------------------------------------------
information: ; information()->void
;  14, "/home/xahmol/git/UBoot64-v2/src/slotmenu.h"
.s4:
01:8a5b : 20 f2 0d JSR $0df2 
01:8a5e : ad 10 d0 LDA $d010 
01:8a61 : 09 01 __ ORA #$01
01:8a63 : 8d 10 d0 STA $d010 
01:8a66 : ad 15 d0 LDA $d015 
01:8a69 : 09 01 __ ORA #$01
01:8a6b : 8d 15 d0 STA $d015 
01:8a6e : a9 dc __ LDA #$dc
01:8a70 : 8d 01 d0 STA $d001 
01:8a73 : a9 40 __ LDA #$40
01:8a75 : 8d 00 d0 STA $d000 
01:8a78 : a9 69 __ LDA #$69
01:8a7a : 85 14 __ STA P7 
01:8a7c : a9 8b __ LDA #$8b
01:8a7e : 85 15 __ STA P8 
01:8a80 : 20 9a 0e JSR $0e9a 
01:8a83 : a9 00 __ LDA #$00
01:8a85 : 8d 68 49 STA $4968 ; (cw.cx + 0)
01:8a88 : a9 03 __ LDA #$03
01:8a8a : 8d 69 49 STA $4969 ; (cw.cy + 0)
01:8a8d : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8a90 : 85 18 __ STA P11 
01:8a92 : a9 7a __ LDA #$7a
01:8a94 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8a97 : a9 8b __ LDA #$8b
01:8a99 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8a9c : 20 25 15 JSR $1525 
01:8a9f : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8aa2 : 85 18 __ STA P11 
01:8aa4 : a9 a5 __ LDA #$a5
01:8aa6 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8aa9 : a9 8b __ LDA #$8b
01:8aab : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8aae : a9 b2 __ LDA #$b2
01:8ab0 : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:8ab3 : a9 8b __ LDA #$8b
01:8ab5 : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:8ab8 : 20 25 15 JSR $1525 
01:8abb : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8abe : 85 18 __ STA P11 
01:8ac0 : a9 c7 __ LDA #$c7
01:8ac2 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8ac5 : a9 8b __ LDA #$8b
01:8ac7 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8aca : 20 25 15 JSR $1525 
01:8acd : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8ad0 : 85 18 __ STA P11 
01:8ad2 : a9 00 __ LDA #$00
01:8ad4 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8ad7 : a9 8c __ LDA #$8c
01:8ad9 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8adc : 20 25 15 JSR $1525 
01:8adf : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8ae2 : 85 18 __ STA P11 
01:8ae4 : a9 25 __ LDA #$25
01:8ae6 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8ae9 : a9 8c __ LDA #$8c
01:8aeb : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8aee : 20 25 15 JSR $1525 
01:8af1 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8af4 : 85 18 __ STA P11 
01:8af6 : a9 4a __ LDA #$4a
01:8af8 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8afb : a9 8c __ LDA #$8c
01:8afd : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8b00 : 20 25 15 JSR $1525 
01:8b03 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8b06 : 85 18 __ STA P11 
01:8b08 : a9 6a __ LDA #$6a
01:8b0a : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8b0d : a9 8c __ LDA #$8c
01:8b0f : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8b12 : 20 25 15 JSR $1525 
01:8b15 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8b18 : 85 18 __ STA P11 
01:8b1a : a9 93 __ LDA #$93
01:8b1c : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8b1f : a9 8c __ LDA #$8c
01:8b21 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8b24 : 20 25 15 JSR $1525 
01:8b27 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8b2a : 85 18 __ STA P11 
01:8b2c : a9 b4 __ LDA #$b4
01:8b2e : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8b31 : a9 8c __ LDA #$8c
01:8b33 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8b36 : 20 25 15 JSR $1525 
01:8b39 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8b3c : 85 18 __ STA P11 
01:8b3e : a9 d1 __ LDA #$d1
01:8b40 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8b43 : a9 8c __ LDA #$8c
01:8b45 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8b48 : 20 25 15 JSR $1525 
01:8b4b : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8b4e : 85 18 __ STA P11 
01:8b50 : a9 00 __ LDA #$00
01:8b52 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8b55 : a9 8d __ LDA #$8d
01:8b57 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8b5a : 20 25 15 JSR $1525 
01:8b5d : 20 58 31 JSR $3158 
01:8b60 : ad 15 d0 LDA $d015 
01:8b63 : 29 fe __ AND #$fe
01:8b65 : 8d 15 d0 STA $d015 
.s3:
01:8b68 : 60 __ __ RTS
--------------------------------------------------------------------
01:8b69 : __ __ __ BYT 69 4e 46 4f 20 41 4e 44 20 43 52 45 44 49 54 53 : iNFO AND CREDITS
01:8b79 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
01:8b7a : __ __ __ BYT 0a 75 62 4f 4f 54 36 34 3a 20 62 4f 4f 54 20 4d : .ubOOT64: bOOT M
01:8b8a : __ __ __ BYT 45 4e 55 20 46 4f 52 20 75 4c 54 49 4d 41 54 45 : ENU FOR uLTIMATE
01:8b9a : __ __ __ BYT 20 44 45 56 49 43 45 53 0a 0a 00                :  DEVICES...
--------------------------------------------------------------------
01:8ba5 : __ __ __ BYT 76 45 52 53 49 4f 4e 3a 20 25 53 0a 00          : vERSION: %S..
--------------------------------------------------------------------
01:8bb2 : __ __ __ BYT 56 32 2e 30 2e 30 2d 32 30 32 36 30 34 32 37 2d : V2.0.0-20260427-
01:8bc2 : __ __ __ BYT 31 37 31 35 00                                  : 1715.
--------------------------------------------------------------------
01:8bc7 : __ __ __ BYT 77 52 49 54 54 45 4e 20 32 30 32 33 20 28 56 31 : wRITTEN 2023 (V1
01:8bd7 : __ __ __ BYT 29 2c 20 32 30 32 35 20 42 59 20 78 41 4e 44 45 : ), 2025 BY xANDE
01:8be7 : __ __ __ BYT 52 20 6d 4f 4c 2e 0a 0a 00                      : R mOL....
--------------------------------------------------------------------
01:8bf0 : __ __ __ BYT 3c 65 6d 70 74 79 3e 00                         : <empty>.
--------------------------------------------------------------------
01:8bf8 : __ __ __ BYT 71 55 49 54 00                                  : qUIT.
--------------------------------------------------------------------
01:8bfd : __ __ __ BYT 2d 00                                           : -.
--------------------------------------------------------------------
01:8c00 : __ __ __ BYT 69 4e 53 50 49 52 45 44 20 42 59 2f 43 4f 44 45 : iNSPIRED BY/CODE
01:8c10 : __ __ __ BYT 20 55 53 45 44 20 4f 46 20 64 52 41 62 52 4f 57 :  USED OF dRAbROW
01:8c20 : __ __ __ BYT 53 45 3a 0a 00                                  : SE:..
--------------------------------------------------------------------
01:8c25 : __ __ __ BYT 64 52 41 62 52 4f 57 53 45 20 49 53 20 41 20 53 : dRAbROWSE IS A S
01:8c35 : __ __ __ BYT 49 4d 50 4c 45 20 46 49 4c 45 20 42 52 4f 57 53 : IMPLE FILE BROWS
01:8c45 : __ __ __ BYT 45 52 2e 0a 00                                  : ER...
--------------------------------------------------------------------
01:8c4a : __ __ __ BYT 6f 52 49 47 49 4e 41 4c 20 32 30 30 39 20 42 59 : oRIGINAL 2009 BY
01:8c5a : __ __ __ BYT 20 73 41 53 43 48 41 20 62 41 44 45 52 2e 0a 00 :  sASCHA bADER...
--------------------------------------------------------------------
01:8c6a : __ __ __ BYT 75 53 45 44 20 56 45 52 53 49 4f 4e 20 41 44 41 : uSED VERSION ADA
01:8c7a : __ __ __ BYT 50 54 45 44 20 42 59 20 64 49 52 4b 20 6a 41 47 : PTED BY dIRK jAG
01:8c8a : __ __ __ BYT 44 4d 41 4e 4e 2e 0a 0a 00                      : DMANN....
--------------------------------------------------------------------
01:8c93 : __ __ __ BYT 72 45 51 55 49 52 45 53 20 41 4e 44 20 4d 41 44 : rEQUIRES AND MAD
01:8ca3 : __ __ __ BYT 45 20 50 4f 53 53 49 42 4c 45 20 42 59 3a 0a 0a : E POSSIBLE BY:..
01:8cb3 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
01:8cb4 : __ __ __ BYT 74 48 45 20 75 4c 54 49 4d 41 54 45 20 69 69 2b : tHE uLTIMATE ii+
01:8cc4 : __ __ __ BYT 20 43 41 52 54 52 49 44 47 45 2c 0a 00          :  CARTRIDGE,..
--------------------------------------------------------------------
01:8cd1 : __ __ __ BYT 63 52 45 41 54 45 44 20 42 59 20 67 49 44 45 4f : cREATED BY gIDEO
01:8ce1 : __ __ __ BYT 4e 20 7a 57 45 49 4a 54 5a 45 52 2e 0a 0a 00    : N zWEIJTZER....
--------------------------------------------------------------------
01:8cf0 : __ __ __ BYT 65 44 49 54 20 4e 41 4d 45 00                   : eDIT NAME.
--------------------------------------------------------------------
01:8cfa : __ __ __ BYT 25 43 0a 00                                     : %C..
--------------------------------------------------------------------
01:8cfe : __ __ __ BYT 20 00                                           :  .
--------------------------------------------------------------------
01:8d00 : __ __ __ BYT 70 52 45 53 53 20 41 20 4b 45 59 20 54 4f 20 43 : pRESS A KEY TO C
01:8d10 : __ __ __ BYT 4f 4e 54 49 4e 55 45 2e 00                      : ONTINUE..
--------------------------------------------------------------------
editmenuoptions: ; editmenuoptions()->void
;  13, "/home/xahmol/git/UBoot64-v2/src/slotmenu.h"
.s1:
01:8d19 : a5 53 __ LDA T3 + 0 
01:8d1b : 8d ab 77 STA $77ab ; (editmenuoptions@stack + 0)
.s4:
01:8d1e : a9 00 __ LDA #$00
.l23:
01:8d20 : 85 53 __ STA T3 + 0 
.l5:
01:8d22 : 20 f2 0d JSR $0df2 
01:8d25 : a9 19 __ LDA #$19
01:8d27 : 85 14 __ STA P7 
01:8d29 : a9 8e __ LDA #$8e
01:8d2b : 85 15 __ STA P8 
01:8d2d : 20 9a 0e JSR $0e9a 
01:8d30 : 20 2e 8e JSR $8e2e ; (presentmenuslots.s4 + 0)
01:8d33 : 20 af 3c JSR $3caf 
01:8d36 : a9 f0 __ LDA #$f0
01:8d38 : 85 0f __ STA P2 
01:8d3a : a9 8c __ LDA #$8c
01:8d3c : 85 10 __ STA P3 
01:8d3e : 20 63 3b JSR $3b63 
01:8d41 : 20 97 3c JSR $3c97 
01:8d44 : a9 75 __ LDA #$75
01:8d46 : 85 0f __ STA P2 
01:8d48 : a9 8e __ LDA #$8e
01:8d4a : 85 10 __ STA P3 
01:8d4c : 20 cb 3b JSR $3bcb 
01:8d4f : a9 28 __ LDA #$28
01:8d51 : 85 0f __ STA P2 
01:8d53 : a9 15 __ LDA #$15
01:8d55 : 85 10 __ STA P3 
01:8d57 : a9 11 __ LDA #$11
01:8d59 : 85 11 __ STA P4 
01:8d5b : a9 87 __ LDA #$87
01:8d5d : 85 12 __ STA P5 
01:8d5f : 20 8f 3c JSR $3c8f 
01:8d62 : a9 2d __ LDA #$2d
01:8d64 : 85 0d __ STA P0 
01:8d66 : a9 82 __ LDA #$82
01:8d68 : 85 0f __ STA P2 
01:8d6a : a9 8e __ LDA #$8e
01:8d6c : 85 10 __ STA P3 
01:8d6e : 20 bf 3b JSR $3bbf 
01:8d71 : a9 3c __ LDA #$3c
01:8d73 : 85 0f __ STA P2 
01:8d75 : a9 15 __ LDA #$15
01:8d77 : 85 10 __ STA P3 
01:8d79 : 20 7f 3c JSR $3c7f 
01:8d7c : a9 41 __ LDA #$41
01:8d7e : 85 0d __ STA P0 
01:8d80 : a9 91 __ LDA #$91
01:8d82 : 85 0f __ STA P2 
01:8d84 : a9 8e __ LDA #$8e
01:8d86 : 85 10 __ STA P3 
01:8d88 : 20 bf 3b JSR $3bbf 
01:8d8b : a9 50 __ LDA #$50
01:8d8d : 85 0f __ STA P2 
01:8d8f : a9 15 __ LDA #$15
01:8d91 : 85 10 __ STA P3 
01:8d93 : 20 6f 3c JSR $3c6f 
01:8d96 : a9 55 __ LDA #$55
01:8d98 : 85 0d __ STA P0 
01:8d9a : a9 f8 __ LDA #$f8
01:8d9c : 85 0f __ STA P2 
01:8d9e : a9 8b __ LDA #$8b
01:8da0 : 85 10 __ STA P3 
01:8da2 : 20 bf 3b JSR $3bbf 
.l6:
01:8da5 : 20 50 14 JSR $1450 
01:8da8 : a5 1b __ LDA ACCU + 0 
01:8daa : c9 85 __ CMP #$85
01:8dac : d0 08 __ BNE $8db6 ; (editmenuoptions.s8 + 0)
.s7:
01:8dae : a0 01 __ LDY #$01
.s15:
01:8db0 : c9 87 __ CMP #$87
01:8db2 : 90 3c __ BCC $8df0 ; (editmenuoptions.s18 + 0)
01:8db4 : b0 52 __ BCS $8e08 ; (editmenuoptions.s16 + 0)
.s8:
01:8db6 : a0 00 __ LDY #$00
01:8db8 : c9 89 __ CMP #$89
01:8dba : f0 f4 __ BEQ $8db0 ; (editmenuoptions.s15 + 0)
.s9:
01:8dbc : c9 86 __ CMP #$86
01:8dbe : f0 f0 __ BEQ $8db0 ; (editmenuoptions.s15 + 0)
.s10:
01:8dc0 : c9 87 __ CMP #$87
01:8dc2 : f0 24 __ BEQ $8de8 ; (editmenuoptions.s14 + 0)
.s11:
01:8dc4 : c9 88 __ CMP #$88
01:8dc6 : d0 dd __ BNE $8da5 ; (editmenuoptions.l6 + 0)
.s12:
01:8dc8 : a6 53 __ LDX T3 + 0 
01:8dca : ca __ __ DEX
01:8dcb : d0 15 __ BNE $8de2 ; (editmenuoptions.s3 + 0)
.s13:
01:8dcd : 86 0d __ STX P0 
01:8dcf : a9 24 __ LDA #$24
01:8dd1 : 85 0f __ STA P2 
01:8dd3 : a9 97 __ LDA #$97
01:8dd5 : 85 10 __ STA P3 
01:8dd7 : 20 b3 3b JSR $3bb3 
01:8dda : a9 00 __ LDA #$00
01:8ddc : 8d ef 7f STA $7fef ; (sstack + 16)
01:8ddf : 20 83 24 JSR $2483 
.s3:
01:8de2 : ad ab 77 LDA $77ab ; (editmenuoptions@stack + 0)
01:8de5 : 85 53 __ STA T3 + 0 
01:8de7 : 60 __ __ RTS
.s14:
01:8de8 : 20 9d 8e JSR $8e9d ; (deletemenuslot.s4 + 0)
.s24:
01:8deb : a5 1b __ LDA ACCU + 0 
01:8ded : 4c 20 8d JMP $8d20 ; (editmenuoptions.l23 + 0)
.s18:
01:8df0 : 98 __ __ TYA
01:8df1 : f0 06 __ BEQ $8df9 ; (editmenuoptions.s19 + 0)
.s21:
01:8df3 : 20 d4 8f JSR $8fd4 ; (renamemenuslot.s1 + 0)
01:8df6 : 4c eb 8d JMP $8deb ; (editmenuoptions.s24 + 0)
.s19:
01:8df9 : a5 1b __ LDA ACCU + 0 
01:8dfb : c9 86 __ CMP #$86
01:8dfd : f0 03 __ BEQ $8e02 ; (editmenuoptions.s20 + 0)
01:8dff : 4c 22 8d JMP $8d22 ; (editmenuoptions.l5 + 0)
.s20:
01:8e02 : 20 c6 92 JSR $92c6 ; (reordermenuslot.s1 + 0)
01:8e05 : 4c eb 8d JMP $8deb ; (editmenuoptions.s24 + 0)
.s16:
01:8e08 : c9 89 __ CMP #$89
01:8e0a : d0 06 __ BNE $8e12 ; (editmenuoptions.s22 + 0)
.s17:
01:8e0c : 20 51 91 JSR $9151 ; (edituserdefinedcommand.s1 + 0)
01:8e0f : 4c eb 8d JMP $8deb ; (editmenuoptions.s24 + 0)
.s22:
01:8e12 : c9 88 __ CMP #$88
01:8e14 : f0 b2 __ BEQ $8dc8 ; (editmenuoptions.s12 + 0)
01:8e16 : 4c 22 8d JMP $8d22 ; (editmenuoptions.l5 + 0)
--------------------------------------------------------------------
01:8e19 : __ __ __ BYT 65 44 49 54 2f 72 45 2d 4f 52 44 45 52 2f 64 45 : eDIT/rE-ORDER/dE
01:8e29 : __ __ __ BYT 4c 45 54 45 00                                  : LETE.
--------------------------------------------------------------------
presentmenuslots: ; presentmenuslots()->void
;   6, "/home/xahmol/git/UBoot64-v2/src/slotmenu.h"
.s4:
01:8e2e : a9 03 __ LDA #$03
01:8e30 : 85 4b __ STA T4 + 0 
01:8e32 : a9 00 __ LDA #$00
01:8e34 : 85 4a __ STA T3 + 0 
.l5:
01:8e36 : 85 0d __ STA P0 
01:8e38 : 20 f8 25 JSR $25f8 
01:8e3b : a5 0d __ LDA P0 
01:8e3d : 85 18 __ STA P11 
01:8e3f : 20 a2 86 JSR $86a2 ; (menuslotnumnerprint.s4 + 0)
01:8e42 : 20 25 3d JSR $3d25 
01:8e45 : a5 4b __ LDA T4 + 0 
01:8e47 : 85 0e __ STA P1 
01:8e49 : a9 05 __ LDA #$05
01:8e4b : 85 0d __ STA P0 
01:8e4d : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8e50 : 85 11 __ STA P4 
01:8e52 : a5 1b __ LDA ACCU + 0 
01:8e54 : 05 1c __ ORA ACCU + 1 
01:8e56 : f0 07 __ BEQ $8e5f ; (presentmenuslots.s8 + 0)
.s6:
01:8e58 : a9 4e __ LDA #$4e
01:8e5a : a0 c9 __ LDY #$c9
01:8e5c : 4c 63 8e JMP $8e63 ; (presentmenuslots.s7 + 0)
.s8:
01:8e5f : a9 8b __ LDA #$8b
01:8e61 : a0 f0 __ LDY #$f0
.s7:
01:8e63 : 84 0f __ STY P2 
01:8e65 : 85 10 __ STA P3 
01:8e67 : 20 8f 12 JSR $128f 
01:8e6a : e6 4b __ INC T4 + 0 
01:8e6c : e6 4a __ INC T3 + 0 
01:8e6e : a5 4a __ LDA T3 + 0 
01:8e70 : c9 12 __ CMP #$12
01:8e72 : 90 c2 __ BCC $8e36 ; (presentmenuslots.l5 + 0)
.s3:
01:8e74 : 60 __ __ RTS
--------------------------------------------------------------------
01:8e75 : __ __ __ BYT 65 44 49 54 20 43 4f 4d 4d 41 4e 44 00          : eDIT COMMAND.
--------------------------------------------------------------------
01:8e82 : __ __ __ BYT 72 45 2d 4f 52 44 45 52 20 53 4c 4f 54 53 00    : rE-ORDER SLOTS.
--------------------------------------------------------------------
01:8e91 : __ __ __ BYT 64 45 4c 45 54 45 20 53 4c 4f 54 00             : dELETE SLOT.
--------------------------------------------------------------------
deletemenuslot: ; deletemenuslot()->u8
;  10, "/home/xahmol/git/UBoot64-v2/src/slotmenu.h"
.s4:
01:8e9d : 20 f2 0d JSR $0df2 
01:8ea0 : a9 6c __ LDA #$6c
01:8ea2 : 85 14 __ STA P7 
01:8ea4 : a9 8f __ LDA #$8f
01:8ea6 : 85 15 __ STA P8 
01:8ea8 : 20 9a 0e JSR $0e9a 
01:8eab : 20 2e 8e JSR $8e2e ; (presentmenuslots.s4 + 0)
01:8eae : a9 00 __ LDA #$00
01:8eb0 : 8d 68 49 STA $4968 ; (cw.cx + 0)
01:8eb3 : a9 17 __ LDA #$17
01:8eb5 : 8d 69 49 STA $4969 ; (cw.cy + 0)
01:8eb8 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8ebb : 85 18 __ STA P11 
01:8ebd : a9 7e __ LDA #$7e
01:8ebf : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8ec2 : a9 8f __ LDA #$8f
01:8ec4 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8ec7 : 20 25 15 JSR $1525 
.l5:
01:8eca : 20 50 14 JSR $1450 
01:8ecd : a5 1b __ LDA ACCU + 0 
01:8ecf : c9 30 __ CMP #$30
01:8ed1 : 90 f7 __ BCC $8eca ; (deletemenuslot.l5 + 0)
.s13:
01:8ed3 : 85 4c __ STA T1 + 0 
01:8ed5 : c9 3a __ CMP #$3a
01:8ed7 : 90 08 __ BCC $8ee1 ; (deletemenuslot.s8 + 0)
.s6:
01:8ed9 : c9 41 __ CMP #$41
01:8edb : 90 ed __ BCC $8eca ; (deletemenuslot.l5 + 0)
.s7:
01:8edd : c9 5b __ CMP #$5b
01:8edf : b0 e9 __ BCS $8eca ; (deletemenuslot.l5 + 0)
.s8:
01:8ee1 : 20 5d 87 JSR $875d ; (keytomenuslot.s4 + 0)
01:8ee4 : 85 4d __ STA T2 + 0 
01:8ee6 : 20 f8 25 JSR $25f8 
01:8ee9 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8eec : 85 18 __ STA P11 
01:8eee : a5 4c __ LDA T1 + 0 
01:8ef0 : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:8ef3 : a9 00 __ LDA #$00
01:8ef5 : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:8ef8 : a9 fa __ LDA #$fa
01:8efa : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8efd : a9 8c __ LDA #$8c
01:8eff : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8f02 : 20 25 15 JSR $1525 
01:8f05 : 20 25 3d JSR $3d25 
01:8f08 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8f0b : 85 18 __ STA P11 
01:8f0d : a5 1b __ LDA ACCU + 0 
01:8f0f : 05 1c __ ORA ACCU + 1 
01:8f11 : d0 15 __ BNE $8f28 ; (deletemenuslot.s11 + 0)
.s9:
01:8f13 : a9 b2 __ LDA #$b2
01:8f15 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8f18 : a9 8f __ LDA #$8f
01:8f1a : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8f1d : 20 25 15 JSR $1525 
01:8f20 : 20 58 31 JSR $3158 
.s10:
01:8f23 : a9 00 __ LDA #$00
.s3:
01:8f25 : 85 1b __ STA ACCU + 0 
01:8f27 : 60 __ __ RTS
.s11:
01:8f28 : a9 9f __ LDA #$9f
01:8f2a : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8f2d : a9 8f __ LDA #$8f
01:8f2f : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8f32 : 20 25 15 JSR $1525 
01:8f35 : 20 af 3a JSR $3aaf 
01:8f38 : 85 4c __ STA T1 + 0 
01:8f3a : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:8f3d : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:8f40 : 85 18 __ STA P11 
01:8f42 : a9 fd __ LDA #$fd
01:8f44 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:8f47 : a9 89 __ LDA #$89
01:8f49 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:8f4c : a9 00 __ LDA #$00
01:8f4e : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:8f51 : 20 25 15 JSR $1525 
01:8f54 : a5 4c __ LDA T1 + 0 
01:8f56 : c9 4e __ CMP #$4e
01:8f58 : f0 c9 __ BEQ $8f23 ; (deletemenuslot.s10 + 0)
.s12:
01:8f5a : a9 00 __ LDA #$00
01:8f5c : 85 0f __ STA P2 
01:8f5e : 85 10 __ STA P3 
01:8f60 : 20 9d 23 JSR $239d 
01:8f63 : a5 4d __ LDA T2 + 0 
01:8f65 : 20 46 24 JSR $2446 
01:8f68 : a9 01 __ LDA #$01
01:8f6a : d0 b9 __ BNE $8f25 ; (deletemenuslot.s3 + 0)
--------------------------------------------------------------------
01:8f6c : __ __ __ BYT 64 45 4c 45 54 45 20 4d 45 4e 55 20 53 4c 4f 54 : dELETE MENU SLOT
01:8f7c : __ __ __ BYT 53 00                                           : S.
--------------------------------------------------------------------
01:8f7e : __ __ __ BYT 63 48 4f 4f 53 45 20 4d 45 4e 55 20 53 4c 4f 54 : cHOOSE MENU SLOT
01:8f8e : __ __ __ BYT 20 54 4f 20 42 45 20 44 45 4c 45 54 45 44 2e 20 :  TO BE DELETED. 
01:8f9e : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
01:8f9f : __ __ __ BYT 61 52 45 20 59 4f 55 20 53 55 52 45 3f 20 79 2f : aRE YOU SURE? y/
01:8faf : __ __ __ BYT 6e 20 00                                        : n .
--------------------------------------------------------------------
01:8fb2 : __ __ __ BYT 73 4c 4f 54 20 49 53 20 41 4c 52 45 41 44 59 20 : sLOT IS ALREADY 
01:8fc2 : __ __ __ BYT 45 4d 50 54 59 2e 20 70 52 45 53 53 20 4b 45 59 : EMPTY. pRESS KEY
01:8fd2 : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
renamemenuslot: ; renamemenuslot()->u8
;   9, "/home/xahmol/git/UBoot64-v2/src/slotmenu.h"
.s1:
01:8fd4 : a5 53 __ LDA T1 + 0 
01:8fd6 : 8d ed 7e STA $7eed ; (renamemenuslot@stack + 0)
01:8fd9 : a5 54 __ LDA T2 + 0 
01:8fdb : 8d ee 7e STA $7eee ; (renamemenuslot@stack + 1)
01:8fde : a5 55 __ LDA T3 + 0 
01:8fe0 : 8d ef 7e STA $7eef ; (renamemenuslot@stack + 2)
.s4:
01:8fe3 : 20 f2 0d JSR $0df2 
01:8fe6 : a9 df __ LDA #$df
01:8fe8 : 85 14 __ STA P7 
01:8fea : a9 90 __ LDA #$90
01:8fec : 85 15 __ STA P8 
01:8fee : 20 9a 0e JSR $0e9a 
01:8ff1 : 20 2e 8e JSR $8e2e ; (presentmenuslots.s4 + 0)
01:8ff4 : a9 00 __ LDA #$00
01:8ff6 : 8d 68 49 STA $4968 ; (cw.cx + 0)
01:8ff9 : a9 15 __ LDA #$15
01:8ffb : 8d 69 49 STA $4969 ; (cw.cy + 0)
01:8ffe : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:9001 : 85 18 __ STA P11 
01:9003 : a9 00 __ LDA #$00
01:9005 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:9008 : a9 91 __ LDA #$91
01:900a : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:900d : 20 25 15 JSR $1525 
.l5:
01:9010 : 20 50 14 JSR $1450 
01:9013 : a5 1b __ LDA ACCU + 0 
01:9015 : c9 30 __ CMP #$30
01:9017 : 90 f7 __ BCC $9010 ; (renamemenuslot.l5 + 0)
.s13:
01:9019 : 85 53 __ STA T1 + 0 
01:901b : c9 3a __ CMP #$3a
01:901d : 90 08 __ BCC $9027 ; (renamemenuslot.s8 + 0)
.s6:
01:901f : c9 41 __ CMP #$41
01:9021 : 90 ed __ BCC $9010 ; (renamemenuslot.l5 + 0)
.s7:
01:9023 : c9 5b __ CMP #$5b
01:9025 : b0 e9 __ BCS $9010 ; (renamemenuslot.l5 + 0)
.s8:
01:9027 : 20 5d 87 JSR $875d ; (keytomenuslot.s4 + 0)
01:902a : 85 55 __ STA T3 + 0 
01:902c : 20 f8 25 JSR $25f8 
01:902f : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:9032 : 85 18 __ STA P11 
01:9034 : a5 53 __ LDA T1 + 0 
01:9036 : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:9039 : a9 00 __ LDA #$00
01:903b : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:903e : a9 fa __ LDA #$fa
01:9040 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:9043 : a9 8c __ LDA #$8c
01:9045 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:9048 : 20 25 15 JSR $1525 
01:904b : 20 25 3d JSR $3d25 
01:904e : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:9051 : 85 18 __ STA P11 
01:9053 : a5 1b __ LDA ACCU + 0 
01:9055 : 05 1c __ ORA ACCU + 1 
01:9057 : d0 14 __ BNE $906d ; (renamemenuslot.s11 + 0)
.s9:
01:9059 : a9 21 __ LDA #$21
01:905b : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:905e : a9 91 __ LDA #$91
01:9060 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:9063 : 20 25 15 JSR $1525 
01:9066 : 20 58 31 JSR $3158 
.s10:
01:9069 : a9 00 __ LDA #$00
01:906b : f0 60 __ BEQ $90cd ; (renamemenuslot.s3 + 0)
.s11:
01:906d : a9 9f __ LDA #$9f
01:906f : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:9072 : a9 8f __ LDA #$8f
01:9074 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:9077 : 20 25 15 JSR $1525 
01:907a : 20 af 3a JSR $3aaf 
01:907d : 85 54 __ STA T2 + 0 
01:907f : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:9082 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:9085 : 85 18 __ STA P11 
01:9087 : a9 fd __ LDA #$fd
01:9089 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:908c : a9 89 __ LDA #$89
01:908e : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:9091 : a9 00 __ LDA #$00
01:9093 : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:9096 : 20 25 15 JSR $1525 
01:9099 : a5 54 __ LDA T2 + 0 
01:909b : c9 4e __ CMP #$4e
01:909d : f0 ca __ BEQ $9069 ; (renamemenuslot.s10 + 0)
.s12:
01:909f : a9 3b __ LDA #$3b
01:90a1 : 85 0f __ STA P2 
01:90a3 : a9 91 __ LDA #$91
01:90a5 : 85 10 __ STA P3 
01:90a7 : 20 82 12 JSR $1282 
01:90aa : a9 18 __ LDA #$18
01:90ac : 8d eb 7f STA $7feb ; (sstack + 12)
01:90af : a9 1f __ LDA #$1f
01:90b1 : 8d ec 7f STA $7fec ; (sstack + 13)
01:90b4 : a9 c9 __ LDA #$c9
01:90b6 : 8d ed 7f STA $7fed ; (sstack + 14)
01:90b9 : a9 4e __ LDA #$4e
01:90bb : 8d ee 7f STA $7fee ; (sstack + 15)
01:90be : a9 1e __ LDA #$1e
01:90c0 : 8d ef 7f STA $7fef ; (sstack + 16)
01:90c3 : 20 59 32 JSR $3259 
01:90c6 : a5 55 __ LDA T3 + 0 
01:90c8 : 20 46 24 JSR $2446 
01:90cb : a9 01 __ LDA #$01
.s3:
01:90cd : 85 1b __ STA ACCU + 0 
01:90cf : ad ed 7e LDA $7eed ; (renamemenuslot@stack + 0)
01:90d2 : 85 53 __ STA T1 + 0 
01:90d4 : ad ee 7e LDA $7eee ; (renamemenuslot@stack + 1)
01:90d7 : 85 54 __ STA T2 + 0 
01:90d9 : ad ef 7e LDA $7eef ; (renamemenuslot@stack + 2)
01:90dc : 85 55 __ STA T3 + 0 
01:90de : 60 __ __ RTS
--------------------------------------------------------------------
01:90df : __ __ __ BYT 72 45 4e 41 4d 45 20 4d 45 4e 55 20 53 4c 4f 54 : rENAME MENU SLOT
01:90ef : __ __ __ BYT 53 00                                           : S.
--------------------------------------------------------------------
01:90f1 : __ __ __ BYT 63 48 4f 53 45 4e 20 53 4c 4f 54 3a 00          : cHOSEN SLOT:.
--------------------------------------------------------------------
01:90fe : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
01:9100 : __ __ __ BYT 63 48 4f 4f 53 45 20 4d 45 4e 55 20 53 4c 4f 54 : cHOOSE MENU SLOT
01:9110 : __ __ __ BYT 20 54 4f 20 42 45 20 52 45 4e 41 4d 45 44 2e 20 :  TO BE RENAMED. 
01:9120 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
01:9121 : __ __ __ BYT 73 4c 4f 54 20 49 53 20 45 4d 50 54 59 2e 20 70 : sLOT IS EMPTY. p
01:9131 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 00                   : RESS KEY..
--------------------------------------------------------------------
01:913b : __ __ __ BYT 63 48 4f 4f 53 45 20 4e 41 4d 45 20 46 4f 52 20 : cHOOSE NAME FOR 
01:914b : __ __ __ BYT 53 4c 4f 54 3a 00                               : SLOT:.
--------------------------------------------------------------------
edituserdefinedcommand: ; edituserdefinedcommand()->u8
;  12, "/home/xahmol/git/UBoot64-v2/src/slotmenu.h"
.s1:
01:9151 : a5 53 __ LDA T1 + 0 
01:9153 : 8d ea 7e STA $7eea ; (edituserdefinedcommand@stack + 0)
01:9156 : a5 54 __ LDA T4 + 0 
01:9158 : 8d eb 7e STA $7eeb ; (edituserdefinedcommand@stack + 1)
.s4:
01:915b : 20 f2 0d JSR $0df2 
01:915e : 20 b6 3a JSR $3ab6 
01:9161 : 20 2e 8e JSR $8e2e ; (presentmenuslots.s4 + 0)
01:9164 : a9 00 __ LDA #$00
01:9166 : 8d 68 49 STA $4968 ; (cw.cx + 0)
01:9169 : a9 15 __ LDA #$15
01:916b : 8d 69 49 STA $4969 ; (cw.cy + 0)
01:916e : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:9171 : 85 18 __ STA P11 
01:9173 : a9 8f __ LDA #$8f
01:9175 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:9178 : a9 92 __ LDA #$92
01:917a : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:917d : 20 25 15 JSR $1525 
.l5:
01:9180 : 20 50 14 JSR $1450 
01:9183 : a5 1b __ LDA ACCU + 0 
01:9185 : c9 30 __ CMP #$30
01:9187 : 90 f7 __ BCC $9180 ; (edituserdefinedcommand.l5 + 0)
.s13:
01:9189 : 85 53 __ STA T1 + 0 
01:918b : c9 3a __ CMP #$3a
01:918d : 90 08 __ BCC $9197 ; (edituserdefinedcommand.s8 + 0)
.s6:
01:918f : c9 41 __ CMP #$41
01:9191 : 90 ed __ BCC $9180 ; (edituserdefinedcommand.l5 + 0)
.s7:
01:9193 : c9 5b __ CMP #$5b
01:9195 : b0 e9 __ BCS $9180 ; (edituserdefinedcommand.l5 + 0)
.s8:
01:9197 : 20 5d 87 JSR $875d ; (keytomenuslot.s4 + 0)
01:919a : 85 54 __ STA T4 + 0 
01:919c : 20 f8 25 JSR $25f8 
01:919f : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:91a2 : 85 18 __ STA P11 
01:91a4 : a5 53 __ LDA T1 + 0 
01:91a6 : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:91a9 : a9 00 __ LDA #$00
01:91ab : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:91ae : a9 fa __ LDA #$fa
01:91b0 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:91b3 : a9 8c __ LDA #$8c
01:91b5 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:91b8 : 20 25 15 JSR $1525 
01:91bb : 20 25 3d JSR $3d25 
01:91be : a5 1b __ LDA ACCU + 0 
01:91c0 : 05 1c __ ORA ACCU + 1 
01:91c2 : d0 1a __ BNE $91de ; (edituserdefinedcommand.s9 + 0)
.s12:
01:91c4 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:91c7 : 85 18 __ STA P11 
01:91c9 : a9 b2 __ LDA #$b2
01:91cb : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:91ce : a9 8f __ LDA #$8f
01:91d0 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:91d3 : 20 25 15 JSR $1525 
01:91d6 : 20 58 31 JSR $3158 
01:91d9 : a9 00 __ LDA #$00
01:91db : 4c 82 92 JMP $9282 ; (edituserdefinedcommand.s3 + 0)
.s9:
01:91de : 20 f2 0d JSR $0df2 
01:91e1 : 20 b6 3a JSR $3ab6 
01:91e4 : a9 03 __ LDA #$03
01:91e6 : 85 0e __ STA P1 
01:91e8 : a9 f1 __ LDA #$f1
01:91ea : 85 0f __ STA P2 
01:91ec : a9 90 __ LDA #$90
01:91ee : 85 10 __ STA P3 
01:91f0 : 20 7f 3b JSR $3b7f 
01:91f3 : a5 54 __ LDA T4 + 0 
01:91f5 : 20 e2 86 JSR $86e2 ; (menuslotkey.s4 + 0)
01:91f8 : 8d e7 7f STA $7fe7 ; (sstack + 8)
01:91fb : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:91fe : 85 18 __ STA P11 
01:9200 : a9 72 __ LDA #$72
01:9202 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:9205 : a9 49 __ LDA #$49
01:9207 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:920a : a9 dc __ LDA #$dc
01:920c : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:920f : a9 86 __ LDA #$86
01:9211 : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:9214 : a9 00 __ LDA #$00
01:9216 : 8d e8 7f STA $7fe8 ; (sstack + 9)
01:9219 : 20 25 15 JSR $1525 
01:921c : a9 04 __ LDA #$04
01:921e : 85 10 __ STA P3 
01:9220 : a9 72 __ LDA #$72
01:9222 : 85 11 __ STA P4 
01:9224 : a9 49 __ LDA #$49
01:9226 : 85 12 __ STA P5 
01:9228 : 20 1b 3c JSR $3c1b 
01:922b : a9 04 __ LDA #$04
01:922d : 85 0e __ STA P1 
01:922f : a9 c9 __ LDA #$c9
01:9231 : 85 0f __ STA P2 
01:9233 : a9 4e __ LDA #$4e
01:9235 : 85 10 __ STA P3 
01:9237 : 20 73 3b JSR $3b73 
01:923a : a9 06 __ LDA #$06
01:923c : 85 0e __ STA P1 
01:923e : a9 aa __ LDA #$aa
01:9240 : 85 0f __ STA P2 
01:9242 : a9 92 __ LDA #$92
01:9244 : 85 10 __ STA P3 
01:9246 : 20 7f 3b JSR $3b7f 
01:9249 : a9 07 __ LDA #$07
01:924b : 8d eb 7f STA $7feb ; (sstack + 12)
01:924e : a9 50 __ LDA #$50
01:9250 : 8d ec 7f STA $7fec ; (sstack + 13)
01:9253 : a9 51 __ LDA #$51
01:9255 : 8d ef 7f STA $7fef ; (sstack + 16)
01:9258 : a9 1b __ LDA #$1b
01:925a : 8d ed 7f STA $7fed ; (sstack + 14)
01:925d : a9 4f __ LDA #$4f
01:925f : 8d ee 7f STA $7fee ; (sstack + 15)
01:9262 : 20 59 32 JSR $3259 
01:9265 : a9 1b __ LDA #$1b
01:9267 : 85 0d __ STA P0 
01:9269 : a9 4f __ LDA #$4f
01:926b : 85 0e __ STA P1 
01:926d : 20 ad 10 JSR $10ad 
01:9270 : a5 1b __ LDA ACCU + 0 
01:9272 : 05 1c __ ORA ACCU + 1 
01:9274 : f0 02 __ BEQ $9278 ; (edituserdefinedcommand.s11 + 0)
.s10:
01:9276 : a9 01 __ LDA #$01
.s11:
01:9278 : 8d a2 50 STA $50a2 ; (Slot.command + 0)
01:927b : a5 54 __ LDA T4 + 0 
01:927d : 20 46 24 JSR $2446 
01:9280 : a9 01 __ LDA #$01
.s3:
01:9282 : 85 1b __ STA ACCU + 0 
01:9284 : ad ea 7e LDA $7eea ; (edituserdefinedcommand@stack + 0)
01:9287 : 85 53 __ STA T1 + 0 
01:9289 : ad eb 7e LDA $7eeb ; (edituserdefinedcommand@stack + 1)
01:928c : 85 54 __ STA T4 + 0 
01:928e : 60 __ __ RTS
--------------------------------------------------------------------
01:928f : __ __ __ BYT 63 48 4f 4f 53 45 20 4d 45 4e 55 20 53 4c 4f 54 : cHOOSE MENU SLOT
01:929f : __ __ __ BYT 20 54 4f 20 45 44 49 54 2e 20 00                :  TO EDIT. .
--------------------------------------------------------------------
01:92aa : __ __ __ BYT 65 4e 54 45 52 20 43 4f 4d 4d 41 4e 44 20 28 45 : eNTER COMMAND (E
01:92ba : __ __ __ BYT 4d 50 54 59 3d 4e 4f 4e 45 29 3a 00             : MPTY=NONE):.
--------------------------------------------------------------------
reordermenuslot: ; reordermenuslot()->u8
;  11, "/home/xahmol/git/UBoot64-v2/src/slotmenu.h"
.s1:
01:92c6 : a2 04 __ LDX #$04
01:92c8 : b5 53 __ LDA T0 + 0,x 
01:92ca : 9d ac 77 STA $77ac,x ; (reordermenuslot@stack + 0)
01:92cd : ca __ __ DEX
01:92ce : 10 f8 __ BPL $92c8 ; (reordermenuslot.s1 + 2)
.s4:
01:92d0 : a9 00 __ LDA #$00
01:92d2 : 85 56 __ STA T4 + 0 
01:92d4 : 85 57 __ STA T5 + 0 
.l5:
01:92d6 : 20 f2 0d JSR $0df2 
01:92d9 : a9 6c __ LDA #$6c
01:92db : 85 14 __ STA P7 
01:92dd : a9 95 __ LDA #$95
01:92df : 85 15 __ STA P8 
01:92e1 : 20 9a 0e JSR $0e9a 
01:92e4 : 20 2e 8e JSR $8e2e ; (presentmenuslots.s4 + 0)
01:92e7 : a9 80 __ LDA #$80
01:92e9 : 85 0f __ STA P2 
01:92eb : a9 95 __ LDA #$95
01:92ed : 85 10 __ STA P3 
01:92ef : 20 f3 3b JSR $3bf3 
01:92f2 : e6 0e __ INC P1 
01:92f4 : a9 a3 __ LDA #$a3
01:92f6 : 85 0f __ STA P2 
01:92f8 : a9 95 __ LDA #$95
01:92fa : 85 10 __ STA P3 
01:92fc : 20 ab 3b JSR $3bab 
01:92ff : a9 0a __ LDA #$0a
01:9301 : 85 0f __ STA P2 
01:9303 : a9 17 __ LDA #$17
01:9305 : 85 10 __ STA P3 
01:9307 : 20 6f 3c JSR $3c6f 
01:930a : a9 0e __ LDA #$0e
01:930c : 85 0d __ STA P0 
01:930e : a9 ae __ LDA #$ae
01:9310 : 85 0f __ STA P2 
01:9312 : a9 95 __ LDA #$95
01:9314 : 85 10 __ STA P3 
01:9316 : 20 db 3b JSR $3bdb 
.l6:
01:9319 : 20 50 14 JSR $1450 
01:931c : a5 1b __ LDA ACCU + 0 
01:931e : c9 88 __ CMP #$88
01:9320 : d0 08 __ BNE $932a ; (reordermenuslot.s7 + 0)
.s31:
01:9322 : 85 54 __ STA T1 + 0 
01:9324 : a9 01 __ LDA #$01
01:9326 : 85 57 __ STA T5 + 0 
01:9328 : d0 28 __ BNE $9352 ; (reordermenuslot.s10 + 0)
.s7:
01:932a : 85 54 __ STA T1 + 0 
01:932c : c9 30 __ CMP #$30
01:932e : 90 1e __ BCC $934e ; (reordermenuslot.s9 + 0)
.s30:
01:9330 : c9 3a __ CMP #$3a
01:9332 : 90 08 __ BCC $933c ; (reordermenuslot.s28 + 0)
.s8:
01:9334 : c9 41 __ CMP #$41
01:9336 : 90 16 __ BCC $934e ; (reordermenuslot.s9 + 0)
.s27:
01:9338 : c9 5b __ CMP #$5b
01:933a : b0 12 __ BCS $934e ; (reordermenuslot.s9 + 0)
.s28:
01:933c : 20 5d 87 JSR $875d ; (keytomenuslot.s4 + 0)
01:933f : 20 f8 25 JSR $25f8 
01:9342 : 20 25 3d JSR $3d25 
01:9345 : a5 1b __ LDA ACCU + 0 
01:9347 : 05 1c __ ORA ACCU + 1 
01:9349 : f0 03 __ BEQ $934e ; (reordermenuslot.s9 + 0)
01:934b : 4c 65 95 JMP $9565 ; (reordermenuslot.s29 + 0)
.s9:
01:934e : a5 57 __ LDA T5 + 0 
01:9350 : f0 c7 __ BEQ $9319 ; (reordermenuslot.l6 + 0)
.s10:
01:9352 : a5 54 __ LDA T1 + 0 
01:9354 : c9 88 __ CMP #$88
01:9356 : d0 03 __ BNE $935b ; (reordermenuslot.s12 + 0)
01:9358 : 4c 56 95 JMP $9556 ; (reordermenuslot.s11 + 0)
.s12:
01:935b : a9 00 __ LDA #$00
01:935d : 85 0d __ STA P0 
01:935f : a9 16 __ LDA #$16
01:9361 : 85 0e __ STA P1 
01:9363 : a9 02 __ LDA #$02
01:9365 : 85 10 __ STA P3 
01:9367 : 20 ea 3c JSR $3cea 
01:936a : a5 54 __ LDA T1 + 0 
01:936c : 20 5d 87 JSR $875d ; (keytomenuslot.s4 + 0)
01:936f : 85 55 __ STA T2 + 0 
01:9371 : 20 f8 25 JSR $25f8 
01:9374 : a9 50 __ LDA #$50
01:9376 : 85 11 __ STA P4 
01:9378 : a9 4d __ LDA #$4d
01:937a : 85 10 __ STA P3 
01:937c : a9 05 __ LDA #$05
01:937e : 85 12 __ STA P5 
01:9380 : a9 b4 __ LDA #$b4
01:9382 : 85 0d __ STA P0 
01:9384 : a9 77 __ LDA #$77
01:9386 : 85 0e __ STA P1 
01:9388 : a9 c8 __ LDA #$c8
01:938a : 85 0f __ STA P2 
01:938c : 20 ae 34 JSR $34ae 
01:938f : a5 55 __ LDA T2 + 0 
01:9391 : 8d eb 7f STA $7feb ; (sstack + 12)
01:9394 : a9 01 __ LDA #$01
01:9396 : 8d ec 7f STA $7fec ; (sstack + 13)
01:9399 : 20 c7 95 JSR $95c7 ; (printnewmenuslot.s4 + 0)
01:939c : a9 8a __ LDA #$8a
01:939e : 85 0f __ STA P2 
01:93a0 : a9 96 __ LDA #$96
01:93a2 : 85 10 __ STA P3 
01:93a4 : 20 f3 3b JSR $3bf3 
01:93a7 : a9 18 __ LDA #$18
01:93a9 : 85 0f __ STA P2 
01:93ab : a9 16 __ LDA #$16
01:93ad : 85 10 __ STA P3 
01:93af : a9 a3 __ LDA #$a3
01:93b1 : 85 11 __ STA P4 
01:93b3 : a9 96 __ LDA #$96
01:93b5 : 85 12 __ STA P5 
01:93b7 : 20 8f 3c JSR $3c8f 
01:93ba : a9 23 __ LDA #$23
01:93bc : 85 0d __ STA P0 
01:93be : a9 fe __ LDA #$fe
01:93c0 : 85 0f __ STA P2 
01:93c2 : a9 90 __ LDA #$90
01:93c4 : 85 10 __ STA P3 
01:93c6 : 20 e7 3b JSR $3be7 
01:93c9 : a9 17 __ LDA #$17
01:93cb : 85 10 __ STA P3 
01:93cd : a9 af __ LDA #$af
01:93cf : 85 11 __ STA P4 
01:93d1 : a9 96 __ LDA #$96
01:93d3 : 85 12 __ STA P5 
01:93d5 : 20 1b 3c JSR $3c1b 
01:93d8 : a9 06 __ LDA #$06
01:93da : 85 0d __ STA P0 
01:93dc : a9 b5 __ LDA #$b5
01:93de : 85 0f __ STA P2 
01:93e0 : a9 96 __ LDA #$96
01:93e2 : 85 10 __ STA P3 
01:93e4 : 20 db 3b JSR $3bdb 
01:93e7 : a9 18 __ LDA #$18
01:93e9 : 85 10 __ STA P3 
01:93eb : a9 cb __ LDA #$cb
01:93ed : 85 11 __ STA P4 
01:93ef : a9 96 __ LDA #$96
01:93f1 : 85 12 __ STA P5 
01:93f3 : 20 1b 3c JSR $3c1b 
01:93f6 : a9 03 __ LDA #$03
01:93f8 : 85 0d __ STA P0 
01:93fa : a9 ce __ LDA #$ce
01:93fc : 85 0f __ STA P2 
01:93fe : a9 96 __ LDA #$96
01:9400 : 85 10 __ STA P3 
01:9402 : 20 b3 3b JSR $3bb3 
.l13:
01:9405 : 20 50 14 JSR $1450 
01:9408 : a5 1b __ LDA ACCU + 0 
01:940a : c9 88 __ CMP #$88
01:940c : d0 1a __ BNE $9428 ; (reordermenuslot.s15 + 0)
.s14:
01:940e : a9 18 __ LDA #$18
01:9410 : 85 0e __ STA P1 
01:9412 : a9 00 __ LDA #$00
01:9414 : 85 0f __ STA P2 
01:9416 : a9 97 __ LDA #$97
01:9418 : 85 10 __ STA P3 
01:941a : 20 7f 3b JSR $3b7f 
01:941d : a9 00 __ LDA #$00
01:941f : 8d f0 7f STA $7ff0 ; (sstack + 17)
01:9422 : 20 ab 21 JSR $21ab 
01:9425 : 4c 56 95 JMP $9556 ; (reordermenuslot.s11 + 0)
.s15:
01:9428 : c9 0d __ CMP #$0d
01:942a : d0 07 __ BNE $9433 ; (reordermenuslot.s17 + 0)
.s16:
01:942c : a9 01 __ LDA #$01
01:942e : 85 56 __ STA T4 + 0 
01:9430 : 4c d6 92 JMP $92d6 ; (reordermenuslot.l5 + 0)
.s17:
01:9433 : c9 11 __ CMP #$11
01:9435 : d0 03 __ BNE $943a ; (reordermenuslot.s22 + 0)
01:9437 : 4c d9 94 JMP $94d9 ; (reordermenuslot.s18 + 0)
.s22:
01:943a : c9 91 __ CMP #$91
01:943c : d0 c7 __ BNE $9405 ; (reordermenuslot.l13 + 0)
.s23:
01:943e : a5 55 __ LDA T2 + 0 
01:9440 : f0 2d __ BEQ $946f ; (reordermenuslot.s24 + 0)
.s26:
01:9442 : e9 01 __ SBC #$01
01:9444 : 20 f8 25 JSR $25f8 
01:9447 : 20 42 24 JSR $2442 
01:944a : a5 0d __ LDA P0 
01:944c : 8d eb 7f STA $7feb ; (sstack + 12)
01:944f : a9 00 __ LDA #$00
01:9451 : 8d ec 7f STA $7fec ; (sstack + 13)
01:9454 : 20 c7 95 JSR $95c7 ; (printnewmenuslot.s4 + 0)
01:9457 : 20 96 34 JSR $3496 
01:945a : c6 55 __ DEC T2 + 0 
01:945c : 20 42 24 JSR $2442 
01:945f : a5 0d __ LDA P0 
01:9461 : 8d eb 7f STA $7feb ; (sstack + 12)
01:9464 : a9 01 __ LDA #$01
01:9466 : 8d ec 7f STA $7fec ; (sstack + 13)
01:9469 : 20 c7 95 JSR $95c7 ; (printnewmenuslot.s4 + 0)
01:946c : 4c 05 94 JMP $9405 ; (reordermenuslot.l13 + 0)
.s24:
01:946f : 85 53 __ STA T0 + 0 
01:9471 : a9 01 __ LDA #$01
01:9473 : 85 54 __ STA T1 + 0 
.l32:
01:9475 : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:9478 : a9 00 __ LDA #$00
01:947a : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:947d : 8d e8 7f STA $7fe8 ; (sstack + 9)
01:9480 : 8d 68 49 STA $4968 ; (cw.cx + 0)
01:9483 : a5 53 __ LDA T0 + 0 
01:9485 : 8d e7 7f STA $7fe7 ; (sstack + 8)
01:9488 : a9 02 __ LDA #$02
01:948a : 8d 69 49 STA $4969 ; (cw.cy + 0)
01:948d : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:9490 : 85 18 __ STA P11 
01:9492 : a9 d9 __ LDA #$d9
01:9494 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:9497 : a9 96 __ LDA #$96
01:9499 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:949c : 20 25 15 JSR $1525 
01:949f : a5 54 __ LDA T1 + 0 
01:94a1 : 20 f8 25 JSR $25f8 
01:94a4 : a5 53 __ LDA T0 + 0 
01:94a6 : 20 46 24 JSR $2446 
01:94a9 : e6 53 __ INC T0 + 0 
01:94ab : e6 54 __ INC T1 + 0 
01:94ad : a5 54 __ LDA T1 + 0 
01:94af : c9 12 __ CMP #$12
01:94b1 : 90 c2 __ BCC $9475 ; (reordermenuslot.l32 + 0)
.s25:
01:94b3 : 20 96 34 JSR $3496 
01:94b6 : a9 11 __ LDA #$11
01:94b8 : 20 46 24 JSR $2446 
01:94bb : a9 12 __ LDA #$12
01:94bd : 85 10 __ STA P3 
01:94bf : 20 d2 3c JSR $3cd2 
01:94c2 : 20 2e 8e JSR $8e2e ; (presentmenuslots.s4 + 0)
01:94c5 : a9 11 __ LDA #$11
01:94c7 : 8d eb 7f STA $7feb ; (sstack + 12)
01:94ca : a9 01 __ LDA #$01
01:94cc : 8d ec 7f STA $7fec ; (sstack + 13)
01:94cf : 20 c7 95 JSR $95c7 ; (printnewmenuslot.s4 + 0)
01:94d2 : a9 11 __ LDA #$11
.s33:
01:94d4 : 85 55 __ STA T2 + 0 
01:94d6 : 4c 05 94 JMP $9405 ; (reordermenuslot.l13 + 0)
.s18:
01:94d9 : a5 55 __ LDA T2 + 0 
01:94db : c9 11 __ CMP #$11
01:94dd : f0 34 __ BEQ $9513 ; (reordermenuslot.s20 + 0)
.s19:
01:94df : aa __ __ TAX
01:94e0 : e8 __ __ INX
01:94e1 : 86 54 __ STX T1 + 0 
01:94e3 : 8a __ __ TXA
01:94e4 : 20 f8 25 JSR $25f8 
01:94e7 : 20 42 24 JSR $2442 
01:94ea : a5 0d __ LDA P0 
01:94ec : 8d eb 7f STA $7feb ; (sstack + 12)
01:94ef : a9 00 __ LDA #$00
01:94f1 : 8d ec 7f STA $7fec ; (sstack + 13)
01:94f4 : 20 c7 95 JSR $95c7 ; (printnewmenuslot.s4 + 0)
01:94f7 : 20 96 34 JSR $3496 
01:94fa : a5 54 __ LDA T1 + 0 
01:94fc : 85 0d __ STA P0 
01:94fe : 20 46 24 JSR $2446 
01:9501 : a5 0d __ LDA P0 
01:9503 : 8d eb 7f STA $7feb ; (sstack + 12)
01:9506 : a9 01 __ LDA #$01
01:9508 : 8d ec 7f STA $7fec ; (sstack + 13)
01:950b : 20 c7 95 JSR $95c7 ; (printnewmenuslot.s4 + 0)
01:950e : a5 54 __ LDA T1 + 0 
01:9510 : 4c d4 94 JMP $94d4 ; (reordermenuslot.s33 + 0)
.s20:
01:9513 : 85 53 __ STA T0 + 0 
01:9515 : a9 10 __ LDA #$10
01:9517 : 85 54 __ STA T1 + 0 
.l21:
01:9519 : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:951c : a9 00 __ LDA #$00
01:951e : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:9521 : 8d e8 7f STA $7fe8 ; (sstack + 9)
01:9524 : 8d 68 49 STA $4968 ; (cw.cx + 0)
01:9527 : a5 53 __ LDA T0 + 0 
01:9529 : 8d e7 7f STA $7fe7 ; (sstack + 8)
01:952c : a9 02 __ LDA #$02
01:952e : 8d 69 49 STA $4969 ; (cw.cy + 0)
01:9531 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:9534 : 85 18 __ STA P11 
01:9536 : a9 d9 __ LDA #$d9
01:9538 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:953b : a9 96 __ LDA #$96
01:953d : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:9540 : 20 25 15 JSR $1525 
01:9543 : a5 54 __ LDA T1 + 0 
01:9545 : 20 f8 25 JSR $25f8 
01:9548 : a5 53 __ LDA T0 + 0 
01:954a : 20 46 24 JSR $2446 
01:954d : c6 53 __ DEC T0 + 0 
01:954f : c6 54 __ DEC T1 + 0 
01:9551 : a5 54 __ LDA T1 + 0 
01:9553 : 4c 19 95 JMP $9519 ; (reordermenuslot.l21 + 0)
.s11:
01:9556 : a5 56 __ LDA T4 + 0 
01:9558 : 85 1b __ STA ACCU + 0 
.s3:
01:955a : a2 04 __ LDX #$04
01:955c : bd ac 77 LDA $77ac,x ; (reordermenuslot@stack + 0)
01:955f : 95 53 __ STA T0 + 0,x 
01:9561 : ca __ __ DEX
01:9562 : 10 f8 __ BPL $955c ; (reordermenuslot.s3 + 2)
01:9564 : 60 __ __ RTS
.s29:
01:9565 : a9 01 __ LDA #$01
01:9567 : 85 57 __ STA T5 + 0 
01:9569 : 4c 5b 93 JMP $935b ; (reordermenuslot.s12 + 0)
--------------------------------------------------------------------
01:956c : __ __ __ BYT 72 45 2d 4f 52 44 45 52 20 4d 45 4e 55 20 53 4c : rE-ORDER MENU SL
01:957c : __ __ __ BYT 4f 54 53 00                                     : OTS.
--------------------------------------------------------------------
01:9580 : __ __ __ BYT 63 48 4f 4f 53 45 20 4d 45 4e 55 20 53 4c 4f 54 : cHOOSE MENU SLOT
01:9590 : __ __ __ BYT 20 54 4f 20 42 45 20 52 45 2d 4f 52 44 45 52 45 :  TO BE RE-ORDERE
01:95a0 : __ __ __ BYT 44 2e 00                                        : D..
--------------------------------------------------------------------
01:95a3 : __ __ __ BYT 6f 52 20 43 48 4f 4f 53 45 20 00                : oR CHOOSE .
--------------------------------------------------------------------
01:95ae : __ __ __ BYT 20 54 4f 20 52 45 54 55 52 4e 20 54 4f 20 4d 41 :  TO RETURN TO MA
01:95be : __ __ __ BYT 49 4e 20 4d 45 4e 55 2e 00                      : IN MENU..
--------------------------------------------------------------------
printnewmenuslot: ; printnewmenuslot(u8,u8,u8*)->void
; 610, "/home/xahmol/git/UBoot64-v2/src/slotmenu.c"
.s4:
01:95c7 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:95ca : 85 4d __ STA T4 + 0 
01:95cc : 85 12 __ STA P5 
01:95ce : a9 00 __ LDA #$00
01:95d0 : 85 0d __ STA P0 
01:95d2 : a9 28 __ LDA #$28
01:95d4 : 85 0f __ STA P2 
01:95d6 : a9 01 __ LDA #$01
01:95d8 : 85 10 __ STA P3 
01:95da : a9 20 __ LDA #$20
01:95dc : 85 11 __ STA P4 
01:95de : ad eb 7f LDA $7feb ; (sstack + 12)
01:95e1 : 18 __ __ CLC
01:95e2 : 69 03 __ ADC #$03
01:95e4 : 85 4c __ STA T1 + 0 
01:95e6 : 85 0e __ STA P1 
01:95e8 : ad 5e 49 LDA $495e ; (cfg.colors.text_input + 0)
01:95eb : 85 4e __ STA T5 + 0 
01:95ed : ad 5f 49 LDA $495f ; (cfg.colors.key + 0)
01:95f0 : 85 4f __ STA T6 + 0 
01:95f2 : 20 bb 0f JSR $0fbb 
01:95f5 : ad eb 7f LDA $7feb ; (sstack + 12)
01:95f8 : 20 e2 86 JSR $86e2 ; (menuslotkey.s4 + 0)
01:95fb : aa __ __ TAX
01:95fc : ad ec 7f LDA $7fec ; (sstack + 13)
01:95ff : 85 50 __ STA T7 + 0 
01:9601 : d0 07 __ BNE $960a ; (printnewmenuslot.s13 + 0)
.s5:
01:9603 : a9 8c __ LDA #$8c
01:9605 : a0 fe __ LDY #$fe
01:9607 : 4c 0e 96 JMP $960e ; (printnewmenuslot.s6 + 0)
.s13:
01:960a : a9 8b __ LDA #$8b
01:960c : a0 fd __ LDY #$fd
.s6:
01:960e : 8e e9 7f STX $7fe9 ; (sstack + 10)
01:9611 : 8c e7 7f STY $7fe7 ; (sstack + 8)
01:9614 : 8d e8 7f STA $7fe8 ; (sstack + 9)
01:9617 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:961a : 85 18 __ STA P11 
01:961c : a9 72 __ LDA #$72
01:961e : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:9621 : a9 49 __ LDA #$49
01:9623 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:9626 : a9 83 __ LDA #$83
01:9628 : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:962b : a9 96 __ LDA #$96
01:962d : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:9630 : a9 00 __ LDA #$00
01:9632 : 8d ea 7f STA $7fea ; (sstack + 11)
01:9635 : 20 25 15 JSR $1525 
01:9638 : a5 4c __ LDA T1 + 0 
01:963a : 85 10 __ STA P3 
01:963c : a9 00 __ LDA #$00
01:963e : 85 0f __ STA P2 
01:9640 : a9 72 __ LDA #$72
01:9642 : 85 11 __ STA P4 
01:9644 : a9 49 __ LDA #$49
01:9646 : 85 12 __ STA P5 
01:9648 : a5 50 __ LDA T7 + 0 
01:964a : d0 07 __ BNE $9653 ; (printnewmenuslot.s12 + 0)
.s7:
01:964c : a5 4f __ LDA T6 + 0 
01:964e : 85 13 __ STA P6 
01:9650 : 4c 59 96 JMP $9659 ; (printnewmenuslot.s8 + 0)
.s12:
01:9653 : a5 4e __ LDA T5 + 0 
01:9655 : 85 13 __ STA P6 
01:9657 : 85 4d __ STA T4 + 0 
.s8:
01:9659 : 20 32 10 JSR $1032 
01:965c : 20 25 3d JSR $3d25 
01:965f : a5 10 __ LDA P3 
01:9661 : 85 0e __ STA P1 
01:9663 : a9 05 __ LDA #$05
01:9665 : 85 0d __ STA P0 
01:9667 : a5 4d __ LDA T4 + 0 
01:9669 : 85 11 __ STA P4 
01:966b : a5 1b __ LDA ACCU + 0 
01:966d : 05 1c __ ORA ACCU + 1 
01:966f : f0 07 __ BEQ $9678 ; (printnewmenuslot.s11 + 0)
.s9:
01:9671 : a9 4e __ LDA #$4e
01:9673 : a0 c9 __ LDY #$c9
01:9675 : 4c 7c 96 JMP $967c ; (printnewmenuslot.s10 + 0)
.s11:
01:9678 : a9 8b __ LDA #$8b
01:967a : a0 f0 __ LDY #$f0
.s10:
01:967c : 84 0f __ STY P2 
01:967e : 85 10 __ STA P3 
01:9680 : 4c 8f 12 JMP $128f 
--------------------------------------------------------------------
01:9683 : __ __ __ BYT 20 25 53 25 43 20 00                            :  %S%C .
--------------------------------------------------------------------
01:968a : __ __ __ BYT 6d 4f 56 45 20 53 4c 4f 54 20 55 50 20 4f 52 20 : mOVE SLOT UP OR 
01:969a : __ __ __ BYT 44 4f 57 4e 20 42 59 20 00                      : DOWN BY .
--------------------------------------------------------------------
01:96a3 : __ __ __ BYT 43 55 52 53 4f 52 20 4b 45 59 53 00             : CURSOR KEYS.
--------------------------------------------------------------------
01:96af : __ __ __ BYT 65 6e 74 65 72 00                               : enter.
--------------------------------------------------------------------
01:96b5 : __ __ __ BYT 54 4f 20 43 4f 4e 46 49 52 4d 20 50 4f 53 49 54 : TO CONFIRM POSIT
01:96c5 : __ __ __ BYT 49 4f 4e 2c 20 00                               : ION, .
--------------------------------------------------------------------
01:96cb : __ __ __ BYT 66 37 00                                        : f7.
--------------------------------------------------------------------
01:96ce : __ __ __ BYT 54 4f 20 43 41 4e 43 45 4c 2e 00                : TO CANCEL..
--------------------------------------------------------------------
01:96d9 : __ __ __ BYT 73 48 49 46 54 49 4e 47 20 25 32 55 20 54 4f 20 : sHIFTING %2U TO 
01:96e9 : __ __ __ BYT 25 32 55 00                                     : %2U.
--------------------------------------------------------------------
01:96ed : __ __ __ BYT 6f 46 46 00                                     : oFF.
--------------------------------------------------------------------
01:96f1 : __ __ __ BYT 6f 4e 00                                        : oN.
--------------------------------------------------------------------
01:96f4 : __ __ __ BYT 73 49 4c 45 4e 54 00                            : sILENT.
--------------------------------------------------------------------
01:96fb : __ __ __ BYT 20 66 36 20 00                                  :  f6 .
--------------------------------------------------------------------
01:9700 : __ __ __ BYT 72 45 53 54 4f 52 49 4e 47 20 53 4c 4f 54 20 44 : rESTORING SLOT D
01:9710 : __ __ __ BYT 41 54 41 2e 2e 2e 2e 50 4c 45 41 53 45 20 57 41 : ATA....PLEASE WA
01:9720 : __ __ __ BYT 49 54 2e 00                                     : IT..
--------------------------------------------------------------------
01:9724 : __ __ __ BYT 73 41 56 49 4e 47 2e 20 70 4c 45 41 53 45 20 57 : sAVING. pLEASE W
01:9734 : __ __ __ BYT 41 49 54 2e 20 20 20 20 20 20 20 20 20 20 00    : AIT.          .
--------------------------------------------------------------------
edittimeconfig: ; edittimeconfig()->void
;  13, "/home/xahmol/git/UBoot64-v2/src/u-time.h"
.s1:
01:9743 : a5 53 __ LDA T2 + 0 
01:9745 : 8d 16 7e STA $7e16 ; (edittimeconfig@stack + 0)
.s4:
01:9748 : a9 00 __ LDA #$00
.l32:
01:974a : 85 53 __ STA T2 + 0 
.l5:
01:974c : 20 f2 0d JSR $0df2 
01:974f : a9 ec __ LDA #$ec
01:9751 : 85 14 __ STA P7 
01:9753 : a9 99 __ LDA #$99
01:9755 : 85 15 __ STA P8 
01:9757 : 20 9a 0e JSR $0e9a 
01:975a : a9 00 __ LDA #$00
01:975c : 8d 68 49 STA $4968 ; (cw.cx + 0)
01:975f : a9 03 __ LDA #$03
01:9761 : 8d 69 49 STA $4969 ; (cw.cy + 0)
01:9764 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:9767 : 85 18 __ STA P11 
01:9769 : a9 00 __ LDA #$00
01:976b : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:976e : a9 9a __ LDA #$9a
01:9770 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:9773 : 20 25 15 JSR $1525 
01:9776 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:9779 : 85 18 __ STA P11 
01:977b : a9 23 __ LDA #$23
01:977d : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:9780 : a9 9a __ LDA #$9a
01:9782 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:9785 : 20 25 15 JSR $1525 
01:9788 : ad 02 49 LDA $4902 ; (cfg.timeon + 0)
01:978b : d0 07 __ BNE $9794 ; (edittimeconfig.s30 + 0)
.s6:
01:978d : a9 96 __ LDA #$96
01:978f : a0 ed __ LDY #$ed
01:9791 : 4c 98 97 JMP $9798 ; (edittimeconfig.s7 + 0)
.s30:
01:9794 : a9 96 __ LDA #$96
01:9796 : a0 f1 __ LDY #$f1
.s7:
01:9798 : 8c e5 7f STY $7fe5 ; (sstack + 6)
01:979b : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:979e : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:97a1 : 85 18 __ STA P11 
01:97a3 : a9 3e __ LDA #$3e
01:97a5 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:97a8 : a9 9a __ LDA #$9a
01:97aa : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:97ad : 20 25 15 JSR $1525 
01:97b0 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:97b3 : 85 18 __ STA P11 
01:97b5 : a9 5b __ LDA #$5b
01:97b7 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:97ba : a9 9a __ LDA #$9a
01:97bc : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:97bf : ad 54 49 LDA $4954 ; (cfg.secondsfromutc + 0)
01:97c2 : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:97c5 : ad 55 49 LDA $4955 ; (cfg.secondsfromutc + 1)
01:97c8 : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:97cb : ad 56 49 LDA $4956 ; (cfg.secondsfromutc + 2)
01:97ce : 8d e7 7f STA $7fe7 ; (sstack + 8)
01:97d1 : ad 57 49 LDA $4957 ; (cfg.secondsfromutc + 3)
01:97d4 : 8d e8 7f STA $7fe8 ; (sstack + 9)
01:97d7 : 20 25 15 JSR $1525 
01:97da : a9 28 __ LDA #$28
01:97dc : 85 11 __ STA P4 
01:97de : a9 49 __ LDA #$49
01:97e0 : 85 10 __ STA P3 
01:97e2 : a9 19 __ LDA #$19
01:97e4 : 85 0d __ STA P0 
01:97e6 : a9 7e __ LDA #$7e
01:97e8 : 85 0e __ STA P1 
01:97ea : a9 03 __ LDA #$03
01:97ec : 85 0f __ STA P2 
01:97ee : 20 f4 1f JSR $1ff4 
01:97f1 : a9 19 __ LDA #$19
01:97f3 : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:97f6 : a9 7e __ LDA #$7e
01:97f8 : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:97fb : a9 00 __ LDA #$00
01:97fd : 8d 41 7e STA $7e41 ; (hostbuf[0] + 40)
01:9800 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:9803 : 85 18 __ STA P11 
01:9805 : a9 7c __ LDA #$7c
01:9807 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:980a : a9 9a __ LDA #$9a
01:980c : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:980f : 20 25 15 JSR $1525 
01:9812 : ad 58 49 LDA $4958 ; (cfg.verbose + 0)
01:9815 : d0 07 __ BNE $981e ; (edittimeconfig.s29 + 0)
.s8:
01:9817 : a9 96 __ LDA #$96
01:9819 : a0 f4 __ LDY #$f4
01:981b : 4c 22 98 JMP $9822 ; (edittimeconfig.s9 + 0)
.s29:
01:981e : a9 9a __ LDA #$9a
01:9820 : a0 b7 __ LDY #$b7
.s9:
01:9822 : 8c e5 7f STY $7fe5 ; (sstack + 6)
01:9825 : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:9828 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:982b : 85 18 __ STA P11 
01:982d : a9 97 __ LDA #$97
01:982f : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:9832 : a9 9a __ LDA #$9a
01:9834 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:9837 : 20 25 15 JSR $1525 
01:983a : a9 10 __ LDA #$10
01:983c : 85 0e __ STA P1 
01:983e : a9 bf __ LDA #$bf
01:9840 : 85 0f __ STA P2 
01:9842 : a9 9a __ LDA #$9a
01:9844 : 85 10 __ STA P3 
01:9846 : 20 7f 3b JSR $3b7f 
01:9849 : a9 11 __ LDA #$11
01:984b : 85 10 __ STA P3 
01:984d : a9 ec __ LDA #$ec
01:984f : 85 11 __ STA P4 
01:9851 : a9 86 __ LDA #$86
01:9853 : 85 12 __ STA P5 
01:9855 : 20 1b 3c JSR $3c1b 
01:9858 : a9 11 __ LDA #$11
01:985a : 85 0e __ STA P1 
01:985c : a9 d1 __ LDA #$d1
01:985e : 85 0f __ STA P2 
01:9860 : a9 9a __ LDA #$9a
01:9862 : 85 10 __ STA P3 
01:9864 : 20 73 3b JSR $3b73 
01:9867 : a9 00 __ LDA #$00
01:9869 : 85 11 __ STA P4 
01:986b : a9 87 __ LDA #$87
01:986d : 85 12 __ STA P5 
01:986f : 20 4b 3c JSR $3c4b 
01:9872 : a9 12 __ LDA #$12
01:9874 : 85 0e __ STA P1 
01:9876 : a9 00 __ LDA #$00
01:9878 : 85 0f __ STA P2 
01:987a : a9 9b __ LDA #$9b
01:987c : 85 10 __ STA P3 
01:987e : 20 73 3b JSR $3b73 
01:9881 : a9 13 __ LDA #$13
01:9883 : 85 10 __ STA P3 
01:9885 : 20 37 3c JSR $3c37 
01:9888 : a9 13 __ LDA #$13
01:988a : 85 0e __ STA P1 
01:988c : a9 17 __ LDA #$17
01:988e : 85 0f __ STA P2 
01:9890 : a9 9b __ LDA #$9b
01:9892 : 85 10 __ STA P3 
01:9894 : 20 73 3b JSR $3b73 
01:9897 : a9 25 __ LDA #$25
01:9899 : 85 11 __ STA P4 
01:989b : a9 87 __ LDA #$87
01:989d : 85 12 __ STA P5 
01:989f : 20 27 3c JSR $3c27 
01:98a2 : a9 14 __ LDA #$14
01:98a4 : 85 0e __ STA P1 
01:98a6 : a9 ea __ LDA #$ea
01:98a8 : 85 0f __ STA P2 
01:98aa : a9 9a __ LDA #$9a
01:98ac : 85 10 __ STA P3 
01:98ae : 20 73 3b JSR $3b73 
01:98b1 : a9 15 __ LDA #$15
01:98b3 : 85 10 __ STA P3 
01:98b5 : a9 fb __ LDA #$fb
01:98b7 : 85 11 __ STA P4 
01:98b9 : a9 96 __ LDA #$96
01:98bb : 85 12 __ STA P5 
01:98bd : 20 1b 3c JSR $3c1b 
01:98c0 : a9 2f __ LDA #$2f
01:98c2 : 85 0f __ STA P2 
01:98c4 : a9 9b __ LDA #$9b
01:98c6 : 85 10 __ STA P3 
01:98c8 : 20 63 3b JSR $3b63 
01:98cb : a9 16 __ LDA #$16
01:98cd : 85 10 __ STA P3 
01:98cf : 20 21 10 JSR $1021 
01:98d2 : a9 05 __ LDA #$05
01:98d4 : 85 0d __ STA P0 
01:98d6 : a9 16 __ LDA #$16
01:98d8 : 85 0e __ STA P1 
01:98da : 20 53 3b JSR $3b53 
.l10:
01:98dd : 20 50 14 JSR $1450 
01:98e0 : a5 1b __ LDA ACCU + 0 
01:98e2 : c9 85 __ CMP #$85
01:98e4 : f0 4c __ BEQ $9932 ; (edittimeconfig.s11 + 0)
.s23:
01:98e6 : c9 89 __ CMP #$89
01:98e8 : f0 48 __ BEQ $9932 ; (edittimeconfig.s11 + 0)
.s24:
01:98ea : c9 86 __ CMP #$86
01:98ec : f0 44 __ BEQ $9932 ; (edittimeconfig.s11 + 0)
.s25:
01:98ee : c9 87 __ CMP #$87
01:98f0 : d0 2a __ BNE $991c ; (edittimeconfig.s27 + 0)
.s26:
01:98f2 : a9 72 __ LDA #$72
01:98f4 : 85 0f __ STA P2 
01:98f6 : a9 9b __ LDA #$9b
01:98f8 : 85 10 __ STA P3 
01:98fa : 20 82 12 JSR $1282 
01:98fd : a9 18 __ LDA #$18
01:98ff : 8d eb 7f STA $7feb ; (sstack + 12)
01:9902 : a9 28 __ LDA #$28
01:9904 : 8d ec 7f STA $7fec ; (sstack + 13)
01:9907 : a9 50 __ LDA #$50
01:9909 : 8d ef 7f STA $7fef ; (sstack + 16)
01:990c : a9 03 __ LDA #$03
01:990e : 8d ed 7f STA $7fed ; (sstack + 14)
01:9911 : a9 49 __ LDA #$49
01:9913 : 8d ee 7f STA $7fee ; (sstack + 15)
01:9916 : 20 59 32 JSR $3259 
01:9919 : 4c 56 99 JMP $9956 ; (edittimeconfig.s18 + 0)
.s27:
01:991c : c9 8b __ CMP #$8b
01:991e : f0 12 __ BEQ $9932 ; (edittimeconfig.s11 + 0)
.s28:
01:9920 : c9 88 __ CMP #$88
01:9922 : d0 b9 __ BNE $98dd ; (edittimeconfig.l10 + 0)
.s14:
01:9924 : a6 53 __ LDX T2 + 0 
01:9926 : ca __ __ DEX
01:9927 : d0 03 __ BNE $992c ; (edittimeconfig.s3 + 0)
.s15:
01:9929 : 20 a9 1d JSR $1da9 
.s3:
01:992c : ad 16 7e LDA $7e16 ; (edittimeconfig@stack + 0)
01:992f : 85 53 __ STA T2 + 0 
01:9931 : 60 __ __ RTS
.s11:
01:9932 : c9 87 __ CMP #$87
01:9934 : 90 25 __ BCC $995b ; (edittimeconfig.s19 + 0)
.s12:
01:9936 : c9 89 __ CMP #$89
01:9938 : d0 0b __ BNE $9945 ; (edittimeconfig.s31 + 0)
.s17:
01:993a : a9 00 __ LDA #$00
01:993c : cd 58 49 CMP $4958 ; (cfg.verbose + 0)
01:993f : 2a __ __ ROL
01:9940 : 8d 58 49 STA $4958 ; (cfg.verbose + 0)
01:9943 : 90 11 __ BCC $9956 ; (edittimeconfig.s18 + 0)
.s31:
01:9945 : c9 8b __ CMP #$8b
01:9947 : d0 06 __ BNE $994f ; (edittimeconfig.s13 + 0)
.s16:
01:9949 : 20 8d 9b JSR $9b8d ; (editcolors.s4 + 0)
01:994c : 4c 4a 97 JMP $974a ; (edittimeconfig.l32 + 0)
.s13:
01:994f : c9 88 __ CMP #$88
01:9951 : f0 d1 __ BEQ $9924 ; (edittimeconfig.s14 + 0)
01:9953 : 4c 4c 97 JMP $974c ; (edittimeconfig.l5 + 0)
.s18:
01:9956 : a9 01 __ LDA #$01
01:9958 : 4c 4a 97 JMP $974a ; (edittimeconfig.l32 + 0)
.s19:
01:995b : c9 85 __ CMP #$85
01:995d : d0 0b __ BNE $996a ; (edittimeconfig.s20 + 0)
.s22:
01:995f : a9 00 __ LDA #$00
01:9961 : cd 02 49 CMP $4902 ; (cfg.timeon + 0)
01:9964 : 2a __ __ ROL
01:9965 : 8d 02 49 STA $4902 ; (cfg.timeon + 0)
01:9968 : 90 ec __ BCC $9956 ; (edittimeconfig.s18 + 0)
.s20:
01:996a : c9 86 __ CMP #$86
01:996c : d0 e5 __ BNE $9953 ; (edittimeconfig.s13 + 4)
.s21:
01:996e : a9 45 __ LDA #$45
01:9970 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:9973 : a9 7e __ LDA #$7e
01:9975 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:9978 : a9 54 __ LDA #$54
01:997a : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:997d : a9 9b __ LDA #$9b
01:997f : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:9982 : ad 54 49 LDA $4954 ; (cfg.secondsfromutc + 0)
01:9985 : 8d e7 7f STA $7fe7 ; (sstack + 8)
01:9988 : ad 55 49 LDA $4955 ; (cfg.secondsfromutc + 1)
01:998b : 8d e8 7f STA $7fe8 ; (sstack + 9)
01:998e : ad 56 49 LDA $4956 ; (cfg.secondsfromutc + 2)
01:9991 : 8d e9 7f STA $7fe9 ; (sstack + 10)
01:9994 : ad 57 49 LDA $4957 ; (cfg.secondsfromutc + 3)
01:9997 : 8d ea 7f STA $7fea ; (sstack + 11)
01:999a : 20 d1 15 JSR $15d1 
01:999d : a9 58 __ LDA #$58
01:999f : 85 0f __ STA P2 
01:99a1 : a9 9b __ LDA #$9b
01:99a3 : 85 10 __ STA P3 
01:99a5 : 20 82 12 JSR $1282 
01:99a8 : a9 0a __ LDA #$0a
01:99aa : 8d ec 7f STA $7fec ; (sstack + 13)
01:99ad : 8d ef 7f STA $7fef ; (sstack + 16)
01:99b0 : a9 18 __ LDA #$18
01:99b2 : 8d eb 7f STA $7feb ; (sstack + 12)
01:99b5 : a9 45 __ LDA #$45
01:99b7 : 8d ed 7f STA $7fed ; (sstack + 14)
01:99ba : a9 7e __ LDA #$7e
01:99bc : 8d ee 7f STA $7fee ; (sstack + 15)
01:99bf : 20 59 32 JSR $3259 
01:99c2 : a9 45 __ LDA #$45
01:99c4 : 85 0d __ STA P0 
01:99c6 : a9 7e __ LDA #$7e
01:99c8 : 85 10 __ STA P3 
01:99ca : a9 7e __ LDA #$7e
01:99cc : 85 0e __ STA P1 
01:99ce : a9 42 __ LDA #$42
01:99d0 : 85 0f __ STA P2 
01:99d2 : 20 d5 34 JSR $34d5 
01:99d5 : a5 1b __ LDA ACCU + 0 
01:99d7 : 8d 54 49 STA $4954 ; (cfg.secondsfromutc + 0)
01:99da : a5 1c __ LDA ACCU + 1 
01:99dc : 8d 55 49 STA $4955 ; (cfg.secondsfromutc + 1)
01:99df : a5 1d __ LDA ACCU + 2 
01:99e1 : 8d 56 49 STA $4956 ; (cfg.secondsfromutc + 2)
01:99e4 : a5 1e __ LDA ACCU + 3 
01:99e6 : 8d 57 49 STA $4957 ; (cfg.secondsfromutc + 3)
01:99e9 : 4c 56 99 JMP $9956 ; (edittimeconfig.s18 + 0)
--------------------------------------------------------------------
01:99ec : __ __ __ BYT 63 4f 4e 46 49 47 55 52 41 54 49 4f 4e 20 54 4f : cONFIGURATION TO
01:99fc : __ __ __ BYT 4f 4c 2e 00                                     : OL..
--------------------------------------------------------------------
01:9a00 : __ __ __ BYT 0a 63 55 52 52 45 4e 54 20 43 4f 4e 46 49 47 55 : .cURRENT CONFIGU
01:9a10 : __ __ __ BYT 52 41 54 49 4f 4e 20 53 45 54 54 49 4e 47 53 3a : RATION SETTINGS:
01:9a20 : __ __ __ BYT 0a 0a 00                                        : ...
--------------------------------------------------------------------
01:9a23 : __ __ __ BYT 6e 74 70 20 54 49 4d 45 20 55 50 44 41 54 45 20 : ntp TIME UPDATE 
01:9a33 : __ __ __ BYT 53 45 54 54 49 4e 47 53 3a 0a 00                : SETTINGS:..
--------------------------------------------------------------------
01:9a3e : __ __ __ BYT 2d 20 75 50 44 41 54 45 20 4f 4e 20 42 4f 4f 54 : - uPDATE ON BOOT
01:9a4e : __ __ __ BYT 20 54 4f 47 47 4c 45 3a 20 25 53 0a 00          :  TOGGLE: %S..
--------------------------------------------------------------------
01:9a5b : __ __ __ BYT 2d 20 6f 46 46 53 45 54 20 54 4f 20 75 74 63 20 : - oFFSET TO utc 
01:9a6b : __ __ __ BYT 49 4e 20 53 45 43 4f 4e 44 53 3a 20 25 4c 44 0a : IN SECONDS: %LD.
01:9a7b : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
01:9a7c : __ __ __ BYT 2d 20 6e 74 70 20 53 45 52 56 45 52 20 48 4f 53 : - ntp SERVER HOS
01:9a8c : __ __ __ BYT 54 4e 41 4d 45 3a 0a 25 53 0a 00                : TNAME:.%S..
--------------------------------------------------------------------
01:9a97 : __ __ __ BYT 0a 76 45 52 42 4f 53 45 20 4f 52 20 53 49 4c 45 : .vERBOSE OR SILE
01:9aa7 : __ __ __ BYT 4e 54 20 53 54 41 52 54 55 50 3a 20 25 53 0a 00 : NT STARTUP: %S..
--------------------------------------------------------------------
01:9ab7 : __ __ __ BYT 76 45 52 42 4f 53 45 00                         : vERBOSE.
--------------------------------------------------------------------
01:9abf : __ __ __ BYT 6d 41 4b 45 20 59 4f 55 52 20 43 48 4f 49 43 45 : mAKE YOUR CHOICE
01:9acf : __ __ __ BYT 3a 00                                           : :.
--------------------------------------------------------------------
01:9ad1 : __ __ __ BYT 74 4f 47 47 4c 45 20 54 49 4d 45 20 53 59 4e 43 : tOGGLE TIME SYNC
01:9ae1 : __ __ __ BYT 48 20 4f 4e 2f 4f 46 46 00                      : H ON/OFF.
--------------------------------------------------------------------
01:9aea : __ __ __ BYT 65 44 49 54 20 6e 74 70 20 53 45 52 56 45 52 20 : eDIT ntp SERVER 
01:9afa : __ __ __ BYT 48 4f 53 54 00                                  : HOST.
--------------------------------------------------------------------
01:9b00 : __ __ __ BYT 76 45 52 42 4f 53 45 20 53 54 41 52 54 55 50 20 : vERBOSE STARTUP 
01:9b10 : __ __ __ BYT 4f 4e 2f 4f 46 46 00                            : ON/OFF.
--------------------------------------------------------------------
01:9b17 : __ __ __ BYT 65 44 49 54 20 54 49 4d 45 20 4f 46 46 53 45 54 : eDIT TIME OFFSET
01:9b27 : __ __ __ BYT 20 54 4f 20 75 74 63 00                         :  TO utc.
--------------------------------------------------------------------
01:9b2f : __ __ __ BYT 65 44 49 54 20 43 4f 4c 4f 55 52 20 53 43 48 45 : eDIT COLOUR SCHE
01:9b3f : __ __ __ BYT 4d 45 00                                        : ME.
--------------------------------------------------------------------
01:9b42 : __ __ __ BYT 62 41 43 4b 20 54 4f 20 4d 41 49 4e 20 4d 45 4e : bACK TO MAIN MEN
01:9b52 : __ __ __ BYT 55 00                                           : U.
--------------------------------------------------------------------
01:9b54 : __ __ __ BYT 25 4c 44 00                                     : %LD.
--------------------------------------------------------------------
01:9b58 : __ __ __ BYT 69 4e 50 55 54 20 54 49 4d 45 20 4f 46 46 53 45 : iNPUT TIME OFFSE
01:9b68 : __ __ __ BYT 54 20 54 4f 20 75 74 63 3a 00                   : T TO utc:.
--------------------------------------------------------------------
01:9b72 : __ __ __ BYT 69 4e 50 55 54 20 6e 74 70 20 53 45 52 56 45 52 : iNPUT ntp SERVER
01:9b82 : __ __ __ BYT 20 48 4f 53 54 4e 41 4d 45 3a 00                :  HOSTNAME:.
--------------------------------------------------------------------
editcolors: ; editcolors()->u8
; 436, "/home/xahmol/git/UBoot64-v2/src/time.c"
.s4:
01:9b8d : a0 b0 __ LDY #$b0
.l5:
01:9b8f : b9 ff 9e LDA $9eff,y ; (write_slotsfile.l7 + 4)
01:9b92 : 99 4e 7e STA $7e4e,y ; (save_buffer[0] + 323)
01:9b95 : 88 __ __ DEY
01:9b96 : d0 f7 __ BNE $9b8f ; (editcolors.l5 + 0)
.s6:
01:9b98 : 84 4f __ STY T8 + 0 
.l7:
01:9b9a : a9 01 __ LDA #$01
.l38:
01:9b9c : 85 50 __ STA T9 + 0 
.l8:
01:9b9e : a5 50 __ LDA T9 + 0 
01:9ba0 : 20 33 9d JSR $9d33 ; (getcolor.s4 + 0)
01:9ba3 : 85 51 __ STA T10 + 0 
01:9ba5 : a9 01 __ LDA #$01
01:9ba7 : 85 4e __ STA T4 + 0 
01:9ba9 : 85 16 __ STA P9 
01:9bab : 20 f6 0d JSR $0df6 
01:9bae : a9 8c __ LDA #$8c
01:9bb0 : 85 14 __ STA P7 
01:9bb2 : a9 9d __ LDA #$9d
01:9bb4 : 85 15 __ STA P8 
01:9bb6 : 20 9a 0e JSR $0e9a 
01:9bb9 : a9 03 __ LDA #$03
01:9bbb : 8d 69 49 STA $4969 ; (cw.cy + 0)
01:9bbe : 85 0e __ STA P1 
01:9bc0 : a9 00 __ LDA #$00
01:9bc2 : 85 4d __ STA T3 + 0 
01:9bc4 : 85 0d __ STA P0 
01:9bc6 : 8d 68 49 STA $4968 ; (cw.cx + 0)
01:9bc9 : a9 a0 __ LDA #$a0
01:9bcb : 85 0f __ STA P2 
01:9bcd : a9 9d __ LDA #$9d
01:9bcf : 85 10 __ STA P3 
01:9bd1 : 20 ab 3b JSR $3bab 
01:9bd4 : a9 05 __ LDA #$05
01:9bd6 : 85 4c __ STA T2 + 0 
.l9:
01:9bd8 : a5 4e __ LDA T4 + 0 
01:9bda : 20 33 9d JSR $9d33 ; (getcolor.s4 + 0)
01:9bdd : 8d e9 7f STA $7fe9 ; (sstack + 10)
01:9be0 : a9 72 __ LDA #$72
01:9be2 : 8d e3 7f STA $7fe3 ; (sstack + 4)
01:9be5 : a9 49 __ LDA #$49
01:9be7 : 8d e4 7f STA $7fe4 ; (sstack + 5)
01:9bea : a9 b7 __ LDA #$b7
01:9bec : 8d e5 7f STA $7fe5 ; (sstack + 6)
01:9bef : a9 9d __ LDA #$9d
01:9bf1 : 8d e6 7f STA $7fe6 ; (sstack + 7)
01:9bf4 : 18 __ __ CLC
01:9bf5 : a9 4f __ LDA #$4f
01:9bf7 : 65 4d __ ADC T3 + 0 
01:9bf9 : 8d e7 7f STA $7fe7 ; (sstack + 8)
01:9bfc : a9 7e __ LDA #$7e
01:9bfe : 69 00 __ ADC #$00
01:9c00 : 8d e8 7f STA $7fe8 ; (sstack + 9)
01:9c03 : a9 00 __ LDA #$00
01:9c05 : 8d ea 7f STA $7fea ; (sstack + 11)
01:9c08 : 20 d1 15 JSR $15d1 
01:9c0b : a5 50 __ LDA T9 + 0 
01:9c0d : c5 4e __ CMP T4 + 0 
01:9c0f : f0 0a __ BEQ $9c1b ; (editcolors.s36 + 0)
.s10:
01:9c11 : a5 4c __ LDA T2 + 0 
01:9c13 : 85 0e __ STA P1 
01:9c15 : 20 8b 3b JSR $3b8b 
01:9c18 : 4c 22 9c JMP $9c22 ; (editcolors.s11 + 0)
.s36:
01:9c1b : a5 4c __ LDA T2 + 0 
01:9c1d : 85 10 __ STA P3 
01:9c1f : 20 5b 3c JSR $3c5b 
.s11:
01:9c22 : a5 4e __ LDA T4 + 0 
01:9c24 : 20 33 9d JSR $9d33 ; (getcolor.s4 + 0)
01:9c27 : 85 12 __ STA P5 
01:9c29 : a5 4c __ LDA T2 + 0 
01:9c2b : 85 0e __ STA P1 
01:9c2d : a9 1e __ LDA #$1e
01:9c2f : 85 0d __ STA P0 
01:9c31 : a9 04 __ LDA #$04
01:9c33 : 85 0f __ STA P2 
01:9c35 : 20 c7 3c JSR $3cc7 
01:9c38 : 18 __ __ CLC
01:9c39 : a5 4d __ LDA T3 + 0 
01:9c3b : 69 10 __ ADC #$10
01:9c3d : 85 4d __ STA T3 + 0 
01:9c3f : e6 4e __ INC T4 + 0 
01:9c41 : e6 4c __ INC T2 + 0 
01:9c43 : a5 4c __ LDA T2 + 0 
01:9c45 : c9 10 __ CMP #$10
01:9c47 : d0 8f __ BNE $9bd8 ; (editcolors.l9 + 0)
.s12:
01:9c49 : a9 bf __ LDA #$bf
01:9c4b : 85 11 __ STA P4 
01:9c4d : a9 9d __ LDA #$9d
01:9c4f : 85 12 __ STA P5 
01:9c51 : 20 4b 3c JSR $3c4b 
01:9c54 : a9 12 __ LDA #$12
01:9c56 : 85 0d __ STA P0 
01:9c58 : 85 0e __ STA P1 
01:9c5a : a9 d1 __ LDA #$d1
01:9c5c : 85 0f __ STA P2 
01:9c5e : a9 9d __ LDA #$9d
01:9c60 : 85 10 __ STA P3 
01:9c62 : 20 ab 3b JSR $3bab 
01:9c65 : a9 13 __ LDA #$13
01:9c67 : 85 10 __ STA P3 
01:9c69 : a9 e2 __ LDA #$e2
01:9c6b : 85 11 __ STA P4 
01:9c6d : a9 9d __ LDA #$9d
01:9c6f : 85 12 __ STA P5 
01:9c71 : 20 1b 3c JSR $3c1b 
01:9c74 : a9 13 __ LDA #$13
01:9c76 : 85 0e __ STA P1 
01:9c78 : a9 00 __ LDA #$00
01:9c7a : 85 0f __ STA P2 
01:9c7c : a9 9e __ LDA #$9e
01:9c7e : 85 10 __ STA P3 
01:9c80 : 20 9f 3b JSR $3b9f 
01:9c83 : a9 f4 __ LDA #$f4
01:9c85 : 85 11 __ STA P4 
01:9c87 : a9 9d __ LDA #$9d
01:9c89 : 85 12 __ STA P5 
01:9c8b : 20 27 3c JSR $3c27 
01:9c8e : a9 14 __ LDA #$14
01:9c90 : 85 0e __ STA P1 
01:9c92 : a9 11 __ LDA #$11
01:9c94 : 85 0f __ STA P2 
01:9c96 : a9 9e __ LDA #$9e
01:9c98 : 85 10 __ STA P3 
01:9c9a : 20 9f 3b JSR $3b9f 
01:9c9d : a9 15 __ LDA #$15
01:9c9f : 85 10 __ STA P3 
01:9ca1 : 20 21 10 JSR $1021 
01:9ca4 : a9 12 __ LDA #$12
01:9ca6 : 85 0d __ STA P0 
01:9ca8 : a9 15 __ LDA #$15
01:9caa : 85 0e __ STA P1 
01:9cac : 20 53 3b JSR $3b53 
.l13:
01:9caf : 20 50 14 JSR $1450 
01:9cb2 : a5 1b __ LDA ACCU + 0 
01:9cb4 : c9 11 __ CMP #$11
01:9cb6 : f0 32 __ BEQ $9cea ; (editcolors.s14 + 0)
.s29:
01:9cb8 : c9 91 __ CMP #$91
01:9cba : f0 2e __ BEQ $9cea ; (editcolors.s14 + 0)
.s30:
01:9cbc : c9 9d __ CMP #$9d
01:9cbe : f0 2a __ BEQ $9cea ; (editcolors.s14 + 0)
.s31:
01:9cc0 : c9 1d __ CMP #$1d
01:9cc2 : d0 1b __ BNE $9cdf ; (editcolors.s34 + 0)
.s32:
01:9cc4 : a5 51 __ LDA T10 + 0 
01:9cc6 : c9 0f __ CMP #$0f
01:9cc8 : 90 03 __ BCC $9ccd ; (editcolors.s33 + 0)
01:9cca : 4c 9e 9b JMP $9b9e ; (editcolors.l8 + 0)
.s33:
01:9ccd : 69 01 __ ADC #$01
.s20:
01:9ccf : 85 0e __ STA P1 
01:9cd1 : a5 50 __ LDA T9 + 0 
01:9cd3 : 85 0d __ STA P0 
01:9cd5 : 20 1d 9e JSR $9e1d ; (pushcolor.s4 + 0)
01:9cd8 : a9 01 __ LDA #$01
.s39:
01:9cda : 85 4f __ STA T8 + 0 
01:9cdc : 4c 9e 9b JMP $9b9e ; (editcolors.l8 + 0)
.s34:
01:9cdf : c9 14 __ CMP #$14
01:9ce1 : f0 07 __ BEQ $9cea ; (editcolors.s14 + 0)
.s35:
01:9ce3 : c9 88 __ CMP #$88
01:9ce5 : d0 c8 __ BNE $9caf ; (editcolors.l13 + 0)
.s17:
01:9ce7 : a5 4f __ LDA T8 + 0 
.s3:
01:9ce9 : 60 __ __ RTS
.s14:
01:9cea : c9 1d __ CMP #$1d
01:9cec : 90 28 __ BCC $9d16 ; (editcolors.s24 + 0)
.s15:
01:9cee : c9 91 __ CMP #$91
01:9cf0 : f0 14 __ BEQ $9d06 ; (editcolors.s21 + 0)
.s37:
01:9cf2 : c9 9d __ CMP #$9d
01:9cf4 : d0 09 __ BNE $9cff ; (editcolors.s16 + 0)
.s18:
01:9cf6 : a5 51 __ LDA T10 + 0 
01:9cf8 : f0 e2 __ BEQ $9cdc ; (editcolors.s39 + 2)
.s19:
01:9cfa : e9 01 __ SBC #$01
01:9cfc : 4c cf 9c JMP $9ccf ; (editcolors.s20 + 0)
.s16:
01:9cff : c9 88 __ CMP #$88
01:9d01 : f0 e4 __ BEQ $9ce7 ; (editcolors.s17 + 0)
01:9d03 : 4c 9e 9b JMP $9b9e ; (editcolors.l8 + 0)
.s21:
01:9d06 : a5 50 __ LDA T9 + 0 
01:9d08 : c9 02 __ CMP #$02
01:9d0a : 90 05 __ BCC $9d11 ; (editcolors.s22 + 0)
.s23:
01:9d0c : c6 50 __ DEC T9 + 0 
01:9d0e : 4c 9e 9b JMP $9b9e ; (editcolors.l8 + 0)
.s22:
01:9d11 : a9 0b __ LDA #$0b
01:9d13 : 4c 9c 9b JMP $9b9c ; (editcolors.l38 + 0)
.s24:
01:9d16 : c9 11 __ CMP #$11
01:9d18 : d0 0e __ BNE $9d28 ; (editcolors.s25 + 0)
.s27:
01:9d1a : a5 50 __ LDA T9 + 0 
01:9d1c : c9 0b __ CMP #$0b
01:9d1e : 90 03 __ BCC $9d23 ; (editcolors.s28 + 0)
01:9d20 : 4c 9a 9b JMP $9b9a ; (editcolors.l7 + 0)
.s28:
01:9d23 : e6 50 __ INC T9 + 0 
01:9d25 : 4c 9e 9b JMP $9b9e ; (editcolors.l8 + 0)
.s25:
01:9d28 : c9 14 __ CMP #$14
01:9d2a : d0 f9 __ BNE $9d25 ; (editcolors.s28 + 2)
.s26:
01:9d2c : 20 87 1b JSR $1b87 
01:9d2f : a9 00 __ LDA #$00
01:9d31 : f0 a7 __ BEQ $9cda ; (editcolors.s39 + 0)
--------------------------------------------------------------------
getcolor: ; getcolor(u8)->u8
; 323, "/home/xahmol/git/UBoot64-v2/src/time.c"
.s4:
01:9d33 : c9 06 __ CMP #$06
01:9d35 : d0 04 __ BNE $9d3b ; (getcolor.s5 + 0)
.s27:
01:9d37 : ad 60 49 LDA $4960 ; (cfg.colors.diritem_normal + 0)
.s3:
01:9d3a : 60 __ __ RTS
.s5:
01:9d3b : 90 29 __ BCC $9d66 ; (getcolor.s17 + 0)
.s6:
01:9d3d : c9 09 __ CMP #$09
01:9d3f : d0 04 __ BNE $9d45 ; (getcolor.s7 + 0)
.s16:
01:9d41 : ad 63 49 LDA $4963 ; (cfg.colors.ok + 0)
01:9d44 : 60 __ __ RTS
.s7:
01:9d45 : 90 13 __ BCC $9d5a ; (getcolor.s13 + 0)
.s8:
01:9d47 : c9 0a __ CMP #$0a
01:9d49 : d0 04 __ BNE $9d4f ; (getcolor.s9 + 0)
.s12:
01:9d4b : ad 59 49 LDA $4959 ; (cfg.colors.background + 0)
01:9d4e : 60 __ __ RTS
.s9:
01:9d4f : c9 0b __ CMP #$0b
01:9d51 : f0 03 __ BEQ $9d56 ; (getcolor.s11 + 0)
.s10:
01:9d53 : a9 00 __ LDA #$00
01:9d55 : 60 __ __ RTS
.s11:
01:9d56 : ad 5a 49 LDA $495a ; (cfg.colors.border + 0)
01:9d59 : 60 __ __ RTS
.s13:
01:9d5a : c9 07 __ CMP #$07
01:9d5c : f0 04 __ BEQ $9d62 ; (getcolor.s15 + 0)
.s14:
01:9d5e : ad 62 49 LDA $4962 ; (cfg.colors.error + 0)
01:9d61 : 60 __ __ RTS
.s15:
01:9d62 : ad 61 49 LDA $4961 ; (cfg.colors.diritem_select + 0)
01:9d65 : 60 __ __ RTS
.s17:
01:9d66 : c9 03 __ CMP #$03
01:9d68 : d0 04 __ BNE $9d6e ; (getcolor.s18 + 0)
.s26:
01:9d6a : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
01:9d6d : 60 __ __ RTS
.s18:
01:9d6e : 90 0c __ BCC $9d7c ; (getcolor.s22 + 0)
.s19:
01:9d70 : c9 04 __ CMP #$04
01:9d72 : f0 04 __ BEQ $9d78 ; (getcolor.s21 + 0)
.s20:
01:9d74 : ad 5f 49 LDA $495f ; (cfg.colors.key + 0)
01:9d77 : 60 __ __ RTS
.s21:
01:9d78 : ad 5e 49 LDA $495e ; (cfg.colors.text_input + 0)
01:9d7b : 60 __ __ RTS
.s22:
01:9d7c : c9 01 __ CMP #$01
01:9d7e : d0 04 __ BNE $9d84 ; (getcolor.s23 + 0)
.s25:
01:9d80 : ad 5b 49 LDA $495b ; (cfg.colors.header1 + 0)
01:9d83 : 60 __ __ RTS
.s23:
01:9d84 : c9 02 __ CMP #$02
01:9d86 : d0 cb __ BNE $9d53 ; (getcolor.s10 + 0)
.s24:
01:9d88 : ad 5c 49 LDA $495c ; (cfg.colors.header2 + 0)
01:9d8b : 60 __ __ RTS
--------------------------------------------------------------------
01:9d8c : __ __ __ BYT 65 44 49 54 20 43 4f 4c 4f 55 52 20 53 43 48 45 : eDIT COLOUR SCHE
01:9d9c : __ __ __ BYT 4d 45 2e 00                                     : ME..
--------------------------------------------------------------------
01:9da0 : __ __ __ BYT 63 55 52 52 45 4e 54 20 43 4f 4c 4f 55 52 20 53 : cURRENT COLOUR S
01:9db0 : __ __ __ BYT 43 48 45 4d 45 3a 00                            : CHEME:.
--------------------------------------------------------------------
01:9db7 : __ __ __ BYT 25 53 3a 20 25 32 55 00                         : %S: %2U.
--------------------------------------------------------------------
01:9dbf : __ __ __ BYT 20 63 75 72 73 20 75 70 2f 64 6f 77 6e 20 20 20 :  curs up/down   
01:9dcf : __ __ __ BYT 20 00                                           :  .
--------------------------------------------------------------------
01:9dd1 : __ __ __ BYT 6d 4f 56 45 20 55 50 20 41 4e 44 20 44 4f 57 4e : mOVE UP AND DOWN
01:9de1 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
01:9de2 : __ __ __ BYT 20 63 75 72 73 20 6c 65 66 74 2f 72 69 67 68 74 :  curs left/right
01:9df2 : __ __ __ BYT 20 00                                           :  .
--------------------------------------------------------------------
01:9df4 : __ __ __ BYT 20 64 65 6c 20 00                               :  del .
--------------------------------------------------------------------
01:9e00 : __ __ __ BYT 69 4e 43 52 2f 64 45 43 52 20 43 4f 4c 4f 55 52 : iNCR/dECR COLOUR
01:9e10 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
01:9e11 : __ __ __ BYT 75 4e 44 4f 20 43 48 41 4e 47 45 00             : uNDO CHANGE.
--------------------------------------------------------------------
pushcolor: ; pushcolor(u8,u8)->void
; 379, "/home/xahmol/git/UBoot64-v2/src/time.c"
.s4:
01:9e1d : a5 0d __ LDA P0 ; (option + 0)
01:9e1f : a4 0e __ LDY P1 ; (color + 0)
01:9e21 : c9 06 __ CMP #$06
01:9e23 : d0 04 __ BNE $9e29 ; (pushcolor.s5 + 0)
.s26:
01:9e25 : 8c 60 49 STY $4960 ; (cfg.colors.diritem_normal + 0)
.s3:
01:9e28 : 60 __ __ RTS
.s5:
01:9e29 : 90 2c __ BCC $9e57 ; (pushcolor.s16 + 0)
.s6:
01:9e2b : c9 09 __ CMP #$09
01:9e2d : d0 04 __ BNE $9e33 ; (pushcolor.s7 + 0)
.s15:
01:9e2f : 8c 63 49 STY $4963 ; (cfg.colors.ok + 0)
01:9e32 : 60 __ __ RTS
.s7:
01:9e33 : 90 16 __ BCC $9e4b ; (pushcolor.s12 + 0)
.s8:
01:9e35 : c9 0a __ CMP #$0a
01:9e37 : d0 07 __ BNE $9e40 ; (pushcolor.s9 + 0)
.s11:
01:9e39 : 8c 21 d0 STY $d021 
01:9e3c : 8c 59 49 STY $4959 ; (cfg.colors.background + 0)
01:9e3f : 60 __ __ RTS
.s9:
01:9e40 : c9 0b __ CMP #$0b
01:9e42 : d0 e4 __ BNE $9e28 ; (pushcolor.s3 + 0)
.s10:
01:9e44 : 8c 20 d0 STY $d020 
01:9e47 : 8c 5a 49 STY $495a ; (cfg.colors.border + 0)
01:9e4a : 60 __ __ RTS
.s12:
01:9e4b : c9 07 __ CMP #$07
01:9e4d : f0 04 __ BEQ $9e53 ; (pushcolor.s14 + 0)
.s13:
01:9e4f : 8c 62 49 STY $4962 ; (cfg.colors.error + 0)
01:9e52 : 60 __ __ RTS
.s14:
01:9e53 : 8c 61 49 STY $4961 ; (cfg.colors.diritem_select + 0)
01:9e56 : 60 __ __ RTS
.s16:
01:9e57 : c9 03 __ CMP #$03
01:9e59 : d0 04 __ BNE $9e5f ; (pushcolor.s17 + 0)
.s25:
01:9e5b : 8c 5d 49 STY $495d ; (cfg.colors.text + 0)
01:9e5e : 60 __ __ RTS
.s17:
01:9e5f : 90 0c __ BCC $9e6d ; (pushcolor.s21 + 0)
.s18:
01:9e61 : c9 04 __ CMP #$04
01:9e63 : f0 04 __ BEQ $9e69 ; (pushcolor.s20 + 0)
.s19:
01:9e65 : 8c 5f 49 STY $495f ; (cfg.colors.key + 0)
01:9e68 : 60 __ __ RTS
.s20:
01:9e69 : 8c 5e 49 STY $495e ; (cfg.colors.text_input + 0)
01:9e6c : 60 __ __ RTS
.s21:
01:9e6d : c9 01 __ CMP #$01
01:9e6f : d0 04 __ BNE $9e75 ; (pushcolor.s22 + 0)
.s24:
01:9e71 : 8c 5b 49 STY $495b ; (cfg.colors.header1 + 0)
01:9e74 : 60 __ __ RTS
.s22:
01:9e75 : c9 02 __ CMP #$02
01:9e77 : d0 af __ BNE $9e28 ; (pushcolor.s3 + 0)
.s23:
01:9e79 : 8c 5c 49 STY $495c ; (cfg.colors.header2 + 0)
01:9e7c : 60 __ __ RTS
--------------------------------------------------------------------
01:9e7d : __ __ __ BYT 00 11 00 1b 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:9e8d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:9e9d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
01:9ead : __ __ __ BYT 00 00 00                                        : ...
--------------------------------------------------------------------
month_days:
01:9eb0 : __ __ __ BYT 1f 1c 1f 1e 1f 1e 1f 1f 1e 1f 1e 1f             : ............
--------------------------------------------------------------------
01:9f00 : __ __ __ BYT 68 45 41 44 45 52 20 4c 49 4e 45 20 31 20 20 00 : hEADER LINE 1  .
01:9f10 : __ __ __ BYT 68 45 41 44 45 52 20 4c 49 4e 45 20 32 20 20 00 : hEADER LINE 2  .
01:9f20 : __ __ __ BYT 6e 4f 52 4d 41 4c 20 54 45 58 54 20 20 20 20 00 : nORMAL TEXT    .
01:9f30 : __ __ __ BYT 74 45 58 54 20 49 4e 50 55 54 20 20 20 20 20 00 : tEXT INPUT     .
01:9f40 : __ __ __ BYT 6b 45 59 20 54 45 58 54 20 20 20 20 20 20 20 00 : kEY TEXT       .
01:9f50 : __ __ __ BYT 64 49 52 20 49 54 45 4d 20 4e 4f 52 4d 41 4c 00 : dIR ITEM NORMAL.
01:9f60 : __ __ __ BYT 64 49 52 20 49 54 45 4d 20 53 45 4c 45 43 54 00 : dIR ITEM SELECT.
01:9f70 : __ __ __ BYT 65 52 52 4f 52 20 54 45 58 54 20 20 20 20 20 00 : eRROR TEXT     .
01:9f80 : __ __ __ BYT 6f 6b 20 54 45 58 54 20 20 20 20 20 20 20 20 00 : ok TEXT        .
01:9f90 : __ __ __ BYT 62 41 43 4b 47 52 4f 55 4e 44 20 20 20 20 20 00 : bACKGROUND     .
01:9fa0 : __ __ __ BYT 62 4f 52 44 45 52 20 20 20 20 20 20 20 20 20 00 : bORDER         .
--------------------------------------------------------------------
mainLoopBrowse: ; mainLoopBrowse()->void
;   4, "/home/xahmol/git/UBoot64-v2/src/filebrowse.h"
.s1:
02:8000 : a5 53 __ LDA T0 + 0 
02:8002 : 8d 44 7e STA $7e44 ; (mainLoopBrowse@stack + 0)
02:8005 : a5 54 __ LDA T0 + 1 
02:8007 : 8d 45 7e STA $7e45 ; (mainLoopBrowse@stack + 1)
02:800a : a5 55 __ LDA T1 + 0 
02:800c : 8d 46 7e STA $7e46 ; (mainLoopBrowse@stack + 2)
.s4:
02:800f : a9 01 __ LDA #$01
02:8011 : 8d 8a 3d STA $3d8a 
02:8014 : 8d bf 3d STA $3dbf 
02:8017 : 8d f7 4c STA $4cf7 ; (fb_uci_mode + 0)
02:801a : a9 02 __ LDA #$02
02:801c : 85 0f __ STA P2 
02:801e : a9 00 __ LDA #$00
02:8020 : 85 10 __ STA P3 
02:8022 : 8d c0 3d STA $3dc0 
02:8025 : 8d f6 4c STA $4cf6 ; (inside_mount + 0)
02:8028 : 8d be 3d STA $3dbe 
02:802b : 8d bd 3d STA $3dbd 
02:802e : 8d bc 3d STA $3dbc 
02:8031 : 8d bb 3d STA $3dbb 
02:8034 : 8d f5 4c STA $4cf5 ; (sorted + 0)
02:8037 : aa __ __ TAX
.l6:
02:8038 : 9d 68 53 STA $5368,x ; (presentdir.firstelement + 0)
02:803b : e8 __ __ INX
02:803c : d0 fa __ BNE $8038 ; (mainLoopBrowse.l6 + 0)
.s5:
02:803e : a2 19 __ LDX #$19
.l7:
02:8040 : ca __ __ DEX
02:8041 : 9d 68 54 STA $5468,x ; (presentdir.path[0] + 237)
02:8044 : d0 fa __ BNE $8040 ; (mainLoopBrowse.l7 + 0)
.s8:
02:8046 : 8d 81 54 STA $5481 ; (linebuffer2[0] + 0)
02:8049 : 8d 82 54 STA $5482 ; (linebuffer2[0] + 1)
02:804c : 8d 83 54 STA $5483 ; (linebuffer2[0] + 2)
02:804f : 8d 84 54 STA $5484 ; (linebuffer2[0] + 3)
02:8052 : 8d 85 54 STA $5485 ; (linebuffer2[0] + 4)
02:8055 : 8d 4a 7e STA $7e4a ; (cmd[0] + 0)
02:8058 : a9 17 __ LDA #$17
02:805a : 8d 4b 7e STA $7e4b ; (cmd[0] + 1)
02:805d : a9 4a __ LDA #$4a
02:805f : 85 0d __ STA P0 
02:8061 : a9 7e __ LDA #$7e
02:8063 : 85 0e __ STA P1 
02:8065 : 20 53 11 JSR $1153 
02:8068 : 20 0c 12 JSR $120c 
02:806b : 20 18 11 JSR $1118 
02:806e : 20 f1 84 JSR $84f1 ; (browse_updatescreen.s4 + 0)
.l9:
02:8071 : ad 74 53 LDA $5374 ; (presentdir.present + 0)
02:8074 : 8d fc 4c STA $4cfc ; (present + 0)
02:8077 : ad 75 53 LDA $5375 ; (presentdir.present + 1)
02:807a : 8d fd 4c STA $4cfd ; (present + 1)
02:807d : ad 76 53 LDA $5376 ; (presentdir.present + 2)
02:8080 : 8d fe 4c STA $4cfe ; (present + 2)
02:8083 : ad 77 53 LDA $5377 ; (presentdir.present + 3)
02:8086 : 8d ff 4c STA $4cff ; (present + 3)
02:8089 : d0 0f __ BNE $809a ; (mainLoopBrowse.s130 + 0)
.s131:
02:808b : ad 76 53 LDA $5376 ; (presentdir.present + 2)
02:808e : d0 0a __ BNE $809a ; (mainLoopBrowse.s130 + 0)
.s132:
02:8090 : ad 75 53 LDA $5375 ; (presentdir.present + 1)
02:8093 : d0 05 __ BNE $809a ; (mainLoopBrowse.s130 + 0)
.s133:
02:8095 : ad 74 53 LDA $5374 ; (presentdir.present + 0)
02:8098 : f0 17 __ BEQ $80b1 ; (mainLoopBrowse.s10 + 0)
.s130:
02:809a : ad 74 53 LDA $5374 ; (presentdir.present + 0)
02:809d : 85 0d __ STA P0 
02:809f : ad 75 53 LDA $5375 ; (presentdir.present + 1)
02:80a2 : 85 0e __ STA P1 
02:80a4 : ad 76 53 LDA $5376 ; (presentdir.present + 2)
02:80a7 : 85 0f __ STA P2 
02:80a9 : ad 77 53 LDA $5377 ; (presentdir.present + 3)
02:80ac : 85 10 __ STA P3 
02:80ae : 20 d2 93 JSR $93d2 ; (dir_get_element.s4 + 0)
.s10:
02:80b1 : 20 50 14 JSR $1450 
02:80b4 : a5 1b __ LDA ACCU + 0 
02:80b6 : c9 4d __ CMP #$4d
02:80b8 : d0 33 __ BNE $80ed ; (mainLoopBrowse.s11 + 0)
.s127:
02:80ba : ae be 3d LDX $3dbe 
02:80bd : ca __ __ DEX
02:80be : d0 b1 __ BNE $8071 ; (mainLoopBrowse.l9 + 0)
.s128:
02:80c0 : ad c1 3d LDA $3dc1 
02:80c3 : f0 ac __ BEQ $8071 ; (mainLoopBrowse.l9 + 0)
.s129:
02:80c5 : a9 97 __ LDA #$97
02:80c7 : 85 0d __ STA P0 
02:80c9 : a9 55 __ LDA #$55
02:80cb : 85 0e __ STA P1 
02:80cd : a9 00 __ LDA #$00
02:80cf : 85 0f __ STA P2 
02:80d1 : a9 55 __ LDA #$55
02:80d3 : 85 10 __ STA P3 
.s113:
02:80d5 : 20 e7 3a JSR $3ae7 
02:80d8 : a9 00 __ LDA #$00
02:80da : 8d c9 55 STA $55c9 ; (pathfile[0] + 50)
.s3:
02:80dd : ad 44 7e LDA $7e44 ; (mainLoopBrowse@stack + 0)
02:80e0 : 85 53 __ STA T0 + 0 
02:80e2 : ad 45 7e LDA $7e45 ; (mainLoopBrowse@stack + 1)
02:80e5 : 85 54 __ STA T0 + 1 
02:80e7 : ad 46 7e LDA $7e46 ; (mainLoopBrowse@stack + 2)
02:80ea : 85 55 __ STA T1 + 0 
02:80ec : 60 __ __ RTS
.s11:
02:80ed : b0 03 __ BCS $80f2 ; (mainLoopBrowse.s12 + 0)
02:80ef : 4c cd 82 JMP $82cd ; (mainLoopBrowse.s69 + 0)
.s12:
02:80f2 : c9 85 __ CMP #$85
02:80f4 : d0 03 __ BNE $80f9 ; (mainLoopBrowse.s13 + 0)
02:80f6 : 4c 20 82 JMP $8220 ; (mainLoopBrowse.s41 + 0)
.s13:
02:80f9 : b0 03 __ BCS $80fe ; (mainLoopBrowse.s14 + 0)
02:80fb : 4c 77 82 JMP $8277 ; (mainLoopBrowse.s55 + 0)
.s14:
02:80fe : c9 89 __ CMP #$89
02:8100 : d0 4e __ BNE $8150 ; (mainLoopBrowse.s15 + 0)
.s44:
02:8102 : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:8105 : f0 03 __ BEQ $810a ; (mainLoopBrowse.s45 + 0)
02:8107 : 4c 71 80 JMP $8071 ; (mainLoopBrowse.l9 + 0)
.s45:
02:810a : ad c2 3d LDA $3dc2 
02:810d : 85 43 __ STA T2 + 0 
02:810f : f0 f6 __ BEQ $8107 ; (mainLoopBrowse.s44 + 5)
.l46:
02:8111 : a6 43 __ LDX T2 + 0 
02:8113 : e8 __ __ INX
02:8114 : 8e c2 3d STX $3dc2 
02:8117 : e0 1f __ CPX #$1f
02:8119 : 90 05 __ BCC $8120 ; (mainLoopBrowse.s47 + 0)
.s54:
02:811b : a9 08 __ LDA #$08
02:811d : 8d c2 3d STA $3dc2 
.s47:
02:8120 : ae c2 3d LDX $3dc2 
02:8123 : 86 43 __ STX T2 + 0 
02:8125 : 86 13 __ STX P6 
02:8127 : bd 10 53 LDA $5310,x ; (Slot.padding[0] + 5)
02:812a : f0 e5 __ BEQ $8111 ; (mainLoopBrowse.l46 + 0)
.s48:
02:812c : bd 45 55 LDA $5545,x ; (devicetype[0] + 0)
02:812f : d0 03 __ BNE $8134 ; (mainLoopBrowse.s50 + 0)
.s49:
02:8131 : 20 64 30 JSR $3064 
.s50:
02:8134 : a9 01 __ LDA #$01
02:8136 : 8d f9 7f STA $7ff9 ; (sstack + 26)
02:8139 : a9 00 __ LDA #$00
02:813b : aa __ __ TAX
.l52:
02:813c : 9d 68 53 STA $5368,x ; (presentdir.firstelement + 0)
02:813f : e8 __ __ INX
02:8140 : d0 fa __ BNE $813c ; (mainLoopBrowse.l52 + 0)
.s51:
02:8142 : a2 19 __ LDX #$19
.l53:
02:8144 : ca __ __ DEX
02:8145 : 9d 68 54 STA $5468,x ; (presentdir.path[0] + 237)
02:8148 : d0 fa __ BNE $8144 ; (mainLoopBrowse.l53 + 0)
.s40:
02:814a : 20 07 85 JSR $8507 ; (dir_draw.s1 + 0)
02:814d : 4c 71 80 JMP $8071 ; (mainLoopBrowse.l9 + 0)
.s15:
02:8150 : b0 03 __ BCS $8155 ; (mainLoopBrowse.s16 + 0)
02:8152 : 4c d4 81 JMP $81d4 ; (mainLoopBrowse.s33 + 0)
.s16:
02:8155 : c9 91 __ CMP #$91
02:8157 : d0 06 __ BNE $815f ; (mainLoopBrowse.s17 + 0)
.s32:
02:8159 : 20 35 9e JSR $9e35 ; (dir_go_up.s1 + 0)
02:815c : 4c 71 80 JMP $8071 ; (mainLoopBrowse.l9 + 0)
.s17:
02:815f : c9 9d __ CMP #$9d
02:8161 : d0 f9 __ BNE $815c ; (mainLoopBrowse.s32 + 3)
.s18:
02:8163 : ad f6 4c LDA $4cf6 ; (inside_mount + 0)
02:8166 : f0 38 __ BEQ $81a0 ; (mainLoopBrowse.s19 + 0)
.s27:
02:8168 : ad bc 3d LDA $3dbc 
02:816b : d0 33 __ BNE $81a0 ; (mainLoopBrowse.s19 + 0)
.s28:
02:816d : 8d bb 3d STA $3dbb 
02:8170 : 8d f6 4c STA $4cf6 ; (inside_mount + 0)
02:8173 : a9 01 __ LDA #$01
02:8175 : 8d f7 4c STA $4cf7 ; (fb_uci_mode + 0)
02:8178 : 20 22 31 JSR $3122 
02:817b : a9 00 __ LDA #$00
02:817d : 8d c1 3d STA $3dc1 
02:8180 : 20 9e 2a JSR $2a9e 
02:8183 : a9 00 __ LDA #$00
02:8185 : 8d 09 dc STA $dc09 
02:8188 : 8d 08 dc STA $dc08 
.l29:
02:818b : ad 09 dc LDA $dc09 
02:818e : c9 02 __ CMP #$02
02:8190 : 90 f9 __ BCC $818b ; (mainLoopBrowse.l29 + 0)
.s30:
02:8192 : a9 01 __ LDA #$01
02:8194 : 8d f9 7f STA $7ff9 ; (sstack + 26)
02:8197 : 20 07 85 JSR $8507 ; (dir_draw.s1 + 0)
.s31:
02:819a : 20 0c 86 JSR $860c ; (browse_menu.s4 + 0)
02:819d : 4c 71 80 JMP $8071 ; (mainLoopBrowse.l9 + 0)
.s19:
02:81a0 : ae bb 3d LDX $3dbb 
02:81a3 : ca __ __ DEX
02:81a4 : d0 08 __ BNE $81ae ; (mainLoopBrowse.s20 + 0)
.s25:
02:81a6 : ad bc 3d LDA $3dbc 
02:81a9 : f0 03 __ BEQ $81ae ; (mainLoopBrowse.s20 + 0)
.s26:
02:81ab : ce bc 3d DEC $3dbc 
.s20:
02:81ae : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:81b1 : d0 11 __ BNE $81c4 ; (mainLoopBrowse.s134 + 0)
.s21:
02:81b3 : ae c2 3d LDX $3dc2 
02:81b6 : bd 45 55 LDA $5545,x ; (devicetype[0] + 0)
02:81b9 : c9 0e __ CMP #$0e
02:81bb : f0 07 __ BEQ $81c4 ; (mainLoopBrowse.s134 + 0)
.s22:
02:81bd : a9 a1 __ LDA #$a1
02:81bf : a2 1d __ LDX #$1d
02:81c1 : 4c c8 81 JMP $81c8 ; (mainLoopBrowse.s23 + 0)
.s134:
02:81c4 : a9 a1 __ LDA #$a1
02:81c6 : a2 1a __ LDX #$1a
.s23:
02:81c8 : 8e fa 7f STX $7ffa ; (sstack + 27)
02:81cb : 8d fb 7f STA $7ffb ; (sstack + 28)
.s24:
02:81ce : 20 be 96 JSR $96be ; (dir_changedir.s1 + 0)
02:81d1 : 4c 71 80 JMP $8071 ; (mainLoopBrowse.l9 + 0)
.s33:
02:81d4 : c9 86 __ CMP #$86
02:81d6 : f0 0c __ BEQ $81e4 ; (mainLoopBrowse.s36 + 0)
.s34:
02:81d8 : c9 88 __ CMP #$88
02:81da : d0 f5 __ BNE $81d1 ; (mainLoopBrowse.s24 + 3)
.s35:
02:81dc : a9 00 __ LDA #$00
02:81de : 8d bb 3d STA $3dbb 
02:81e1 : 4c dd 80 JMP $80dd ; (mainLoopBrowse.s3 + 0)
.s36:
02:81e4 : a9 00 __ LDA #$00
02:81e6 : 8d bc 3d STA $3dbc 
02:81e9 : 8d bb 3d STA $3dbb 
02:81ec : cd f7 4c CMP $4cf7 ; (fb_uci_mode + 0)
02:81ef : 2a __ __ ROL
02:81f0 : 85 55 __ STA T1 + 0 
02:81f2 : 8d f7 4c STA $4cf7 ; (fb_uci_mode + 0)
02:81f5 : ad f6 4c LDA $4cf6 ; (inside_mount + 0)
02:81f8 : f0 1f __ BEQ $8219 ; (mainLoopBrowse.s37 + 0)
.s42:
02:81fa : a9 00 __ LDA #$00
02:81fc : 8d f6 4c STA $4cf6 ; (inside_mount + 0)
02:81ff : 20 22 31 JSR $3122 
02:8202 : a9 00 __ LDA #$00
02:8204 : 8d c1 3d STA $3dc1 
02:8207 : 20 9e 2a JSR $2a9e 
02:820a : a9 00 __ LDA #$00
02:820c : 8d 09 dc STA $dc09 
02:820f : 8d 08 dc STA $dc08 
.l43:
02:8212 : ad 09 dc LDA $dc09 
02:8215 : c9 02 __ CMP #$02
02:8217 : 90 f9 __ BCC $8212 ; (mainLoopBrowse.l43 + 0)
.s37:
02:8219 : 20 0c 86 JSR $860c ; (browse_menu.s4 + 0)
02:821c : a5 55 __ LDA T1 + 0 
02:821e : f0 08 __ BEQ $8228 ; (mainLoopBrowse.s38 + 0)
.s41:
02:8220 : a9 01 __ LDA #$01
02:8222 : 8d f9 7f STA $7ff9 ; (sstack + 26)
02:8225 : 4c 4a 81 JMP $814a ; (mainLoopBrowse.s40 + 0)
.s38:
02:8228 : 20 d2 9c JSR $9cd2 ; (FindFirstIECDrive.s1 + 0)
02:822b : ad c2 3d LDA $3dc2 
02:822e : d0 a1 __ BNE $81d1 ; (mainLoopBrowse.s24 + 3)
.s39:
02:8230 : 85 0d __ STA P0 
02:8232 : a9 18 __ LDA #$18
02:8234 : 85 0f __ STA P2 
02:8236 : 20 06 3d JSR $3d06 
02:8239 : a9 00 __ LDA #$00
02:823b : 8d 68 49 STA $4968 ; (cw.cx + 0)
02:823e : a9 03 __ LDA #$03
02:8240 : 8d 69 49 STA $4969 ; (cw.cy + 0)
02:8243 : ad 62 49 LDA $4962 ; (cfg.colors.error + 0)
02:8246 : 85 18 __ STA P11 
02:8248 : a9 27 __ LDA #$27
02:824a : 8d e3 7f STA $7fe3 ; (sstack + 4)
02:824d : a9 9d __ LDA #$9d
02:824f : 8d e4 7f STA $7fe4 ; (sstack + 5)
02:8252 : 20 25 15 JSR $1525 
02:8255 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
02:8258 : 85 18 __ STA P11 
02:825a : a9 3f __ LDA #$3f
02:825c : 8d e3 7f STA $7fe3 ; (sstack + 4)
02:825f : a9 9d __ LDA #$9d
02:8261 : 8d e4 7f STA $7fe4 ; (sstack + 5)
02:8264 : 20 25 15 JSR $1525 
02:8267 : a9 01 __ LDA #$01
02:8269 : 8d f9 7f STA $7ff9 ; (sstack + 26)
02:826c : 20 50 14 JSR $1450 
02:826f : a9 01 __ LDA #$01
02:8271 : 8d f7 4c STA $4cf7 ; (fb_uci_mode + 0)
02:8274 : 4c 4a 81 JMP $814a ; (mainLoopBrowse.s40 + 0)
.s55:
02:8277 : c9 54 __ CMP #$54
02:8279 : d0 06 __ BNE $8281 ; (mainLoopBrowse.s56 + 0)
.s68:
02:827b : 20 81 9f JSR $9f81 ; (dir_top.s4 + 0)
02:827e : 4c 71 80 JMP $8071 ; (mainLoopBrowse.l9 + 0)
.s56:
02:8281 : 90 27 __ BCC $82aa ; (mainLoopBrowse.s62 + 0)
.s57:
02:8283 : c9 55 __ CMP #$55
02:8285 : d0 06 __ BNE $828d ; (mainLoopBrowse.s58 + 0)
.s61:
02:8287 : 20 0f 9c JSR $9c0f ; (dir_pageup.s1 + 0)
02:828a : 4c 71 80 JMP $8071 ; (mainLoopBrowse.l9 + 0)
.s58:
02:828d : c9 5e __ CMP #$5e
02:828f : d0 f9 __ BNE $828a ; (mainLoopBrowse.s61 + 3)
.s59:
02:8291 : a9 fe __ LDA #$fe
02:8293 : 8d fa 7f STA $7ffa ; (sstack + 27)
02:8296 : a9 85 __ LDA #$85
02:8298 : 8d fb 7f STA $7ffb ; (sstack + 28)
02:829b : ae bb 3d LDX $3dbb 
02:829e : ca __ __ DEX
02:829f : f0 03 __ BEQ $82a4 ; (mainLoopBrowse.s60 + 0)
02:82a1 : 4c ce 81 JMP $81ce ; (mainLoopBrowse.s24 + 0)
.s60:
02:82a4 : 8e bc 3d STX $3dbc 
02:82a7 : 4c ce 81 JMP $81ce ; (mainLoopBrowse.s24 + 0)
.s62:
02:82aa : c9 50 __ CMP #$50
02:82ac : d0 06 __ BNE $82b4 ; (mainLoopBrowse.s63 + 0)
.s67:
02:82ae : 20 74 9a JSR $9a74 ; (dir_pagedown.s1 + 0)
02:82b1 : 4c 71 80 JMP $8071 ; (mainLoopBrowse.l9 + 0)
.s63:
02:82b4 : b0 10 __ BCS $82c6 ; (mainLoopBrowse.s64 + 0)
.s65:
02:82b6 : c9 4f __ CMP #$4f
02:82b8 : d0 f7 __ BNE $82b1 ; (mainLoopBrowse.s67 + 3)
.s66:
02:82ba : a9 00 __ LDA #$00
02:82bc : cd c0 3d CMP $3dc0 
02:82bf : 2a __ __ ROL
02:82c0 : 8d c0 3d STA $3dc0 
02:82c3 : 4c 9a 81 JMP $819a ; (mainLoopBrowse.s31 + 0)
.s64:
02:82c6 : c9 51 __ CMP #$51
02:82c8 : d0 e7 __ BNE $82b1 ; (mainLoopBrowse.s67 + 3)
02:82ca : 4c dc 81 JMP $81dc ; (mainLoopBrowse.s35 + 0)
.s69:
02:82cd : c9 2d __ CMP #$2d
02:82cf : d0 26 __ BNE $82f7 ; (mainLoopBrowse.s70 + 0)
.s122:
02:82d1 : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:82d4 : d0 db __ BNE $82b1 ; (mainLoopBrowse.s67 + 3)
.s123:
02:82d6 : ad c2 3d LDA $3dc2 
02:82d9 : 85 43 __ STA T2 + 0 
02:82db : f0 d4 __ BEQ $82b1 ; (mainLoopBrowse.s67 + 3)
.l124:
02:82dd : c6 43 __ DEC T2 + 0 
02:82df : a5 43 __ LDA T2 + 0 
02:82e1 : c9 08 __ CMP #$08
02:82e3 : b0 02 __ BCS $82e7 ; (mainLoopBrowse.s125 + 0)
.s126:
02:82e5 : a9 1e __ LDA #$1e
.s125:
02:82e7 : 8d c2 3d STA $3dc2 
02:82ea : 85 43 __ STA T2 + 0 
02:82ec : 85 13 __ STA P6 
02:82ee : aa __ __ TAX
02:82ef : bd 10 53 LDA $5310,x ; (Slot.padding[0] + 5)
02:82f2 : f0 e9 __ BEQ $82dd ; (mainLoopBrowse.l124 + 0)
02:82f4 : 4c 2c 81 JMP $812c ; (mainLoopBrowse.s48 + 0)
.s70:
02:82f7 : 90 03 __ BCC $82fc ; (mainLoopBrowse.s95 + 0)
02:82f9 : 4c f6 83 JMP $83f6 ; (mainLoopBrowse.s71 + 0)
.s95:
02:82fc : c9 14 __ CMP #$14
02:82fe : d0 03 __ BNE $8303 ; (mainLoopBrowse.s96 + 0)
02:8300 : 4c 63 81 JMP $8163 ; (mainLoopBrowse.s18 + 0)
.s96:
02:8303 : b0 03 __ BCS $8308 ; (mainLoopBrowse.s97 + 0)
02:8305 : 4c dc 83 JMP $83dc ; (mainLoopBrowse.s117 + 0)
.s97:
02:8308 : c9 1d __ CMP #$1d
02:830a : f0 07 __ BEQ $8313 ; (mainLoopBrowse.s99 + 0)
.s98:
02:830c : c9 2b __ CMP #$2b
02:830e : d0 a1 __ BNE $82b1 ; (mainLoopBrowse.s67 + 3)
02:8310 : 4c 02 81 JMP $8102 ; (mainLoopBrowse.s44 + 0)
.s99:
02:8313 : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:8316 : d0 63 __ BNE $837b ; (mainLoopBrowse.s101 + 0)
.s100:
02:8318 : ad 6b 53 LDA $536b ; (presentdir.firstelement + 3)
02:831b : d0 0f __ BNE $832c ; (mainLoopBrowse.s109 + 0)
.s114:
02:831d : ad 6a 53 LDA $536a ; (presentdir.firstelement + 2)
02:8320 : d0 0a __ BNE $832c ; (mainLoopBrowse.s109 + 0)
.s115:
02:8322 : ad 69 53 LDA $5369 ; (presentdir.firstelement + 1)
02:8325 : d0 05 __ BNE $832c ; (mainLoopBrowse.s109 + 0)
.s116:
02:8327 : ad 68 53 LDA $5368 ; (presentdir.firstelement + 0)
02:832a : f0 4f __ BEQ $837b ; (mainLoopBrowse.s101 + 0)
.s109:
02:832c : ad 3b 55 LDA $553b ; (presentdirelement.meta.type + 0)
02:832f : c9 11 __ CMP #$11
02:8331 : d0 48 __ BNE $837b ; (mainLoopBrowse.s101 + 0)
.s110:
02:8333 : ad bb 3d LDA $3dbb 
02:8336 : f0 13 __ BEQ $834b ; (mainLoopBrowse.s111 + 0)
.s112:
02:8338 : a9 00 __ LDA #$00
02:833a : 85 0f __ STA P2 
02:833c : a9 55 __ LDA #$55
02:833e : 85 10 __ STA P3 
02:8340 : a9 97 __ LDA #$97
02:8342 : 85 0d __ STA P0 
02:8344 : a9 55 __ LDA #$55
02:8346 : 85 0e __ STA P1 
02:8348 : 4c d5 80 JMP $80d5 ; (mainLoopBrowse.s113 + 0)
.s111:
02:834b : a9 00 __ LDA #$00
02:834d : 8d f9 7f STA $7ff9 ; (sstack + 26)
02:8350 : a9 55 __ LDA #$55
02:8352 : 8d fa 7f STA $7ffa ; (sstack + 27)
02:8355 : ad c2 3d LDA $3dc2 
02:8358 : 8d fb 7f STA $7ffb ; (sstack + 28)
02:835b : ad bf 3d LDA $3dbf 
02:835e : 0a __ __ ASL
02:835f : 85 53 __ STA T0 + 0 
02:8361 : ad c0 3d LDA $3dc0 
02:8364 : 0a __ __ ASL
02:8365 : 0a __ __ ASL
02:8366 : 0a __ __ ASL
02:8367 : 0a __ __ ASL
02:8368 : 18 __ __ CLC
02:8369 : 65 53 __ ADC T0 + 0 
02:836b : 8d fc 7f STA $7ffc ; (sstack + 29)
02:836e : a9 fe __ LDA #$fe
02:8370 : 8d fd 7f STA $7ffd ; (sstack + 30)
02:8373 : a9 85 __ LDA #$85
02:8375 : 8d fe 7f STA $7ffe ; (sstack + 31)
02:8378 : 20 c3 2b JSR $2bc3 
.s101:
02:837b : ad 6b 53 LDA $536b ; (presentdir.firstelement + 3)
02:837e : d0 0f __ BNE $838f ; (mainLoopBrowse.s103 + 0)
.s106:
02:8380 : ad 6a 53 LDA $536a ; (presentdir.firstelement + 2)
02:8383 : d0 0a __ BNE $838f ; (mainLoopBrowse.s103 + 0)
.s107:
02:8385 : ad 69 53 LDA $5369 ; (presentdir.firstelement + 1)
02:8388 : d0 05 __ BNE $838f ; (mainLoopBrowse.s103 + 0)
.s108:
02:838a : ad 68 53 LDA $5368 ; (presentdir.firstelement + 0)
02:838d : f0 42 __ BEQ $83d1 ; (mainLoopBrowse.s102 + 0)
.s103:
02:838f : ae bb 3d LDX $3dbb 
02:8392 : ca __ __ DEX
02:8393 : d0 2f __ BNE $83c4 ; (mainLoopBrowse.s104 + 0)
.s105:
02:8395 : a9 00 __ LDA #$00
02:8397 : ae bc 3d LDX $3dbc 
02:839a : 18 __ __ CLC
02:839b : 7d 9f 3a ADC $3a9f,x 
02:839e : 85 53 __ STA T0 + 0 
02:83a0 : 85 0d __ STA P0 
02:83a2 : a9 00 __ LDA #$00
02:83a4 : 85 0f __ STA P2 
02:83a6 : a9 55 __ LDA #$55
02:83a8 : 85 10 __ STA P3 
02:83aa : a9 33 __ LDA #$33
02:83ac : 85 11 __ STA P4 
02:83ae : a9 00 __ LDA #$00
02:83b0 : 85 12 __ STA P5 
02:83b2 : a9 57 __ LDA #$57
02:83b4 : 7d a7 3a ADC $3aa7,x 
02:83b7 : 85 54 __ STA T0 + 1 
02:83b9 : 85 0e __ STA P1 
02:83bb : 20 c9 23 JSR $23c9 
02:83be : a9 00 __ LDA #$00
02:83c0 : a0 32 __ LDY #$32
02:83c2 : 91 53 __ STA (T0 + 0),y 
.s104:
02:83c4 : a9 00 __ LDA #$00
02:83c6 : 8d fa 7f STA $7ffa ; (sstack + 27)
02:83c9 : a9 55 __ LDA #$55
02:83cb : 8d fb 7f STA $7ffb ; (sstack + 28)
02:83ce : 20 be 96 JSR $96be ; (dir_changedir.s1 + 0)
.s102:
02:83d1 : ad bd 3d LDA $3dbd 
02:83d4 : f0 03 __ BEQ $83d9 ; (mainLoopBrowse.s102 + 8)
02:83d6 : 4c dd 80 JMP $80dd ; (mainLoopBrowse.s3 + 0)
02:83d9 : 4c 71 80 JMP $8071 ; (mainLoopBrowse.l9 + 0)
.s117:
02:83dc : c9 11 __ CMP #$11
02:83de : d0 06 __ BNE $83e6 ; (mainLoopBrowse.s118 + 0)
.s121:
02:83e0 : 20 4a 9d JSR $9d4a ; (dir_go_down.s1 + 0)
02:83e3 : 4c 71 80 JMP $8071 ; (mainLoopBrowse.l9 + 0)
.s118:
02:83e6 : b0 07 __ BCS $83ef ; (mainLoopBrowse.s119 + 0)
.s120:
02:83e8 : c9 0d __ CMP #$0d
02:83ea : d0 f7 __ BNE $83e3 ; (mainLoopBrowse.s121 + 3)
02:83ec : 4c 13 83 JMP $8313 ; (mainLoopBrowse.s99 + 0)
.s119:
02:83ef : c9 13 __ CMP #$13
02:83f1 : d0 f0 __ BNE $83e3 ; (mainLoopBrowse.s121 + 3)
02:83f3 : 4c 7b 82 JMP $827b ; (mainLoopBrowse.s68 + 0)
.s71:
02:83f6 : c9 42 __ CMP #$42
02:83f8 : d0 4b __ BNE $8445 ; (mainLoopBrowse.s72 + 0)
.s90:
02:83fa : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:83fd : f0 e4 __ BEQ $83e3 ; (mainLoopBrowse.s121 + 3)
.s91:
02:83ff : 20 23 99 JSR $9923 ; (CheckMounttype@proxy + 0)
02:8402 : ae be 3d LDX $3dbe 
02:8405 : ca __ __ DEX
02:8406 : d0 db __ BNE $83e3 ; (mainLoopBrowse.s121 + 3)
.s92:
02:8408 : 20 35 26 JSR $2635 
02:840b : a5 1b __ LDA ACCU + 0 
02:840d : d0 10 __ BNE $841f ; (mainLoopBrowse.s94 + 0)
.s93:
02:840f : 20 f6 0d JSR $0df6 
02:8412 : a9 3b __ LDA #$3b
02:8414 : 8d eb 7f STA $7feb ; (sstack + 12)
02:8417 : a9 9a __ LDA #$9a
02:8419 : 8d ec 7f STA $7fec ; (sstack + 13)
02:841c : 20 01 15 JSR $1501 
.s94:
02:841f : a9 40 __ LDA #$40
02:8421 : 85 0e __ STA P1 
02:8423 : a9 33 __ LDA #$33
02:8425 : 85 0d __ STA P0 
02:8427 : 20 c1 3a JSR $3ac1 
02:842a : a9 00 __ LDA #$00
02:842c : 8d 65 40 STA $4065 
02:842f : 20 c1 2e JSR $2ec1 
02:8432 : a9 49 __ LDA #$49
02:8434 : 85 10 __ STA P3 
02:8436 : a9 d6 __ LDA #$d6
02:8438 : 85 0f __ STA P2 
02:843a : 20 d4 3a JSR $3ad4 
02:843d : a9 00 __ LDA #$00
02:843f : 8d ff 3e STA $3eff 
02:8442 : 4c dd 80 JMP $80dd ; (mainLoopBrowse.s3 + 0)
.s72:
02:8445 : b0 69 __ BCS $84b0 ; (mainLoopBrowse.s73 + 0)
.s80:
02:8447 : c9 32 __ CMP #$32
02:8449 : d0 03 __ BNE $844e ; (mainLoopBrowse.s81 + 0)
02:844b : 4c 02 81 JMP $8102 ; (mainLoopBrowse.s44 + 0)
.s81:
02:844e : b0 10 __ BCS $8460 ; (mainLoopBrowse.s82 + 0)
.s88:
02:8450 : c9 31 __ CMP #$31
02:8452 : d0 8f __ BNE $83e3 ; (mainLoopBrowse.s121 + 3)
.s89:
02:8454 : a9 00 __ LDA #$00
02:8456 : cd bf 3d CMP $3dbf 
02:8459 : 2a __ __ ROL
02:845a : 8d bf 3d STA $3dbf 
02:845d : 4c 9a 81 JMP $819a ; (mainLoopBrowse.s31 + 0)
.s82:
02:8460 : c9 41 __ CMP #$41
02:8462 : f0 03 __ BEQ $8467 ; (mainLoopBrowse.s83 + 0)
02:8464 : 4c 71 80 JMP $8071 ; (mainLoopBrowse.l9 + 0)
.s83:
02:8467 : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:846a : f0 f8 __ BEQ $8464 ; (mainLoopBrowse.s82 + 4)
.s84:
02:846c : 20 23 99 JSR $9923 ; (CheckMounttype@proxy + 0)
02:846f : ae be 3d LDX $3dbe 
02:8472 : ca __ __ DEX
02:8473 : d0 ef __ BNE $8464 ; (mainLoopBrowse.s82 + 4)
.s85:
02:8475 : 20 35 26 JSR $2635 
02:8478 : a5 1b __ LDA ACCU + 0 
02:847a : d0 10 __ BNE $848c ; (mainLoopBrowse.s87 + 0)
.s86:
02:847c : 20 f6 0d JSR $0df6 
02:847f : a9 3b __ LDA #$3b
02:8481 : 8d eb 7f STA $7feb ; (sstack + 12)
02:8484 : a9 9a __ LDA #$9a
02:8486 : 8d ec 7f STA $7fec ; (sstack + 13)
02:8489 : 20 01 15 JSR $1501 
.s87:
02:848c : ad e7 4c LDA $4ce7 ; (uii_devinfo[0].id + 0)
02:848f : 8d c1 3d STA $3dc1 
02:8492 : a9 00 __ LDA #$00
02:8494 : 85 0d __ STA P0 
02:8496 : a9 40 __ LDA #$40
02:8498 : 85 0e __ STA P1 
02:849a : 20 c1 3a JSR $3ac1 
02:849d : a9 00 __ LDA #$00
02:849f : 8d 32 40 STA $4032 
02:84a2 : 20 c1 2e JSR $2ec1 
02:84a5 : 20 fd 3a JSR $3afd 
02:84a8 : a9 00 __ LDA #$00
02:84aa : 8d ff 3f STA $3fff 
02:84ad : 4c dd 80 JMP $80dd ; (mainLoopBrowse.s3 + 0)
.s73:
02:84b0 : c9 44 __ CMP #$44
02:84b2 : d0 30 __ BNE $84e4 ; (mainLoopBrowse.s74 + 0)
.s76:
02:84b4 : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:84b7 : d0 ab __ BNE $8464 ; (mainLoopBrowse.s82 + 4)
.s77:
02:84b9 : ad bb 3d LDA $3dbb 
02:84bc : f0 0b __ BEQ $84c9 ; (mainLoopBrowse.s78 + 0)
.s79:
02:84be : a9 00 __ LDA #$00
02:84c0 : 8d bc 3d STA $3dbc 
02:84c3 : 8d bb 3d STA $3dbb 
02:84c6 : 4c 92 81 JMP $8192 ; (mainLoopBrowse.s30 + 0)
.s78:
02:84c9 : a9 01 __ LDA #$01
02:84cb : 8d bb 3d STA $3dbb 
02:84ce : ad c2 3d LDA $3dc2 
02:84d1 : 8d 67 53 STA $5367 ; (pathdevice + 0)
02:84d4 : a9 fe __ LDA #$fe
02:84d6 : 8d fa 7f STA $7ffa ; (sstack + 27)
02:84d9 : a9 85 __ LDA #$85
02:84db : 8d fb 7f STA $7ffb ; (sstack + 28)
02:84de : 20 be 96 JSR $96be ; (dir_changedir.s1 + 0)
02:84e1 : 4c 92 81 JMP $8192 ; (mainLoopBrowse.s30 + 0)
.s74:
02:84e4 : c9 45 __ CMP #$45
02:84e6 : f0 03 __ BEQ $84eb ; (mainLoopBrowse.s75 + 0)
02:84e8 : 4c 71 80 JMP $8071 ; (mainLoopBrowse.l9 + 0)
.s75:
02:84eb : 20 e7 9f JSR $9fe7 ; (dir_bottom.s1 + 0)
02:84ee : 4c 71 80 JMP $8071 ; (mainLoopBrowse.l9 + 0)
--------------------------------------------------------------------
browse_updatescreen: ; browse_updatescreen()->void
;1139, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s4:
02:84f1 : 20 f2 0d JSR $0df2 
02:84f4 : a9 00 __ LDA #$00
02:84f6 : 85 14 __ STA P7 
02:84f8 : a9 86 __ LDA #$86
02:84fa : 85 15 __ STA P8 
02:84fc : 20 9a 0e JSR $0e9a 
02:84ff : 20 0c 86 JSR $860c ; (browse_menu.s4 + 0)
02:8502 : a9 01 __ LDA #$01
02:8504 : 8d f9 7f STA $7ff9 ; (sstack + 26)
--------------------------------------------------------------------
dir_draw: ; dir_draw(u8)->void
; 893, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s1:
02:8507 : a2 04 __ LDX #$04
02:8509 : b5 53 __ LDA T0 + 0,x 
02:850b : 9d 54 7e STA $7e54,x ; (dir_draw@stack + 0)
02:850e : ca __ __ DEX
02:850f : 10 f8 __ BPL $8509 ; (dir_draw.s1 + 2)
.s4:
02:8511 : a9 00 __ LDA #$00
02:8513 : 85 57 __ STA T3 + 0 
02:8515 : ad f9 7f LDA $7ff9 ; (sstack + 26)
02:8518 : f0 1b __ BEQ $8535 ; (dir_draw.s5 + 0)
.s13:
02:851a : 20 24 89 JSR $8924 ; (dir_read@proxy + 0)
02:851d : ad 6c 53 LDA $536c ; (presentdir.firstprint + 0)
02:8520 : 8d 74 53 STA $5374 ; (presentdir.present + 0)
02:8523 : ad 6d 53 LDA $536d ; (presentdir.firstprint + 1)
02:8526 : 8d 75 53 STA $5375 ; (presentdir.present + 1)
02:8529 : ad 6e 53 LDA $536e ; (presentdir.firstprint + 2)
02:852c : 8d 76 53 STA $5376 ; (presentdir.present + 2)
02:852f : ad 6f 53 LDA $536f ; (presentdir.firstprint + 3)
02:8532 : 8d 77 53 STA $5377 ; (presentdir.present + 3)
.s5:
02:8535 : 20 31 94 JSR $9431 ; (dir_print_id_and_path.s4 + 0)
02:8538 : ad 6d 53 LDA $536d ; (presentdir.firstprint + 1)
02:853b : 85 54 __ STA T0 + 1 
02:853d : ad 6e 53 LDA $536e ; (presentdir.firstprint + 2)
02:8540 : 85 55 __ STA T0 + 2 
02:8542 : ad 6f 53 LDA $536f ; (presentdir.firstprint + 3)
02:8545 : 85 56 __ STA T0 + 3 
02:8547 : ad 6c 53 LDA $536c ; (presentdir.firstprint + 0)
02:854a : 85 53 __ STA T0 + 0 
02:854c : 05 54 __ ORA T0 + 1 
02:854e : 05 55 __ ORA T0 + 2 
02:8550 : 05 56 __ ORA T0 + 3 
02:8552 : d0 19 __ BNE $856d ; (dir_draw.l7 + 0)
.s6:
02:8554 : 85 0d __ STA P0 
02:8556 : ad 62 49 LDA $4962 ; (cfg.colors.error + 0)
02:8559 : 85 11 __ STA P4 
02:855b : a9 05 __ LDA #$05
02:855d : 85 0e __ STA P1 
02:855f : a9 70 __ LDA #$70
02:8561 : 85 0f __ STA P2 
02:8563 : a9 95 __ LDA #$95
02:8565 : 85 10 __ STA P3 
02:8567 : 20 8f 12 JSR $128f 
02:856a : 4c f3 85 JMP $85f3 ; (dir_draw.s3 + 0)
.l7:
02:856d : a5 53 __ LDA T0 + 0 
02:856f : 85 0d __ STA P0 
02:8571 : a5 54 __ LDA T0 + 1 
02:8573 : 85 0e __ STA P1 
02:8575 : a5 55 __ LDA T0 + 2 
02:8577 : 85 0f __ STA P2 
02:8579 : a5 56 __ LDA T0 + 3 
02:857b : 85 10 __ STA P3 
02:857d : 20 d2 93 JSR $93d2 ; (dir_get_element.s4 + 0)
02:8580 : 20 81 95 JSR $9581 ; (dir_print_entry@proxy + 0)
02:8583 : a5 53 __ LDA T0 + 0 
02:8585 : 8d 70 53 STA $5370 ; (presentdir.lastprint + 0)
02:8588 : a5 54 __ LDA T0 + 1 
02:858a : 8d 71 53 STA $5371 ; (presentdir.lastprint + 1)
02:858d : a5 55 __ LDA T0 + 2 
02:858f : 8d 72 53 STA $5372 ; (presentdir.lastprint + 2)
02:8592 : a5 56 __ LDA T0 + 3 
02:8594 : 8d 73 53 STA $5373 ; (presentdir.lastprint + 3)
02:8597 : ad 7a 53 LDA $537a ; (presentdir.position + 1)
02:859a : d0 1b __ BNE $85b7 ; (dir_draw.s8 + 0)
.s12:
02:859c : a5 18 __ LDA P11 
02:859e : cd 79 53 CMP $5379 ; (presentdir.position + 0)
02:85a1 : d0 14 __ BNE $85b7 ; (dir_draw.s8 + 0)
.s11:
02:85a3 : a5 53 __ LDA T0 + 0 
02:85a5 : 8d 74 53 STA $5374 ; (presentdir.present + 0)
02:85a8 : a5 54 __ LDA T0 + 1 
02:85aa : 8d 75 53 STA $5375 ; (presentdir.present + 1)
02:85ad : a5 55 __ LDA T0 + 2 
02:85af : 8d 76 53 STA $5376 ; (presentdir.present + 2)
02:85b2 : a5 56 __ LDA T0 + 3 
02:85b4 : 8d 77 53 STA $5377 ; (presentdir.present + 3)
.s8:
02:85b7 : ad 34 55 LDA $5534 ; (presentdirelement.meta.next + 1)
02:85ba : 85 54 __ STA T0 + 1 
02:85bc : ad 35 55 LDA $5535 ; (presentdirelement.meta.next + 2)
02:85bf : 85 55 __ STA T0 + 2 
02:85c1 : ad 36 55 LDA $5536 ; (presentdirelement.meta.next + 3)
02:85c4 : 85 56 __ STA T0 + 3 
02:85c6 : ad 33 55 LDA $5533 ; (presentdirelement.meta.next + 0)
02:85c9 : 85 53 __ STA T0 + 0 
02:85cb : 05 54 __ ORA T0 + 1 
02:85cd : 05 55 __ ORA T0 + 2 
02:85cf : 05 56 __ ORA T0 + 3 
02:85d1 : f0 08 __ BEQ $85db ; (dir_draw.s9 + 0)
.s10:
02:85d3 : e6 57 __ INC T3 + 0 
02:85d5 : a5 57 __ LDA T3 + 0 
02:85d7 : c9 13 __ CMP #$13
02:85d9 : 90 92 __ BCC $856d ; (dir_draw.l7 + 0)
.s9:
02:85db : ad 74 53 LDA $5374 ; (presentdir.present + 0)
02:85de : 8d fc 4c STA $4cfc ; (present + 0)
02:85e1 : ad 75 53 LDA $5375 ; (presentdir.present + 1)
02:85e4 : 8d fd 4c STA $4cfd ; (present + 1)
02:85e7 : ad 76 53 LDA $5376 ; (presentdir.present + 2)
02:85ea : 8d fe 4c STA $4cfe ; (present + 2)
02:85ed : ad 77 53 LDA $5377 ; (presentdir.present + 3)
02:85f0 : 8d ff 4c STA $4cff ; (present + 3)
.s3:
02:85f3 : a2 04 __ LDX #$04
02:85f5 : bd 54 7e LDA $7e54,x ; (dir_draw@stack + 0)
02:85f8 : 95 53 __ STA T0 + 0,x 
02:85fa : ca __ __ DEX
02:85fb : 10 f8 __ BPL $85f5 ; (dir_draw.s3 + 2)
02:85fd : 60 __ __ RTS
--------------------------------------------------------------------
02:85fe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
02:8600 : __ __ __ BYT 66 49 4c 45 42 52 4f 57 53 45 52 00             : fILEBROWSER.
--------------------------------------------------------------------
browse_menu: ; browse_menu()->void
; 948, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s4:
02:860c : a9 19 __ LDA #$19
02:860e : 85 0d __ STA P0 
02:8610 : a9 0f __ LDA #$0f
02:8612 : 85 0f __ STA P2 
02:8614 : 20 06 3d JSR $3d06 
02:8617 : e6 0d __ INC P0 
02:8619 : a9 e2 __ LDA #$e2
02:861b : 85 0f __ STA P2 
02:861d : a9 87 __ LDA #$87
02:861f : 85 10 __ STA P3 
02:8621 : 20 ab 3b JSR $3bab 
02:8624 : e6 0e __ INC P1 
02:8626 : a9 f0 __ LDA #$f0
02:8628 : 85 0f __ STA P2 
02:862a : a9 87 __ LDA #$87
02:862c : 85 10 __ STA P3 
02:862e : 20 ab 3b JSR $3bab 
02:8631 : e6 0e __ INC P1 
02:8633 : a2 0b __ LDX #$0b
02:8635 : 86 4e __ STX T3 + 0 
02:8637 : a9 07 __ LDA #$07
02:8639 : 85 4c __ STA T1 + 0 
02:863b : a9 09 __ LDA #$09
02:863d : 85 4d __ STA T2 + 0 
02:863f : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:8642 : f0 12 __ BEQ $8656 ; (browse_menu.s5 + 0)
.s24:
02:8644 : a9 04 __ LDA #$04
02:8646 : 85 4f __ STA T5 + 0 
02:8648 : a9 06 __ LDA #$06
02:864a : 85 50 __ STA T6 + 0 
02:864c : a9 08 __ LDA #$08
02:864e : 85 51 __ STA T7 + 0 
02:8650 : a9 0a __ LDA #$0a
02:8652 : 85 52 __ STA T8 + 0 
02:8654 : d0 26 __ BNE $867c ; (browse_menu.s6 + 0)
.s5:
02:8656 : 86 52 __ STX T8 + 0 
02:8658 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
02:865b : 85 11 __ STA P4 
02:865d : a9 09 __ LDA #$09
02:865f : 85 51 __ STA T7 + 0 
02:8661 : a9 07 __ LDA #$07
02:8663 : 85 50 __ STA T6 + 0 
02:8665 : a9 00 __ LDA #$00
02:8667 : 85 0f __ STA P2 
02:8669 : a9 88 __ LDA #$88
02:866b : 85 10 __ STA P3 
02:866d : 20 8f 12 JSR $128f 
02:8670 : e6 0e __ INC P1 
02:8672 : e6 4c __ INC T1 + 0 
02:8674 : a9 05 __ LDA #$05
02:8676 : 85 4f __ STA T5 + 0 
02:8678 : e6 4d __ INC T2 + 0 
02:867a : e6 4e __ INC T3 + 0 
.s6:
02:867c : a9 0b __ LDA #$0b
02:867e : 85 0f __ STA P2 
02:8680 : a9 88 __ LDA #$88
02:8682 : 85 10 __ STA P3 
02:8684 : 20 ab 3b JSR $3bab 
02:8687 : a5 50 __ LDA T6 + 0 
02:8689 : 85 0e __ STA P1 
02:868b : a9 1a __ LDA #$1a
02:868d : 85 0f __ STA P2 
02:868f : a9 88 __ LDA #$88
02:8691 : 85 10 __ STA P3 
02:8693 : 20 ab 3b JSR $3bab 
02:8696 : a9 25 __ LDA #$25
02:8698 : 85 0f __ STA P2 
02:869a : a9 88 __ LDA #$88
02:869c : 85 10 __ STA P3 
02:869e : 20 03 3c JSR $3c03 
02:86a1 : a5 51 __ LDA T7 + 0 
02:86a3 : 85 0e __ STA P1 
02:86a5 : a9 32 __ LDA #$32
02:86a7 : 85 0f __ STA P2 
02:86a9 : a9 88 __ LDA #$88
02:86ab : 85 10 __ STA P3 
02:86ad : 20 ab 3b JSR $3bab 
02:86b0 : a5 4d __ LDA T2 + 0 
02:86b2 : 85 0e __ STA P1 
02:86b4 : a9 3a __ LDA #$3a
02:86b6 : 85 0f __ STA P2 
02:86b8 : a9 88 __ LDA #$88
02:86ba : 85 10 __ STA P3 
02:86bc : 20 ab 3b JSR $3bab 
02:86bf : a5 52 __ LDA T8 + 0 
02:86c1 : 85 0e __ STA P1 
02:86c3 : a9 42 __ LDA #$42
02:86c5 : 85 0f __ STA P2 
02:86c7 : a9 88 __ LDA #$88
02:86c9 : 85 10 __ STA P3 
02:86cb : 20 ab 3b JSR $3bab 
02:86ce : a5 4e __ LDA T3 + 0 
02:86d0 : 85 0e __ STA P1 
02:86d2 : a9 51 __ LDA #$51
02:86d4 : 85 0f __ STA P2 
02:86d6 : a9 88 __ LDA #$88
02:86d8 : 85 10 __ STA P3 
02:86da : 20 ab 3b JSR $3bab 
02:86dd : a5 4f __ LDA T5 + 0 
02:86df : 09 08 __ ORA #$08
02:86e1 : 85 4f __ STA T5 + 0 
02:86e3 : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:86e6 : d0 07 __ BNE $86ef ; (browse_menu.s23 + 0)
.s7:
02:86e8 : a9 88 __ LDA #$88
02:86ea : a0 5e __ LDY #$5e
02:86ec : 4c 00 87 JMP $8700 ; (browse_menu.s8 + 0)
.s23:
02:86ef : a9 6b __ LDA #$6b
02:86f1 : 85 0f __ STA P2 
02:86f3 : a9 88 __ LDA #$88
02:86f5 : 85 10 __ STA P3 
02:86f7 : 20 0f 3c JSR $3c0f 
02:86fa : e6 4f __ INC T5 + 0 
02:86fc : a9 88 __ LDA #$88
02:86fe : a0 79 __ LDY #$79
.s8:
02:8700 : 84 0f __ STY P2 
02:8702 : 85 10 __ STA P3 
02:8704 : 20 0f 3c JSR $3c0f 
02:8707 : e6 0e __ INC P1 
02:8709 : a9 87 __ LDA #$87
02:870b : 85 0f __ STA P2 
02:870d : a9 88 __ LDA #$88
02:870f : 85 10 __ STA P3 
02:8711 : 20 ab 3b JSR $3bab 
02:8714 : e6 0e __ INC P1 
02:8716 : a9 93 __ LDA #$93
02:8718 : 85 0f __ STA P2 
02:871a : a9 88 __ LDA #$88
02:871c : 85 10 __ STA P3 
02:871e : 20 ab 3b JSR $3bab 
02:8721 : e6 0e __ INC P1 
02:8723 : a9 a1 __ LDA #$a1
02:8725 : 85 0f __ STA P2 
02:8727 : a9 88 __ LDA #$88
02:8729 : 85 10 __ STA P3 
02:872b : 20 ab 3b JSR $3bab 
02:872e : a6 0e __ LDX P1 
02:8730 : e8 __ __ INX
02:8731 : e8 __ __ INX
02:8732 : 86 4c __ STX T1 + 0 
02:8734 : 86 0e __ STX P1 
02:8736 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
02:8739 : 85 11 __ STA P4 
02:873b : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:873e : d0 07 __ BNE $8747 ; (browse_menu.s22 + 0)
.s9:
02:8740 : a9 88 __ LDA #$88
02:8742 : a0 b3 __ LDY #$b3
02:8744 : 4c 4b 87 JMP $874b ; (browse_menu.s10 + 0)
.s22:
02:8747 : a9 88 __ LDA #$88
02:8749 : a0 aa __ LDY #$aa
.s10:
02:874b : 84 0f __ STY P2 
02:874d : 85 10 __ STA P3 
02:874f : 20 8f 12 JSR $128f 
02:8752 : ad f6 4c LDA $4cf6 ; (inside_mount + 0)
02:8755 : f0 36 __ BEQ $878d ; (browse_menu.s11 + 0)
.s21:
02:8757 : e6 4c __ INC T1 + 0 
02:8759 : a9 bc __ LDA #$bc
02:875b : 85 0f __ STA P2 
02:875d : a9 88 __ LDA #$88
02:875f : 85 10 __ STA P3 
02:8761 : 20 03 3c JSR $3c03 
02:8764 : e6 4c __ INC T1 + 0 
02:8766 : a9 1a __ LDA #$1a
02:8768 : 8d 68 49 STA $4968 ; (cw.cx + 0)
02:876b : a5 4c __ LDA T1 + 0 
02:876d : 8d 69 49 STA $4969 ; (cw.cy + 0)
02:8770 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
02:8773 : 85 18 __ STA P11 
02:8775 : a9 c9 __ LDA #$c9
02:8777 : 8d e3 7f STA $7fe3 ; (sstack + 4)
02:877a : a9 88 __ LDA #$88
02:877c : 8d e4 7f STA $7fe4 ; (sstack + 5)
02:877f : ad c1 3d LDA $3dc1 
02:8782 : 8d e5 7f STA $7fe5 ; (sstack + 6)
02:8785 : a9 00 __ LDA #$00
02:8787 : 8d e6 7f STA $7fe6 ; (sstack + 7)
02:878a : 20 25 15 JSR $1525 
.s11:
02:878d : a9 1a __ LDA #$1a
02:878f : 85 0d __ STA P0 
02:8791 : ae bb 3d LDX $3dbb 
02:8794 : ca __ __ DEX
02:8795 : f0 07 __ BEQ $879e ; (browse_menu.s20 + 0)
.s12:
02:8797 : a9 88 __ LDA #$88
02:8799 : a0 e1 __ LDY #$e1
02:879b : 4c a2 87 JMP $87a2 ; (browse_menu.s13 + 0)
.s20:
02:879e : a9 88 __ LDA #$88
02:87a0 : a0 d5 __ LDY #$d5
.s13:
02:87a2 : 84 0f __ STY P2 
02:87a4 : 85 10 __ STA P3 
02:87a6 : a6 4c __ LDX T1 + 0 
02:87a8 : e8 __ __ INX
02:87a9 : 86 0e __ STX P1 
02:87ab : 20 ab 3b JSR $3bab 
02:87ae : ae bf 3d LDX $3dbf 
02:87b1 : ca __ __ DEX
02:87b2 : f0 07 __ BEQ $87bb ; (browse_menu.s19 + 0)
.s14:
02:87b4 : a9 89 __ LDA #$89
02:87b6 : a0 00 __ LDY #$00
02:87b8 : 4c bf 87 JMP $87bf ; (browse_menu.s15 + 0)
.s19:
02:87bb : a9 88 __ LDA #$88
02:87bd : a0 ed __ LDY #$ed
.s15:
02:87bf : 84 0f __ STY P2 
02:87c1 : 85 10 __ STA P3 
02:87c3 : e6 0e __ INC P1 
02:87c5 : 20 ab 3b JSR $3bab 
02:87c8 : e6 0e __ INC P1 
02:87ca : ae c0 3d LDX $3dc0 
02:87cd : ca __ __ DEX
02:87ce : f0 07 __ BEQ $87d7 ; (browse_menu.s18 + 0)
.s16:
02:87d0 : a9 89 __ LDA #$89
02:87d2 : a0 18 __ LDY #$18
02:87d4 : 4c db 87 JMP $87db ; (browse_menu.s17 + 0)
.s18:
02:87d7 : a9 89 __ LDA #$89
02:87d9 : a0 0c __ LDY #$0c
.s17:
02:87db : 84 0f __ STY P2 
02:87dd : 85 10 __ STA P3 
02:87df : 4c ab 3b JMP $3bab 
--------------------------------------------------------------------
02:87e2 : __ __ __ BYT 20 66 31 20 64 49 52 20 52 45 46 52 2e 00       :  f1 dIR REFR..
--------------------------------------------------------------------
02:87f0 : __ __ __ BYT 20 66 33 20 75 63 69 20 4f 52 20 69 65 63 00    :  f3 uci OR iec.
--------------------------------------------------------------------
02:8800 : __ __ __ BYT 2b 2f 2d 20 64 45 56 49 43 45 00                : +/- dEVICE.
--------------------------------------------------------------------
02:880b : __ __ __ BYT 72 65 74 20 72 55 4e 2f 73 45 4c 45 43 54 00    : ret rUN/sELECT.
--------------------------------------------------------------------
02:881a : __ __ __ BYT 64 65 6c 20 64 49 52 20 55 50 00                : del dIR UP.
--------------------------------------------------------------------
02:8825 : __ __ __ BYT 20 20 5e 20 72 4f 4f 54 20 44 49 52 00          :   ^ rOOT DIR.
--------------------------------------------------------------------
02:8832 : __ __ __ BYT 20 20 74 20 74 4f 50 00                         :   t tOP.
--------------------------------------------------------------------
02:883a : __ __ __ BYT 20 20 65 20 65 4e 44 00                         :   e eND.
--------------------------------------------------------------------
02:8842 : __ __ __ BYT 70 2f 75 20 70 41 47 45 20 44 4f 2f 55 50 00    : p/u pAGE DO/UP.
--------------------------------------------------------------------
02:8851 : __ __ __ BYT 63 55 52 20 6e 41 56 49 47 41 54 45 00          : cUR nAVIGATE.
--------------------------------------------------------------------
02:885e : __ __ __ BYT 20 20 64 20 64 49 52 54 52 41 43 45 00          :   d dIRTRACE.
--------------------------------------------------------------------
02:886b : __ __ __ BYT 20 61 62 20 61 44 44 20 4d 4f 55 4e 54 00       :  ab aDD MOUNT.
--------------------------------------------------------------------
02:8879 : __ __ __ BYT 20 20 6d 20 72 55 4e 20 4d 4f 55 4e 54 00       :   m rUN MOUNT.
--------------------------------------------------------------------
02:8887 : __ __ __ BYT 20 20 31 20 2c 31 20 6c 4f 41 44 00             :   1 ,1 lOAD.
--------------------------------------------------------------------
02:8893 : __ __ __ BYT 20 20 6f 20 64 45 4d 4f 20 4d 4f 44 45 00       :   o dEMO MODE.
--------------------------------------------------------------------
02:88a1 : __ __ __ BYT 20 66 37 20 71 55 49 54 00                      :  f7 qUIT.
--------------------------------------------------------------------
02:88aa : __ __ __ BYT 75 63 69 20 4d 4f 44 45 00                      : uci MODE.
--------------------------------------------------------------------
02:88b3 : __ __ __ BYT 69 65 63 20 4d 4f 44 45 00                      : iec MODE.
--------------------------------------------------------------------
02:88bc : __ __ __ BYT 69 4e 53 49 44 45 20 4d 4f 55 4e 54 00          : iNSIDE MOUNT.
--------------------------------------------------------------------
02:88c9 : __ __ __ BYT 61 20 41 54 20 69 64 20 25 32 44 00             : a AT id %2D.
--------------------------------------------------------------------
02:88d5 : __ __ __ BYT 74 52 41 43 45 20 20 20 6f 6e 20 00             : tRACE   on .
--------------------------------------------------------------------
02:88e1 : __ __ __ BYT 74 52 41 43 45 20 20 20 6f 66 66 00             : tRACE   off.
--------------------------------------------------------------------
02:88ed : __ __ __ BYT 2c 31 20 6c 4f 41 44 20 6f 6e 20 00             : ,1 lOAD on .
--------------------------------------------------------------------
02:88f9 : __ __ __ BYT 24 00                                           : $.
--------------------------------------------------------------------
02:88fb : __ __ __ BYT 20 20 20 00                                     :    .
--------------------------------------------------------------------
02:8900 : __ __ __ BYT 2c 31 20 6c 4f 41 44 20 6f 66 66 00             : ,1 lOAD off.
--------------------------------------------------------------------
02:890c : __ __ __ BYT 64 45 4d 4f 20 20 20 20 6f 6e 20 00             : dEMO    on .
--------------------------------------------------------------------
02:8918 : __ __ __ BYT 64 45 4d 4f 20 20 20 20 6f 66 66 00             : dEMO    off.
--------------------------------------------------------------------
dir_read@proxy: ; dir_read@proxy
02:8924 : ad f5 4c LDA $4cf5 ; (sorted + 0)
02:8927 : 85 13 __ STA P6 
--------------------------------------------------------------------
dir_read: ; dir_read(u8)->u8
; 499, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s1:
02:8929 : a5 53 __ LDA T5 + 0 
02:892b : 8d 59 7e STA $7e59 ; (dir_read@stack + 0)
02:892e : a5 54 __ LDA T6 + 0 
02:8930 : 8d 5a 7e STA $7e5a ; (dir_read@stack + 1)
.s4:
02:8933 : a9 00 __ LDA #$00
02:8935 : 8d 68 53 STA $5368 ; (presentdir.firstelement + 0)
02:8938 : 8d 69 53 STA $5369 ; (presentdir.firstelement + 1)
02:893b : 8d 6a 53 STA $536a ; (presentdir.firstelement + 2)
02:893e : 8d 6b 53 STA $536b ; (presentdir.firstelement + 3)
02:8941 : 8d 6c 53 STA $536c ; (presentdir.firstprint + 0)
02:8944 : 8d 6d 53 STA $536d ; (presentdir.firstprint + 1)
02:8947 : 8d 6e 53 STA $536e ; (presentdir.firstprint + 2)
02:894a : 8d 6f 53 STA $536f ; (presentdir.firstprint + 3)
02:894d : 8d 70 53 STA $5370 ; (presentdir.lastprint + 0)
02:8950 : 8d 71 53 STA $5371 ; (presentdir.lastprint + 1)
02:8953 : 8d 72 53 STA $5372 ; (presentdir.lastprint + 2)
02:8956 : 8d 73 53 STA $5373 ; (presentdir.lastprint + 3)
02:8959 : 8d 74 53 STA $5374 ; (presentdir.present + 0)
02:895c : 8d 75 53 STA $5375 ; (presentdir.present + 1)
02:895f : 8d 76 53 STA $5376 ; (presentdir.present + 2)
02:8962 : 8d 77 53 STA $5377 ; (presentdir.present + 3)
02:8965 : 8d 79 53 STA $5379 ; (presentdir.position + 0)
02:8968 : 8d 7a 53 STA $537a ; (presentdir.position + 1)
02:896b : 8d fe 4c STA $4cfe ; (present + 2)
02:896e : 8d ff 4c STA $4cff ; (present + 3)
02:8971 : 8d 7f 54 STA $547f ; (presentdir.address + 2)
02:8974 : 8d 80 54 STA $5480 ; (presentdir.address + 3)
02:8977 : 8d f8 4c STA $4cf8 ; (previous + 0)
02:897a : 8d f9 4c STA $4cf9 ; (previous + 1)
02:897d : 8d fa 4c STA $4cfa ; (previous + 2)
02:8980 : 8d fb 4c STA $4cfb ; (previous + 3)
02:8983 : a9 a0 __ LDA #$a0
02:8985 : 8d fc 4c STA $4cfc ; (present + 0)
02:8988 : 8d 7d 54 STA $547d ; (presentdir.address + 0)
02:898b : a9 5f __ LDA #$5f
02:898d : 8d fd 4c STA $4cfd ; (present + 1)
02:8990 : 8d 7e 54 STA $547e ; (presentdir.address + 1)
02:8993 : ad e2 4c LDA $4ce2 ; (reudetected + 0)
02:8996 : 18 __ __ CLC
02:8997 : e9 00 __ SBC #$00
02:8999 : 85 4d __ STA T2 + 2 
02:899b : ad e3 4c LDA $4ce3 ; (reudetected + 1)
02:899e : e9 00 __ SBC #$00
02:89a0 : 85 4e __ STA T2 + 3 
02:89a2 : a9 ff __ LDA #$ff
02:89a4 : 85 54 __ STA T6 + 0 
02:89a6 : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:89a9 : f0 03 __ BEQ $89ae ; (dir_read.s5 + 0)
02:89ab : 4c 52 8e JMP $8e52 ; (dir_read.s51 + 0)
.s5:
02:89ae : 8d 7b 53 STA $537b ; (presentdir.path[0] + 0)
02:89b1 : ad c2 3d LDA $3dc2 
02:89b4 : 85 10 __ STA P3 
02:89b6 : 20 a9 8e JSR $8ea9 ; (dir_open.s4 + 0)
02:89b9 : a5 1b __ LDA ACCU + 0 
02:89bb : f0 0f __ BEQ $89cc ; (dir_read.l6 + 0)
.s56:
02:89bd : a9 00 __ LDA #$00
.s3:
02:89bf : 85 1b __ STA ACCU + 0 
02:89c1 : ad 59 7e LDA $7e59 ; (dir_read@stack + 0)
02:89c4 : 85 53 __ STA T5 + 0 
02:89c6 : ad 5a 7e LDA $7e5a ; (dir_read@stack + 1)
02:89c9 : 85 54 __ STA T6 + 0 
02:89cb : 60 __ __ RTS
.l6:
02:89cc : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:89cf : 85 53 __ STA T5 + 0 
02:89d1 : f0 03 __ BEQ $89d6 ; (dir_read.s7 + 0)
02:89d3 : 4c 48 8e JMP $8e48 ; (dir_read.s50 + 0)
.s7:
02:89d6 : 20 09 8f JSR $8f09 ; (dir_readentry_iec.s4 + 0)
02:89d9 : a5 1b __ LDA ACCU + 0 
02:89db : f0 03 __ BEQ $89e0 ; (dir_read.s8 + 0)
02:89dd : 4c ea 8d JMP $8dea ; (dir_read.s35 + 0)
.s8:
02:89e0 : a5 54 __ LDA T6 + 0 
02:89e2 : 4a __ __ LSR
02:89e3 : 4a __ __ LSR
02:89e4 : c9 28 __ CMP #$28
02:89e6 : 90 14 __ BCC $89fc ; (dir_read.s9 + 0)
.s49:
02:89e8 : a9 00 __ LDA #$00
02:89ea : 85 54 __ STA T6 + 0 
02:89ec : 85 0d __ STA P0 
02:89ee : a9 02 __ LDA #$02
02:89f0 : 85 0e __ STA P1 
02:89f2 : a9 01 __ LDA #$01
02:89f4 : 85 10 __ STA P3 
02:89f6 : 20 ea 3c JSR $3cea 
02:89f9 : 4c 17 8a JMP $8a17 ; (dir_read.s10 + 0)
.s9:
02:89fc : 85 0d __ STA P0 
02:89fe : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
02:8a01 : 85 0f __ STA P2 
02:8a03 : a5 54 __ LDA T6 + 0 
02:8a05 : 29 03 __ AND #$03
02:8a07 : aa __ __ TAX
02:8a08 : bd 2b a1 LDA $a12b,x ; (progressRev[0] + 0)
02:8a0b : 4a __ __ LSR
02:8a0c : 6a __ __ ROR
02:8a0d : 1d 27 a1 ORA $a127,x ; (progressBar[0] + 0)
02:8a10 : 85 0e __ STA P1 
02:8a12 : 20 55 2e JSR $2e55 
02:8a15 : e6 54 __ INC T6 + 0 
.s10:
02:8a17 : ad 7b 53 LDA $537b ; (presentdir.path[0] + 0)
02:8a1a : d0 5c __ BNE $8a78 ; (dir_read.s17 + 0)
.s11:
02:8a1c : a5 53 __ LDA T5 + 0 
02:8a1e : d0 58 __ BNE $8a78 ; (dir_read.s17 + 0)
.s12:
02:8a20 : ad 3b 55 LDA $553b ; (presentdirelement.meta.type + 0)
02:8a23 : a2 ff __ LDX #$ff
02:8a25 : c9 05 __ CMP #$05
02:8a27 : f0 0b __ BEQ $8a34 ; (dir_read.s14 + 0)
.l13:
02:8a29 : e8 __ __ INX
02:8a2a : bd b1 93 LDA $93b1,x 
02:8a2d : 9d 7b 53 STA $537b,x ; (presentdir.path[0] + 0)
02:8a30 : d0 f7 __ BNE $8a29 ; (dir_read.l13 + 0)
02:8a32 : f0 98 __ BEQ $89cc ; (dir_read.l6 + 0)
.s14:
02:8a34 : a9 00 __ LDA #$00
02:8a36 : 85 0d __ STA P0 
02:8a38 : a9 55 __ LDA #$55
02:8a3a : 85 0e __ STA P1 
.l15:
02:8a3c : e8 __ __ INX
02:8a3d : bd 00 55 LDA $5500,x ; (presentdirelement.name[0] + 0)
02:8a40 : 9d 7b 53 STA $537b,x ; (presentdir.path[0] + 0)
02:8a43 : d0 f7 __ BNE $8a3c ; (dir_read.l15 + 0)
.s16:
02:8a45 : 20 ad 10 JSR $10ad 
02:8a48 : a9 2c __ LDA #$2c
02:8a4a : a6 1b __ LDX ACCU + 0 
02:8a4c : 9d 7b 53 STA $537b,x ; (presentdir.path[0] + 0)
02:8a4f : ad 81 54 LDA $5481 ; (linebuffer2[0] + 0)
02:8a52 : 9d 7c 53 STA $537c,x ; (presentdir.path[0] + 1)
02:8a55 : ad 82 54 LDA $5482 ; (linebuffer2[0] + 1)
02:8a58 : 9d 7d 53 STA $537d,x ; (presentdir.path[0] + 2)
02:8a5b : ad 83 54 LDA $5483 ; (linebuffer2[0] + 2)
02:8a5e : 9d 7e 53 STA $537e,x ; (presentdir.path[0] + 3)
02:8a61 : ad 84 54 LDA $5484 ; (linebuffer2[0] + 3)
02:8a64 : 9d 7f 53 STA $537f,x ; (presentdir.path[0] + 4)
02:8a67 : ad 85 54 LDA $5485 ; (linebuffer2[0] + 4)
02:8a6a : 9d 80 53 STA $5380,x ; (presentdir.path[0] + 5)
02:8a6d : a9 00 __ LDA #$00
02:8a6f : 9d 81 53 STA $5381,x ; (presentdir.path[0] + 6)
02:8a72 : 8d 8f 53 STA $538f ; (presentdir.path[0] + 20)
02:8a75 : 4c cc 89 JMP $89cc ; (dir_read.l6 + 0)
.s17:
02:8a78 : ad 3b 55 LDA $553b ; (presentdirelement.meta.type + 0)
02:8a7b : c9 64 __ CMP #$64
02:8a7d : d0 12 __ BNE $8a91 ; (dir_read.s18 + 0)
.s47:
02:8a7f : a5 53 __ LDA T5 + 0 
02:8a81 : d0 0e __ BNE $8a91 ; (dir_read.s18 + 0)
.s48:
02:8a83 : ad 3e 55 LDA $553e ; (presentdirelement.meta.size + 0)
02:8a86 : 8d 7b 54 STA $547b ; (presentdir.free + 0)
02:8a89 : a9 00 __ LDA #$00
02:8a8b : 8d 7c 54 STA $547c ; (presentdir.free + 1)
02:8a8e : 4c ea 8d JMP $8dea ; (dir_read.s35 + 0)
.s18:
02:8a91 : ad 7d 54 LDA $547d ; (presentdir.address + 0)
02:8a94 : 18 __ __ CLC
02:8a95 : 69 45 __ ADC #$45
02:8a97 : 85 43 __ STA T0 + 0 
02:8a99 : ad 7e 54 LDA $547e ; (presentdir.address + 1)
02:8a9c : 69 00 __ ADC #$00
02:8a9e : 85 44 __ STA T0 + 1 
02:8aa0 : ad 7f 54 LDA $547f ; (presentdir.address + 2)
02:8aa3 : 69 00 __ ADC #$00
02:8aa5 : 85 45 __ STA T0 + 2 
02:8aa7 : ad 80 54 LDA $5480 ; (presentdir.address + 3)
02:8aaa : 69 00 __ ADC #$00
02:8aac : 85 46 __ STA T0 + 3 
02:8aae : a5 4e __ LDA T2 + 3 
02:8ab0 : c5 46 __ CMP T0 + 3 
02:8ab2 : d0 0e __ BNE $8ac2 ; (dir_read.s46 + 0)
.s43:
02:8ab4 : a5 4d __ LDA T2 + 2 
02:8ab6 : c5 45 __ CMP T0 + 2 
02:8ab8 : d0 08 __ BNE $8ac2 ; (dir_read.s46 + 0)
.s44:
02:8aba : a9 ff __ LDA #$ff
02:8abc : c5 44 __ CMP T0 + 1 
02:8abe : d0 02 __ BNE $8ac2 ; (dir_read.s46 + 0)
.s45:
02:8ac0 : c5 43 __ CMP T0 + 0 
.s46:
02:8ac2 : 90 ca __ BCC $8a8e ; (dir_read.s48 + 11)
.s19:
02:8ac4 : ad f9 4c LDA $4cf9 ; (previous + 1)
02:8ac7 : 85 48 __ STA T1 + 1 
02:8ac9 : ad fa 4c LDA $4cfa ; (previous + 2)
02:8acc : 85 49 __ STA T1 + 2 
02:8ace : ad fb 4c LDA $4cfb ; (previous + 3)
02:8ad1 : 85 4a __ STA T1 + 3 
02:8ad3 : ad f8 4c LDA $4cf8 ; (previous + 0)
02:8ad6 : 85 47 __ STA T1 + 0 
02:8ad8 : 05 48 __ ORA T1 + 1 
02:8ada : 05 49 __ ORA T1 + 2 
02:8adc : 05 4a __ ORA T1 + 3 
02:8ade : d0 34 __ BNE $8b14 ; (dir_read.s23 + 0)
.s20:
02:8ae0 : 8d 37 55 STA $5537 ; (presentdirelement.meta.prev + 0)
02:8ae3 : 8d 38 55 STA $5538 ; (presentdirelement.meta.prev + 1)
02:8ae6 : 8d 39 55 STA $5539 ; (presentdirelement.meta.prev + 2)
02:8ae9 : 8d 3a 55 STA $553a ; (presentdirelement.meta.prev + 3)
02:8aec : ae fc 4c LDX $4cfc ; (present + 0)
02:8aef : 8e 6c 53 STX $536c ; (presentdir.firstprint + 0)
02:8af2 : 8e 68 53 STX $5368 ; (presentdir.firstelement + 0)
02:8af5 : ac fd 4c LDY $4cfd ; (present + 1)
02:8af8 : 8c 6d 53 STY $536d ; (presentdir.firstprint + 1)
02:8afb : 8c 69 53 STY $5369 ; (presentdir.firstelement + 1)
02:8afe : ad fe 4c LDA $4cfe ; (present + 2)
02:8b01 : 85 45 __ STA T0 + 2 
02:8b03 : 8d 6e 53 STA $536e ; (presentdir.firstprint + 2)
02:8b06 : 8d 6a 53 STA $536a ; (presentdir.firstelement + 2)
02:8b09 : ad ff 4c LDA $4cff ; (present + 3)
02:8b0c : 8d 6f 53 STA $536f ; (presentdir.firstprint + 3)
02:8b0f : 8d 6b 53 STA $536b ; (presentdir.firstelement + 3)
02:8b12 : b0 4e __ BCS $8b62 ; (dir_read.s21 + 0)
.s23:
02:8b14 : a5 13 __ LDA P6 ; (sort + 0)
02:8b16 : f0 03 __ BEQ $8b1b ; (dir_read.s24 + 0)
02:8b18 : 4c 22 8c JMP $8c22 ; (dir_read.s25 + 0)
.s24:
02:8b1b : a5 47 __ LDA T1 + 0 
02:8b1d : 8d 37 55 STA $5537 ; (presentdirelement.meta.prev + 0)
02:8b20 : 8d 04 df STA $df04 
02:8b23 : a5 48 __ LDA T1 + 1 
02:8b25 : 8d 38 55 STA $5538 ; (presentdirelement.meta.prev + 1)
02:8b28 : 8d 05 df STA $df05 
02:8b2b : a5 49 __ LDA T1 + 2 
02:8b2d : 8d 39 55 STA $5539 ; (presentdirelement.meta.prev + 2)
02:8b30 : 8d 06 df STA $df06 
02:8b33 : a5 4a __ LDA T1 + 3 
02:8b35 : 8d 3a 55 STA $553a ; (presentdirelement.meta.prev + 3)
02:8b38 : a9 fc __ LDA #$fc
02:8b3a : 8d 02 df STA $df02 
02:8b3d : a9 4c __ LDA #$4c
02:8b3f : 8d 03 df STA $df03 
02:8b42 : a9 04 __ LDA #$04
02:8b44 : 8d 07 df STA $df07 
02:8b47 : a9 00 __ LDA #$00
02:8b49 : 8d 08 df STA $df08 
02:8b4c : 8d 0a df STA $df0a 
02:8b4f : a9 90 __ LDA #$90
02:8b51 : 8d 01 df STA $df01 
02:8b54 : ad fe 4c LDA $4cfe ; (present + 2)
02:8b57 : 85 45 __ STA T0 + 2 
02:8b59 : ad ff 4c LDA $4cff ; (present + 3)
02:8b5c : ae fc 4c LDX $4cfc ; (present + 0)
02:8b5f : ac fd 4c LDY $4cfd ; (present + 1)
.s21:
02:8b62 : 8e f8 4c STX $4cf8 ; (previous + 0)
02:8b65 : 8c f9 4c STY $4cf9 ; (previous + 1)
02:8b68 : 8d fb 4c STA $4cfb ; (previous + 3)
02:8b6b : a5 45 __ LDA T0 + 2 
02:8b6d : 8d fa 4c STA $4cfa ; (previous + 2)
02:8b70 : a9 00 __ LDA #$00
02:8b72 : 8d 33 55 STA $5533 ; (presentdirelement.meta.next + 0)
02:8b75 : 8d 34 55 STA $5534 ; (presentdirelement.meta.next + 1)
02:8b78 : 8d 35 55 STA $5535 ; (presentdirelement.meta.next + 2)
02:8b7b : 8d 36 55 STA $5536 ; (presentdirelement.meta.next + 3)
.s22:
02:8b7e : a2 33 __ LDX #$33
02:8b80 : 8e 02 df STX $df02 
02:8b83 : a2 55 __ LDX #$55
02:8b85 : 8e 03 df STX $df03 
02:8b88 : ae 7d 54 LDX $547d ; (presentdir.address + 0)
02:8b8b : 8e 04 df STX $df04 
02:8b8e : ae 7e 54 LDX $547e ; (presentdir.address + 1)
02:8b91 : 8e 05 df STX $df05 
02:8b94 : ae 7f 54 LDX $547f ; (presentdir.address + 2)
02:8b97 : 8e 06 df STX $df06 
02:8b9a : a2 12 __ LDX #$12
02:8b9c : 8e 07 df STX $df07 
02:8b9f : 8d 3d 55 STA $553d ; (presentdirelement.meta.select + 0)
02:8ba2 : 8d 08 df STA $df08 
02:8ba5 : 8d 0a df STA $df0a 
02:8ba8 : a9 90 __ LDA #$90
02:8baa : 8d 01 df STA $df01 
02:8bad : a9 00 __ LDA #$00
02:8baf : 8d 02 df STA $df02 
02:8bb2 : a9 55 __ LDA #$55
02:8bb4 : 8d 03 df STA $df03 
02:8bb7 : ad 7d 54 LDA $547d ; (presentdir.address + 0)
02:8bba : 18 __ __ CLC
02:8bbb : 69 12 __ ADC #$12
02:8bbd : 85 43 __ STA T0 + 0 
02:8bbf : 8d 04 df STA $df04 
02:8bc2 : ad 7e 54 LDA $547e ; (presentdir.address + 1)
02:8bc5 : 69 00 __ ADC #$00
02:8bc7 : 8d 05 df STA $df05 
02:8bca : a8 __ __ TAY
02:8bcb : ad 7f 54 LDA $547f ; (presentdir.address + 2)
02:8bce : 69 00 __ ADC #$00
02:8bd0 : 8d 06 df STA $df06 
02:8bd3 : aa __ __ TAX
02:8bd4 : ad 80 54 LDA $5480 ; (presentdir.address + 3)
02:8bd7 : 69 00 __ ADC #$00
02:8bd9 : 85 46 __ STA T0 + 3 
02:8bdb : ad 3c 55 LDA $553c ; (presentdirelement.meta.length + 0)
02:8bde : 8d 07 df STA $df07 
02:8be1 : 18 __ __ CLC
02:8be2 : 65 43 __ ADC T0 + 0 
02:8be4 : 8d fc 4c STA $4cfc ; (present + 0)
02:8be7 : a9 00 __ LDA #$00
02:8be9 : 8d 08 df STA $df08 
02:8bec : 8d 0a df STA $df0a 
02:8bef : a9 90 __ LDA #$90
02:8bf1 : 8d 01 df STA $df01 
02:8bf4 : ad fc 4c LDA $4cfc ; (present + 0)
02:8bf7 : 8d 7d 54 STA $547d ; (presentdir.address + 0)
02:8bfa : 98 __ __ TYA
02:8bfb : 69 00 __ ADC #$00
02:8bfd : 8d fd 4c STA $4cfd ; (present + 1)
02:8c00 : 8a __ __ TXA
02:8c01 : 69 00 __ ADC #$00
02:8c03 : 8d fe 4c STA $4cfe ; (present + 2)
02:8c06 : a5 46 __ LDA T0 + 3 
02:8c08 : 69 00 __ ADC #$00
02:8c0a : 8d ff 4c STA $4cff ; (present + 3)
02:8c0d : ad fd 4c LDA $4cfd ; (present + 1)
02:8c10 : 8d 7e 54 STA $547e ; (presentdir.address + 1)
02:8c13 : ad fe 4c LDA $4cfe ; (present + 2)
02:8c16 : 8d 7f 54 STA $547f ; (presentdir.address + 2)
02:8c19 : ad ff 4c LDA $4cff ; (present + 3)
02:8c1c : 8d 80 54 STA $5480 ; (presentdir.address + 3)
02:8c1f : 4c cc 89 JMP $89cc ; (dir_read.l6 + 0)
.s25:
02:8c22 : ad 68 53 LDA $5368 ; (presentdir.firstelement + 0)
02:8c25 : 85 4f __ STA T3 + 0 
02:8c27 : ad 69 53 LDA $5369 ; (presentdir.firstelement + 1)
02:8c2a : 85 50 __ STA T3 + 1 
02:8c2c : ad 6a 53 LDA $536a ; (presentdir.firstelement + 2)
02:8c2f : 85 51 __ STA T3 + 2 
02:8c31 : ad 6b 53 LDA $536b ; (presentdir.firstelement + 3)
02:8c34 : 85 52 __ STA T3 + 3 
.l26:
02:8c36 : a9 97 __ LDA #$97
02:8c38 : 8d 02 df STA $df02 
02:8c3b : a9 7e __ LDA #$7e
02:8c3d : 8d 03 df STA $df03 
02:8c40 : a5 4f __ LDA T3 + 0 
02:8c42 : 8d 04 df STA $df04 
02:8c45 : a5 50 __ LDA T3 + 1 
02:8c47 : 8d 05 df STA $df05 
02:8c4a : a5 51 __ LDA T3 + 2 
02:8c4c : 8d 06 df STA $df06 
02:8c4f : a9 12 __ LDA #$12
02:8c51 : 8d 07 df STA $df07 
02:8c54 : a9 00 __ LDA #$00
02:8c56 : 8d 08 df STA $df08 
02:8c59 : 8d 0a df STA $df0a 
02:8c5c : a9 91 __ LDA #$91
02:8c5e : 8d 01 df STA $df01 
02:8c61 : a9 64 __ LDA #$64
02:8c63 : 85 0d __ STA P0 
02:8c65 : 8d 02 df STA $df02 
02:8c68 : a9 7e __ LDA #$7e
02:8c6a : 85 0e __ STA P1 
02:8c6c : 8d 03 df STA $df03 
02:8c6f : 18 __ __ CLC
02:8c70 : a5 4f __ LDA T3 + 0 
02:8c72 : 69 12 __ ADC #$12
02:8c74 : 8d 04 df STA $df04 
02:8c77 : a5 50 __ LDA T3 + 1 
02:8c79 : 69 00 __ ADC #$00
02:8c7b : 8d 05 df STA $df05 
02:8c7e : a5 51 __ LDA T3 + 2 
02:8c80 : 69 00 __ ADC #$00
02:8c82 : 8d 06 df STA $df06 
02:8c85 : ad a0 7e LDA $7ea0 ; (bufferdir.meta.length + 0)
02:8c88 : 8d 07 df STA $df07 
02:8c8b : a9 00 __ LDA #$00
02:8c8d : 8d 08 df STA $df08 
02:8c90 : 8d 0a df STA $df0a 
02:8c93 : a9 91 __ LDA #$91
02:8c95 : 8d 01 df STA $df01 
02:8c98 : a9 00 __ LDA #$00
02:8c9a : 85 0f __ STA P2 
02:8c9c : a9 55 __ LDA #$55
02:8c9e : 85 10 __ STA P3 
02:8ca0 : 20 07 1d JSR $1d07 
02:8ca3 : aa __ __ TAX
02:8ca4 : 30 02 __ BMI $8ca8 ; (dir_read.s27 + 0)
.s34:
02:8ca6 : d0 28 __ BNE $8cd0 ; (dir_read.s31 + 0)
.s27:
02:8ca8 : ad 97 7e LDA $7e97 ; (bufferdir.meta.next + 0)
02:8cab : 85 4f __ STA T3 + 0 
02:8cad : ad 98 7e LDA $7e98 ; (bufferdir.meta.next + 1)
02:8cb0 : 85 50 __ STA T3 + 1 
02:8cb2 : ad 99 7e LDA $7e99 ; (bufferdir.meta.next + 2)
02:8cb5 : 85 51 __ STA T3 + 2 
02:8cb7 : ad 9a 7e LDA $7e9a ; (bufferdir.meta.next + 3)
02:8cba : 85 52 __ STA T3 + 3 
02:8cbc : f0 03 __ BEQ $8cc1 ; (dir_read.s28 + 0)
02:8cbe : 4c 36 8c JMP $8c36 ; (dir_read.l26 + 0)
.s28:
02:8cc1 : a5 51 __ LDA T3 + 2 
02:8cc3 : d0 f9 __ BNE $8cbe ; (dir_read.s27 + 22)
.s29:
02:8cc5 : a5 50 __ LDA T3 + 1 
02:8cc7 : d0 f5 __ BNE $8cbe ; (dir_read.s27 + 22)
.s30:
02:8cc9 : a5 4f __ LDA T3 + 0 
02:8ccb : d0 f1 __ BNE $8cbe ; (dir_read.s27 + 22)
02:8ccd : 4c 1b 8b JMP $8b1b ; (dir_read.s24 + 0)
.s31:
02:8cd0 : a5 4f __ LDA T3 + 0 
02:8cd2 : 8d 33 55 STA $5533 ; (presentdirelement.meta.next + 0)
02:8cd5 : 8d 04 df STA $df04 
02:8cd8 : a5 50 __ LDA T3 + 1 
02:8cda : 8d 34 55 STA $5534 ; (presentdirelement.meta.next + 1)
02:8cdd : 8d 05 df STA $df05 
02:8ce0 : a5 51 __ LDA T3 + 2 
02:8ce2 : 8d 35 55 STA $5535 ; (presentdirelement.meta.next + 2)
02:8ce5 : 8d 06 df STA $df06 
02:8ce8 : a5 52 __ LDA T3 + 3 
02:8cea : 8d 36 55 STA $5536 ; (presentdirelement.meta.next + 3)
02:8ced : a9 97 __ LDA #$97
02:8cef : 8d 02 df STA $df02 
02:8cf2 : a9 7e __ LDA #$7e
02:8cf4 : 8d 03 df STA $df03 
02:8cf7 : a9 12 __ LDA #$12
02:8cf9 : 8d 07 df STA $df07 
02:8cfc : a9 00 __ LDA #$00
02:8cfe : 8d 08 df STA $df08 
02:8d01 : 8d 0a df STA $df0a 
02:8d04 : a9 90 __ LDA #$90
02:8d06 : 8d 01 df STA $df01 
02:8d09 : ad 9c 7e LDA $7e9c ; (bufferdir.meta.prev + 1)
02:8d0c : 85 48 __ STA T1 + 1 
02:8d0e : ad 9d 7e LDA $7e9d ; (bufferdir.meta.prev + 2)
02:8d11 : 85 49 __ STA T1 + 2 
02:8d13 : ad 9e 7e LDA $7e9e ; (bufferdir.meta.prev + 3)
02:8d16 : 85 4a __ STA T1 + 3 
02:8d18 : ad fc 4c LDA $4cfc ; (present + 0)
02:8d1b : ae 9b 7e LDX $7e9b ; (bufferdir.meta.prev + 0)
02:8d1e : 8d 9b 7e STA $7e9b ; (bufferdir.meta.prev + 0)
02:8d21 : ad fd 4c LDA $4cfd ; (present + 1)
02:8d24 : 8d 9c 7e STA $7e9c ; (bufferdir.meta.prev + 1)
02:8d27 : ad fe 4c LDA $4cfe ; (present + 2)
02:8d2a : 8d 9d 7e STA $7e9d ; (bufferdir.meta.prev + 2)
02:8d2d : ad ff 4c LDA $4cff ; (present + 3)
02:8d30 : 8d 9e 7e STA $7e9e ; (bufferdir.meta.prev + 3)
02:8d33 : 8a __ __ TXA
02:8d34 : 05 48 __ ORA T1 + 1 
02:8d36 : 05 49 __ ORA T1 + 2 
02:8d38 : 05 4a __ ORA T1 + 3 
02:8d3a : f0 79 __ BEQ $8db5 ; (dir_read.s32 + 0)
.s33:
02:8d3c : 8e 37 55 STX $5537 ; (presentdirelement.meta.prev + 0)
02:8d3f : ad fc 4c LDA $4cfc ; (present + 0)
02:8d42 : 8d 97 7e STA $7e97 ; (bufferdir.meta.next + 0)
02:8d45 : ad fd 4c LDA $4cfd ; (present + 1)
02:8d48 : 8d 98 7e STA $7e98 ; (bufferdir.meta.next + 1)
02:8d4b : ad fe 4c LDA $4cfe ; (present + 2)
02:8d4e : 8d 99 7e STA $7e99 ; (bufferdir.meta.next + 2)
02:8d51 : ad ff 4c LDA $4cff ; (present + 3)
02:8d54 : 8d 9a 7e STA $7e9a ; (bufferdir.meta.next + 3)
02:8d57 : 8e 04 df STX $df04 
02:8d5a : a5 48 __ LDA T1 + 1 
02:8d5c : 8d 38 55 STA $5538 ; (presentdirelement.meta.prev + 1)
02:8d5f : 8d 05 df STA $df05 
02:8d62 : a5 49 __ LDA T1 + 2 
02:8d64 : 8d 39 55 STA $5539 ; (presentdirelement.meta.prev + 2)
02:8d67 : 8d 06 df STA $df06 
02:8d6a : a5 4a __ LDA T1 + 3 
02:8d6c : 8d 3a 55 STA $553a ; (presentdirelement.meta.prev + 3)
02:8d6f : a9 97 __ LDA #$97
02:8d71 : 8d 02 df STA $df02 
02:8d74 : a9 7e __ LDA #$7e
02:8d76 : 8d 03 df STA $df03 
02:8d79 : 8e 04 df STX $df04 
02:8d7c : a5 48 __ LDA T1 + 1 
02:8d7e : 8d 05 df STA $df05 
02:8d81 : a5 49 __ LDA T1 + 2 
02:8d83 : 8d 06 df STA $df06 
02:8d86 : a9 12 __ LDA #$12
02:8d88 : 8d 07 df STA $df07 
02:8d8b : a9 00 __ LDA #$00
02:8d8d : 8d 08 df STA $df08 
02:8d90 : 8d 0a df STA $df0a 
02:8d93 : a2 91 __ LDX #$91
02:8d95 : 8e 01 df STX $df01 
02:8d98 : a2 97 __ LDX #$97
02:8d9a : 8e 02 df STX $df02 
02:8d9d : a2 7e __ LDX #$7e
02:8d9f : 8e 03 df STX $df03 
02:8da2 : a2 12 __ LDX #$12
02:8da4 : 8e 07 df STX $df07 
02:8da7 : 8d 08 df STA $df08 
02:8daa : 8d 0a df STA $df0a 
02:8dad : a2 90 __ LDX #$90
02:8daf : 8e 01 df STX $df01 
02:8db2 : 4c 7e 8b JMP $8b7e ; (dir_read.s22 + 0)
.s32:
02:8db5 : ad fc 4c LDA $4cfc ; (present + 0)
02:8db8 : 8d 68 53 STA $5368 ; (presentdir.firstelement + 0)
02:8dbb : 8d 6c 53 STA $536c ; (presentdir.firstprint + 0)
02:8dbe : ad fd 4c LDA $4cfd ; (present + 1)
02:8dc1 : 8d 69 53 STA $5369 ; (presentdir.firstelement + 1)
02:8dc4 : 8d 6d 53 STA $536d ; (presentdir.firstprint + 1)
02:8dc7 : ad fe 4c LDA $4cfe ; (present + 2)
02:8dca : 8d 6a 53 STA $536a ; (presentdir.firstelement + 2)
02:8dcd : 8d 6e 53 STA $536e ; (presentdir.firstprint + 2)
02:8dd0 : ad ff 4c LDA $4cff ; (present + 3)
02:8dd3 : 8d 6b 53 STA $536b ; (presentdir.firstelement + 3)
02:8dd6 : 8d 6f 53 STA $536f ; (presentdir.firstprint + 3)
02:8dd9 : a9 00 __ LDA #$00
02:8ddb : 8d 37 55 STA $5537 ; (presentdirelement.meta.prev + 0)
02:8dde : 8d 38 55 STA $5538 ; (presentdirelement.meta.prev + 1)
02:8de1 : 8d 39 55 STA $5539 ; (presentdirelement.meta.prev + 2)
02:8de4 : 8d 3a 55 STA $553a ; (presentdirelement.meta.prev + 3)
02:8de7 : 4c 7e 8b JMP $8b7e ; (dir_read.s22 + 0)
.s35:
02:8dea : a9 01 __ LDA #$01
02:8dec : 85 10 __ STA P3 
02:8dee : 20 d2 3c JSR $3cd2 
02:8df1 : a5 53 __ LDA T5 + 0 
02:8df3 : d0 08 __ BNE $8dfd ; (dir_read.s37 + 0)
.s36:
02:8df5 : 20 cc ff JSR $ffcc 
02:8df8 : a9 02 __ LDA #$02
02:8dfa : 20 c3 ff JSR $ffc3 
.s37:
02:8dfd : ad 6b 53 LDA $536b ; (presentdir.firstelement + 3)
02:8e00 : d0 0f __ BNE $8e11 ; (dir_read.s39 + 0)
.s40:
02:8e02 : ad 6a 53 LDA $536a ; (presentdir.firstelement + 2)
02:8e05 : d0 0a __ BNE $8e11 ; (dir_read.s39 + 0)
.s41:
02:8e07 : ad 69 53 LDA $5369 ; (presentdir.firstelement + 1)
02:8e0a : d0 05 __ BNE $8e11 ; (dir_read.s39 + 0)
.s42:
02:8e0c : ad 68 53 LDA $5368 ; (presentdir.firstelement + 0)
02:8e0f : f0 26 __ BEQ $8e37 ; (dir_read.s38 + 0)
.s39:
02:8e11 : ad 68 53 LDA $5368 ; (presentdir.firstelement + 0)
02:8e14 : 85 0d __ STA P0 
02:8e16 : 8d fc 4c STA $4cfc ; (present + 0)
02:8e19 : ad 69 53 LDA $5369 ; (presentdir.firstelement + 1)
02:8e1c : 85 0e __ STA P1 
02:8e1e : 8d fd 4c STA $4cfd ; (present + 1)
02:8e21 : ad 6a 53 LDA $536a ; (presentdir.firstelement + 2)
02:8e24 : 85 0f __ STA P2 
02:8e26 : 8d fe 4c STA $4cfe ; (present + 2)
02:8e29 : ad 6b 53 LDA $536b ; (presentdir.firstelement + 3)
02:8e2c : 85 10 __ STA P3 
02:8e2e : 8d ff 4c STA $4cff ; (present + 3)
02:8e31 : 20 d2 93 JSR $93d2 ; (dir_get_element.s4 + 0)
02:8e34 : 4c 43 8e JMP $8e43 ; (dir_read.s55 + 0)
.s38:
02:8e37 : 8d fc 4c STA $4cfc ; (present + 0)
02:8e3a : 8d fd 4c STA $4cfd ; (present + 1)
02:8e3d : 8d fe 4c STA $4cfe ; (present + 2)
02:8e40 : 8d ff 4c STA $4cff ; (present + 3)
.s55:
02:8e43 : a9 01 __ LDA #$01
02:8e45 : 4c bf 89 JMP $89bf ; (dir_read.s3 + 0)
.s50:
02:8e48 : 20 15 91 JSR $9115 ; (dir_readentry_uci.s4 + 0)
02:8e4b : a5 1b __ LDA ACCU + 0 
02:8e4d : d0 9b __ BNE $8dea ; (dir_read.s35 + 0)
02:8e4f : 4c e0 89 JMP $89e0 ; (dir_read.s8 + 0)
.s51:
02:8e52 : a9 00 __ LDA #$00
02:8e54 : 85 10 __ STA P3 
02:8e56 : 8d 62 7e STA $7e62 ; (cmd[0] + 0)
02:8e59 : a9 02 __ LDA #$02
02:8e5b : 85 0f __ STA P2 
02:8e5d : a9 01 __ LDA #$01
02:8e5f : 8d 8a 3d STA $3d8a 
02:8e62 : a9 13 __ LDA #$13
02:8e64 : 8d 63 7e STA $7e63 ; (cmd[0] + 1)
02:8e67 : a9 62 __ LDA #$62
02:8e69 : 85 0d __ STA P0 
02:8e6b : a9 7e __ LDA #$7e
02:8e6d : 85 0e __ STA P1 
02:8e6f : 20 53 11 JSR $1153 
02:8e72 : 20 0c 12 JSR $120c 
02:8e75 : 20 18 11 JSR $1118 
02:8e78 : ad d7 4b LDA $4bd7 ; (uii_status[0] + 0)
02:8e7b : c9 30 __ CMP #$30
02:8e7d : d0 24 __ BNE $8ea3 ; (dir_read.s54 + 0)
.s52:
02:8e7f : ad d8 4b LDA $4bd8 ; (uii_status[0] + 1)
02:8e82 : c9 30 __ CMP #$30
02:8e84 : d0 1d __ BNE $8ea3 ; (dir_read.s54 + 0)
.s53:
02:8e86 : a9 01 __ LDA #$01
02:8e88 : 8d 8a 3d STA $3d8a 
02:8e8b : a9 00 __ LDA #$00
02:8e8d : 8d 60 7e STA $7e60 ; (cmd[0] + 0)
02:8e90 : a9 14 __ LDA #$14
02:8e92 : 8d 61 7e STA $7e61 ; (cmd[0] + 1)
02:8e95 : a9 60 __ LDA #$60
02:8e97 : 85 0d __ STA P0 
02:8e99 : a9 7e __ LDA #$7e
02:8e9b : 85 0e __ STA P1 
02:8e9d : 20 53 11 JSR $1153 
02:8ea0 : 4c cc 89 JMP $89cc ; (dir_read.l6 + 0)
.s54:
02:8ea3 : 20 f5 12 JSR $12f5 
02:8ea6 : 4c bd 89 JMP $89bd ; (dir_read.s56 + 0)
--------------------------------------------------------------------
dir_open: ; dir_open(u8,u8)->u8
; 169, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s4:
02:8ea9 : a9 f9 __ LDA #$f9
02:8eab : 85 0d __ STA P0 
02:8ead : a9 88 __ LDA #$88
02:8eaf : 85 0e __ STA P1 
02:8eb1 : 20 03 2e JSR $2e03 
02:8eb4 : a9 02 __ LDA #$02
02:8eb6 : 85 0d __ STA P0 
02:8eb8 : a9 00 __ LDA #$00
02:8eba : 85 0f __ STA P2 
02:8ebc : 20 19 2e JSR $2e19 
02:8ebf : aa __ __ TAX
02:8ec0 : 20 b7 ff JSR $ffb7 
02:8ec3 : 85 43 __ STA T1 + 0 
02:8ec5 : 85 1b __ STA ACCU + 0 
02:8ec7 : 8a __ __ TXA
02:8ec8 : f0 3e __ BEQ $8f08 ; (dir_open.s3 + 0)
.s5:
02:8eca : a5 43 __ LDA T1 + 0 
02:8ecc : f0 0c __ BEQ $8eda ; (dir_open.s6 + 0)
.s10:
02:8ece : 20 cc ff JSR $ffcc 
02:8ed1 : a9 02 __ LDA #$02
02:8ed3 : 20 c3 ff JSR $ffc3 
02:8ed6 : a5 43 __ LDA T1 + 0 
02:8ed8 : d0 2c __ BNE $8f06 ; (dir_open.s11 + 0)
.s6:
02:8eda : a9 02 __ LDA #$02
02:8edc : 20 4b 2e JSR $2e4b 
02:8edf : aa __ __ TAX
02:8ee0 : 20 b7 ff JSR $ffb7 
02:8ee3 : 85 43 __ STA T1 + 0 
02:8ee5 : 8a __ __ TXA
02:8ee6 : f0 14 __ BEQ $8efc ; (dir_open.s7 + 0)
.s8:
02:8ee8 : a5 43 __ LDA T1 + 0 
02:8eea : d0 10 __ BNE $8efc ; (dir_open.s7 + 0)
.s9:
02:8eec : 20 cf ff JSR $ffcf 
02:8eef : 20 cf ff JSR $ffcf 
02:8ef2 : 20 b7 ff JSR $ffb7 
02:8ef5 : 85 43 __ STA T1 + 0 
02:8ef7 : 85 1b __ STA ACCU + 0 
02:8ef9 : aa __ __ TAX
02:8efa : f0 0c __ BEQ $8f08 ; (dir_open.s3 + 0)
.s7:
02:8efc : 20 cc ff JSR $ffcc 
02:8eff : a9 02 __ LDA #$02
02:8f01 : 20 c3 ff JSR $ffc3 
02:8f04 : a5 43 __ LDA T1 + 0 
.s11:
02:8f06 : 85 1b __ STA ACCU + 0 
.s3:
02:8f08 : 60 __ __ RTS
--------------------------------------------------------------------
dir_readentry_iec: ; dir_readentry_iec(struct DirElement*)->u8
; 238, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s4:
02:8f09 : 20 cf ff JSR $ffcf 
02:8f0c : aa __ __ TAX
02:8f0d : d0 05 __ BNE $8f14 ; (dir_readentry_iec.s6 + 0)
.s5:
02:8f0f : a9 01 __ LDA #$01
.s3:
02:8f11 : 85 1b __ STA ACCU + 0 
02:8f13 : 60 __ __ RTS
.s6:
02:8f14 : 20 cf ff JSR $ffcf 
02:8f17 : 20 cf ff JSR $ffcf 
02:8f1a : 8d 3e 55 STA $553e ; (presentdirelement.meta.size + 0)
02:8f1d : 20 cf ff JSR $ffcf 
02:8f20 : a9 00 __ LDA #$00
02:8f22 : a2 64 __ LDX #$64
.l7:
02:8f24 : ca __ __ DEX
02:8f25 : 9d 72 49 STA $4972,x ; (linebuffer[0] + 0)
02:8f28 : d0 fa __ BNE $8f24 ; (dir_readentry_iec.l7 + 0)
.s8:
02:8f2a : 85 46 __ STA T4 + 0 
.l9:
02:8f2c : 20 cf ff JSR $ffcf 
02:8f2f : aa __ __ TAX
02:8f30 : f0 0d __ BEQ $8f3f ; (dir_readentry_iec.s10 + 0)
.s75:
02:8f32 : a6 46 __ LDX T4 + 0 
02:8f34 : e0 64 __ CPX #$64
02:8f36 : b0 f4 __ BCS $8f2c ; (dir_readentry_iec.l9 + 0)
.s76:
02:8f38 : 9d 72 49 STA $4972,x ; (linebuffer[0] + 0)
02:8f3b : e6 46 __ INC T4 + 0 
02:8f3d : 90 ed __ BCC $8f2c ; (dir_readentry_iec.l9 + 0)
.s10:
02:8f3f : ad 72 49 LDA $4972 ; (linebuffer[0] + 0)
02:8f42 : c9 42 __ CMP #$42
02:8f44 : d0 08 __ BNE $8f4e ; (dir_readentry_iec.s11 + 0)
.s74:
02:8f46 : a9 64 __ LDA #$64
02:8f48 : 8d 3b 55 STA $553b ; (presentdirelement.meta.type + 0)
02:8f4b : 4c 84 90 JMP $9084 ; (dir_readentry_iec.s77 + 0)
.s11:
02:8f4e : a6 46 __ LDX T4 + 0 
02:8f50 : e0 05 __ CPX #$05
02:8f52 : b0 04 __ BCS $8f58 ; (dir_readentry_iec.l80 + 0)
.s73:
02:8f54 : a9 03 __ LDA #$03
02:8f56 : 90 b9 __ BCC $8f11 ; (dir_readentry_iec.s3 + 0)
.l80:
02:8f58 : bd 71 49 LDA $4971,x ; (vspriteScreen + 1)
02:8f5b : f0 08 __ BEQ $8f65 ; (dir_readentry_iec.s12 + 0)
.s71:
02:8f5d : c9 20 __ CMP #$20
02:8f5f : f0 04 __ BEQ $8f65 ; (dir_readentry_iec.s12 + 0)
.s72:
02:8f61 : c9 a0 __ CMP #$a0
02:8f63 : d0 03 __ BNE $8f68 ; (dir_readentry_iec.s81 + 0)
.s12:
02:8f65 : ca __ __ DEX
02:8f66 : d0 f0 __ BNE $8f58 ; (dir_readentry_iec.l80 + 0)
.s81:
02:8f68 : 86 46 __ STX T4 + 0 
02:8f6a : a2 00 __ LDX #$00
.l13:
02:8f6c : bd 72 49 LDA $4972,x ; (linebuffer[0] + 0)
02:8f6f : c9 22 __ CMP #$22
02:8f71 : f0 05 __ BEQ $8f78 ; (dir_readentry_iec.s82 + 0)
.s70:
02:8f73 : e8 __ __ INX
02:8f74 : e0 64 __ CPX #$64
02:8f76 : 90 f4 __ BCC $8f6c ; (dir_readentry_iec.l13 + 0)
.s82:
02:8f78 : a9 00 __ LDA #$00
02:8f7a : 85 44 __ STA T1 + 0 
02:8f7c : f0 05 __ BEQ $8f83 ; (dir_readentry_iec.l14 + 0)
.s69:
02:8f7e : 99 00 55 STA $5500,y ; (presentdirelement.name[0] + 0)
02:8f81 : e6 44 __ INC T1 + 0 
.l14:
02:8f83 : e8 __ __ INX
02:8f84 : e0 33 __ CPX #$33
02:8f86 : 90 03 __ BCC $8f8b ; (dir_readentry_iec.s67 + 0)
02:8f88 : 4c 10 91 JMP $9110 ; (dir_readentry_iec.s83 + 0)
.s67:
02:8f8b : bd 72 49 LDA $4972,x ; (linebuffer[0] + 0)
02:8f8e : c9 22 __ CMP #$22
02:8f90 : f0 f6 __ BEQ $8f88 ; (dir_readentry_iec.l14 + 5)
.s68:
02:8f92 : a4 44 __ LDY T1 + 0 
02:8f94 : c0 10 __ CPY #$10
02:8f96 : 90 e6 __ BCC $8f7e ; (dir_readentry_iec.s69 + 0)
.s15:
02:8f98 : a9 00 __ LDA #$00
02:8f9a : 99 00 55 STA $5500,y ; (presentdirelement.name[0] + 0)
02:8f9d : c8 __ __ INY
02:8f9e : 8c 3c 55 STY $553c ; (presentdirelement.meta.length + 0)
02:8fa1 : a4 46 __ LDY T4 + 0 
02:8fa3 : b9 6f 49 LDA $496f,y ; (cw.cp + 1)
02:8fa6 : c9 50 __ CMP #$50
02:8fa8 : d0 03 __ BNE $8fad ; (dir_readentry_iec.s16 + 0)
02:8faa : 4c f8 90 JMP $90f8 ; (dir_readentry_iec.s64 + 0)
.s16:
02:8fad : 85 44 __ STA T1 + 0 
02:8faf : c9 53 __ CMP #$53
02:8fb1 : d0 03 __ BNE $8fb6 ; (dir_readentry_iec.s17 + 0)
02:8fb3 : 4c e3 90 JMP $90e3 ; (dir_readentry_iec.s61 + 0)
.s17:
02:8fb6 : c9 55 __ CMP #$55
02:8fb8 : d0 15 __ BNE $8fcf ; (dir_readentry_iec.s18 + 0)
.s58:
02:8fba : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:8fbd : c9 53 __ CMP #$53
02:8fbf : d0 0c __ BNE $8fcd ; (dir_readentry_iec.s84 + 0)
.s59:
02:8fc1 : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:8fc4 : c9 52 __ CMP #$52
02:8fc6 : d0 05 __ BNE $8fcd ; (dir_readentry_iec.s84 + 0)
.s60:
02:8fc8 : a9 12 __ LDA #$12
02:8fca : 4c 89 90 JMP $9089 ; (dir_readentry_iec.s41 + 0)
.s84:
02:8fcd : a5 44 __ LDA T1 + 0 
.s18:
02:8fcf : c9 44 __ CMP #$44
02:8fd1 : d0 03 __ BNE $8fd6 ; (dir_readentry_iec.s20 + 0)
02:8fd3 : 4c c6 90 JMP $90c6 ; (dir_readentry_iec.s19 + 0)
.s20:
02:8fd6 : a9 00 __ LDA #$00
02:8fd8 : 85 45 __ STA T3 + 0 
02:8fda : a5 44 __ LDA T1 + 0 
02:8fdc : c9 52 __ CMP #$52
02:8fde : d0 03 __ BNE $8fe3 ; (dir_readentry_iec.s21 + 0)
02:8fe0 : 4c b1 90 JMP $90b1 ; (dir_readentry_iec.s53 + 0)
.s21:
02:8fe3 : c9 43 __ CMP #$43
02:8fe5 : d0 13 __ BNE $8ffa ; (dir_readentry_iec.s22 + 0)
.s50:
02:8fe7 : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:8fea : c9 42 __ CMP #$42
02:8fec : d0 0c __ BNE $8ffa ; (dir_readentry_iec.s22 + 0)
.s51:
02:8fee : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:8ff1 : c9 4d __ CMP #$4d
02:8ff3 : d0 05 __ BNE $8ffa ; (dir_readentry_iec.s22 + 0)
.s52:
02:8ff5 : a9 01 __ LDA #$01
02:8ff7 : 4c 89 90 JMP $9089 ; (dir_readentry_iec.s41 + 0)
.s22:
02:8ffa : 24 45 __ BIT T3 + 0 
02:8ffc : 10 12 __ BPL $9010 ; (dir_readentry_iec.s23 + 0)
.s47:
02:8ffe : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:9001 : c9 49 __ CMP #$49
02:9003 : d0 0b __ BNE $9010 ; (dir_readentry_iec.s23 + 0)
.s48:
02:9005 : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:9008 : c9 52 __ CMP #$52
02:900a : d0 04 __ BNE $9010 ; (dir_readentry_iec.s23 + 0)
.s49:
02:900c : a9 02 __ LDA #$02
02:900e : d0 79 __ BNE $9089 ; (dir_readentry_iec.s41 + 0)
.s23:
02:9010 : a5 44 __ LDA T1 + 0 
02:9012 : c9 56 __ CMP #$56
02:9014 : d0 03 __ BNE $9019 ; (dir_readentry_iec.s24 + 0)
02:9016 : 4c 9f 90 JMP $909f ; (dir_readentry_iec.s44 + 0)
.s24:
02:9019 : c9 4c __ CMP #$4c
02:901b : d0 12 __ BNE $902f ; (dir_readentry_iec.s25 + 0)
.s38:
02:901d : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:9020 : c9 4e __ CMP #$4e
02:9022 : d0 0b __ BNE $902f ; (dir_readentry_iec.s25 + 0)
.s39:
02:9024 : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:9027 : c9 4b __ CMP #$4b
02:9029 : d0 04 __ BNE $902f ; (dir_readentry_iec.s25 + 0)
.s40:
02:902b : a9 03 __ LDA #$03
02:902d : d0 5a __ BNE $9089 ; (dir_readentry_iec.s41 + 0)
.s25:
02:902f : a9 05 __ LDA #$05
02:9031 : 8d 3b 55 STA $553b ; (presentdirelement.meta.type + 0)
02:9034 : bd 72 49 LDA $4972,x ; (linebuffer[0] + 0)
02:9037 : c9 22 __ CMP #$22
02:9039 : d0 01 __ BNE $903c ; (dir_readentry_iec.s26 + 0)
.s37:
02:903b : e8 __ __ INX
.s26:
02:903c : bd 72 49 LDA $4972,x ; (linebuffer[0] + 0)
02:903f : c9 20 __ CMP #$20
02:9041 : d0 01 __ BNE $9044 ; (dir_readentry_iec.s27 + 0)
.s36:
02:9043 : e8 __ __ INX
.s27:
02:9044 : a0 00 __ LDY #$00
02:9046 : bd 72 49 LDA $4972,x ; (linebuffer[0] + 0)
02:9049 : f0 03 __ BEQ $904e ; (dir_readentry_iec.l28 + 0)
.l35:
02:904b : 99 81 54 STA $5481,y ; (linebuffer2[0] + 0)
.l28:
02:904e : e8 __ __ INX
02:904f : c8 __ __ INY
02:9050 : c0 05 __ CPY #$05
02:9052 : b0 07 __ BCS $905b ; (dir_readentry_iec.s29 + 0)
.s79:
02:9054 : bd 72 49 LDA $4972,x ; (linebuffer[0] + 0)
02:9057 : f0 f5 __ BEQ $904e ; (dir_readentry_iec.l28 + 0)
02:9059 : d0 f0 __ BNE $904b ; (dir_readentry_iec.l35 + 0)
.s29:
02:905b : a9 00 __ LDA #$00
02:905d : 8d 86 54 STA $5486 ; (linebuffer2[0] + 5)
02:9060 : a9 01 __ LDA #$01
02:9062 : 85 43 __ STA T0 + 0 
.l30:
02:9064 : 38 __ __ SEC
02:9065 : a9 10 __ LDA #$10
02:9067 : e5 43 __ SBC T0 + 0 
02:9069 : a8 __ __ TAY
02:906a : b9 00 55 LDA $5500,y ; (presentdirelement.name[0] + 0)
02:906d : f0 08 __ BEQ $9077 ; (dir_readentry_iec.s31 + 0)
.s33:
02:906f : c9 20 __ CMP #$20
02:9071 : f0 04 __ BEQ $9077 ; (dir_readentry_iec.s31 + 0)
.s34:
02:9073 : c9 a0 __ CMP #$a0
02:9075 : d0 05 __ BNE $907c ; (dir_readentry_iec.s32 + 0)
.s31:
02:9077 : a9 00 __ LDA #$00
02:9079 : 99 00 55 STA $5500,y ; (presentdirelement.name[0] + 0)
.s32:
02:907c : e6 43 __ INC T0 + 0 
02:907e : a5 43 __ LDA T0 + 0 
02:9080 : c9 10 __ CMP #$10
02:9082 : d0 e0 __ BNE $9064 ; (dir_readentry_iec.l30 + 0)
.s77:
02:9084 : a9 00 __ LDA #$00
02:9086 : 4c 11 8f JMP $8f11 ; (dir_readentry_iec.s3 + 0)
.s41:
02:9089 : 8d 3b 55 STA $553b ; (presentdirelement.meta.type + 0)
02:908c : bd 6e 49 LDA $496e,x ; (cw.cp + 0)
02:908f : c9 3c __ CMP #$3c
02:9091 : d0 04 __ BNE $9097 ; (dir_readentry_iec.s42 + 0)
.s43:
02:9093 : a9 01 __ LDA #$01
02:9095 : d0 02 __ BNE $9099 ; (dir_readentry_iec.s78 + 0)
.s42:
02:9097 : a9 03 __ LDA #$03
.s78:
02:9099 : 8d 3f 55 STA $553f ; (presentdirelement.meta.access + 0)
02:909c : 4c 84 90 JMP $9084 ; (dir_readentry_iec.s77 + 0)
.s44:
02:909f : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:90a2 : c9 52 __ CMP #$52
02:90a4 : d0 89 __ BNE $902f ; (dir_readentry_iec.s25 + 0)
.s45:
02:90a6 : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:90a9 : c9 50 __ CMP #$50
02:90ab : d0 82 __ BNE $902f ; (dir_readentry_iec.s25 + 0)
.s46:
02:90ad : a9 14 __ LDA #$14
02:90af : d0 d8 __ BNE $9089 ; (dir_readentry_iec.s41 + 0)
.s53:
02:90b1 : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:90b4 : c9 45 __ CMP #$45
02:90b6 : f0 03 __ BEQ $90bb ; (dir_readentry_iec.s54 + 0)
02:90b8 : 4c 10 90 JMP $9010 ; (dir_readentry_iec.s23 + 0)
.s54:
02:90bb : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:90be : c9 4c __ CMP #$4c
02:90c0 : d0 f6 __ BNE $90b8 ; (dir_readentry_iec.s53 + 7)
.s55:
02:90c2 : a9 13 __ LDA #$13
02:90c4 : d0 c3 __ BNE $9089 ; (dir_readentry_iec.s41 + 0)
.s19:
02:90c6 : a9 ff __ LDA #$ff
02:90c8 : 85 45 __ STA T3 + 0 
02:90ca : a9 44 __ LDA #$44
02:90cc : 85 44 __ STA T1 + 0 
02:90ce : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:90d1 : c9 45 __ CMP #$45
02:90d3 : f0 03 __ BEQ $90d8 ; (dir_readentry_iec.s56 + 0)
02:90d5 : 4c fa 8f JMP $8ffa ; (dir_readentry_iec.s22 + 0)
.s56:
02:90d8 : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:90db : c9 4c __ CMP #$4c
02:90dd : d0 f6 __ BNE $90d5 ; (dir_readentry_iec.s19 + 15)
.s57:
02:90df : a9 00 __ LDA #$00
02:90e1 : f0 a6 __ BEQ $9089 ; (dir_readentry_iec.s41 + 0)
.s61:
02:90e3 : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:90e6 : c9 45 __ CMP #$45
02:90e8 : f0 03 __ BEQ $90ed ; (dir_readentry_iec.s62 + 0)
02:90ea : 4c cd 8f JMP $8fcd ; (dir_readentry_iec.s84 + 0)
.s62:
02:90ed : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:90f0 : c9 51 __ CMP #$51
02:90f2 : d0 f6 __ BNE $90ea ; (dir_readentry_iec.s61 + 7)
.s63:
02:90f4 : a9 10 __ LDA #$10
02:90f6 : d0 91 __ BNE $9089 ; (dir_readentry_iec.s41 + 0)
.s64:
02:90f8 : 85 44 __ STA T1 + 0 
02:90fa : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:90fd : c9 52 __ CMP #$52
02:90ff : f0 03 __ BEQ $9104 ; (dir_readentry_iec.s65 + 0)
02:9101 : 4c d6 8f JMP $8fd6 ; (dir_readentry_iec.s20 + 0)
.s65:
02:9104 : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:9107 : c9 47 __ CMP #$47
02:9109 : d0 f6 __ BNE $9101 ; (dir_readentry_iec.s64 + 9)
.s66:
02:910b : a9 11 __ LDA #$11
02:910d : 4c 89 90 JMP $9089 ; (dir_readentry_iec.s41 + 0)
.s83:
02:9110 : a4 44 __ LDY T1 + 0 
02:9112 : 4c 98 8f JMP $8f98 ; (dir_readentry_iec.s15 + 0)
--------------------------------------------------------------------
dir_readentry_uci: ; dir_readentry_uci(struct DirElement*)->u8
; 406, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s4:
02:9115 : 2c 1c df BIT $df1c 
02:9118 : 30 05 __ BMI $911f ; (dir_readentry_uci.s6 + 0)
.s5:
02:911a : a9 01 __ LDA #$01
.s3:
02:911c : 85 1b __ STA ACCU + 0 
02:911e : 60 __ __ RTS
.s6:
02:911f : 20 ce 11 JSR $11ce 
02:9122 : 20 18 11 JSR $1118 
02:9125 : a9 d7 __ LDA #$d7
02:9127 : 85 0f __ STA P2 
02:9129 : a9 49 __ LDA #$49
02:912b : 85 10 __ STA P3 
02:912d : ad d6 49 LDA $49d6 ; (uii_data[0] + 0)
02:9130 : 29 10 __ AND #$10
02:9132 : f0 02 __ BEQ $9136 ; (dir_readentry_uci.s7 + 0)
.s73:
02:9134 : a9 02 __ LDA #$02
.s7:
02:9136 : 85 46 __ STA T2 + 0 
02:9138 : a9 54 __ LDA #$54
02:913a : 85 0e __ STA P1 
02:913c : a9 81 __ LDA #$81
02:913e : 85 0d __ STA P0 
02:9140 : 20 e7 3a JSR $3ae7 
02:9143 : a9 00 __ LDA #$00
02:9145 : 85 12 __ STA P5 
02:9147 : 8d b3 54 STA $54b3 ; (linebuffer2[0] + 50)
02:914a : a9 81 __ LDA #$81
02:914c : 85 0f __ STA P2 
02:914e : a9 54 __ LDA #$54
02:9150 : 85 10 __ STA P3 
02:9152 : a9 00 __ LDA #$00
02:9154 : 85 0d __ STA P0 
02:9156 : a9 55 __ LDA #$55
02:9158 : 85 0e __ STA P1 
02:915a : 20 c9 23 JSR $23c9 
02:915d : a9 81 __ LDA #$81
02:915f : 85 0d __ STA P0 
02:9161 : a9 00 __ LDA #$00
02:9163 : 8d 32 55 STA $5532 ; (presentdirelement.name[0] + 50)
02:9166 : a9 54 __ LDA #$54
02:9168 : 85 0e __ STA P1 
02:916a : 20 6f 93 JSR $936f ; (AscToPet.s4 + 0)
02:916d : a9 72 __ LDA #$72
02:916f : 85 0d __ STA P0 
02:9171 : a9 49 __ LDA #$49
02:9173 : 85 0e __ STA P1 
02:9175 : a0 ff __ LDY #$ff
.l8:
02:9177 : c8 __ __ INY
02:9178 : b1 1b __ LDA (ACCU + 0),y 
02:917a : 99 72 49 STA $4972,y ; (linebuffer[0] + 0)
02:917d : d0 f8 __ BNE $9177 ; (dir_readentry_uci.l8 + 0)
.s9:
02:917f : 20 ad 10 JSR $10ad 
02:9182 : a9 00 __ LDA #$00
02:9184 : 8d 3e 55 STA $553e ; (presentdirelement.meta.size + 0)
02:9187 : a6 1b __ LDX ACCU + 0 
02:9189 : e8 __ __ INX
02:918a : 8e 3c 55 STX $553c ; (presentdirelement.meta.length + 0)
02:918d : a5 46 __ LDA T2 + 0 
02:918f : d0 44 __ BNE $91d5 ; (dir_readentry_uci.s74 + 0)
.s10:
02:9191 : a4 1b __ LDY ACCU + 0 
02:9193 : c0 05 __ CPY #$05
02:9195 : b0 03 __ BCS $919a ; (dir_readentry_uci.s12 + 0)
02:9197 : 4c 72 92 JMP $9272 ; (dir_readentry_uci.s11 + 0)
.s12:
02:919a : b9 6f 49 LDA $496f,y ; (cw.cp + 1)
02:919d : c9 50 __ CMP #$50
02:919f : d0 03 __ BNE $91a4 ; (dir_readentry_uci.s13 + 0)
02:91a1 : 4c 52 93 JMP $9352 ; (dir_readentry_uci.s71 + 0)
.s13:
02:91a4 : aa __ __ TAX
02:91a5 : e0 70 __ CPX #$70
02:91a7 : d0 03 __ BNE $91ac ; (dir_readentry_uci.s14 + 0)
02:91a9 : 4c 3c 93 JMP $933c ; (dir_readentry_uci.s68 + 0)
.s14:
02:91ac : e0 53 __ CPX #$53
02:91ae : d0 03 __ BNE $91b3 ; (dir_readentry_uci.s15 + 0)
02:91b0 : 4c 28 93 JMP $9328 ; (dir_readentry_uci.s66 + 0)
.s15:
02:91b3 : e0 73 __ CPX #$73
02:91b5 : d0 03 __ BNE $91ba ; (dir_readentry_uci.s16 + 0)
02:91b7 : 4c 14 93 JMP $9314 ; (dir_readentry_uci.s64 + 0)
.s16:
02:91ba : e0 55 __ CPX #$55
02:91bc : d0 03 __ BNE $91c1 ; (dir_readentry_uci.s17 + 0)
02:91be : 4c 00 93 JMP $9300 ; (dir_readentry_uci.s62 + 0)
.s17:
02:91c1 : e0 75 __ CPX #$75
02:91c3 : d0 18 __ BNE $91dd ; (dir_readentry_uci.s18 + 0)
.s59:
02:91c5 : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:91c8 : c9 73 __ CMP #$73
02:91ca : d0 11 __ BNE $91dd ; (dir_readentry_uci.s18 + 0)
.s60:
02:91cc : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:91cf : c9 72 __ CMP #$72
02:91d1 : d0 0a __ BNE $91dd ; (dir_readentry_uci.s18 + 0)
.s61:
02:91d3 : a9 12 __ LDA #$12
.s74:
02:91d5 : 8d 3b 55 STA $553b ; (presentdirelement.meta.type + 0)
02:91d8 : a9 00 __ LDA #$00
02:91da : 4c 1c 91 JMP $911c ; (dir_readentry_uci.s3 + 0)
.s18:
02:91dd : e0 44 __ CPX #$44
02:91df : d0 10 __ BNE $91f1 ; (dir_readentry_uci.s20 + 0)
.s19:
02:91e1 : e6 46 __ INC T2 + 0 
02:91e3 : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:91e6 : c9 45 __ CMP #$45
02:91e8 : d0 07 __ BNE $91f1 ; (dir_readentry_uci.s20 + 0)
.s58:
02:91ea : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:91ed : c9 4c __ CMP #$4c
02:91ef : f0 a6 __ BEQ $9197 ; (dir_readentry_uci.s10 + 6)
.s20:
02:91f1 : e0 64 __ CPX #$64
02:91f3 : d0 03 __ BNE $91f8 ; (dir_readentry_uci.s22 + 0)
02:91f5 : 4c e8 92 JMP $92e8 ; (dir_readentry_uci.s21 + 0)
.s22:
02:91f8 : a9 00 __ LDA #$00
02:91fa : 85 45 __ STA T3 + 0 
02:91fc : e0 52 __ CPX #$52
02:91fe : d0 03 __ BNE $9203 ; (dir_readentry_uci.s23 + 0)
02:9200 : 4c d4 92 JMP $92d4 ; (dir_readentry_uci.s55 + 0)
.s23:
02:9203 : e0 72 __ CPX #$72
02:9205 : d0 03 __ BNE $920a ; (dir_readentry_uci.s24 + 0)
02:9207 : 4c be 92 JMP $92be ; (dir_readentry_uci.s52 + 0)
.s24:
02:920a : e0 43 __ CPX #$43
02:920c : d0 03 __ BNE $9211 ; (dir_readentry_uci.s25 + 0)
02:920e : 4c aa 92 JMP $92aa ; (dir_readentry_uci.s50 + 0)
.s25:
02:9211 : e0 63 __ CPX #$63
02:9213 : d0 12 __ BNE $9227 ; (dir_readentry_uci.s26 + 0)
.s47:
02:9215 : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:9218 : c9 62 __ CMP #$62
02:921a : d0 0b __ BNE $9227 ; (dir_readentry_uci.s26 + 0)
.s48:
02:921c : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:921f : c9 6d __ CMP #$6d
02:9221 : d0 04 __ BNE $9227 ; (dir_readentry_uci.s26 + 0)
.s49:
02:9223 : a9 01 __ LDA #$01
02:9225 : d0 ae __ BNE $91d5 ; (dir_readentry_uci.s74 + 0)
.s26:
02:9227 : a5 46 __ LDA T2 + 0 
02:9229 : f0 0e __ BEQ $9239 ; (dir_readentry_uci.s27 + 0)
.s45:
02:922b : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:922e : c9 49 __ CMP #$49
02:9230 : d0 07 __ BNE $9239 ; (dir_readentry_uci.s27 + 0)
.s46:
02:9232 : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:9235 : c9 52 __ CMP #$52
02:9237 : f0 12 __ BEQ $924b ; (dir_readentry_uci.s44 + 0)
.s27:
02:9239 : 24 45 __ BIT T3 + 0 
02:923b : 10 12 __ BPL $924f ; (dir_readentry_uci.s28 + 0)
.s42:
02:923d : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:9240 : c9 69 __ CMP #$69
02:9242 : d0 0b __ BNE $924f ; (dir_readentry_uci.s28 + 0)
.s43:
02:9244 : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:9247 : c9 72 __ CMP #$72
02:9249 : d0 04 __ BNE $924f ; (dir_readentry_uci.s28 + 0)
.s44:
02:924b : a9 02 __ LDA #$02
02:924d : d0 86 __ BNE $91d5 ; (dir_readentry_uci.s74 + 0)
.s28:
02:924f : e0 56 __ CPX #$56
02:9251 : f0 47 __ BEQ $929a ; (dir_readentry_uci.s40 + 0)
.s29:
02:9253 : e0 76 __ CPX #$76
02:9255 : f0 30 __ BEQ $9287 ; (dir_readentry_uci.s37 + 0)
.s30:
02:9257 : e0 4c __ CPX #$4c
02:9259 : f0 1c __ BEQ $9277 ; (dir_readentry_uci.s35 + 0)
.s31:
02:925b : e0 6c __ CPX #$6c
02:925d : d0 13 __ BNE $9272 ; (dir_readentry_uci.s11 + 0)
.s32:
02:925f : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:9262 : c9 6e __ CMP #$6e
02:9264 : d0 0c __ BNE $9272 ; (dir_readentry_uci.s11 + 0)
.s33:
02:9266 : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:9269 : c9 6b __ CMP #$6b
02:926b : d0 05 __ BNE $9272 ; (dir_readentry_uci.s11 + 0)
.s34:
02:926d : a9 03 __ LDA #$03
02:926f : 4c d5 91 JMP $91d5 ; (dir_readentry_uci.s74 + 0)
.s11:
02:9272 : a9 10 __ LDA #$10
02:9274 : 4c d5 91 JMP $91d5 ; (dir_readentry_uci.s74 + 0)
.s35:
02:9277 : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:927a : c9 4e __ CMP #$4e
02:927c : d0 f4 __ BNE $9272 ; (dir_readentry_uci.s11 + 0)
.s36:
02:927e : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:9281 : c9 4b __ CMP #$4b
02:9283 : d0 ed __ BNE $9272 ; (dir_readentry_uci.s11 + 0)
02:9285 : f0 e6 __ BEQ $926d ; (dir_readentry_uci.s34 + 0)
.s37:
02:9287 : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:928a : c9 72 __ CMP #$72
02:928c : d0 cd __ BNE $925b ; (dir_readentry_uci.s31 + 0)
.s38:
02:928e : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:9291 : c9 70 __ CMP #$70
02:9293 : d0 c6 __ BNE $925b ; (dir_readentry_uci.s31 + 0)
.s39:
02:9295 : a9 14 __ LDA #$14
02:9297 : 4c d5 91 JMP $91d5 ; (dir_readentry_uci.s74 + 0)
.s40:
02:929a : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:929d : c9 52 __ CMP #$52
02:929f : d0 b6 __ BNE $9257 ; (dir_readentry_uci.s30 + 0)
.s41:
02:92a1 : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:92a4 : c9 50 __ CMP #$50
02:92a6 : f0 ed __ BEQ $9295 ; (dir_readentry_uci.s39 + 0)
02:92a8 : d0 ad __ BNE $9257 ; (dir_readentry_uci.s30 + 0)
.s50:
02:92aa : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:92ad : c9 42 __ CMP #$42
02:92af : f0 03 __ BEQ $92b4 ; (dir_readentry_uci.s51 + 0)
02:92b1 : 4c 27 92 JMP $9227 ; (dir_readentry_uci.s26 + 0)
.s51:
02:92b4 : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:92b7 : c9 4d __ CMP #$4d
02:92b9 : d0 f6 __ BNE $92b1 ; (dir_readentry_uci.s50 + 7)
02:92bb : 4c 23 92 JMP $9223 ; (dir_readentry_uci.s49 + 0)
.s52:
02:92be : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:92c1 : c9 65 __ CMP #$65
02:92c3 : f0 03 __ BEQ $92c8 ; (dir_readentry_uci.s53 + 0)
02:92c5 : 4c 11 92 JMP $9211 ; (dir_readentry_uci.s25 + 0)
.s53:
02:92c8 : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:92cb : c9 6c __ CMP #$6c
02:92cd : d0 f6 __ BNE $92c5 ; (dir_readentry_uci.s52 + 7)
.s54:
02:92cf : a9 13 __ LDA #$13
02:92d1 : 4c d5 91 JMP $91d5 ; (dir_readentry_uci.s74 + 0)
.s55:
02:92d4 : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:92d7 : c9 45 __ CMP #$45
02:92d9 : f0 03 __ BEQ $92de ; (dir_readentry_uci.s56 + 0)
02:92db : 4c 0a 92 JMP $920a ; (dir_readentry_uci.s24 + 0)
.s56:
02:92de : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:92e1 : c9 4c __ CMP #$4c
02:92e3 : f0 ea __ BEQ $92cf ; (dir_readentry_uci.s54 + 0)
02:92e5 : 4c 0a 92 JMP $920a ; (dir_readentry_uci.s24 + 0)
.s21:
02:92e8 : a9 ff __ LDA #$ff
02:92ea : 85 45 __ STA T3 + 0 
02:92ec : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:92ef : c9 65 __ CMP #$65
02:92f1 : f0 03 __ BEQ $92f6 ; (dir_readentry_uci.s57 + 0)
02:92f3 : 4c 03 92 JMP $9203 ; (dir_readentry_uci.s23 + 0)
.s57:
02:92f6 : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:92f9 : c9 6c __ CMP #$6c
02:92fb : d0 f6 __ BNE $92f3 ; (dir_readentry_uci.s21 + 11)
02:92fd : 4c 72 92 JMP $9272 ; (dir_readentry_uci.s11 + 0)
.s62:
02:9300 : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:9303 : c9 53 __ CMP #$53
02:9305 : f0 03 __ BEQ $930a ; (dir_readentry_uci.s63 + 0)
02:9307 : 4c dd 91 JMP $91dd ; (dir_readentry_uci.s18 + 0)
.s63:
02:930a : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:930d : c9 52 __ CMP #$52
02:930f : d0 f6 __ BNE $9307 ; (dir_readentry_uci.s62 + 7)
02:9311 : 4c d3 91 JMP $91d3 ; (dir_readentry_uci.s61 + 0)
.s64:
02:9314 : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:9317 : c9 65 __ CMP #$65
02:9319 : f0 03 __ BEQ $931e ; (dir_readentry_uci.s65 + 0)
02:931b : 4c c1 91 JMP $91c1 ; (dir_readentry_uci.s17 + 0)
.s65:
02:931e : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:9321 : c9 71 __ CMP #$71
02:9323 : f0 d8 __ BEQ $92fd ; (dir_readentry_uci.s57 + 7)
02:9325 : 4c c1 91 JMP $91c1 ; (dir_readentry_uci.s17 + 0)
.s66:
02:9328 : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:932b : c9 45 __ CMP #$45
02:932d : f0 03 __ BEQ $9332 ; (dir_readentry_uci.s67 + 0)
02:932f : 4c ba 91 JMP $91ba ; (dir_readentry_uci.s16 + 0)
.s67:
02:9332 : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:9335 : c9 51 __ CMP #$51
02:9337 : f0 c4 __ BEQ $92fd ; (dir_readentry_uci.s57 + 7)
02:9339 : 4c ba 91 JMP $91ba ; (dir_readentry_uci.s16 + 0)
.s68:
02:933c : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:933f : c9 72 __ CMP #$72
02:9341 : f0 03 __ BEQ $9346 ; (dir_readentry_uci.s69 + 0)
02:9343 : 4c b3 91 JMP $91b3 ; (dir_readentry_uci.s15 + 0)
.s69:
02:9346 : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:9349 : c9 67 __ CMP #$67
02:934b : d0 f6 __ BNE $9343 ; (dir_readentry_uci.s68 + 7)
.s70:
02:934d : a9 11 __ LDA #$11
02:934f : 4c d5 91 JMP $91d5 ; (dir_readentry_uci.s74 + 0)
.s71:
02:9352 : aa __ __ TAX
02:9353 : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:9356 : c9 52 __ CMP #$52
02:9358 : f0 03 __ BEQ $935d ; (dir_readentry_uci.s72 + 0)
02:935a : 4c ac 91 JMP $91ac ; (dir_readentry_uci.s14 + 0)
.s72:
02:935d : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:9360 : c9 47 __ CMP #$47
02:9362 : f0 e9 __ BEQ $934d ; (dir_readentry_uci.s70 + 0)
02:9364 : 4c ac 91 JMP $91ac ; (dir_readentry_uci.s14 + 0)
--------------------------------------------------------------------
AscToPet@proxy: ; AscToPet@proxy
02:9367 : a9 d6 __ LDA #$d6
02:9369 : 85 0d __ STA P0 
02:936b : a9 49 __ LDA #$49
02:936d : 85 0e __ STA P1 
--------------------------------------------------------------------
AscToPet: ; AscToPet(u8*)->u8*
;   4, "/home/xahmol/git/UBoot64-v2/src/petscii_ascii.h"
.s4:
02:936f : a5 0d __ LDA P0 ; (ascii + 0)
02:9371 : 85 43 __ STA T3 + 0 
02:9373 : a9 00 __ LDA #$00
02:9375 : 85 45 __ STA T4 + 0 
02:9377 : a5 0e __ LDA P1 ; (ascii + 1)
02:9379 : 85 44 __ STA T3 + 1 
02:937b : 4c 8b 93 JMP $938b ; (AscToPet.l5 + 0)
.s7:
02:937e : b1 43 __ LDA (T3 + 0),y 
02:9380 : aa __ __ TAX
02:9381 : bd 00 a2 LDA $a200,x ; (ascToPetTable[0] + 0)
02:9384 : 99 df 7e STA $7edf,y ; (convert[0] + 0)
02:9387 : e6 45 __ INC T4 + 0 
02:9389 : a5 44 __ LDA T3 + 1 
.l5:
02:938b : 85 0e __ STA P1 ; (ascii + 1)
02:938d : 20 ad 10 JSR $10ad 
02:9390 : a5 1c __ LDA ACCU + 1 
02:9392 : 30 0d __ BMI $93a1 ; (AscToPet.s6 + 0)
.s9:
02:9394 : f0 05 __ BEQ $939b ; (AscToPet.s8 + 0)
.s10:
02:9396 : a4 45 __ LDY T4 + 0 
02:9398 : 4c 7e 93 JMP $937e ; (AscToPet.s7 + 0)
.s8:
02:939b : a4 45 __ LDY T4 + 0 
02:939d : c4 1b __ CPY ACCU + 0 
02:939f : 90 dd __ BCC $937e ; (AscToPet.s7 + 0)
.s6:
02:93a1 : a9 00 __ LDA #$00
02:93a3 : a6 45 __ LDX T4 + 0 
02:93a5 : 9d df 7e STA $7edf,x ; (convert[0] + 0)
02:93a8 : a9 df __ LDA #$df
02:93aa : 85 1b __ STA ACCU + 0 
02:93ac : a9 7e __ LDA #$7e
02:93ae : 85 1c __ STA ACCU + 1 
.s3:
02:93b0 : 60 __ __ RTS
--------------------------------------------------------------------
02:93b1 : __ __ __ BYT 75 4e 4b 4e 4f 57 4e 20 54 59 50 45 00          : uNKNOWN TYPE.
--------------------------------------------------------------------
dir_get_element@proxy: ; dir_get_element@proxy
02:93be : ad fc 4c LDA $4cfc ; (present + 0)
02:93c1 : 85 0d __ STA P0 
02:93c3 : ad fd 4c LDA $4cfd ; (present + 1)
02:93c6 : 85 0e __ STA P1 
02:93c8 : ad fe 4c LDA $4cfe ; (present + 2)
02:93cb : 85 0f __ STA P2 
02:93cd : ad ff 4c LDA $4cff ; (present + 3)
02:93d0 : 85 10 __ STA P3 
--------------------------------------------------------------------
dir_get_element: ; dir_get_element(u32)->void
; 218, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s4:
02:93d2 : a9 33 __ LDA #$33
02:93d4 : 8d 02 df STA $df02 
02:93d7 : a9 55 __ LDA #$55
02:93d9 : 8d 03 df STA $df03 
02:93dc : a5 0d __ LDA P0 ; (address + 0)
02:93de : 8d 04 df STA $df04 
02:93e1 : a5 0e __ LDA P1 ; (address + 1)
02:93e3 : 8d 05 df STA $df05 
02:93e6 : a5 0f __ LDA P2 ; (address + 2)
02:93e8 : 8d 06 df STA $df06 
02:93eb : a9 12 __ LDA #$12
02:93ed : 8d 07 df STA $df07 
02:93f0 : a9 00 __ LDA #$00
02:93f2 : 8d 08 df STA $df08 
02:93f5 : 8d 0a df STA $df0a 
02:93f8 : a9 91 __ LDA #$91
02:93fa : 8d 01 df STA $df01 
02:93fd : a9 00 __ LDA #$00
02:93ff : 8d 02 df STA $df02 
02:9402 : a9 55 __ LDA #$55
02:9404 : 8d 03 df STA $df03 
02:9407 : 18 __ __ CLC
02:9408 : a5 0d __ LDA P0 ; (address + 0)
02:940a : 69 12 __ ADC #$12
02:940c : 8d 04 df STA $df04 
02:940f : a5 0e __ LDA P1 ; (address + 1)
02:9411 : 69 00 __ ADC #$00
02:9413 : 8d 05 df STA $df05 
02:9416 : a5 0f __ LDA P2 ; (address + 2)
02:9418 : 69 00 __ ADC #$00
02:941a : 8d 06 df STA $df06 
02:941d : ad 3c 55 LDA $553c ; (presentdirelement.meta.length + 0)
02:9420 : 8d 07 df STA $df07 
02:9423 : a9 00 __ LDA #$00
02:9425 : 8d 08 df STA $df08 
02:9428 : 8d 0a df STA $df0a 
02:942b : a9 91 __ LDA #$91
02:942d : 8d 01 df STA $df01 
.s3:
02:9430 : 60 __ __ RTS
--------------------------------------------------------------------
dir_print_id_and_path: ; dir_print_id_and_path()->void
; 800, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s4:
02:9431 : a9 00 __ LDA #$00
02:9433 : 85 0d __ STA P0 
02:9435 : a9 19 __ LDA #$19
02:9437 : 85 0f __ STA P2 
02:9439 : 20 06 3d JSR $3d06 
02:943c : a9 00 __ LDA #$00
02:943e : 8d 68 49 STA $4968 ; (cw.cx + 0)
02:9441 : a9 03 __ LDA #$03
02:9443 : 8d 69 49 STA $4969 ; (cw.cy + 0)
02:9446 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
02:9449 : 85 18 __ STA P11 
02:944b : a9 00 __ LDA #$00
02:944d : 85 4d __ STA T2 + 0 
02:944f : a9 56 __ LDA #$56
02:9451 : 85 4e __ STA T2 + 1 
02:9453 : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:9456 : f0 16 __ BEQ $946e ; (dir_print_id_and_path.s5 + 0)
.s14:
02:9458 : a9 2f __ LDA #$2f
02:945a : 8d e3 7f STA $7fe3 ; (sstack + 4)
02:945d : a9 95 __ LDA #$95
02:945f : 8d e4 7f STA $7fe4 ; (sstack + 5)
02:9462 : 20 25 15 JSR $1525 
02:9465 : 20 c1 2e JSR $2ec1 
02:9468 : 20 67 93 JSR $9367 ; (AscToPet@proxy + 0)
02:946b : 4c ef 94 JMP $94ef ; (dir_print_id_and_path.s10 + 0)
.s5:
02:946e : ad c2 3d LDA $3dc2 
02:9471 : 85 4c __ STA T1 + 0 
02:9473 : 8d e5 7f STA $7fe5 ; (sstack + 6)
02:9476 : a9 41 __ LDA #$41
02:9478 : 8d e3 7f STA $7fe3 ; (sstack + 4)
02:947b : a9 95 __ LDA #$95
02:947d : 8d e4 7f STA $7fe4 ; (sstack + 5)
02:9480 : a9 00 __ LDA #$00
02:9482 : 8d e6 7f STA $7fe6 ; (sstack + 7)
02:9485 : a9 7b __ LDA #$7b
02:9487 : 8d e7 7f STA $7fe7 ; (sstack + 8)
02:948a : a9 53 __ LDA #$53
02:948c : 8d e8 7f STA $7fe8 ; (sstack + 9)
02:948f : 20 25 15 JSR $1525 
02:9492 : a9 00 __ LDA #$00
02:9494 : 8d 68 49 STA $4968 ; (cw.cx + 0)
02:9497 : a9 18 __ LDA #$18
02:9499 : 8d 69 49 STA $4969 ; (cw.cy + 0)
02:949c : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
02:949f : 85 18 __ STA P11 
02:94a1 : a9 4b __ LDA #$4b
02:94a3 : 8d e3 7f STA $7fe3 ; (sstack + 4)
02:94a6 : a9 95 __ LDA #$95
02:94a8 : 8d e4 7f STA $7fe4 ; (sstack + 5)
02:94ab : a6 4c __ LDX T1 + 0 
02:94ad : bd 45 55 LDA $5545,x ; (devicetype[0] + 0)
02:94b0 : 0a __ __ ASL
02:94b1 : aa __ __ TAX
02:94b2 : bd c3 3d LDA $3dc3,x 
02:94b5 : 8d e5 7f STA $7fe5 ; (sstack + 6)
02:94b8 : bd c4 3d LDA $3dc4,x 
02:94bb : 8d e6 7f STA $7fe6 ; (sstack + 7)
02:94be : ad 7b 54 LDA $547b ; (presentdir.free + 0)
02:94c1 : 8d e7 7f STA $7fe7 ; (sstack + 8)
02:94c4 : ad 7c 54 LDA $547c ; (presentdir.free + 1)
02:94c7 : 8d e8 7f STA $7fe8 ; (sstack + 9)
02:94ca : 20 25 15 JSR $1525 
02:94cd : ad bb 3d LDA $3dbb 
02:94d0 : d0 1a __ BNE $94ec ; (dir_print_id_and_path.s9 + 0)
.s6:
02:94d2 : a2 ff __ LDX #$ff
.l7:
02:94d4 : e8 __ __ INX
02:94d5 : bd 5c 95 LDA $955c,x 
02:94d8 : 9d 81 54 STA $5481,x ; (linebuffer2[0] + 0)
02:94db : d0 f7 __ BNE $94d4 ; (dir_print_id_and_path.l7 + 0)
.s8:
02:94dd : a9 04 __ LDA #$04
02:94df : 85 0e __ STA P1 
02:94e1 : a9 81 __ LDA #$81
02:94e3 : 85 0f __ STA P2 
02:94e5 : a9 54 __ LDA #$54
02:94e7 : 85 10 __ STA P3 
02:94e9 : 4c 7f 3b JMP $3b7f 
.s9:
02:94ec : 20 ea 2e JSR $2eea 
.s10:
02:94ef : a9 00 __ LDA #$00
02:94f1 : 85 0d __ STA P0 
02:94f3 : a9 56 __ LDA #$56
02:94f5 : 85 0e __ STA P1 
02:94f7 : a9 ff __ LDA #$ff
02:94f9 : 85 11 __ STA P4 
02:94fb : a9 00 __ LDA #$00
02:94fd : 85 12 __ STA P5 
02:94ff : 20 f2 3a JSR $3af2 
02:9502 : a9 00 __ LDA #$00
02:9504 : 85 0d __ STA P0 
02:9506 : a9 00 __ LDA #$00
02:9508 : 8d ff 56 STA $56ff ; (pathbuffer[0] + 255)
02:950b : a9 56 __ LDA #$56
02:950d : 85 0e __ STA P1 
02:950f : 20 ad 10 JSR $10ad 
02:9512 : a5 1b __ LDA ACCU + 0 
02:9514 : c9 19 __ CMP #$19
02:9516 : 90 0b __ BCC $9523 ; (dir_print_id_and_path.s11 + 0)
.s13:
02:9518 : 18 __ __ CLC
02:9519 : 69 e8 __ ADC #$e8
02:951b : 85 4d __ STA T2 + 0 
02:951d : a9 55 __ LDA #$55
02:951f : 69 00 __ ADC #$00
02:9521 : 85 4e __ STA T2 + 1 
.s11:
02:9523 : a0 ff __ LDY #$ff
.l12:
02:9525 : c8 __ __ INY
02:9526 : b1 4d __ LDA (T2 + 0),y 
02:9528 : 99 81 54 STA $5481,y ; (linebuffer2[0] + 0)
02:952b : d0 f8 __ BNE $9525 ; (dir_print_id_and_path.l12 + 0)
02:952d : f0 ae __ BEQ $94dd ; (dir_print_id_and_path.s8 + 0)
--------------------------------------------------------------------
02:952f : __ __ __ BYT 5b 75 63 69 20 46 49 4c 45 20 53 59 53 54 45 4d : [uci FILE SYSTEM
02:953f : __ __ __ BYT 5d 00                                           : ].
--------------------------------------------------------------------
02:9541 : __ __ __ BYT 5b 25 30 32 49 5d 20 25 53 00                   : [%02I] %S.
--------------------------------------------------------------------
02:954b : __ __ __ BYT 28 25 53 29 20 25 55 20 42 4c 2e 20 46 52 45 45 : (%S) %U BL. FREE
02:955b : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
02:955c : __ __ __ BYT 6e 4f 20 44 49 52 54 52 41 43 45 20 41 43 54 49 : nO DIRTRACE ACTI
02:956c : __ __ __ BYT 56 45 2e 00                                     : VE..
--------------------------------------------------------------------
02:9570 : __ __ __ BYT 65 4d 50 54 59 20 44 49 52 45 43 54 4f 52 59 2e : eMPTY DIRECTORY.
02:9580 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
dir_print_entry@proxy: ; dir_print_entry@proxy
02:9581 : a5 57 __ LDA $57 
02:9583 : 85 18 __ STA P11 
--------------------------------------------------------------------
dir_print_entry: ; dir_print_entry(u8)->void
; 849, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s4:
02:9585 : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:9588 : f0 46 __ BEQ $95d0 ; (dir_print_entry.s5 + 0)
.s12:
02:958a : a9 00 __ LDA #$00
02:958c : 85 0d __ STA P0 
02:958e : a9 55 __ LDA #$55
02:9590 : 85 0e __ STA P1 
02:9592 : 20 6f 93 JSR $936f ; (AscToPet.s4 + 0)
02:9595 : a5 1b __ LDA ACCU + 0 
02:9597 : 85 0f __ STA P2 
02:9599 : a5 1c __ LDA ACCU + 1 
02:959b : 85 10 __ STA P3 
02:959d : a9 15 __ LDA #$15
02:959f : 85 11 __ STA P4 
02:95a1 : 20 18 3b JSR $3b18 
02:95a4 : a9 00 __ LDA #$00
02:95a6 : 8d de 7e STA $7ede ; (namebuffer[0] + 21)
02:95a9 : ad 3b 55 LDA $553b ; (presentdirelement.meta.type + 0)
02:95ac : 20 49 96 JSR $9649 ; (fileTypeToStr.s4 + 0)
02:95af : a9 c9 __ LDA #$c9
02:95b1 : 8d e7 7f STA $7fe7 ; (sstack + 8)
02:95b4 : a9 7e __ LDA #$7e
02:95b6 : 8d e8 7f STA $7fe8 ; (sstack + 9)
02:95b9 : a5 1b __ LDA ACCU + 0 
02:95bb : 8d e9 7f STA $7fe9 ; (sstack + 10)
02:95be : a5 1c __ LDA ACCU + 1 
02:95c0 : 8d ea 7f STA $7fea ; (sstack + 11)
02:95c3 : a9 40 __ LDA #$40
02:95c5 : 8d e5 7f STA $7fe5 ; (sstack + 6)
02:95c8 : a9 96 __ LDA #$96
02:95ca : 8d e6 7f STA $7fe6 ; (sstack + 7)
02:95cd : 4c 18 96 JMP $9618 ; (dir_print_entry.s8 + 0)
.s5:
02:95d0 : a9 00 __ LDA #$00
02:95d2 : 85 0f __ STA P2 
02:95d4 : a9 55 __ LDA #$55
02:95d6 : 85 10 __ STA P3 
02:95d8 : a9 10 __ LDA #$10
02:95da : 85 11 __ STA P4 
02:95dc : 20 18 3b JSR $3b18 
02:95df : ad 3b 55 LDA $553b ; (presentdirelement.meta.type + 0)
02:95e2 : 20 49 96 JSR $9649 ; (fileTypeToStr.s4 + 0)
02:95e5 : a9 c9 __ LDA #$c9
02:95e7 : 8d e9 7f STA $7fe9 ; (sstack + 10)
02:95ea : a9 7e __ LDA #$7e
02:95ec : 8d ea 7f STA $7fea ; (sstack + 11)
02:95ef : a9 81 __ LDA #$81
02:95f1 : 8d eb 7f STA $7feb ; (sstack + 12)
02:95f4 : a9 54 __ LDA #$54
02:95f6 : 8d ec 7f STA $7fec ; (sstack + 13)
02:95f9 : a0 ff __ LDY #$ff
.l6:
02:95fb : c8 __ __ INY
02:95fc : b1 1b __ LDA (ACCU + 0),y 
02:95fe : 99 81 54 STA $5481,y ; (linebuffer2[0] + 0)
02:9601 : d0 f8 __ BNE $95fb ; (dir_print_entry.l6 + 0)
.s7:
02:9603 : a9 b1 __ LDA #$b1
02:9605 : 8d e5 7f STA $7fe5 ; (sstack + 6)
02:9608 : a9 96 __ LDA #$96
02:960a : 8d e6 7f STA $7fe6 ; (sstack + 7)
02:960d : ad 3e 55 LDA $553e ; (presentdirelement.meta.size + 0)
02:9610 : 8d e7 7f STA $7fe7 ; (sstack + 8)
02:9613 : a9 00 __ LDA #$00
02:9615 : 8d e8 7f STA $7fe8 ; (sstack + 9)
.s8:
02:9618 : a9 72 __ LDA #$72
02:961a : 8d e3 7f STA $7fe3 ; (sstack + 4)
02:961d : a9 49 __ LDA #$49
02:961f : 8d e4 7f STA $7fe4 ; (sstack + 5)
02:9622 : 20 d1 15 JSR $15d1 
02:9625 : 18 __ __ CLC
02:9626 : a5 18 __ LDA P11 ; (printpos + 0)
02:9628 : 69 05 __ ADC #$05
02:962a : 85 10 __ STA P3 
02:962c : 85 0e __ STA P1 
02:962e : ad 7a 53 LDA $537a ; (presentdir.position + 1)
02:9631 : d0 07 __ BNE $963a ; (dir_print_entry.s9 + 0)
.s11:
02:9633 : a5 18 __ LDA P11 ; (printpos + 0)
02:9635 : cd 79 53 CMP $5379 ; (presentdir.position + 0)
02:9638 : f0 03 __ BEQ $963d ; (dir_print_entry.s10 + 0)
.s9:
02:963a : 4c 8b 3b JMP $3b8b 
.s10:
02:963d : 4c 5b 3c JMP $3c5b 
--------------------------------------------------------------------
02:9640 : __ __ __ BYT 25 2d 32 31 53 20 25 53 00                      : %-21S %S.
--------------------------------------------------------------------
fileTypeToStr: ; fileTypeToStr(u8)->const u8*
; 719, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s4:
02:9649 : aa __ __ TAX
02:964a : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:964d : f0 0d __ BEQ $965c ; (fileTypeToStr.s5 + 0)
.s11:
02:964f : e0 02 __ CPX #$02
02:9651 : f0 09 __ BEQ $965c ; (fileTypeToStr.s5 + 0)
.s12:
02:9653 : a9 fb __ LDA #$fb
02:9655 : 85 1b __ STA ACCU + 0 
02:9657 : a9 88 __ LDA #$88
.s3:
02:9659 : 85 1c __ STA ACCU + 1 
02:965b : 60 __ __ RTS
.s5:
02:965c : 8a __ __ TXA
02:965d : 29 10 __ AND #$10
02:965f : d0 3b __ BNE $969c ; (fileTypeToStr.s9 + 0)
.s6:
02:9661 : 8a __ __ TXA
02:9662 : e0 06 __ CPX #$06
02:9664 : b0 0d __ BCS $9673 ; (fileTypeToStr.s7 + 0)
.s8:
02:9666 : 0a __ __ ASL
02:9667 : aa __ __ TAX
02:9668 : bd eb 3d LDA $3deb,x 
02:966b : 85 1b __ STA ACCU + 0 
02:966d : bd ec 3d LDA $3dec,x 
02:9670 : 4c 59 96 JMP $9659 ; (fileTypeToStr.s3 + 0)
.s7:
02:9673 : a9 3f __ LDA #$3f
02:9675 : 8d e5 54 STA $54e5 ; (bad_type[0] + 0)
02:9678 : a9 00 __ LDA #$00
02:967a : 8d e8 54 STA $54e8 ; (bad_type[0] + 3)
02:967d : 8a __ __ TXA
02:967e : 4a __ __ LSR
02:967f : 4a __ __ LSR
02:9680 : 4a __ __ LSR
02:9681 : 4a __ __ LSR
02:9682 : a8 __ __ TAY
02:9683 : b9 53 30 LDA $3053,y 
02:9686 : 8d e6 54 STA $54e6 ; (bad_type[0] + 1)
02:9689 : 8a __ __ TXA
02:968a : 29 0f __ AND #$0f
02:968c : aa __ __ TAX
02:968d : bd 53 30 LDA $3053,x 
02:9690 : 8d e7 54 STA $54e7 ; (bad_type[0] + 2)
02:9693 : a9 e5 __ LDA #$e5
02:9695 : 85 1b __ STA ACCU + 0 
02:9697 : a9 54 __ LDA #$54
02:9699 : 4c 59 96 JMP $9659 ; (fileTypeToStr.s3 + 0)
.s9:
02:969c : 8a __ __ TXA
02:969d : 29 ef __ AND #$ef
02:969f : c9 05 __ CMP #$05
02:96a1 : aa __ __ TAX
02:96a2 : b0 cf __ BCS $9673 ; (fileTypeToStr.s7 + 0)
.s10:
02:96a4 : 0a __ __ ASL
02:96a5 : aa __ __ TAX
02:96a6 : bd e1 3d LDA $3de1,x 
02:96a9 : 85 1b __ STA ACCU + 0 
02:96ab : bd e2 3d LDA $3de2,x 
02:96ae : 4c 59 96 JMP $9659 ; (fileTypeToStr.s3 + 0)
--------------------------------------------------------------------
02:96b1 : __ __ __ BYT 25 34 55 20 25 2d 31 36 53 20 25 53 00          : %4U %-16S %S.
--------------------------------------------------------------------
dir_changedir: ; dir_changedir(u8*)->void
;1022, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s1:
02:96be : a2 05 __ LDX #$05
02:96c0 : b5 53 __ LDA T0 + 0,x 
02:96c2 : 9d 4d 7e STA $7e4d,x ; (dir_changedir@stack + 0)
02:96c5 : ca __ __ DEX
02:96c6 : 10 f8 __ BPL $96c0 ; (dir_changedir.s1 + 2)
.s4:
02:96c8 : ad fa 7f LDA $7ffa ; (sstack + 27)
02:96cb : 85 0d __ STA P0 
02:96cd : 85 55 __ STA T1 + 0 
02:96cf : ad fb 7f LDA $7ffb ; (sstack + 28)
02:96d2 : 85 56 __ STA T1 + 1 
02:96d4 : 85 0e __ STA P1 
02:96d6 : 20 ad 10 JSR $10ad 
02:96d9 : a5 0d __ LDA P0 
02:96db : 05 56 __ ORA T1 + 1 
02:96dd : d0 63 __ BNE $9742 ; (dir_changedir.s14 + 0)
.s5:
02:96df : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:96e2 : d0 43 __ BNE $9727 ; (dir_changedir.s11 + 0)
.s6:
02:96e4 : 85 0d __ STA P0 
02:96e6 : a9 02 __ LDA #$02
02:96e8 : 85 0e __ STA P1 
02:96ea : a2 ff __ LDX #$ff
.l7:
02:96ec : e8 __ __ INX
02:96ed : bd 6a 9a LDA $9a6a,x 
02:96f0 : 9d 72 49 STA $4972,x ; (linebuffer[0] + 0)
02:96f3 : d0 f7 __ BNE $96ec ; (dir_changedir.l7 + 0)
.s8:
02:96f5 : a9 6f __ LDA #$6f
02:96f7 : 85 0f __ STA P2 
02:96f9 : a9 9a __ LDA #$9a
02:96fb : 85 10 __ STA P3 
02:96fd : 20 ab 3b JSR $3bab 
.s9:
02:9700 : ad c2 3d LDA $3dc2 
02:9703 : 85 10 __ STA P3 
02:9705 : a9 72 __ LDA #$72
02:9707 : 85 11 __ STA P4 
02:9709 : a9 49 __ LDA #$49
02:970b : 85 12 __ STA P5 
02:970d : 20 79 2d JSR $2d79 
02:9710 : a5 1b __ LDA ACCU + 0 
02:9712 : d0 08 __ BNE $971c ; (dir_changedir.s3 + 0)
.s10:
02:9714 : a9 01 __ LDA #$01
02:9716 : 8d f9 7f STA $7ff9 ; (sstack + 26)
02:9719 : 20 07 85 JSR $8507 ; (dir_draw.s1 + 0)
.s3:
02:971c : a2 05 __ LDX #$05
02:971e : bd 4d 7e LDA $7e4d,x ; (dir_changedir@stack + 0)
02:9721 : 95 53 __ STA T0 + 0,x 
02:9723 : ca __ __ DEX
02:9724 : 10 f8 __ BPL $971e ; (dir_changedir.s3 + 2)
02:9726 : 60 __ __ RTS
.s11:
02:9727 : a9 68 __ LDA #$68
02:9729 : 85 11 __ STA P4 
02:972b : a9 9a __ LDA #$9a
02:972d : 85 12 __ STA P5 
02:972f : 20 66 14 JSR $1466 
.s12:
02:9732 : ad d7 4b LDA $4bd7 ; (uii_status[0] + 0)
02:9735 : c9 30 __ CMP #$30
02:9737 : d0 e3 __ BNE $971c ; (dir_changedir.s3 + 0)
.s13:
02:9739 : ad d8 4b LDA $4bd8 ; (uii_status[0] + 1)
02:973c : c9 30 __ CMP #$30
02:973e : d0 dc __ BNE $971c ; (dir_changedir.s3 + 0)
02:9740 : f0 d2 __ BEQ $9714 ; (dir_changedir.s10 + 0)
.s14:
02:9742 : a5 1b __ LDA ACCU + 0 
02:9744 : 85 57 __ STA T2 + 0 
02:9746 : a5 55 __ LDA T1 + 0 
02:9748 : 85 11 __ STA P4 
02:974a : a5 56 __ LDA T1 + 1 
02:974c : 85 12 __ STA P5 
02:974e : 20 2b 99 JSR $992b ; (CheckMounttype.s4 + 0)
02:9751 : ad be 3d LDA $3dbe 
02:9754 : c9 02 __ CMP #$02
02:9756 : 85 58 __ STA T3 + 0 
02:9758 : d0 03 __ BNE $975d ; (dir_changedir.s15 + 0)
02:975a : 4c bb 98 JMP $98bb ; (dir_changedir.s40 + 0)
.s15:
02:975d : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:9760 : d0 03 __ BNE $9765 ; (dir_changedir.s27 + 0)
02:9762 : 4c 68 98 JMP $9868 ; (dir_changedir.s16 + 0)
.s27:
02:9765 : ad f6 4c LDA $4cf6 ; (inside_mount + 0)
02:9768 : d0 f8 __ BNE $9762 ; (dir_changedir.s15 + 5)
.s28:
02:976a : a6 58 __ LDX T3 + 0 
02:976c : ca __ __ DEX
02:976d : f0 4b __ BEQ $97ba ; (dir_changedir.s30 + 0)
.s29:
02:976f : a5 55 __ LDA T1 + 0 
02:9771 : 85 11 __ STA P4 
02:9773 : a5 56 __ LDA T1 + 1 
02:9775 : 85 12 __ STA P5 
02:9777 : 20 66 14 JSR $1466 
.s22:
02:977a : ae bb 3d LDX $3dbb 
02:977d : ca __ __ DEX
02:977e : d0 2f __ BNE $97af ; (dir_changedir.s23 + 0)
.s24:
02:9780 : a5 55 __ LDA T1 + 0 
02:9782 : 85 0f __ STA P2 
02:9784 : a5 56 __ LDA T1 + 1 
02:9786 : 85 10 __ STA P3 
02:9788 : a9 00 __ LDA #$00
02:978a : ae bc 3d LDX $3dbc 
02:978d : 18 __ __ CLC
02:978e : 7d 9f 3a ADC $3a9f,x 
02:9791 : 85 53 __ STA T0 + 0 
02:9793 : 85 0d __ STA P0 
02:9795 : a9 33 __ LDA #$33
02:9797 : 85 11 __ STA P4 
02:9799 : a9 00 __ LDA #$00
02:979b : 85 12 __ STA P5 
02:979d : a9 57 __ LDA #$57
02:979f : 7d a7 3a ADC $3aa7,x 
02:97a2 : 85 54 __ STA T0 + 1 
02:97a4 : 85 0e __ STA P1 
02:97a6 : 20 c9 23 JSR $23c9 
02:97a9 : a9 00 __ LDA #$00
02:97ab : a0 32 __ LDY #$32
02:97ad : 91 53 __ STA (T0 + 0),y 
.s23:
02:97af : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:97b2 : f0 03 __ BEQ $97b7 ; (dir_changedir.s23 + 8)
02:97b4 : 4c 32 97 JMP $9732 ; (dir_changedir.s12 + 0)
02:97b7 : 4c 00 97 JMP $9700 ; (dir_changedir.s9 + 0)
.s30:
02:97ba : 20 35 26 JSR $2635 
02:97bd : a5 1b __ LDA ACCU + 0 
02:97bf : d0 10 __ BNE $97d1 ; (dir_changedir.s32 + 0)
.s31:
02:97c1 : 20 f6 0d JSR $0df6 
02:97c4 : a9 3b __ LDA #$3b
02:97c6 : 8d eb 7f STA $7feb ; (sstack + 12)
02:97c9 : a9 9a __ LDA #$9a
02:97cb : 8d ec 7f STA $7fec ; (sstack + 13)
02:97ce : 20 01 15 JSR $1501 
.s32:
02:97d1 : ad e7 4c LDA $4ce7 ; (uii_devinfo[0].id + 0)
02:97d4 : 85 57 __ STA T2 + 0 
02:97d6 : 8d c2 3d STA $3dc2 
02:97d9 : 8d c1 3d STA $3dc1 
02:97dc : a9 00 __ LDA #$00
02:97de : 85 0d __ STA P0 
02:97e0 : a9 55 __ LDA #$55
02:97e2 : 85 10 __ STA P3 
02:97e4 : a9 40 __ LDA #$40
02:97e6 : 85 0e __ STA P1 
02:97e8 : a9 64 __ LDA #$64
02:97ea : 85 0f __ STA P2 
02:97ec : 20 e7 3a JSR $3ae7 
02:97ef : a9 00 __ LDA #$00
02:97f1 : 8d 32 40 STA $4032 
02:97f4 : ad e6 4c LDA $4ce6 ; (uii_devinfo[0].power + 0)
02:97f7 : d0 12 __ BNE $980b ; (dir_changedir.s35 + 0)
.s33:
02:97f9 : 20 75 2a JSR $2a75 
02:97fc : a9 00 __ LDA #$00
02:97fe : 8d 09 dc STA $dc09 
02:9801 : 8d 08 dc STA $dc08 
.l34:
02:9804 : ad 09 dc LDA $dc09 
02:9807 : c9 02 __ CMP #$02
02:9809 : 90 f9 __ BCC $9804 ; (dir_changedir.l34 + 0)
.s35:
02:980b : a5 57 __ LDA T2 + 0 
02:980d : 85 13 __ STA P6 
02:980f : 20 64 30 JSR $3064 
02:9812 : a5 13 __ LDA P6 
02:9814 : 85 11 __ STA P4 
02:9816 : a5 55 __ LDA T1 + 0 
02:9818 : 85 12 __ STA P5 
02:981a : a5 56 __ LDA T1 + 1 
02:981c : 85 13 __ STA P6 
02:981e : 20 f4 2a JSR $2af4 
02:9821 : a9 00 __ LDA #$00
02:9823 : 8d 09 dc STA $dc09 
02:9826 : 8d 08 dc STA $dc08 
.l36:
02:9829 : ad 09 dc LDA $dc09 
02:982c : c9 02 __ CMP #$02
02:982e : 90 f9 __ BCC $9829 ; (dir_changedir.l36 + 0)
.s37:
02:9830 : 20 c1 2e JSR $2ec1 
02:9833 : 20 fd 3a JSR $3afd 
02:9836 : a9 00 __ LDA #$00
02:9838 : 8d ff 3f STA $3fff 
02:983b : ad d7 4b LDA $4bd7 ; (uii_status[0] + 0)
02:983e : c9 30 __ CMP #$30
02:9840 : f0 03 __ BEQ $9845 ; (dir_changedir.s38 + 0)
02:9842 : 4c 1c 97 JMP $971c ; (dir_changedir.s3 + 0)
.s38:
02:9845 : ad d8 4b LDA $4bd8 ; (uii_status[0] + 1)
02:9848 : c9 30 __ CMP #$30
02:984a : d0 f6 __ BNE $9842 ; (dir_changedir.s37 + 18)
.s39:
02:984c : a9 01 __ LDA #$01
02:984e : 8d f9 7f STA $7ff9 ; (sstack + 26)
02:9851 : 8d f6 4c STA $4cf6 ; (inside_mount + 0)
02:9854 : 8d bb 3d STA $3dbb 
02:9857 : a9 00 __ LDA #$00
02:9859 : 8d bc 3d STA $3dbc 
02:985c : 8d f7 4c STA $4cf7 ; (fb_uci_mode + 0)
02:985f : 20 07 85 JSR $8507 ; (dir_draw.s1 + 0)
02:9862 : 20 0c 86 JSR $860c ; (browse_menu.s4 + 0)
02:9865 : 4c 80 97 JMP $9780 ; (dir_changedir.s24 + 0)
.s16:
02:9868 : a6 58 __ LDX T3 + 0 
02:986a : ca __ __ DEX
02:986b : f0 2a __ BEQ $9897 ; (dir_changedir.s25 + 0)
.s17:
02:986d : a4 57 __ LDY T2 + 0 
02:986f : 88 __ __ DEY
02:9870 : d0 06 __ BNE $9878 ; (dir_changedir.s18 + 0)
.s26:
02:9872 : b1 55 __ LDA (T1 + 0),y 
02:9874 : c9 5f __ CMP #$5f
02:9876 : f0 1f __ BEQ $9897 ; (dir_changedir.s25 + 0)
.s18:
02:9878 : ae c2 3d LDX $3dc2 
02:987b : bd 45 55 LDA $5545,x ; (devicetype[0] + 0)
02:987e : c9 0d __ CMP #$0d
02:9880 : f0 15 __ BEQ $9897 ; (dir_changedir.s25 + 0)
.s19:
02:9882 : c9 0e __ CMP #$0e
02:9884 : f0 11 __ BEQ $9897 ; (dir_changedir.s25 + 0)
.s20:
02:9886 : a9 72 __ LDA #$72
02:9888 : 8d e3 7f STA $7fe3 ; (sstack + 4)
02:988b : a9 49 __ LDA #$49
02:988d : 8d e4 7f STA $7fe4 ; (sstack + 5)
02:9890 : a9 9a __ LDA #$9a
02:9892 : a2 61 __ LDX #$61
02:9894 : 4c a5 98 JMP $98a5 ; (dir_changedir.s21 + 0)
.s25:
02:9897 : a9 72 __ LDA #$72
02:9899 : 8d e3 7f STA $7fe3 ; (sstack + 4)
02:989c : a9 49 __ LDA #$49
02:989e : 8d e4 7f STA $7fe4 ; (sstack + 5)
02:98a1 : a9 9a __ LDA #$9a
02:98a3 : a2 5b __ LDX #$5b
.s21:
02:98a5 : 8e e5 7f STX $7fe5 ; (sstack + 6)
02:98a8 : 8d e6 7f STA $7fe6 ; (sstack + 7)
02:98ab : a5 55 __ LDA T1 + 0 
02:98ad : 8d e7 7f STA $7fe7 ; (sstack + 8)
02:98b0 : a5 56 __ LDA T1 + 1 
02:98b2 : 8d e8 7f STA $7fe8 ; (sstack + 9)
02:98b5 : 20 d1 15 JSR $15d1 
02:98b8 : 4c 7a 97 JMP $977a ; (dir_changedir.s22 + 0)
.s40:
02:98bb : ae bb 3d LDX $3dbb 
02:98be : ca __ __ DEX
02:98bf : f0 05 __ BEQ $98c6 ; (dir_changedir.s42 + 0)
.s41:
02:98c1 : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:98c4 : f0 a2 __ BEQ $9868 ; (dir_changedir.s16 + 0)
.s42:
02:98c6 : a5 11 __ LDA P4 
02:98c8 : 85 0f __ STA P2 
02:98ca : a5 12 __ LDA P5 
02:98cc : 85 10 __ STA P3 
02:98ce : a9 33 __ LDA #$33
02:98d0 : 85 11 __ STA P4 
02:98d2 : a9 01 __ LDA #$01
02:98d4 : 8d bd 3d STA $3dbd 
02:98d7 : a9 64 __ LDA #$64
02:98d9 : 85 0d __ STA P0 
02:98db : a9 55 __ LDA #$55
02:98dd : 85 0e __ STA P1 
02:98df : 20 f4 1f JSR $1ff4 
02:98e2 : a9 00 __ LDA #$00
02:98e4 : 8d 96 55 STA $5596 ; (imagename[0] + 50)
02:98e7 : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:98ea : f0 19 __ BEQ $9905 ; (dir_changedir.s43 + 0)
.s44:
02:98ec : 20 c1 2e JSR $2ec1 
02:98ef : 20 67 93 JSR $9367 ; (AscToPet@proxy + 0)
02:98f2 : a5 1b __ LDA ACCU + 0 
02:98f4 : 85 0f __ STA P2 
02:98f6 : a5 1c __ LDA ACCU + 1 
02:98f8 : 85 10 __ STA P3 
02:98fa : 20 d4 3a JSR $3ad4 
02:98fd : a9 00 __ LDA #$00
02:98ff : 8d ff 3e STA $3eff 
02:9902 : 4c 65 97 JMP $9765 ; (dir_changedir.s27 + 0)
.s43:
02:9905 : 20 ea 2e JSR $2eea 
02:9908 : a9 00 __ LDA #$00
02:990a : 85 11 __ STA P4 
02:990c : a9 3f __ LDA #$3f
02:990e : 85 0e __ STA P1 
02:9910 : a9 01 __ LDA #$01
02:9912 : 85 12 __ STA P5 
02:9914 : a9 00 __ LDA #$00
02:9916 : 85 0d __ STA P0 
02:9918 : 20 f2 3a JSR $3af2 
02:991b : a9 00 __ LDA #$00
02:991d : 8d ff 3f STA $3fff 
02:9920 : 4c 6d 98 JMP $986d ; (dir_changedir.s17 + 0)
--------------------------------------------------------------------
CheckMounttype@proxy: ; CheckMounttype@proxy
02:9923 : a9 00 __ LDA #$00
02:9925 : 85 11 __ STA P4 
02:9927 : a9 55 __ LDA #$55
02:9929 : 85 12 __ STA P5 
--------------------------------------------------------------------
CheckMounttype: ; CheckMounttype(u8*)->void
; 745, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s4:
02:992b : a5 11 __ LDA P4 ; (dirname + 0)
02:992d : 85 0d __ STA P0 
02:992f : 85 46 __ STA T0 + 0 
02:9931 : a5 12 __ LDA P5 ; (dirname + 1)
02:9933 : 85 0e __ STA P1 
02:9935 : 85 47 __ STA T0 + 1 
02:9937 : 20 ad 10 JSR $10ad 
02:993a : a5 1b __ LDA ACCU + 0 
02:993c : 85 48 __ STA T1 + 0 
02:993e : a9 00 __ LDA #$00
02:9940 : 8d be 3d STA $3dbe 
02:9943 : ad f7 4c LDA $4cf7 ; (fb_uci_mode + 0)
02:9946 : 85 49 __ STA T6 + 0 
02:9948 : f0 0f __ BEQ $9959 ; (CheckMounttype.s5 + 0)
.s45:
02:994a : a5 12 __ LDA P5 ; (dirname + 1)
02:994c : 85 0e __ STA P1 
02:994e : 20 6f 93 JSR $936f ; (AscToPet.s4 + 0)
02:9951 : a5 1b __ LDA ACCU + 0 
02:9953 : 85 46 __ STA T0 + 0 
02:9955 : a5 1c __ LDA ACCU + 1 
02:9957 : 85 47 __ STA T0 + 1 
.s5:
02:9959 : a0 ff __ LDY #$ff
.l6:
02:995b : c8 __ __ INY
02:995c : b1 46 __ LDA (T0 + 0),y 
02:995e : 99 72 49 STA $4972,y ; (linebuffer[0] + 0)
02:9961 : d0 f8 __ BNE $995b ; (CheckMounttype.l6 + 0)
.s7:
02:9963 : a4 48 __ LDY T1 + 0 
02:9965 : c0 05 __ CPY #$05
02:9967 : 90 07 __ BCC $9970 ; (CheckMounttype.s3 + 0)
.s8:
02:9969 : b9 6e 49 LDA $496e,y ; (cw.cp + 0)
02:996c : c9 2e __ CMP #$2e
02:996e : f0 01 __ BEQ $9971 ; (CheckMounttype.s9 + 0)
.s3:
02:9970 : 60 __ __ RTS
.s9:
02:9971 : be 6f 49 LDX $496f,y ; (cw.cp + 1)
02:9974 : e0 44 __ CPX #$44
02:9976 : d0 06 __ BNE $997e ; (CheckMounttype.s11 + 0)
.s10:
02:9978 : a9 01 __ LDA #$01
02:997a : 85 1b __ STA ACCU + 0 
02:997c : d0 08 __ BNE $9986 ; (CheckMounttype.s42 + 0)
.s11:
02:997e : a9 00 __ LDA #$00
02:9980 : 85 1b __ STA ACCU + 0 
02:9982 : e0 64 __ CPX #$64
02:9984 : d0 13 __ BNE $9999 ; (CheckMounttype.s12 + 0)
.s42:
02:9986 : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:9989 : c9 36 __ CMP #$36
02:998b : d0 0c __ BNE $9999 ; (CheckMounttype.s12 + 0)
.s43:
02:998d : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:9990 : c9 34 __ CMP #$34
02:9992 : d0 05 __ BNE $9999 ; (CheckMounttype.s12 + 0)
.s44:
02:9994 : a9 01 __ LDA #$01
02:9996 : 8d be 3d STA $3dbe 
.s12:
02:9999 : e0 47 __ CPX #$47
02:999b : d0 06 __ BNE $99a3 ; (CheckMounttype.s14 + 0)
.s13:
02:999d : a9 ff __ LDA #$ff
02:999f : 85 43 __ STA T3 + 0 
02:99a1 : d0 08 __ BNE $99ab ; (CheckMounttype.s40 + 0)
.s14:
02:99a3 : a9 00 __ LDA #$00
02:99a5 : 85 43 __ STA T3 + 0 
02:99a7 : e0 67 __ CPX #$67
02:99a9 : d0 0e __ BNE $99b9 ; (CheckMounttype.s15 + 0)
.s40:
02:99ab : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:99ae : c9 36 __ CMP #$36
02:99b0 : d0 07 __ BNE $99b9 ; (CheckMounttype.s15 + 0)
.s41:
02:99b2 : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:99b5 : c9 34 __ CMP #$34
02:99b7 : f0 56 __ BEQ $9a0f ; (CheckMounttype.s33 + 0)
.s15:
02:99b9 : a5 1b __ LDA ACCU + 0 
02:99bb : d0 04 __ BNE $99c1 ; (CheckMounttype.s37 + 0)
.s16:
02:99bd : e0 64 __ CPX #$64
02:99bf : d0 12 __ BNE $99d3 ; (CheckMounttype.s17 + 0)
.s37:
02:99c1 : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:99c4 : c9 37 __ CMP #$37
02:99c6 : f0 04 __ BEQ $99cc ; (CheckMounttype.s39 + 0)
.s38:
02:99c8 : c9 38 __ CMP #$38
02:99ca : d0 07 __ BNE $99d3 ; (CheckMounttype.s17 + 0)
.s39:
02:99cc : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:99cf : c9 31 __ CMP #$31
02:99d1 : f0 3c __ BEQ $9a0f ; (CheckMounttype.s33 + 0)
.s17:
02:99d3 : 24 43 __ BIT T3 + 0 
02:99d5 : 30 04 __ BMI $99db ; (CheckMounttype.s34 + 0)
.s18:
02:99d7 : e0 67 __ CPX #$67
02:99d9 : d0 12 __ BNE $99ed ; (CheckMounttype.s19 + 0)
.s34:
02:99db : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:99de : c9 37 __ CMP #$37
02:99e0 : f0 04 __ BEQ $99e6 ; (CheckMounttype.s36 + 0)
.s35:
02:99e2 : c9 38 __ CMP #$38
02:99e4 : d0 07 __ BNE $99ed ; (CheckMounttype.s19 + 0)
.s36:
02:99e6 : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:99e9 : c9 31 __ CMP #$31
02:99eb : f0 22 __ BEQ $9a0f ; (CheckMounttype.s33 + 0)
.s19:
02:99ed : a5 1b __ LDA ACCU + 0 
02:99ef : d0 04 __ BNE $99f5 ; (CheckMounttype.s28 + 0)
.s20:
02:99f1 : e0 64 __ CPX #$64
02:99f3 : d0 20 __ BNE $9a15 ; (CheckMounttype.s21 + 0)
.s28:
02:99f5 : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:99f8 : c9 4e __ CMP #$4e
02:99fa : f0 04 __ BEQ $9a00 ; (CheckMounttype.s30 + 0)
.s29:
02:99fc : c9 6e __ CMP #$6e
02:99fe : d0 15 __ BNE $9a15 ; (CheckMounttype.s21 + 0)
.s30:
02:9a00 : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:9a03 : c9 50 __ CMP #$50
02:9a05 : f0 04 __ BEQ $9a0b ; (CheckMounttype.s32 + 0)
.s31:
02:9a07 : c9 70 __ CMP #$70
02:9a09 : d0 0a __ BNE $9a15 ; (CheckMounttype.s21 + 0)
.s32:
02:9a0b : a5 49 __ LDA T6 + 0 
02:9a0d : d0 06 __ BNE $9a15 ; (CheckMounttype.s21 + 0)
.s33:
02:9a0f : a9 01 __ LDA #$01
.s46:
02:9a11 : 8d be 3d STA $3dbe 
02:9a14 : 60 __ __ RTS
.s21:
02:9a15 : 8a __ __ TXA
02:9a16 : e0 52 __ CPX #$52
02:9a18 : f0 05 __ BEQ $9a1f ; (CheckMounttype.s23 + 0)
.s22:
02:9a1a : c9 72 __ CMP #$72
02:9a1c : f0 01 __ BEQ $9a1f ; (CheckMounttype.s23 + 0)
02:9a1e : 60 __ __ RTS
.s23:
02:9a1f : b9 70 49 LDA $4970,y ; (vspriteScreen + 0)
02:9a22 : c9 45 __ CMP #$45
02:9a24 : f0 05 __ BEQ $9a2b ; (CheckMounttype.s25 + 0)
.s24:
02:9a26 : c9 65 __ CMP #$65
02:9a28 : f0 01 __ BEQ $9a2b ; (CheckMounttype.s25 + 0)
02:9a2a : 60 __ __ RTS
.s25:
02:9a2b : b9 71 49 LDA $4971,y ; (vspriteScreen + 1)
02:9a2e : c9 55 __ CMP #$55
02:9a30 : f0 05 __ BEQ $9a37 ; (CheckMounttype.s27 + 0)
.s26:
02:9a32 : c9 75 __ CMP #$75
02:9a34 : f0 01 __ BEQ $9a37 ; (CheckMounttype.s27 + 0)
02:9a36 : 60 __ __ RTS
.s27:
02:9a37 : a9 02 __ LDA #$02
02:9a39 : d0 d6 __ BNE $9a11 ; (CheckMounttype.s46 + 0)
--------------------------------------------------------------------
02:9a3b : __ __ __ BYT 6f 4c 44 20 75 4c 54 49 4d 41 54 45 20 46 49 52 : oLD uLTIMATE FIR
02:9a4b : __ __ __ BYT 4d 57 41 52 45 20 44 45 54 45 43 54 45 44 2e 00 : MWARE DETECTED..
--------------------------------------------------------------------
02:9a5b : __ __ __ BYT 43 44 3a 25 53 00                               : CD:%S.
--------------------------------------------------------------------
02:9a61 : __ __ __ BYT 43 44 2f 25 53 2f 00                            : CD/%S/.
--------------------------------------------------------------------
02:9a68 : __ __ __ BYT 2f 00                                           : /.
--------------------------------------------------------------------
02:9a6a : __ __ __ BYT 43 44 2f 2f 00                                  : CD//.
--------------------------------------------------------------------
02:9a6f : __ __ __ BYT 72 4f 4f 54 00                                  : rOOT.
--------------------------------------------------------------------
dir_pagedown: ; dir_pagedown()->void
;1290, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s1:
02:9a74 : a2 04 __ LDX #$04
02:9a76 : b5 53 __ LDA T0 + 0,x 
02:9a78 : 9d 4c 7e STA $7e4c,x ; (dir_pagedown@stack + 0)
02:9a7b : ca __ __ DEX
02:9a7c : 10 f8 __ BPL $9a76 ; (dir_pagedown.s1 + 2)
.s4:
02:9a7e : ad 6b 53 LDA $536b ; (presentdir.firstelement + 3)
02:9a81 : d0 0f __ BNE $9a92 ; (dir_pagedown.s5 + 0)
.s14:
02:9a83 : ad 6a 53 LDA $536a ; (presentdir.firstelement + 2)
02:9a86 : d0 0a __ BNE $9a92 ; (dir_pagedown.s5 + 0)
.s15:
02:9a88 : ad 69 53 LDA $5369 ; (presentdir.firstelement + 1)
02:9a8b : d0 05 __ BNE $9a92 ; (dir_pagedown.s5 + 0)
.s16:
02:9a8d : ad 68 53 LDA $5368 ; (presentdir.firstelement + 0)
02:9a90 : f0 3c __ BEQ $9ace ; (dir_pagedown.s3 + 0)
.s5:
02:9a92 : ad 70 53 LDA $5370 ; (presentdir.lastprint + 0)
02:9a95 : 85 0d __ STA P0 
02:9a97 : ad 71 53 LDA $5371 ; (presentdir.lastprint + 1)
02:9a9a : 85 0e __ STA P1 
02:9a9c : ad 72 53 LDA $5372 ; (presentdir.lastprint + 2)
02:9a9f : 85 0f __ STA P2 
02:9aa1 : ad 73 53 LDA $5373 ; (presentdir.lastprint + 3)
02:9aa4 : 85 10 __ STA P3 
02:9aa6 : 20 d2 93 JSR $93d2 ; (dir_get_element.s4 + 0)
02:9aa9 : ad 33 55 LDA $5533 ; (presentdirelement.meta.next + 0)
02:9aac : 85 54 __ STA T1 + 0 
02:9aae : ad 34 55 LDA $5534 ; (presentdirelement.meta.next + 1)
02:9ab1 : 85 55 __ STA T1 + 1 
02:9ab3 : ad 35 55 LDA $5535 ; (presentdirelement.meta.next + 2)
02:9ab6 : 85 56 __ STA T1 + 2 
02:9ab8 : ad 36 55 LDA $5536 ; (presentdirelement.meta.next + 3)
02:9abb : 85 57 __ STA T1 + 3 
02:9abd : d0 1a __ BNE $9ad9 ; (dir_pagedown.s7 + 0)
.s11:
02:9abf : a5 56 __ LDA T1 + 2 
02:9ac1 : d0 16 __ BNE $9ad9 ; (dir_pagedown.s7 + 0)
.s12:
02:9ac3 : a5 55 __ LDA T1 + 1 
02:9ac5 : d0 12 __ BNE $9ad9 ; (dir_pagedown.s7 + 0)
.s13:
02:9ac7 : a5 54 __ LDA T1 + 0 
02:9ac9 : d0 0e __ BNE $9ad9 ; (dir_pagedown.s7 + 0)
.s6:
02:9acb : 20 54 9b JSR $9b54 ; (dir_last_of_page.s4 + 0)
.s3:
02:9ace : a2 04 __ LDX #$04
02:9ad0 : bd 4c 7e LDA $7e4c,x ; (dir_pagedown@stack + 0)
02:9ad3 : 95 53 __ STA T0 + 0,x 
02:9ad5 : ca __ __ DEX
02:9ad6 : 10 f8 __ BPL $9ad0 ; (dir_pagedown.s3 + 2)
02:9ad8 : 60 __ __ RTS
.s7:
02:9ad9 : 20 be 93 JSR $93be ; (dir_get_element@proxy + 0)
02:9adc : a9 13 __ LDA #$13
02:9ade : 85 53 __ STA T0 + 0 
02:9ae0 : a5 54 __ LDA T1 + 0 
02:9ae2 : 05 55 __ ORA T1 + 1 
02:9ae4 : 05 56 __ ORA T1 + 2 
02:9ae6 : 05 57 __ ORA T1 + 3 
02:9ae8 : f0 35 __ BEQ $9b1f ; (dir_pagedown.s8 + 0)
.s17:
02:9aea : a5 54 __ LDA T1 + 0 
02:9aec : 85 0d __ STA P0 
02:9aee : a5 55 __ LDA T1 + 1 
02:9af0 : 85 0e __ STA P1 
02:9af2 : a5 56 __ LDA T1 + 2 
02:9af4 : 85 0f __ STA P2 
02:9af6 : a5 57 __ LDA T1 + 3 
02:9af8 : 85 10 __ STA P3 
.l9:
02:9afa : a5 54 __ LDA T1 + 0 
02:9afc : 8d fc 4c STA $4cfc ; (present + 0)
02:9aff : a5 55 __ LDA T1 + 1 
02:9b01 : 8d fd 4c STA $4cfd ; (present + 1)
02:9b04 : a5 56 __ LDA T1 + 2 
02:9b06 : 8d fe 4c STA $4cfe ; (present + 2)
02:9b09 : a5 57 __ LDA T1 + 3 
02:9b0b : 8d ff 4c STA $4cff ; (present + 3)
02:9b0e : 20 d2 93 JSR $93d2 ; (dir_get_element.s4 + 0)
02:9b11 : c6 53 __ DEC T0 + 0 
02:9b13 : f0 0a __ BEQ $9b1f ; (dir_pagedown.s8 + 0)
.s10:
02:9b15 : a5 54 __ LDA T1 + 0 
02:9b17 : 05 0e __ ORA P1 
02:9b19 : 05 0f __ ORA P2 
02:9b1b : 05 57 __ ORA T1 + 3 
02:9b1d : d0 db __ BNE $9afa ; (dir_pagedown.l9 + 0)
.s8:
02:9b1f : a9 00 __ LDA #$00
02:9b21 : 8d f9 7f STA $7ff9 ; (sstack + 26)
02:9b24 : 8d 79 53 STA $5379 ; (presentdir.position + 0)
02:9b27 : 8d 7a 53 STA $537a ; (presentdir.position + 1)
02:9b2a : ad fc 4c LDA $4cfc ; (present + 0)
02:9b2d : 8d 6c 53 STA $536c ; (presentdir.firstprint + 0)
02:9b30 : 8d 74 53 STA $5374 ; (presentdir.present + 0)
02:9b33 : ad fd 4c LDA $4cfd ; (present + 1)
02:9b36 : 8d 6d 53 STA $536d ; (presentdir.firstprint + 1)
02:9b39 : 8d 75 53 STA $5375 ; (presentdir.present + 1)
02:9b3c : ad fe 4c LDA $4cfe ; (present + 2)
02:9b3f : 8d 6e 53 STA $536e ; (presentdir.firstprint + 2)
02:9b42 : 8d 76 53 STA $5376 ; (presentdir.present + 2)
02:9b45 : ad ff 4c LDA $4cff ; (present + 3)
02:9b48 : 8d 6f 53 STA $536f ; (presentdir.firstprint + 3)
02:9b4b : 8d 77 53 STA $5377 ; (presentdir.present + 3)
02:9b4e : 20 07 85 JSR $8507 ; (dir_draw.s1 + 0)
02:9b51 : 4c ce 9a JMP $9ace ; (dir_pagedown.s3 + 0)
--------------------------------------------------------------------
dir_last_of_page: ; dir_last_of_page()->void
;1252, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s4:
02:9b54 : ad 6b 53 LDA $536b ; (presentdir.firstelement + 3)
02:9b57 : d0 10 __ BNE $9b69 ; (dir_last_of_page.s5 + 0)
.s9:
02:9b59 : ad 6a 53 LDA $536a ; (presentdir.firstelement + 2)
02:9b5c : d0 0b __ BNE $9b69 ; (dir_last_of_page.s5 + 0)
.s10:
02:9b5e : ad 69 53 LDA $5369 ; (presentdir.firstelement + 1)
02:9b61 : d0 06 __ BNE $9b69 ; (dir_last_of_page.s5 + 0)
.s11:
02:9b63 : ad 68 53 LDA $5368 ; (presentdir.firstelement + 0)
02:9b66 : d0 01 __ BNE $9b69 ; (dir_last_of_page.s5 + 0)
02:9b68 : 60 __ __ RTS
.s5:
02:9b69 : ad 6c 53 LDA $536c ; (presentdir.firstprint + 0)
02:9b6c : 85 4a __ STA T1 + 0 
02:9b6e : 85 0d __ STA P0 
02:9b70 : ad 6d 53 LDA $536d ; (presentdir.firstprint + 1)
02:9b73 : 85 4b __ STA T1 + 1 
02:9b75 : 85 0e __ STA P1 
02:9b77 : ad 6e 53 LDA $536e ; (presentdir.firstprint + 2)
02:9b7a : 85 4c __ STA T1 + 2 
02:9b7c : 85 0f __ STA P2 
02:9b7e : ad 6f 53 LDA $536f ; (presentdir.firstprint + 3)
02:9b81 : 85 4d __ STA T1 + 3 
02:9b83 : 85 10 __ STA P3 
02:9b85 : ad 79 53 LDA $5379 ; (presentdir.position + 0)
02:9b88 : 85 4e __ STA T2 + 0 
02:9b8a : 20 d2 93 JSR $93d2 ; (dir_get_element.s4 + 0)
02:9b8d : a9 00 __ LDA #$00
02:9b8f : 85 4f __ STA T3 + 0 
02:9b91 : a9 12 __ LDA #$12
02:9b93 : 85 50 __ STA T4 + 0 
.l6:
02:9b95 : ad 33 55 LDA $5533 ; (presentdirelement.meta.next + 0)
02:9b98 : 0d 34 55 ORA $5534 ; (presentdirelement.meta.next + 1)
02:9b9b : 0d 35 55 ORA $5535 ; (presentdirelement.meta.next + 2)
02:9b9e : 0d 36 55 ORA $5536 ; (presentdirelement.meta.next + 3)
02:9ba1 : f0 25 __ BEQ $9bc8 ; (dir_last_of_page.s7 + 0)
.s8:
02:9ba3 : ad 33 55 LDA $5533 ; (presentdirelement.meta.next + 0)
02:9ba6 : 85 0d __ STA P0 
02:9ba8 : 85 4a __ STA T1 + 0 
02:9baa : ad 34 55 LDA $5534 ; (presentdirelement.meta.next + 1)
02:9bad : 85 0e __ STA P1 
02:9baf : 85 4b __ STA T1 + 1 
02:9bb1 : ad 35 55 LDA $5535 ; (presentdirelement.meta.next + 2)
02:9bb4 : 85 0f __ STA P2 
02:9bb6 : 85 4c __ STA T1 + 2 
02:9bb8 : ad 36 55 LDA $5536 ; (presentdirelement.meta.next + 3)
02:9bbb : 85 10 __ STA P3 
02:9bbd : 85 4d __ STA T1 + 3 
02:9bbf : 20 d2 93 JSR $93d2 ; (dir_get_element.s4 + 0)
02:9bc2 : e6 4f __ INC T3 + 0 
02:9bc4 : c6 50 __ DEC T4 + 0 
02:9bc6 : d0 cd __ BNE $9b95 ; (dir_last_of_page.l6 + 0)
.s7:
02:9bc8 : a5 4f __ LDA T3 + 0 
02:9bca : 8d 79 53 STA $5379 ; (presentdir.position + 0)
02:9bcd : a9 00 __ LDA #$00
02:9bcf : 8d 7a 53 STA $537a ; (presentdir.position + 1)
02:9bd2 : 20 be 93 JSR $93be ; (dir_get_element@proxy + 0)
02:9bd5 : a5 4e __ LDA T2 + 0 
02:9bd7 : 85 18 __ STA P11 
02:9bd9 : 20 85 95 JSR $9585 ; (dir_print_entry.s4 + 0)
02:9bdc : a5 4a __ LDA T1 + 0 
02:9bde : 85 0d __ STA P0 
02:9be0 : 8d 74 53 STA $5374 ; (presentdir.present + 0)
02:9be3 : 8d fc 4c STA $4cfc ; (present + 0)
02:9be6 : a5 4b __ LDA T1 + 1 
02:9be8 : 85 0e __ STA P1 
02:9bea : 8d 75 53 STA $5375 ; (presentdir.present + 1)
02:9bed : 8d fd 4c STA $4cfd ; (present + 1)
02:9bf0 : a5 4c __ LDA T1 + 2 
02:9bf2 : 85 0f __ STA P2 
02:9bf4 : 8d 76 53 STA $5376 ; (presentdir.present + 2)
02:9bf7 : 8d fe 4c STA $4cfe ; (present + 2)
02:9bfa : a5 4d __ LDA T1 + 3 
02:9bfc : 85 10 __ STA P3 
02:9bfe : 8d 77 53 STA $5377 ; (presentdir.present + 3)
02:9c01 : 8d ff 4c STA $4cff ; (present + 3)
02:9c04 : 20 d2 93 JSR $93d2 ; (dir_get_element.s4 + 0)
02:9c07 : a5 4f __ LDA T3 + 0 
02:9c09 : 85 18 __ STA P11 
02:9c0b : 4c 85 95 JMP $9585 ; (dir_print_entry.s4 + 0)
.s3:
02:9c0e : 60 __ __ RTS
--------------------------------------------------------------------
dir_pageup: ; dir_pageup()->void
;1336, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s1:
02:9c0f : a2 04 __ LDX #$04
02:9c11 : b5 53 __ LDA T0 + 0,x 
02:9c13 : 9d 4f 7e STA $7e4f,x ; (dir_pageup@stack + 0)
02:9c16 : ca __ __ DEX
02:9c17 : 10 f8 __ BPL $9c11 ; (dir_pageup.s1 + 2)
.s4:
02:9c19 : ad 6b 53 LDA $536b ; (presentdir.firstelement + 3)
02:9c1c : d0 12 __ BNE $9c30 ; (dir_pageup.s5 + 0)
.s13:
02:9c1e : ad 6a 53 LDA $536a ; (presentdir.firstelement + 2)
02:9c21 : d0 0d __ BNE $9c30 ; (dir_pageup.s5 + 0)
.s14:
02:9c23 : ad 69 53 LDA $5369 ; (presentdir.firstelement + 1)
02:9c26 : d0 08 __ BNE $9c30 ; (dir_pageup.s5 + 0)
.s15:
02:9c28 : ad 68 53 LDA $5368 ; (presentdir.firstelement + 0)
02:9c2b : d0 03 __ BNE $9c30 ; (dir_pageup.s5 + 0)
02:9c2d : 4c c7 9c JMP $9cc7 ; (dir_pageup.s3 + 0)
.s5:
02:9c30 : ad 37 55 LDA $5537 ; (presentdirelement.meta.prev + 0)
02:9c33 : 85 53 __ STA T0 + 0 
02:9c35 : ad 38 55 LDA $5538 ; (presentdirelement.meta.prev + 1)
02:9c38 : 85 54 __ STA T0 + 1 
02:9c3a : ad 39 55 LDA $5539 ; (presentdirelement.meta.prev + 2)
02:9c3d : 85 55 __ STA T0 + 2 
02:9c3f : ad 3a 55 LDA $553a ; (presentdirelement.meta.prev + 3)
02:9c42 : 85 56 __ STA T0 + 3 
02:9c44 : d0 0c __ BNE $9c52 ; (dir_pageup.s6 + 0)
.s10:
02:9c46 : a5 55 __ LDA T0 + 2 
02:9c48 : d0 08 __ BNE $9c52 ; (dir_pageup.s6 + 0)
.s11:
02:9c4a : a5 54 __ LDA T0 + 1 
02:9c4c : d0 04 __ BNE $9c52 ; (dir_pageup.s6 + 0)
.s12:
02:9c4e : a5 53 __ LDA T0 + 0 
02:9c50 : f0 75 __ BEQ $9cc7 ; (dir_pageup.s3 + 0)
.s6:
02:9c52 : a9 13 __ LDA #$13
02:9c54 : 85 57 __ STA T1 + 0 
02:9c56 : a5 53 __ LDA T0 + 0 
02:9c58 : 05 54 __ ORA T0 + 1 
02:9c5a : 05 55 __ ORA T0 + 2 
02:9c5c : 05 56 __ ORA T0 + 3 
02:9c5e : f0 35 __ BEQ $9c95 ; (dir_pageup.s7 + 0)
.s16:
02:9c60 : a5 53 __ LDA T0 + 0 
02:9c62 : 85 0d __ STA P0 
02:9c64 : a5 54 __ LDA T0 + 1 
02:9c66 : 85 0e __ STA P1 
02:9c68 : a5 55 __ LDA T0 + 2 
02:9c6a : 85 0f __ STA P2 
02:9c6c : a5 56 __ LDA T0 + 3 
02:9c6e : 85 10 __ STA P3 
.l8:
02:9c70 : a5 53 __ LDA T0 + 0 
02:9c72 : 8d fc 4c STA $4cfc ; (present + 0)
02:9c75 : a5 54 __ LDA T0 + 1 
02:9c77 : 8d fd 4c STA $4cfd ; (present + 1)
02:9c7a : a5 55 __ LDA T0 + 2 
02:9c7c : 8d fe 4c STA $4cfe ; (present + 2)
02:9c7f : a5 56 __ LDA T0 + 3 
02:9c81 : 8d ff 4c STA $4cff ; (present + 3)
02:9c84 : 20 d2 93 JSR $93d2 ; (dir_get_element.s4 + 0)
02:9c87 : c6 57 __ DEC T1 + 0 
02:9c89 : f0 0a __ BEQ $9c95 ; (dir_pageup.s7 + 0)
.s9:
02:9c8b : a5 53 __ LDA T0 + 0 
02:9c8d : 05 0e __ ORA P1 
02:9c8f : 05 0f __ ORA P2 
02:9c91 : 05 56 __ ORA T0 + 3 
02:9c93 : d0 db __ BNE $9c70 ; (dir_pageup.l8 + 0)
.s7:
02:9c95 : a9 00 __ LDA #$00
02:9c97 : 8d f9 7f STA $7ff9 ; (sstack + 26)
02:9c9a : 8d 79 53 STA $5379 ; (presentdir.position + 0)
02:9c9d : 8d 7a 53 STA $537a ; (presentdir.position + 1)
02:9ca0 : ad fc 4c LDA $4cfc ; (present + 0)
02:9ca3 : 8d 6c 53 STA $536c ; (presentdir.firstprint + 0)
02:9ca6 : 8d 74 53 STA $5374 ; (presentdir.present + 0)
02:9ca9 : ad fd 4c LDA $4cfd ; (present + 1)
02:9cac : 8d 6d 53 STA $536d ; (presentdir.firstprint + 1)
02:9caf : 8d 75 53 STA $5375 ; (presentdir.present + 1)
02:9cb2 : ad fe 4c LDA $4cfe ; (present + 2)
02:9cb5 : 8d 6e 53 STA $536e ; (presentdir.firstprint + 2)
02:9cb8 : 8d 76 53 STA $5376 ; (presentdir.present + 2)
02:9cbb : ad ff 4c LDA $4cff ; (present + 3)
02:9cbe : 8d 6f 53 STA $536f ; (presentdir.firstprint + 3)
02:9cc1 : 8d 77 53 STA $5377 ; (presentdir.present + 3)
02:9cc4 : 20 07 85 JSR $8507 ; (dir_draw.s1 + 0)
.s3:
02:9cc7 : a2 04 __ LDX #$04
02:9cc9 : bd 4f 7e LDA $7e4f,x ; (dir_pageup@stack + 0)
02:9ccc : 95 53 __ STA T0 + 0,x 
02:9cce : ca __ __ DEX
02:9ccf : 10 f8 __ BPL $9cc9 ; (dir_pageup.s3 + 2)
02:9cd1 : 60 __ __ RTS
--------------------------------------------------------------------
FindFirstIECDrive: ; FindFirstIECDrive()->void
;1147, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s1:
02:9cd2 : a5 53 __ LDA T1 + 0 
02:9cd4 : 8d 53 7e STA $7e53 ; (FindFirstIECDrive@stack + 0)
.s4:
02:9cd7 : a9 00 __ LDA #$00
02:9cd9 : 85 0d __ STA P0 
.l11:
02:9cdb : 20 c3 ff JSR $ffc3 
02:9cde : 20 cc ff JSR $ffcc 
02:9ce1 : a5 0d __ LDA P0 
02:9ce3 : 20 c3 ff JSR $ffc3 
02:9ce6 : e6 0d __ INC P0 
02:9ce8 : a5 0d __ LDA P0 
02:9cea : c9 10 __ CMP #$10
02:9cec : 90 ed __ BCC $9cdb ; (FindFirstIECDrive.l11 + 0)
.s5:
02:9cee : 20 f0 27 JSR $27f0 
02:9cf1 : a9 07 __ LDA #$07
02:9cf3 : 85 53 __ STA T1 + 0 
02:9cf5 : d0 03 __ BNE $9cfa ; (FindFirstIECDrive.l6 + 0)
.s8:
02:9cf7 : 8d c2 3d STA $3dc2 
.l6:
02:9cfa : e6 53 __ INC T1 + 0 
02:9cfc : a5 53 __ LDA T1 + 0 
02:9cfe : c9 1f __ CMP #$1f
02:9d00 : b0 1f __ BCS $9d21 ; (FindFirstIECDrive.s3 + 0)
.s7:
02:9d02 : 8d c2 3d STA $3dc2 
02:9d05 : aa __ __ TAX
02:9d06 : bd 10 53 LDA $5310,x ; (Slot.padding[0] + 5)
02:9d09 : f0 ec __ BEQ $9cf7 ; (FindFirstIECDrive.s8 + 0)
.s9:
02:9d0b : 20 24 89 JSR $8924 ; (dir_read@proxy + 0)
02:9d0e : a5 1b __ LDA ACCU + 0 
02:9d10 : f0 e5 __ BEQ $9cf7 ; (FindFirstIECDrive.s8 + 0)
.s10:
02:9d12 : a5 53 __ LDA T1 + 0 
02:9d14 : 85 13 __ STA P6 
02:9d16 : 20 64 30 JSR $3064 
02:9d19 : a9 00 __ LDA #$00
02:9d1b : 8d f9 7f STA $7ff9 ; (sstack + 26)
02:9d1e : 20 07 85 JSR $8507 ; (dir_draw.s1 + 0)
.s3:
02:9d21 : ad 53 7e LDA $7e53 ; (FindFirstIECDrive@stack + 0)
02:9d24 : 85 53 __ STA T1 + 0 
02:9d26 : 60 __ __ RTS
--------------------------------------------------------------------
02:9d27 : __ __ __ BYT 6e 4f 20 41 43 54 49 56 45 20 69 65 63 20 44 52 : nO ACTIVE iec DR
02:9d37 : __ __ __ BYT 49 56 45 53 2e 0a 0d 00                         : IVES....
--------------------------------------------------------------------
02:9d3f : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 2e 00                : pRESS KEY..
--------------------------------------------------------------------
dir_go_down: ; dir_go_down()->void
;1173, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s1:
02:9d4a : a2 04 __ LDX #$04
02:9d4c : b5 53 __ LDA T0 + 0,x 
02:9d4e : 9d 4e 7e STA $7e4e,x ; (dir_go_down@stack + 0)
02:9d51 : ca __ __ DEX
02:9d52 : 10 f8 __ BPL $9d4c ; (dir_go_down.s1 + 2)
.s4:
02:9d54 : ad 6b 53 LDA $536b ; (presentdir.firstelement + 3)
02:9d57 : d0 12 __ BNE $9d6b ; (dir_go_down.s5 + 0)
.s13:
02:9d59 : ad 6a 53 LDA $536a ; (presentdir.firstelement + 2)
02:9d5c : d0 0d __ BNE $9d6b ; (dir_go_down.s5 + 0)
.s14:
02:9d5e : ad 69 53 LDA $5369 ; (presentdir.firstelement + 1)
02:9d61 : d0 08 __ BNE $9d6b ; (dir_go_down.s5 + 0)
.s15:
02:9d63 : ad 68 53 LDA $5368 ; (presentdir.firstelement + 0)
02:9d66 : d0 03 __ BNE $9d6b ; (dir_go_down.s5 + 0)
02:9d68 : 4c 2a 9e JMP $9e2a ; (dir_go_down.s3 + 0)
.s5:
02:9d6b : ad 33 55 LDA $5533 ; (presentdirelement.meta.next + 0)
02:9d6e : 85 53 __ STA T0 + 0 
02:9d70 : ad 36 55 LDA $5536 ; (presentdirelement.meta.next + 3)
02:9d73 : 85 56 __ STA T0 + 3 
02:9d75 : d0 0a __ BNE $9d81 ; (dir_go_down.s16 + 0)
.s10:
02:9d77 : ad 35 55 LDA $5535 ; (presentdirelement.meta.next + 2)
02:9d7a : d0 05 __ BNE $9d81 ; (dir_go_down.s16 + 0)
.s11:
02:9d7c : ad 34 55 LDA $5534 ; (presentdirelement.meta.next + 1)
02:9d7f : f0 05 __ BEQ $9d86 ; (dir_go_down.s12 + 0)
.s16:
02:9d81 : a5 53 __ LDA T0 + 0 
02:9d83 : 4c 8a 9d JMP $9d8a ; (dir_go_down.s6 + 0)
.s12:
02:9d86 : a5 53 __ LDA T0 + 0 
02:9d88 : f0 de __ BEQ $9d68 ; (dir_go_down.s15 + 5)
.s6:
02:9d8a : 85 0d __ STA P0 
02:9d8c : 8d fc 4c STA $4cfc ; (present + 0)
02:9d8f : ad 34 55 LDA $5534 ; (presentdirelement.meta.next + 1)
02:9d92 : 85 0e __ STA P1 
02:9d94 : 8d fd 4c STA $4cfd ; (present + 1)
02:9d97 : ad 35 55 LDA $5535 ; (presentdirelement.meta.next + 2)
02:9d9a : 85 0f __ STA P2 
02:9d9c : 8d fe 4c STA $4cfe ; (present + 2)
02:9d9f : a5 56 __ LDA T0 + 3 
02:9da1 : 85 10 __ STA P3 
02:9da3 : 8d ff 4c STA $4cff ; (present + 3)
02:9da6 : 20 d2 93 JSR $93d2 ; (dir_get_element.s4 + 0)
02:9da9 : a5 53 __ LDA T0 + 0 
02:9dab : 8d 74 53 STA $5374 ; (presentdir.present + 0)
02:9dae : a5 0e __ LDA P1 
02:9db0 : 8d 75 53 STA $5375 ; (presentdir.present + 1)
02:9db3 : a5 0f __ LDA P2 
02:9db5 : 8d 76 53 STA $5376 ; (presentdir.present + 2)
02:9db8 : a5 56 __ LDA T0 + 3 
02:9dba : 8d 77 53 STA $5377 ; (presentdir.present + 3)
02:9dbd : ad 79 53 LDA $5379 ; (presentdir.position + 0)
02:9dc0 : 85 57 __ STA T2 + 0 
02:9dc2 : 18 __ __ CLC
02:9dc3 : 69 01 __ ADC #$01
02:9dc5 : 8d 79 53 STA $5379 ; (presentdir.position + 0)
02:9dc8 : ad 7a 53 LDA $537a ; (presentdir.position + 1)
02:9dcb : 69 00 __ ADC #$00
02:9dcd : 8d 7a 53 STA $537a ; (presentdir.position + 1)
02:9dd0 : d0 36 __ BNE $9e08 ; (dir_go_down.s8 + 0)
.s9:
02:9dd2 : a9 12 __ LDA #$12
02:9dd4 : cd 79 53 CMP $5379 ; (presentdir.position + 0)
02:9dd7 : 90 2f __ BCC $9e08 ; (dir_go_down.s8 + 0)
.s7:
02:9dd9 : ad 37 55 LDA $5537 ; (presentdirelement.meta.prev + 0)
02:9ddc : 85 0d __ STA P0 
02:9dde : 8d f8 4c STA $4cf8 ; (previous + 0)
02:9de1 : ad 38 55 LDA $5538 ; (presentdirelement.meta.prev + 1)
02:9de4 : 85 0e __ STA P1 
02:9de6 : 8d f9 4c STA $4cf9 ; (previous + 1)
02:9de9 : ad 39 55 LDA $5539 ; (presentdirelement.meta.prev + 2)
02:9dec : 85 0f __ STA P2 
02:9dee : 8d fa 4c STA $4cfa ; (previous + 2)
02:9df1 : ad 3a 55 LDA $553a ; (presentdirelement.meta.prev + 3)
02:9df4 : 85 10 __ STA P3 
02:9df6 : 8d fb 4c STA $4cfb ; (previous + 3)
02:9df9 : 20 d2 93 JSR $93d2 ; (dir_get_element.s4 + 0)
02:9dfc : 20 81 95 JSR $9581 ; (dir_print_entry@proxy + 0)
02:9dff : 20 be 93 JSR $93be ; (dir_get_element@proxy + 0)
02:9e02 : 20 1f a1 JSR $a11f ; (dir_print_entry@proxy + 0)
02:9e05 : 4c 2a 9e JMP $9e2a ; (dir_go_down.s3 + 0)
.s8:
02:9e08 : a9 00 __ LDA #$00
02:9e0a : 8d f9 7f STA $7ff9 ; (sstack + 26)
02:9e0d : 8d 79 53 STA $5379 ; (presentdir.position + 0)
02:9e10 : 8d 7a 53 STA $537a ; (presentdir.position + 1)
02:9e13 : a5 53 __ LDA T0 + 0 
02:9e15 : 8d 6c 53 STA $536c ; (presentdir.firstprint + 0)
02:9e18 : a5 0e __ LDA P1 
02:9e1a : 8d 6d 53 STA $536d ; (presentdir.firstprint + 1)
02:9e1d : a5 0f __ LDA P2 
02:9e1f : 8d 6e 53 STA $536e ; (presentdir.firstprint + 2)
02:9e22 : a5 56 __ LDA T0 + 3 
02:9e24 : 8d 6f 53 STA $536f ; (presentdir.firstprint + 3)
02:9e27 : 20 07 85 JSR $8507 ; (dir_draw.s1 + 0)
.s3:
02:9e2a : a2 04 __ LDX #$04
02:9e2c : bd 4e 7e LDA $7e4e,x ; (dir_go_down@stack + 0)
02:9e2f : 95 53 __ STA T0 + 0,x 
02:9e31 : ca __ __ DEX
02:9e32 : 10 f8 __ BPL $9e2c ; (dir_go_down.s3 + 2)
02:9e34 : 60 __ __ RTS
--------------------------------------------------------------------
dir_go_up: ; dir_go_up()->void
;1206, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s1:
02:9e35 : a5 53 __ LDA T1 + 0 
02:9e37 : 8d 4e 7e STA $7e4e ; (dir_go_up@stack + 0)
.s4:
02:9e3a : ad 6b 53 LDA $536b ; (presentdir.firstelement + 3)
02:9e3d : d0 12 __ BNE $9e51 ; (dir_go_up.s5 + 0)
.s15:
02:9e3f : ad 6a 53 LDA $536a ; (presentdir.firstelement + 2)
02:9e42 : d0 0d __ BNE $9e51 ; (dir_go_up.s5 + 0)
.s16:
02:9e44 : ad 69 53 LDA $5369 ; (presentdir.firstelement + 1)
02:9e47 : d0 08 __ BNE $9e51 ; (dir_go_up.s5 + 0)
.s17:
02:9e49 : ad 68 53 LDA $5368 ; (presentdir.firstelement + 0)
02:9e4c : d0 03 __ BNE $9e51 ; (dir_go_up.s5 + 0)
02:9e4e : 4c 37 9f JMP $9f37 ; (dir_go_up.s3 + 0)
.s5:
02:9e51 : ad 3a 55 LDA $553a ; (presentdirelement.meta.prev + 3)
02:9e54 : d0 0f __ BNE $9e65 ; (dir_go_up.s6 + 0)
.s12:
02:9e56 : ad 39 55 LDA $5539 ; (presentdirelement.meta.prev + 2)
02:9e59 : d0 0a __ BNE $9e65 ; (dir_go_up.s6 + 0)
.s13:
02:9e5b : ad 38 55 LDA $5538 ; (presentdirelement.meta.prev + 1)
02:9e5e : d0 05 __ BNE $9e65 ; (dir_go_up.s6 + 0)
.s14:
02:9e60 : ad 37 55 LDA $5537 ; (presentdirelement.meta.prev + 0)
02:9e63 : f0 e9 __ BEQ $9e4e ; (dir_go_up.s17 + 5)
.s6:
02:9e65 : ad 37 55 LDA $5537 ; (presentdirelement.meta.prev + 0)
02:9e68 : 85 0d __ STA P0 
02:9e6a : 8d fc 4c STA $4cfc ; (present + 0)
02:9e6d : ad 38 55 LDA $5538 ; (presentdirelement.meta.prev + 1)
02:9e70 : 85 0e __ STA P1 
02:9e72 : 8d fd 4c STA $4cfd ; (present + 1)
02:9e75 : ad 39 55 LDA $5539 ; (presentdirelement.meta.prev + 2)
02:9e78 : 85 0f __ STA P2 
02:9e7a : 8d fe 4c STA $4cfe ; (present + 2)
02:9e7d : ad 3a 55 LDA $553a ; (presentdirelement.meta.prev + 3)
02:9e80 : 85 10 __ STA P3 
02:9e82 : 8d ff 4c STA $4cff ; (present + 3)
02:9e85 : 20 d2 93 JSR $93d2 ; (dir_get_element.s4 + 0)
02:9e88 : a5 0d __ LDA P0 
02:9e8a : 8d 74 53 STA $5374 ; (presentdir.present + 0)
02:9e8d : a5 0e __ LDA P1 
02:9e8f : 8d 75 53 STA $5375 ; (presentdir.present + 1)
02:9e92 : a5 0f __ LDA P2 
02:9e94 : 8d 76 53 STA $5376 ; (presentdir.present + 2)
02:9e97 : a5 10 __ LDA P3 
02:9e99 : 8d 77 53 STA $5377 ; (presentdir.present + 3)
02:9e9c : ad 79 53 LDA $5379 ; (presentdir.position + 0)
02:9e9f : 85 53 __ STA T1 + 0 
02:9ea1 : 0d 7a 53 ORA $537a ; (presentdir.position + 1)
02:9ea4 : f0 03 __ BEQ $9ea9 ; (dir_go_up.s7 + 0)
02:9ea6 : 4c 3d 9f JMP $9f3d ; (dir_go_up.s11 + 0)
.s7:
02:9ea9 : a9 12 __ LDA #$12
02:9eab : 8d 79 53 STA $5379 ; (presentdir.position + 0)
02:9eae : a9 00 __ LDA #$00
02:9eb0 : 8d 7a 53 STA $537a ; (presentdir.position + 1)
02:9eb3 : a9 13 __ LDA #$13
02:9eb5 : 85 53 __ STA T1 + 0 
.l8:
02:9eb7 : ad 37 55 LDA $5537 ; (presentdirelement.meta.prev + 0)
02:9eba : 0d 38 55 ORA $5538 ; (presentdirelement.meta.prev + 1)
02:9ebd : 0d 39 55 ORA $5539 ; (presentdirelement.meta.prev + 2)
02:9ec0 : 0d 3a 55 ORA $553a ; (presentdirelement.meta.prev + 3)
02:9ec3 : f0 36 __ BEQ $9efb ; (dir_go_up.s9 + 0)
.s10:
02:9ec5 : ad 37 55 LDA $5537 ; (presentdirelement.meta.prev + 0)
02:9ec8 : 85 0d __ STA P0 
02:9eca : 8d fc 4c STA $4cfc ; (present + 0)
02:9ecd : ad 38 55 LDA $5538 ; (presentdirelement.meta.prev + 1)
02:9ed0 : 85 0e __ STA P1 
02:9ed2 : 8d fd 4c STA $4cfd ; (present + 1)
02:9ed5 : ad 39 55 LDA $5539 ; (presentdirelement.meta.prev + 2)
02:9ed8 : 85 0f __ STA P2 
02:9eda : 8d fe 4c STA $4cfe ; (present + 2)
02:9edd : ad 3a 55 LDA $553a ; (presentdirelement.meta.prev + 3)
02:9ee0 : 85 10 __ STA P3 
02:9ee2 : 8d ff 4c STA $4cff ; (present + 3)
02:9ee5 : 20 d2 93 JSR $93d2 ; (dir_get_element.s4 + 0)
02:9ee8 : a9 02 __ LDA #$02
02:9eea : 85 0e __ STA P1 
02:9eec : a9 71 __ LDA #$71
02:9eee : 85 0f __ STA P2 
02:9ef0 : a9 9f __ LDA #$9f
02:9ef2 : 85 10 __ STA P3 
02:9ef4 : 20 7f 3b JSR $3b7f 
02:9ef7 : c6 53 __ DEC T1 + 0 
02:9ef9 : d0 bc __ BNE $9eb7 ; (dir_go_up.l8 + 0)
.s9:
02:9efb : ad fc 4c LDA $4cfc ; (present + 0)
02:9efe : 8d 6c 53 STA $536c ; (presentdir.firstprint + 0)
02:9f01 : a9 00 __ LDA #$00
02:9f03 : 85 0d __ STA P0 
02:9f05 : a9 02 __ LDA #$02
02:9f07 : 85 0e __ STA P1 
02:9f09 : a9 28 __ LDA #$28
02:9f0b : 85 0f __ STA P2 
02:9f0d : a9 01 __ LDA #$01
02:9f0f : 85 10 __ STA P3 
02:9f11 : a9 20 __ LDA #$20
02:9f13 : 85 11 __ STA P4 
02:9f15 : ad fd 4c LDA $4cfd ; (present + 1)
02:9f18 : 8d 6d 53 STA $536d ; (presentdir.firstprint + 1)
02:9f1b : ad fe 4c LDA $4cfe ; (present + 2)
02:9f1e : 8d 6e 53 STA $536e ; (presentdir.firstprint + 2)
02:9f21 : ad ff 4c LDA $4cff ; (present + 3)
02:9f24 : 8d 6f 53 STA $536f ; (presentdir.firstprint + 3)
02:9f27 : ad 5d 49 LDA $495d ; (cfg.colors.text + 0)
02:9f2a : 85 12 __ STA P5 
02:9f2c : 20 bb 0f JSR $0fbb 
02:9f2f : a9 00 __ LDA #$00
02:9f31 : 8d f9 7f STA $7ff9 ; (sstack + 26)
02:9f34 : 20 07 85 JSR $8507 ; (dir_draw.s1 + 0)
.s3:
02:9f37 : ad 4e 7e LDA $7e4e ; (dir_go_up@stack + 0)
02:9f3a : 85 53 __ STA T1 + 0 
02:9f3c : 60 __ __ RTS
.s11:
02:9f3d : 18 __ __ CLC
02:9f3e : a5 53 __ LDA T1 + 0 
02:9f40 : 69 ff __ ADC #$ff
02:9f42 : 8d 79 53 STA $5379 ; (presentdir.position + 0)
02:9f45 : b0 03 __ BCS $9f4a ; (dir_go_up.s19 + 0)
.s18:
02:9f47 : ce 7a 53 DEC $537a ; (presentdir.position + 1)
.s19:
02:9f4a : ad 33 55 LDA $5533 ; (presentdirelement.meta.next + 0)
02:9f4d : 85 0d __ STA P0 
02:9f4f : ad 34 55 LDA $5534 ; (presentdirelement.meta.next + 1)
02:9f52 : 85 0e __ STA P1 
02:9f54 : ad 35 55 LDA $5535 ; (presentdirelement.meta.next + 2)
02:9f57 : 85 0f __ STA P2 
02:9f59 : ad 36 55 LDA $5536 ; (presentdirelement.meta.next + 3)
02:9f5c : 85 10 __ STA P3 
02:9f5e : 20 d2 93 JSR $93d2 ; (dir_get_element.s4 + 0)
02:9f61 : a5 53 __ LDA T1 + 0 
02:9f63 : 85 18 __ STA P11 
02:9f65 : 20 85 95 JSR $9585 ; (dir_print_entry.s4 + 0)
02:9f68 : 20 be 93 JSR $93be ; (dir_get_element@proxy + 0)
02:9f6b : 20 1f a1 JSR $a11f ; (dir_print_entry@proxy + 0)
02:9f6e : 4c 37 9f JMP $9f37 ; (dir_go_up.s3 + 0)
--------------------------------------------------------------------
02:9f71 : __ __ __ BYT 73 43 52 4f 4c 4c 49 4e 47 20 55 50 2e 2e 2e 00 : sCROLLING UP....
--------------------------------------------------------------------
dir_top: ; dir_top()->void
;1368, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s4:
02:9f81 : ad 6b 53 LDA $536b ; (presentdir.firstelement + 3)
02:9f84 : d0 0f __ BNE $9f95 ; (dir_top.s5 + 0)
.s6:
02:9f86 : ad 6a 53 LDA $536a ; (presentdir.firstelement + 2)
02:9f89 : d0 0a __ BNE $9f95 ; (dir_top.s5 + 0)
.s7:
02:9f8b : ad 69 53 LDA $5369 ; (presentdir.firstelement + 1)
02:9f8e : d0 05 __ BNE $9f95 ; (dir_top.s5 + 0)
.s8:
02:9f90 : ad 68 53 LDA $5368 ; (presentdir.firstelement + 0)
02:9f93 : f0 51 __ BEQ $9fe6 ; (dir_top.s3 + 0)
.s5:
02:9f95 : ad 68 53 LDA $5368 ; (presentdir.firstelement + 0)
02:9f98 : 85 0d __ STA P0 
02:9f9a : 8d fc 4c STA $4cfc ; (present + 0)
02:9f9d : ad 69 53 LDA $5369 ; (presentdir.firstelement + 1)
02:9fa0 : 85 0e __ STA P1 
02:9fa2 : 8d fd 4c STA $4cfd ; (present + 1)
02:9fa5 : ad 6a 53 LDA $536a ; (presentdir.firstelement + 2)
02:9fa8 : 85 0f __ STA P2 
02:9faa : 8d fe 4c STA $4cfe ; (present + 2)
02:9fad : ad 6b 53 LDA $536b ; (presentdir.firstelement + 3)
02:9fb0 : 85 10 __ STA P3 
02:9fb2 : 8d ff 4c STA $4cff ; (present + 3)
02:9fb5 : 20 d2 93 JSR $93d2 ; (dir_get_element.s4 + 0)
02:9fb8 : a9 00 __ LDA #$00
02:9fba : 8d f9 7f STA $7ff9 ; (sstack + 26)
02:9fbd : 8d 79 53 STA $5379 ; (presentdir.position + 0)
02:9fc0 : 8d 7a 53 STA $537a ; (presentdir.position + 1)
02:9fc3 : a5 0d __ LDA P0 
02:9fc5 : 8d 6c 53 STA $536c ; (presentdir.firstprint + 0)
02:9fc8 : 8d 74 53 STA $5374 ; (presentdir.present + 0)
02:9fcb : a5 0e __ LDA P1 
02:9fcd : 8d 6d 53 STA $536d ; (presentdir.firstprint + 1)
02:9fd0 : 8d 75 53 STA $5375 ; (presentdir.present + 1)
02:9fd3 : a5 0f __ LDA P2 
02:9fd5 : 8d 6e 53 STA $536e ; (presentdir.firstprint + 2)
02:9fd8 : 8d 76 53 STA $5376 ; (presentdir.present + 2)
02:9fdb : a5 10 __ LDA P3 
02:9fdd : 8d 6f 53 STA $536f ; (presentdir.firstprint + 3)
02:9fe0 : 8d 77 53 STA $5377 ; (presentdir.present + 3)
02:9fe3 : 4c 07 85 JMP $8507 ; (dir_draw.s1 + 0)
.s3:
02:9fe6 : 60 __ __ RTS
--------------------------------------------------------------------
dir_bottom: ; dir_bottom()->void
;1384, "/home/xahmol/git/UBoot64-v2/src/filebrowse.c"
.s1:
02:9fe7 : a2 07 __ LDX #$07
02:9fe9 : b5 53 __ LDA T0 + 0,x 
02:9feb : 9d 4c 7e STA $7e4c,x ; (dir_bottom@stack + 0)
02:9fee : ca __ __ DEX
02:9fef : 10 f8 __ BPL $9fe9 ; (dir_bottom.s1 + 2)
.s4:
02:9ff1 : ad 6b 53 LDA $536b ; (presentdir.firstelement + 3)
02:9ff4 : d0 0f __ BNE $a005 ; (dir_bottom.s5 + 0)
.s17:
02:9ff6 : ad 6a 53 LDA $536a ; (presentdir.firstelement + 2)
02:9ff9 : d0 0a __ BNE $a005 ; (dir_bottom.s5 + 0)
.s18:
02:9ffb : ad 69 53 LDA $5369 ; (presentdir.firstelement + 1)
02:9ffe : d0 05 __ BNE $a005 ; (dir_bottom.s5 + 0)
.s19:
02:a000 : ad 68 53 LDA $5368 ; (presentdir.firstelement + 0)
02:a003 : f0 52 __ BEQ $a057 ; (dir_bottom.s3 + 0)
.s5:
02:a005 : ad 33 55 LDA $5533 ; (presentdirelement.meta.next + 0)
02:a008 : 85 57 __ STA T1 + 0 
02:a00a : ad 34 55 LDA $5534 ; (presentdirelement.meta.next + 1)
02:a00d : 85 58 __ STA T1 + 1 
02:a00f : ad 35 55 LDA $5535 ; (presentdirelement.meta.next + 2)
02:a012 : 85 59 __ STA T1 + 2 
02:a014 : ad 36 55 LDA $5536 ; (presentdirelement.meta.next + 3)
02:a017 : 85 5a __ STA T1 + 3 
02:a019 : d0 0c __ BNE $a027 ; (dir_bottom.s6 + 0)
.s14:
02:a01b : a5 59 __ LDA T1 + 2 
02:a01d : d0 08 __ BNE $a027 ; (dir_bottom.s6 + 0)
.s15:
02:a01f : a5 58 __ LDA T1 + 1 
02:a021 : d0 04 __ BNE $a027 ; (dir_bottom.s6 + 0)
.s16:
02:a023 : a5 57 __ LDA T1 + 0 
02:a025 : f0 30 __ BEQ $a057 ; (dir_bottom.s3 + 0)
.s6:
02:a027 : ad 70 53 LDA $5370 ; (presentdir.lastprint + 0)
02:a02a : 85 0d __ STA P0 
02:a02c : 8d fc 4c STA $4cfc ; (present + 0)
02:a02f : ad 71 53 LDA $5371 ; (presentdir.lastprint + 1)
02:a032 : 85 0e __ STA P1 
02:a034 : 8d fd 4c STA $4cfd ; (present + 1)
02:a037 : ad 72 53 LDA $5372 ; (presentdir.lastprint + 2)
02:a03a : 85 0f __ STA P2 
02:a03c : 8d fe 4c STA $4cfe ; (present + 2)
02:a03f : ad 73 53 LDA $5373 ; (presentdir.lastprint + 3)
02:a042 : 85 10 __ STA P3 
02:a044 : 8d ff 4c STA $4cff ; (present + 3)
02:a047 : 20 d2 93 JSR $93d2 ; (dir_get_element.s4 + 0)
02:a04a : a5 57 __ LDA T1 + 0 
02:a04c : 05 58 __ ORA T1 + 1 
02:a04e : 05 59 __ ORA T1 + 2 
02:a050 : 05 5a __ ORA T1 + 3 
02:a052 : d0 0e __ BNE $a062 ; (dir_bottom.l8 + 0)
.s7:
02:a054 : 20 54 9b JSR $9b54 ; (dir_last_of_page.s4 + 0)
.s3:
02:a057 : a2 07 __ LDX #$07
02:a059 : bd 4c 7e LDA $7e4c,x ; (dir_bottom@stack + 0)
02:a05c : 95 53 __ STA T0 + 0,x 
02:a05e : ca __ __ DEX
02:a05f : 10 f8 __ BPL $a059 ; (dir_bottom.s3 + 2)
02:a061 : 60 __ __ RTS
.l8:
02:a062 : ad fc 4c LDA $4cfc ; (present + 0)
02:a065 : 85 53 __ STA T0 + 0 
02:a067 : 85 0d __ STA P0 
02:a069 : ad fd 4c LDA $4cfd ; (present + 1)
02:a06c : 85 54 __ STA T0 + 1 
02:a06e : 85 0e __ STA P1 
02:a070 : ad fe 4c LDA $4cfe ; (present + 2)
02:a073 : 85 55 __ STA T0 + 2 
02:a075 : 85 0f __ STA P2 
02:a077 : ad ff 4c LDA $4cff ; (present + 3)
02:a07a : 85 56 __ STA T0 + 3 
02:a07c : 85 10 __ STA P3 
02:a07e : 20 d2 93 JSR $93d2 ; (dir_get_element.s4 + 0)
02:a081 : a5 57 __ LDA T1 + 0 
02:a083 : 05 58 __ ORA T1 + 1 
02:a085 : 05 59 __ ORA T1 + 2 
02:a087 : 05 5a __ ORA T1 + 3 
02:a089 : f0 17 __ BEQ $a0a2 ; (dir_bottom.s9 + 0)
.s13:
02:a08b : a5 57 __ LDA T1 + 0 
02:a08d : 8d fc 4c STA $4cfc ; (present + 0)
02:a090 : a5 58 __ LDA T1 + 1 
02:a092 : 8d fd 4c STA $4cfd ; (present + 1)
02:a095 : a5 59 __ LDA T1 + 2 
02:a097 : 8d fe 4c STA $4cfe ; (present + 2)
02:a09a : a5 5a __ LDA T1 + 3 
02:a09c : 8d ff 4c STA $4cff ; (present + 3)
02:a09f : 4c 62 a0 JMP $a062 ; (dir_bottom.l8 + 0)
.s9:
02:a0a2 : a5 53 __ LDA T0 + 0 
02:a0a4 : 8d 74 53 STA $5374 ; (presentdir.present + 0)
02:a0a7 : a5 54 __ LDA T0 + 1 
02:a0a9 : 8d 75 53 STA $5375 ; (presentdir.present + 1)
02:a0ac : a5 55 __ LDA T0 + 2 
02:a0ae : 8d 76 53 STA $5376 ; (presentdir.present + 2)
02:a0b1 : a5 56 __ LDA T0 + 3 
02:a0b3 : 8d 77 53 STA $5377 ; (presentdir.present + 3)
02:a0b6 : a9 12 __ LDA #$12
02:a0b8 : 8d 79 53 STA $5379 ; (presentdir.position + 0)
02:a0bb : 85 57 __ STA T1 + 0 
02:a0bd : a9 00 __ LDA #$00
02:a0bf : 8d 7a 53 STA $537a ; (presentdir.position + 1)
.l10:
02:a0c2 : ad 37 55 LDA $5537 ; (presentdirelement.meta.prev + 0)
02:a0c5 : 0d 38 55 ORA $5538 ; (presentdirelement.meta.prev + 1)
02:a0c8 : 0d 39 55 ORA $5539 ; (presentdirelement.meta.prev + 2)
02:a0cb : 0d 3a 55 ORA $553a ; (presentdirelement.meta.prev + 3)
02:a0ce : f0 27 __ BEQ $a0f7 ; (dir_bottom.s11 + 0)
.s12:
02:a0d0 : ad 37 55 LDA $5537 ; (presentdirelement.meta.prev + 0)
02:a0d3 : 85 0d __ STA P0 
02:a0d5 : 8d fc 4c STA $4cfc ; (present + 0)
02:a0d8 : ad 38 55 LDA $5538 ; (presentdirelement.meta.prev + 1)
02:a0db : 85 0e __ STA P1 
02:a0dd : 8d fd 4c STA $4cfd ; (present + 1)
02:a0e0 : ad 39 55 LDA $5539 ; (presentdirelement.meta.prev + 2)
02:a0e3 : 85 0f __ STA P2 
02:a0e5 : 8d fe 4c STA $4cfe ; (present + 2)
02:a0e8 : ad 3a 55 LDA $553a ; (presentdirelement.meta.prev + 3)
02:a0eb : 85 10 __ STA P3 
02:a0ed : 8d ff 4c STA $4cff ; (present + 3)
02:a0f0 : 20 d2 93 JSR $93d2 ; (dir_get_element.s4 + 0)
02:a0f3 : c6 57 __ DEC T1 + 0 
02:a0f5 : d0 cb __ BNE $a0c2 ; (dir_bottom.l10 + 0)
.s11:
02:a0f7 : a9 00 __ LDA #$00
02:a0f9 : 8d f9 7f STA $7ff9 ; (sstack + 26)
02:a0fc : ad fc 4c LDA $4cfc ; (present + 0)
02:a0ff : 8d 6c 53 STA $536c ; (presentdir.firstprint + 0)
02:a102 : ad fd 4c LDA $4cfd ; (present + 1)
02:a105 : 8d 6d 53 STA $536d ; (presentdir.firstprint + 1)
02:a108 : ad fe 4c LDA $4cfe ; (present + 2)
02:a10b : 8d 6e 53 STA $536e ; (presentdir.firstprint + 2)
02:a10e : ad ff 4c LDA $4cff ; (present + 3)
02:a111 : 8d 6f 53 STA $536f ; (presentdir.firstprint + 3)
02:a114 : 20 07 85 JSR $8507 ; (dir_draw.s1 + 0)
02:a117 : 4c 57 a0 JMP $a057 ; (dir_bottom.s3 + 0)
--------------------------------------------------------------------
02:a11a : __ __ __ BYT 2e 2e 00                                        : ...
--------------------------------------------------------------------
02:a11d : __ __ __ BYT ff 00                                           : ..
--------------------------------------------------------------------
dir_print_entry@proxy: ; dir_print_entry@proxy
02:a11f : ad 79 53 LDA $5379 ; (presentdir.position + 0)
02:a122 : 85 18 __ STA P11 
02:a124 : 4c 85 95 JMP $9585 ; (dir_print_entry.s4 + 0)
--------------------------------------------------------------------
progressBar:
02:a127 : __ __ __ BYT 65 61 67 20                                     : eag 
--------------------------------------------------------------------
progressRev:
02:a12b : __ __ __ BYT 00 00 01 01                                     : ....
--------------------------------------------------------------------
ascToPetTable:
02:a200 : __ __ __ BYT 00 01 02 03 04 05 06 07 14 20 0d 11 93 0a 0e 0f : ......... ......
02:a210 : __ __ __ BYT 10 0b 12 13 08 15 16 17 18 19 1a 1b 1c 1d 1e 1f : ................
02:a220 : __ __ __ BYT 20 21 22 23 24 25 26 27 28 29 2a 2b 2c 2d 2e 2f :  !"#$%&'()*+,-./
02:a230 : __ __ __ BYT 30 31 32 33 34 35 36 37 38 39 3a 3b 3c 3d 3e 3f : 0123456789:;<=>?
02:a240 : __ __ __ BYT 40 c1 c2 c3 c4 c5 c6 c7 c8 c9 ca cb cc cd ce cf : @...............
02:a250 : __ __ __ BYT d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 da 5b 5c 5d 5e 5f : ...........[\]^_
02:a260 : __ __ __ BYT c0 41 42 43 44 45 46 47 48 49 4a 4b 4c 4d 4e 4f : .ABCDEFGHIJKLMNO
02:a270 : __ __ __ BYT 50 51 52 53 54 55 56 57 58 59 5a db dc dd de df : PQRSTUVWXYZ.....
02:a280 : __ __ __ BYT 80 81 82 83 84 85 86 87 88 89 8a 8b 8c 8d 8e 8f : ................
02:a290 : __ __ __ BYT 90 91 92 0c 94 95 96 97 98 99 9a 9b 9c 9d 9e 9f : ................
02:a2a0 : __ __ __ BYT a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 aa ab ac ad ae af : ................
02:a2b0 : __ __ __ BYT b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 ba bb bc bd be bf : ................
02:a2c0 : __ __ __ BYT 60 61 62 63 64 65 66 67 68 69 6a 6b 6c 6d 6e 6f : `abcdefghijklmno
02:a2d0 : __ __ __ BYT 70 71 72 73 74 75 76 77 78 79 7a 7b 7c 7d 7e 7f : pqrstuvwxyz{|}~.
02:a2e0 : __ __ __ BYT e0 e1 e2 e3 e4 e5 e6 e7 e8 e9 ea eb ec ed ee ef : ................
02:a2f0 : __ __ __ BYT f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 fa fb fc fd fe ff : ................
