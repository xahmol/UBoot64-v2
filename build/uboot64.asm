; Compiled with 1.32.263
--------------------------------------------------------------------
cfg:
4900 : __ __ __ BSS	86
--------------------------------------------------------------------
cw:
4956 : __ __ __ BSS	12
--------------------------------------------------------------------
vspriteScreen:
4962 : __ __ __ BSS	2
--------------------------------------------------------------------
linebuffer:
4964 : __ __ __ BSS	100
--------------------------------------------------------------------
uii_data:
49c8 : __ __ __ BSS	513
--------------------------------------------------------------------
uii_status:
4bc9 : __ __ __ BSS	257
--------------------------------------------------------------------
execute_commands:
4cca : __ __ __ BSS	200
--------------------------------------------------------------------
execute_keys:
4d92 : __ __ __ BSS	10
--------------------------------------------------------------------
Slot:
4d9c : __ __ __ BSS	1336
--------------------------------------------------------------------
uii_devinfo:
52d4 : __ __ __ BSS	16
--------------------------------------------------------------------
iec_devices:
52e4 : __ __ __ BSS	23
--------------------------------------------------------------------
HeapNode:
52fb : __ __ __ BSS	4
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
00:801b : e0 52 __ CPX #$52
00:801d : f0 0b __ BEQ $802a ; (startup + 42)
00:801f : 91 19 __ STA (IP + 0),y 
00:8021 : c8 __ __ INY
00:8022 : d0 fb __ BNE $801f ; (startup + 31)
00:8024 : e8 __ __ INX
00:8025 : d0 f2 __ BNE $8019 ; (startup + 25)
00:8027 : 91 19 __ STA (IP + 0),y 
00:8029 : c8 __ __ INY
00:802a : c0 ff __ CPY #$ff
00:802c : d0 f9 __ BNE $8027 ; (startup + 39)
00:802e : a9 00 __ LDA #$00
00:8030 : a2 f7 __ LDX #$f7
00:8032 : d0 03 __ BNE $8037 ; (startup + 55)
00:8034 : 95 00 __ STA $00,x 
00:8036 : e8 __ __ INX
00:8037 : e0 f7 __ CPX #$f7
00:8039 : d0 f9 __ BNE $8034 ; (startup + 52)
00:803b : a9 eb __ LDA #$eb
00:803d : 85 23 __ STA SP + 0 
00:803f : a9 7c __ LDA #$7c
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
00:80ab : bd ff 80 LDA $80ff,x ; (startmessage + 0)
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
00:80ca : 86 45 __ STX T1 + 0 
00:80cc : 18 __ __ CLC
00:80cd : 69 86 __ ADC #$86
00:80cf : 85 46 __ STA T1 + 1 
00:80d1 : a0 00 __ LDY #$00
.l10:
00:80d3 : b1 43 __ LDA (T0 + 0),y 
00:80d5 : 91 45 __ STA (T1 + 0),y 
00:80d7 : ee 20 d0 INC $d020 
00:80da : c8 __ __ INY
00:80db : d0 f6 __ BNE $80d3 ; (main.l10 + 0)
.s11:
00:80dd : 84 43 __ STY T0 + 0 
00:80df : e6 44 __ INC T0 + 1 
00:80e1 : a5 44 __ LDA T0 + 1 
00:80e3 : c9 c0 __ CMP #$c0
00:80e5 : d0 e3 __ BNE $80ca ; (main.l6 + 0)
.l9:
00:80e7 : bd 29 81 LDA $8129,x ; (logo_sprite + 0)
00:80ea : 9d 40 03 STA $0340,x 
00:80ed : ee 20 d0 INC $d020 
00:80f0 : e8 __ __ INX
00:80f1 : e0 40 __ CPX #$40
00:80f3 : 90 f2 __ BCC $80e7 ; (main.l9 + 0)
.s7:
00:80f5 : 20 00 09 JSR $0900 
00:80f8 : a9 00 __ LDA #$00
00:80fa : 85 1b __ STA ACCU + 0 
00:80fc : 85 1c __ STA ACCU + 1 
.s3:
00:80fe : 60 __ __ RTS
--------------------------------------------------------------------
startmessage:
00:80ff : __ __ __ BYT 73 54 41 52 54 49 4e 47 20 75 62 4f 4f 54 36 34 : sTARTING ubOOT64
00:810f : __ __ __ BYT 2e 0d 0d 63 4f 50 59 49 4e 47 20 43 4f 52 45 20 : ...cOPYING CORE 
00:811f : __ __ __ BYT 54 4f 20 72 61 6d 2e 0d 00 00                   : TO ram....
--------------------------------------------------------------------
logo_sprite:
00:8129 : __ __ __ BYT 00 0f 80 00 10 40 00 10 40 00 13 80 00 12 00 00 : .....@..@.......
00:8139 : __ __ __ BYT 3f 00 40 c0 c0 a3 00 30 94 00 18 9a ba 94 92 a2 : ?.@....0........
00:8149 : __ __ __ BYT a2 52 bb a2 22 a8 a1 23 b8 a1 5c 00 22 93 00 22 : .R.."..#..\.".."
00:8159 : __ __ __ BYT 88 c0 d4 94 3f 18 93 00 30 a0 c0 c0 40 3f 00 07 : ....?...0...@?..
--------------------------------------------------------------------
fc3_exit: ; fc3_exit()->void
.s4:
00:8200 : a9 a7 __ LDA #$a7
00:8202 : 85 0d __ STA P0 
00:8204 : a9 c0 __ LDA #$c0
00:8206 : 85 0e __ STA P1 
00:8208 : 20 39 11 JSR $1139 
00:820b : 20 c0 11 JSR $11c0 
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
00:827d : bd ca 4c LDA $4cca,x ; (execute_commands + 0)
00:8280 : f0 06 __ BEQ $8288 ; (fc3_exit.s4 + 136)
00:8282 : 20 d2 ff JSR $ffd2 
00:8285 : e8 __ __ INX
00:8286 : d0 f5 __ BNE $827d ; (fc3_exit.s4 + 125)
00:8288 : a2 00 __ LDX #$00
00:828a : bd 92 4d LDA $4d92,x ; (execute_keys + 0)
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
00:82a3 : 4c 78 a4 JMP $a478 ; (mul40 + 12)
.s3:
00:82a6 : 60 __ __ RTS
--------------------------------------------------------------------
00:82a7 : __ __ __ BYT 65 58 49 54 20 52 4f 55 54 49 4e 45 00          : eXIT ROUTINE.
--------------------------------------------------------------------
bootmsg:
00:82b4 : __ __ __ BYT 0d 55 42 4f 4f 54 36 34 2e 0d 00                : .UBOOT64...
--------------------------------------------------------------------
mainloop: ; mainloop()->void
.s1:
00:8300 : a5 53 __ LDA T2 + 0 
00:8302 : 8d ed 7c STA $7ced ; (mainloop@stack + 0)
00:8305 : 38 __ __ SEC
00:8306 : a5 23 __ LDA SP + 0 
00:8308 : e9 0d __ SBC #$0d
00:830a : 85 23 __ STA SP + 0 
00:830c : b0 02 __ BCS $8310 ; (mainloop.s4 + 0)
00:830e : c6 24 __ DEC SP + 1 
.s4:
00:8310 : a9 00 __ LDA #$00
00:8312 : 8d 54 49 STA $4954 ; (cfg + 84)
00:8315 : 8d 55 49 STA $4955 ; (cfg + 85)
00:8318 : a9 02 __ LDA #$02
00:831a : 8d 00 49 STA $4900 ; (cfg + 0)
00:831d : a9 01 __ LDA #$01
00:831f : 8d 01 49 STA $4901 ; (cfg + 1)
00:8322 : a9 20 __ LDA #$20
00:8324 : 8d 52 49 STA $4952 ; (cfg + 82)
00:8327 : a9 1c __ LDA #$1c
00:8329 : 8d 53 49 STA $4953 ; (cfg + 83)
00:832c : a2 ff __ LDX #$ff
.l5:
00:832e : e8 __ __ INX
00:832f : bd 54 0c LDA $0c54,x 
00:8332 : 9d 02 49 STA $4902,x ; (cfg + 2)
00:8335 : d0 f7 __ BNE $832e ; (mainloop.l5 + 0)
.s6:
00:8337 : 20 61 0c JSR $0c61 
00:833a : a9 00 __ LDA #$00
00:833c : 8d 20 d0 STA $d020 
00:833f : 8d 21 d0 STA $d021 
00:8342 : 20 7b 0c JSR $0c7b 
00:8345 : 20 a4 0c JSR $0ca4 
00:8348 : a9 f8 __ LDA #$f8
00:834a : 8d 62 49 STA $4962 ; (vspriteScreen + 0)
00:834d : a9 07 __ LDA #$07
00:834f : 8d 63 49 STA $4963 ; (vspriteScreen + 1)
00:8352 : 20 f8 0c JSR $0cf8 
00:8355 : 20 40 0d JSR $0d40 
00:8358 : a9 00 __ LDA #$00
00:835a : 8d 5a 49 STA $495a ; (cw + 4)
00:835d : a9 03 __ LDA #$03
00:835f : 8d 5b 49 STA $495b ; (cw + 5)
00:8362 : ad 1d df LDA $df1d 
00:8365 : c9 c9 __ CMP #$c9
00:8367 : f0 25 __ BEQ $838e ; (mainloop.s61 + 0)
.s7:
00:8369 : a9 99 __ LDA #$99
00:836b : 85 0d __ STA P0 
00:836d : a9 11 __ LDA #$11
00:836f : 85 0e __ STA P1 
00:8371 : 20 39 11 JSR $1139 
00:8374 : 20 c0 11 JSR $11c0 
00:8377 : a9 d8 __ LDA #$d8
00:8379 : 85 0d __ STA P0 
00:837b : a9 11 __ LDA #$11
00:837d : 85 0e __ STA P1 
00:837f : 20 39 11 JSR $1139 
00:8382 : 20 c0 11 JSR $11c0 
00:8385 : 20 eb 11 JSR $11eb 
00:8388 : 20 00 c0 JSR $c000 
00:838b : 4c 9f 09 JMP $099f 
.s61:
00:838e : 20 30 11 JSR $1130 
00:8391 : a9 00 __ LDA #$00
00:8393 : 85 0d __ STA P0 
00:8395 : a9 12 __ LDA #$12
00:8397 : 85 0e __ STA P1 
00:8399 : 20 39 11 JSR $1139 
00:839c : 20 c0 11 JSR $11c0 
.s8:
00:839f : a9 00 __ LDA #$00
00:83a1 : 85 10 __ STA P3 
00:83a3 : 8d ee 7c STA $7cee ; (cmd + 0)
00:83a6 : a9 02 __ LDA #$02
00:83a8 : 85 0f __ STA P2 
00:83aa : a9 01 __ LDA #$01
00:83ac : 8d a6 2a STA $2aa6 
00:83af : 8d ef 7c STA $7cef ; (cmd + 1)
00:83b2 : a9 ee __ LDA #$ee
00:83b4 : 85 0d __ STA P0 
00:83b6 : a9 7c __ LDA #$7c
00:83b8 : 85 0e __ STA P1 
00:83ba : 20 a6 0f JSR $0fa6 
00:83bd : 20 22 10 JSR $1022 
00:83c0 : 20 60 10 JSR $1060 
00:83c3 : 20 0e 11 JSR $110e 
00:83c6 : a9 c8 __ LDA #$c8
00:83c8 : 85 0d __ STA P0 
00:83ca : a9 49 __ LDA #$49
00:83cc : 85 0e __ STA P1 
00:83ce : 20 39 11 JSR $1139 
00:83d1 : 20 c0 11 JSR $11c0 
00:83d4 : 20 25 12 JSR $1225 
00:83d7 : a5 1c __ LDA ACCU + 1 
00:83d9 : 05 1b __ ORA ACCU + 0 
00:83db : d0 10 __ BNE $83ed ; (mainloop.s60 + 0)
.s9:
00:83dd : a9 7f __ LDA #$7f
00:83df : 8d fc 7f STA $7ffc ; (sstack + 4)
00:83e2 : a9 1a __ LDA #$1a
00:83e4 : 8d fd 7f STA $7ffd ; (sstack + 5)
00:83e7 : 20 27 1a JSR $1a27 
00:83ea : 4c 12 0a JMP $0a12 
.s60:
00:83ed : a9 0b __ LDA #$0b
00:83ef : a0 05 __ LDY #$05
00:83f1 : 91 23 __ STA (SP + 0),y 
00:83f3 : a9 1a __ LDA #$1a
00:83f5 : c8 __ __ INY
00:83f6 : 91 23 __ STA (SP + 0),y 
00:83f8 : a5 1b __ LDA ACCU + 0 
00:83fa : 85 44 __ STA T0 + 1 
00:83fc : a5 1c __ LDA ACCU + 1 
00:83fe : 4a __ __ LSR
00:83ff : 66 44 __ ROR T0 + 1 
00:8401 : 6a __ __ ROR
00:8402 : 66 44 __ ROR T0 + 1 
00:8404 : 29 80 __ AND #$80
00:8406 : 6a __ __ ROR
00:8407 : c8 __ __ INY
00:8408 : 91 23 __ STA (SP + 0),y 
00:840a : a5 44 __ LDA T0 + 1 
00:840c : c8 __ __ INY
00:840d : 91 23 __ STA (SP + 0),y 
00:840f : 20 70 13 JSR $1370 
.s10:
00:8412 : a9 00 __ LDA #$00
00:8414 : 8d 09 dc STA $dc09 
00:8417 : 8d 08 dc STA $dc08 
.l11:
00:841a : 20 91 10 JSR $1091 
00:841d : ad c9 4b LDA $4bc9 ; (uii_status + 0)
00:8420 : c9 30 __ CMP #$30
00:8422 : d0 f6 __ BNE $841a ; (mainloop.l11 + 0)
.s12:
00:8424 : ad ca 4b LDA $4bca ; (uii_status + 1)
00:8427 : c9 30 __ CMP #$30
00:8429 : d0 ef __ BNE $841a ; (mainloop.l11 + 0)
.s13:
00:842b : ad 09 dc LDA $dc09 
00:842e : c9 05 __ CMP #$05
00:8430 : b0 e8 __ BCS $841a ; (mainloop.l11 + 0)
.s14:
00:8432 : 20 90 1a JSR $1a90 
00:8435 : 20 7c 1e JSR $1e7c 
00:8438 : 20 e5 23 JSR $23e5 
00:843b : a5 1b __ LDA ACCU + 0 
00:843d : d0 0d __ BNE $844c ; (mainloop.s16 + 0)
.s15:
00:843f : a9 b3 __ LDA #$b3
00:8441 : 8d fc 7f STA $7ffc ; (sstack + 4)
00:8444 : a9 24 __ LDA #$24
00:8446 : 8d fd 7f STA $7ffd ; (sstack + 5)
00:8449 : 20 27 1a JSR $1a27 
.s16:
00:844c : a9 ce __ LDA #$ce
00:844e : a0 05 __ LDY #$05
00:8450 : 91 23 __ STA (SP + 0),y 
00:8452 : a9 24 __ LDA #$24
00:8454 : c8 __ __ INY
00:8455 : 91 23 __ STA (SP + 0),y 
00:8457 : 20 70 13 JSR $1370 
00:845a : ad d4 52 LDA $52d4 ; (uii_devinfo + 0)
00:845d : f0 63 __ BEQ $84c2 ; (mainloop.s17 + 0)
.s49:
00:845f : a9 00 __ LDA #$00
00:8461 : a0 05 __ LDY #$05
00:8463 : 91 23 __ STA (SP + 0),y 
00:8465 : a9 25 __ LDA #$25
00:8467 : c8 __ __ INY
00:8468 : 91 23 __ STA (SP + 0),y 
00:846a : ad d7 52 LDA $52d7 ; (uii_devinfo + 3)
00:846d : c8 __ __ INY
00:846e : 91 23 __ STA (SP + 0),y 
00:8470 : a9 00 __ LDA #$00
00:8472 : c8 __ __ INY
00:8473 : 91 23 __ STA (SP + 0),y 
00:8475 : ad d6 52 LDA $52d6 ; (uii_devinfo + 2)
00:8478 : d0 07 __ BNE $8481 ; (mainloop.s59 + 0)
.s50:
00:847a : a9 24 __ LDA #$24
00:847c : a2 ed __ LDX #$ed
00:847e : 4c 85 0a JMP $0a85 
.s59:
00:8481 : a9 21 __ LDA #$21
00:8483 : a2 fa __ LDX #$fa
.s51:
00:8485 : a0 0a __ LDY #$0a
00:8487 : 91 23 __ STA (SP + 0),y 
00:8489 : 8a __ __ TXA
00:848a : 88 __ __ DEY
00:848b : 91 23 __ STA (SP + 0),y 
00:848d : ad d5 52 LDA $52d5 ; (uii_devinfo + 1)
00:8490 : c9 01 __ CMP #$01
00:8492 : d0 12 __ BNE $84a6 ; (mainloop.s52 + 0)
.s58:
00:8494 : a9 24 __ LDA #$24
00:8496 : a2 f6 __ LDX #$f6
.s55:
00:8498 : a0 0c __ LDY #$0c
00:849a : 91 23 __ STA (SP + 0),y 
00:849c : 8a __ __ TXA
00:849d : 88 __ __ DEY
00:849e : 91 23 __ STA (SP + 0),y 
00:84a0 : 20 70 13 JSR $1370 
00:84a3 : 4c c2 0a JMP $0ac2 
.s52:
00:84a6 : aa __ __ TAX
00:84a7 : d0 07 __ BNE $84b0 ; (mainloop.s53 + 0)
.s57:
00:84a9 : a9 24 __ LDA #$24
00:84ab : a2 f1 __ LDX #$f1
00:84ad : 4c 98 0a JMP $0a98 
.s53:
00:84b0 : c9 02 __ CMP #$02
00:84b2 : f0 07 __ BEQ $84bb ; (mainloop.s56 + 0)
.s54:
00:84b4 : a9 11 __ LDA #$11
00:84b6 : a2 ff __ LDX #$ff
00:84b8 : 4c 98 0a JMP $0a98 
.s56:
00:84bb : a9 24 __ LDA #$24
00:84bd : a2 fb __ LDX #$fb
00:84bf : 4c 98 0a JMP $0a98 
.s17:
00:84c2 : ad d8 52 LDA $52d8 ; (uii_devinfo + 4)
00:84c5 : f0 63 __ BEQ $852a ; (mainloop.s18 + 0)
.s38:
00:84c7 : a9 1c __ LDA #$1c
00:84c9 : a0 05 __ LDY #$05
00:84cb : 91 23 __ STA (SP + 0),y 
00:84cd : a9 25 __ LDA #$25
00:84cf : c8 __ __ INY
00:84d0 : 91 23 __ STA (SP + 0),y 
00:84d2 : ad db 52 LDA $52db ; (uii_devinfo + 7)
00:84d5 : c8 __ __ INY
00:84d6 : 91 23 __ STA (SP + 0),y 
00:84d8 : a9 00 __ LDA #$00
00:84da : c8 __ __ INY
00:84db : 91 23 __ STA (SP + 0),y 
00:84dd : ad da 52 LDA $52da ; (uii_devinfo + 6)
00:84e0 : d0 07 __ BNE $84e9 ; (mainloop.s48 + 0)
.s39:
00:84e2 : a9 24 __ LDA #$24
00:84e4 : a2 ed __ LDX #$ed
00:84e6 : 4c ed 0a JMP $0aed 
.s48:
00:84e9 : a9 21 __ LDA #$21
00:84eb : a2 fa __ LDX #$fa
.s40:
00:84ed : a0 0a __ LDY #$0a
00:84ef : 91 23 __ STA (SP + 0),y 
00:84f1 : 8a __ __ TXA
00:84f2 : 88 __ __ DEY
00:84f3 : 91 23 __ STA (SP + 0),y 
00:84f5 : ad d9 52 LDA $52d9 ; (uii_devinfo + 5)
00:84f8 : c9 01 __ CMP #$01
00:84fa : d0 12 __ BNE $850e ; (mainloop.s41 + 0)
.s47:
00:84fc : a9 24 __ LDA #$24
00:84fe : a2 f6 __ LDX #$f6
.s44:
00:8500 : a0 0c __ LDY #$0c
00:8502 : 91 23 __ STA (SP + 0),y 
00:8504 : 8a __ __ TXA
00:8505 : 88 __ __ DEY
00:8506 : 91 23 __ STA (SP + 0),y 
00:8508 : 20 70 13 JSR $1370 
00:850b : 4c 2a 0b JMP $0b2a 
.s41:
00:850e : aa __ __ TAX
00:850f : d0 07 __ BNE $8518 ; (mainloop.s42 + 0)
.s46:
00:8511 : a9 24 __ LDA #$24
00:8513 : a2 f1 __ LDX #$f1
00:8515 : 4c 00 0b JMP $0b00 
.s42:
00:8518 : c9 02 __ CMP #$02
00:851a : f0 07 __ BEQ $8523 ; (mainloop.s45 + 0)
.s43:
00:851c : a9 11 __ LDA #$11
00:851e : a2 ff __ LDX #$ff
00:8520 : 4c 00 0b JMP $0b00 
.s45:
00:8523 : a9 24 __ LDA #$24
00:8525 : a2 fb __ LDX #$fb
00:8527 : 4c 00 0b JMP $0b00 
.s18:
00:852a : ad dc 52 LDA $52dc ; (uii_devinfo + 8)
00:852d : f0 31 __ BEQ $8560 ; (mainloop.s19 + 0)
.s34:
00:852f : a9 38 __ LDA #$38
00:8531 : a0 05 __ LDY #$05
00:8533 : 91 23 __ STA (SP + 0),y 
00:8535 : a9 25 __ LDA #$25
00:8537 : c8 __ __ INY
00:8538 : 91 23 __ STA (SP + 0),y 
00:853a : ad df 52 LDA $52df ; (uii_devinfo + 11)
00:853d : c8 __ __ INY
00:853e : 91 23 __ STA (SP + 0),y 
00:8540 : a9 00 __ LDA #$00
00:8542 : c8 __ __ INY
00:8543 : 91 23 __ STA (SP + 0),y 
00:8545 : ad de 52 LDA $52de ; (uii_devinfo + 10)
00:8548 : d0 07 __ BNE $8551 ; (mainloop.s37 + 0)
.s35:
00:854a : a9 24 __ LDA #$24
00:854c : a2 ed __ LDX #$ed
00:854e : 4c 55 0b JMP $0b55 
.s37:
00:8551 : a9 21 __ LDA #$21
00:8553 : a2 fa __ LDX #$fa
.s36:
00:8555 : a0 0a __ LDY #$0a
00:8557 : 91 23 __ STA (SP + 0),y 
00:8559 : 8a __ __ TXA
00:855a : 88 __ __ DEY
00:855b : 91 23 __ STA (SP + 0),y 
00:855d : 20 70 13 JSR $1370 
.s19:
00:8560 : ad e0 52 LDA $52e0 ; (uii_devinfo + 12)
00:8563 : f0 31 __ BEQ $8596 ; (mainloop.s20 + 0)
.s30:
00:8565 : a9 50 __ LDA #$50
00:8567 : a0 05 __ LDY #$05
00:8569 : 91 23 __ STA (SP + 0),y 
00:856b : a9 25 __ LDA #$25
00:856d : c8 __ __ INY
00:856e : 91 23 __ STA (SP + 0),y 
00:8570 : ad e3 52 LDA $52e3 ; (uii_devinfo + 15)
00:8573 : c8 __ __ INY
00:8574 : 91 23 __ STA (SP + 0),y 
00:8576 : a9 00 __ LDA #$00
00:8578 : c8 __ __ INY
00:8579 : 91 23 __ STA (SP + 0),y 
00:857b : ad e2 52 LDA $52e2 ; (uii_devinfo + 14)
00:857e : d0 07 __ BNE $8587 ; (mainloop.s33 + 0)
.s31:
00:8580 : a9 24 __ LDA #$24
00:8582 : a2 ed __ LDX #$ed
00:8584 : 4c 8b 0b JMP $0b8b 
.s33:
00:8587 : a9 21 __ LDA #$21
00:8589 : a2 fa __ LDX #$fa
.s32:
00:858b : a0 0a __ LDY #$0a
00:858d : 91 23 __ STA (SP + 0),y 
00:858f : 8a __ __ TXA
00:8590 : 88 __ __ DEY
00:8591 : 91 23 __ STA (SP + 0),y 
00:8593 : 20 70 13 JSR $1370 
.s20:
00:8596 : a9 68 __ LDA #$68
00:8598 : a0 05 __ LDY #$05
00:859a : 91 23 __ STA (SP + 0),y 
00:859c : a9 25 __ LDA #$25
00:859e : c8 __ __ INY
00:859f : 91 23 __ STA (SP + 0),y 
00:85a1 : 20 90 25 JSR $2590 
00:85a4 : aa __ __ TAX
00:85a5 : d0 07 __ BNE $85ae ; (mainloop.s29 + 0)
.s21:
00:85a7 : a9 21 __ LDA #$21
00:85a9 : a2 fd __ LDX #$fd
00:85ab : 4c b2 0b JMP $0bb2 
.s29:
00:85ae : a9 26 __ LDA #$26
00:85b0 : a2 61 __ LDX #$61
.s22:
00:85b2 : a0 08 __ LDY #$08
00:85b4 : 91 23 __ STA (SP + 0),y 
00:85b6 : 8a __ __ TXA
00:85b7 : 88 __ __ DEY
00:85b8 : 91 23 __ STA (SP + 0),y 
00:85ba : 20 70 13 JSR $1370 
00:85bd : a9 65 __ LDA #$65
00:85bf : a0 05 __ LDY #$05
00:85c1 : 91 23 __ STA (SP + 0),y 
00:85c3 : a9 26 __ LDA #$26
00:85c5 : c8 __ __ INY
00:85c6 : 91 23 __ STA (SP + 0),y 
00:85c8 : 20 70 13 JSR $1370 
00:85cb : a2 00 __ LDX #$00
00:85cd : ad e4 52 LDA $52e4 ; (iec_devices + 0)
00:85d0 : d0 0a __ BNE $85dc ; (mainloop.l26 + 0)
.l24:
00:85d2 : e8 __ __ INX
00:85d3 : e0 17 __ CPX #$17
00:85d5 : b0 2f __ BCS $8606 ; (mainloop.s25 + 0)
.s23:
00:85d7 : bd e4 52 LDA $52e4,x ; (iec_devices + 0)
00:85da : f0 f6 __ BEQ $85d2 ; (mainloop.l24 + 0)
.l26:
00:85dc : 86 53 __ STX T2 + 0 
00:85de : a9 76 __ LDA #$76
00:85e0 : a0 05 __ LDY #$05
00:85e2 : 91 23 __ STA (SP + 0),y 
00:85e4 : a9 26 __ LDA #$26
00:85e6 : c8 __ __ INY
00:85e7 : 91 23 __ STA (SP + 0),y 
00:85e9 : 8a __ __ TXA
00:85ea : e0 16 __ CPX #$16
00:85ec : d0 04 __ BNE $85f2 ; (mainloop.s27 + 0)
.s28:
00:85ee : a9 04 __ LDA #$04
00:85f0 : d0 03 __ BNE $85f5 ; (mainloop.s62 + 0)
.s27:
00:85f2 : 18 __ __ CLC
00:85f3 : 69 08 __ ADC #$08
.s62:
00:85f5 : a0 07 __ LDY #$07
00:85f7 : 91 23 __ STA (SP + 0),y 
00:85f9 : a9 00 __ LDA #$00
00:85fb : c8 __ __ INY
00:85fc : 91 23 __ STA (SP + 0),y 
00:85fe : 20 70 13 JSR $1370 
00:8601 : a6 53 __ LDX T2 + 0 
00:8603 : 4c d2 0b JMP $0bd2 
.s25:
00:8606 : 20 c0 11 JSR $11c0 
00:8609 : a9 01 __ LDA #$01
00:860b : 8d ff df STA $dfff 
00:860e : 20 00 80 JSR $8000 ; (startup + 0)
00:8611 : a9 02 __ LDA #$02
00:8613 : 8d ff df STA $dfff 
00:8616 : 20 00 80 JSR $8000 ; (startup + 0)
00:8619 : a9 03 __ LDA #$03
00:861b : 8d ff df STA $dfff 
00:861e : 20 00 80 JSR $8000 ; (startup + 0)
00:8621 : a9 7c __ LDA #$7c
00:8623 : 85 0d __ STA P0 
00:8625 : a9 26 __ LDA #$26
00:8627 : 85 0e __ STA P1 
00:8629 : 20 39 11 JSR $1139 
00:862c : 20 c0 11 JSR $11c0 
00:862f : 20 eb 11 JSR $11eb 
00:8632 : a9 8d __ LDA #$8d
00:8634 : 85 0d __ STA P0 
00:8636 : a9 26 __ LDA #$26
00:8638 : 85 0e __ STA P1 
00:863a : 20 39 11 JSR $1139 
00:863d : 20 c0 11 JSR $11c0 
00:8640 : 20 00 c0 JSR $c000 
.s3:
00:8643 : 18 __ __ CLC
00:8644 : a5 23 __ LDA SP + 0 
00:8646 : 69 0d __ ADC #$0d
00:8648 : 85 23 __ STA SP + 0 
00:864a : 90 02 __ BCC $864e ; (mainloop.s3 + 11)
00:864c : e6 24 __ INC SP + 1 
00:864e : ad ed 7c LDA $7ced ; (mainloop@stack + 0)
00:8651 : 85 53 __ STA T2 + 0 
00:8653 : 60 __ __ RTS
--------------------------------------------------------------------
00:8654 : __ __ __ BYT 50 4f 4f 4c 2e 4e 54 50 2e 4f 52 47 00          : POOL.NTP.ORG.
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
.s4:
00:8661 : a9 1b __ LDA #$1b
00:8663 : 8d 11 d0 STA $d011 
00:8666 : a9 08 __ LDA #$08
00:8668 : 8d 16 d0 STA $d016 
00:866b : ad 00 dd LDA $dd00 
00:866e : 29 fc __ AND #$fc
00:8670 : 09 03 __ ORA #$03
00:8672 : 8d 00 dd STA $dd00 
00:8675 : a9 16 __ LDA #$16
00:8677 : 8d 18 d0 STA $d018 
.s3:
00:867a : 60 __ __ RTS
--------------------------------------------------------------------
cwin_init: ; cwin_init(struct CharWin*,u8*,u8,u8,u8,u8)->void
.s4:
00:867b : a9 00 __ LDA #$00
00:867d : 8d 56 49 STA $4956 ; (cw + 0)
00:8680 : 8d 57 49 STA $4957 ; (cw + 1)
00:8683 : 8d 5a 49 STA $495a ; (cw + 4)
00:8686 : 8d 5b 49 STA $495b ; (cw + 5)
00:8689 : 8d 5e 49 STA $495e ; (cw + 8)
00:868c : 8d 60 49 STA $4960 ; (cw + 10)
00:868f : a9 28 __ LDA #$28
00:8691 : 8d 58 49 STA $4958 ; (cw + 2)
00:8694 : a9 19 __ LDA #$19
00:8696 : 8d 59 49 STA $4959 ; (cw + 3)
00:8699 : a9 04 __ LDA #$04
00:869b : 8d 5f 49 STA $495f ; (cw + 9)
00:869e : a9 d8 __ LDA #$d8
00:86a0 : 8d 61 49 STA $4961 ; (cw + 11)
.s3:
00:86a3 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_clear: ; cwin_clear(struct CharWin*)->void
.s4:
00:86a4 : ad 59 49 LDA $4959 ; (cw + 3)
00:86a7 : f0 32 __ BEQ $86db ; (cwin_clear.s3 + 0)
.s5:
00:86a9 : ad 5e 49 LDA $495e ; (cw + 8)
00:86ac : 85 1b __ STA ACCU + 0 
00:86ae : ad 5f 49 LDA $495f ; (cw + 9)
00:86b1 : 85 1c __ STA ACCU + 1 
00:86b3 : ad 60 49 LDA $4960 ; (cw + 10)
00:86b6 : 85 43 __ STA T1 + 0 
00:86b8 : ad 61 49 LDA $4961 ; (cw + 11)
00:86bb : 85 44 __ STA T1 + 1 
00:86bd : a2 00 __ LDX #$00
00:86bf : ad 58 49 LDA $4958 ; (cw + 2)
00:86c2 : f0 11 __ BEQ $86d5 ; (cwin_clear.l7 + 0)
.l8:
00:86c4 : 85 1d __ STA ACCU + 2 
00:86c6 : a0 00 __ LDY #$00
.l9:
00:86c8 : a9 20 __ LDA #$20
00:86ca : 91 1b __ STA (ACCU + 0),y 
00:86cc : a9 01 __ LDA #$01
00:86ce : 91 43 __ STA (T1 + 0),y 
00:86d0 : c8 __ __ INY
00:86d1 : c4 1d __ CPY ACCU + 2 
00:86d3 : 90 f3 __ BCC $86c8 ; (cwin_clear.l9 + 0)
.l7:
00:86d5 : e8 __ __ INX
00:86d6 : ec 59 49 CPX $4959 ; (cw + 3)
00:86d9 : 90 01 __ BCC $86dc ; (cwin_clear.s6 + 0)
.s3:
00:86db : 60 __ __ RTS
.s6:
00:86dc : a5 1b __ LDA ACCU + 0 
00:86de : 69 28 __ ADC #$28
00:86e0 : 85 1b __ STA ACCU + 0 
00:86e2 : 90 03 __ BCC $86e7 ; (cwin_clear.s11 + 0)
.s10:
00:86e4 : e6 1c __ INC ACCU + 1 
00:86e6 : 18 __ __ CLC
.s11:
00:86e7 : a5 43 __ LDA T1 + 0 
00:86e9 : 69 28 __ ADC #$28
00:86eb : 85 43 __ STA T1 + 0 
00:86ed : 90 02 __ BCC $86f1 ; (cwin_clear.s13 + 0)
.s12:
00:86ef : e6 44 __ INC T1 + 1 
.s13:
00:86f1 : ad 58 49 LDA $4958 ; (cw + 2)
00:86f4 : f0 df __ BEQ $86d5 ; (cwin_clear.l7 + 0)
00:86f6 : d0 cc __ BNE $86c4 ; (cwin_clear.l8 + 0)
--------------------------------------------------------------------
spr_set: ; spr_set(u8,bool,i16,i16,u8,u8,bool,bool,bool)->void
.s4:
00:86f8 : ad 10 d0 LDA $d010 
00:86fb : 09 01 __ ORA #$01
00:86fd : 8d 10 d0 STA $d010 
00:8700 : ad 15 d0 LDA $d015 
00:8703 : 09 01 __ ORA #$01
00:8705 : 8d 15 d0 STA $d015 
00:8708 : ad 1c d0 LDA $d01c 
00:870b : 29 fe __ AND #$fe
00:870d : 8d 1c d0 STA $d01c 
00:8710 : ad 1d d0 LDA $d01d 
00:8713 : 29 fe __ AND #$fe
00:8715 : 8d 1d d0 STA $d01d 
00:8718 : ad 17 d0 LDA $d017 
00:871b : 29 fe __ AND #$fe
00:871d : 8d 17 d0 STA $d017 
00:8720 : a9 46 __ LDA #$46
00:8722 : 8d 01 d0 STA $d001 
00:8725 : a9 40 __ LDA #$40
00:8727 : 8d 00 d0 STA $d000 
00:872a : ad 62 49 LDA $4962 ; (vspriteScreen + 0)
00:872d : 85 1b __ STA ACCU + 0 
00:872f : ad 63 49 LDA $4963 ; (vspriteScreen + 1)
00:8732 : 85 1c __ STA ACCU + 1 
00:8734 : a9 0d __ LDA #$0d
00:8736 : a0 00 __ LDY #$00
00:8738 : 91 1b __ STA (ACCU + 0),y 
00:873a : a9 03 __ LDA #$03
00:873c : 8d 27 d0 STA $d027 
.s3:
00:873f : 60 __ __ RTS
--------------------------------------------------------------------
headertext: ; headertext(const u8*,u8)->void
.s4:
00:8740 : a9 00 __ LDA #$00
00:8742 : 85 0d __ STA P0 
00:8744 : 85 0e __ STA P1 
00:8746 : a9 28 __ LDA #$28
00:8748 : 85 0f __ STA P2 
00:874a : a9 05 __ LDA #$05
00:874c : 85 12 __ STA P5 
00:874e : a9 01 __ LDA #$01
00:8750 : 85 10 __ STA P3 
00:8752 : a9 a0 __ LDA #$a0
00:8754 : 85 11 __ STA P4 
00:8756 : 20 af 0e JSR $0eaf 
00:8759 : a9 01 __ LDA #$01
00:875b : 85 0e __ STA P1 
00:875d : a9 0d __ LDA #$0d
00:875f : 85 12 __ STA P5 
00:8761 : 20 af 0e JSR $0eaf 
00:8764 : a9 00 __ LDA #$00
00:8766 : 85 0f __ STA P2 
00:8768 : 85 10 __ STA P3 
00:876a : a9 05 __ LDA #$05
00:876c : 85 13 __ STA P6 
00:876e : a9 0f __ LDA #$0f
00:8770 : 85 12 __ STA P5 
00:8772 : a9 43 __ LDA #$43
00:8774 : 85 11 __ STA P4 
00:8776 : 20 a4 0d JSR $0da4 
00:8779 : e6 10 __ INC P3 
00:877b : a9 0d __ LDA #$0d
00:877d : 85 13 __ STA P6 
00:877f : a9 0f __ LDA #$0f
00:8781 : 85 12 __ STA P5 
00:8783 : a9 6c __ LDA #$6c
00:8785 : 85 11 __ STA P4 
00:8787 : 20 a4 0d JSR $0da4 
00:878a : a9 1e __ LDA #$1e
00:878c : 85 0d __ STA P0 
00:878e : a9 11 __ LDA #$11
00:8790 : 85 0e __ STA P1 
00:8792 : 20 27 0f JSR $0f27 
00:8795 : 38 __ __ SEC
00:8796 : a9 28 __ LDA #$28
00:8798 : e5 1b __ SBC ACCU + 0 
00:879a : 85 0f __ STA P2 
00:879c : a9 1e __ LDA #$1e
00:879e : 85 11 __ STA P4 
00:87a0 : a9 11 __ LDA #$11
00:87a2 : 85 12 __ STA P5 
--------------------------------------------------------------------
cwin_putat_string_reverse: ; cwin_putat_string_reverse(struct CharWin*,u8,u8,const u8*,u8)->void
.s4:
00:87a4 : 20 1f 0f JSR $0f1f 
00:87a7 : a9 63 __ LDA #$63
00:87a9 : c5 1b __ CMP ACCU + 0 
00:87ab : b0 06 __ BCS $87b3 ; (cwin_putat_string_reverse.s5 + 0)
.s10:
00:87ad : 85 1b __ STA ACCU + 0 
.s9:
00:87af : a0 00 __ LDY #$00
00:87b1 : f0 4b __ BEQ $87fe ; (cwin_putat_string_reverse.l11 + 0)
.s5:
00:87b3 : a5 1b __ LDA ACCU + 0 
00:87b5 : d0 f8 __ BNE $87af ; (cwin_putat_string_reverse.s9 + 0)
.s6:
00:87b7 : a9 00 __ LDA #$00
00:87b9 : a6 1b __ LDX ACCU + 0 
00:87bb : 9d 64 49 STA $4964,x ; (linebuffer + 0)
00:87be : a5 10 __ LDA P3 ; (y + 0)
00:87c0 : 0a __ __ ASL
00:87c1 : aa __ __ TAX
00:87c2 : bd 6c 2a LDA $2a6c,x 
00:87c5 : 65 0f __ ADC P2 ; (x + 0)
00:87c7 : 85 1b __ STA ACCU + 0 
00:87c9 : bd 6d 2a LDA $2a6d,x 
00:87cc : 69 00 __ ADC #$00
00:87ce : 85 1c __ STA ACCU + 1 
00:87d0 : ad 5e 49 LDA $495e ; (cw + 8)
00:87d3 : 65 1b __ ADC ACCU + 0 
00:87d5 : 85 43 __ STA T1 + 0 
00:87d7 : ad 5f 49 LDA $495f ; (cw + 9)
00:87da : 65 1c __ ADC ACCU + 1 
00:87dc : 85 44 __ STA T1 + 1 
00:87de : ad 60 49 LDA $4960 ; (cw + 10)
00:87e1 : 18 __ __ CLC
00:87e2 : 65 1b __ ADC ACCU + 0 
00:87e4 : 85 1b __ STA ACCU + 0 
00:87e6 : ad 61 49 LDA $4961 ; (cw + 11)
00:87e9 : 65 1c __ ADC ACCU + 1 
00:87eb : 85 1c __ STA ACCU + 1 
00:87ed : a0 00 __ LDY #$00
00:87ef : f0 07 __ BEQ $87f8 ; (cwin_putat_string_reverse.l7 + 0)
.s8:
00:87f1 : 91 43 __ STA (T1 + 0),y 
00:87f3 : a5 13 __ LDA P6 ; (color + 0)
00:87f5 : 91 1b __ STA (ACCU + 0),y 
00:87f7 : c8 __ __ INY
.l7:
00:87f8 : b9 64 49 LDA $4964,y ; (linebuffer + 0)
00:87fb : d0 f4 __ BNE $87f1 ; (cwin_putat_string_reverse.s8 + 0)
.s3:
00:87fd : 60 __ __ RTS
.l11:
00:87fe : b1 11 __ LDA (P4),y ; (str + 0)
00:8800 : 4a __ __ LSR
00:8801 : 4a __ __ LSR
00:8802 : 4a __ __ LSR
00:8803 : 4a __ __ LSR
00:8804 : 4a __ __ LSR
00:8805 : aa __ __ TAX
00:8806 : bd 9e 2a LDA $2a9e,x 
00:8809 : 51 11 __ EOR (P4),y ; (str + 0)
00:880b : 09 80 __ ORA #$80
00:880d : 99 64 49 STA $4964,y ; (linebuffer + 0)
00:8810 : c8 __ __ INY
00:8811 : c4 1b __ CPY ACCU + 0 
00:8813 : 90 e9 __ BCC $87fe ; (cwin_putat_string_reverse.l11 + 0)
00:8815 : b0 a0 __ BCS $87b7 ; (cwin_putat_string_reverse.s6 + 0)
--------------------------------------------------------------------
cwin_console_newline: ; cwin_console_newline(struct CharWin*)->void
.s4:
00:8817 : a9 00 __ LDA #$00
00:8819 : 8d 5a 49 STA $495a ; (cw + 4)
00:881c : ad 5b 49 LDA $495b ; (cw + 5)
00:881f : aa __ __ TAX
00:8820 : 18 __ __ CLC
00:8821 : 69 01 __ ADC #$01
00:8823 : 8d 5b 49 STA $495b ; (cw + 5)
00:8826 : cd 59 49 CMP $4959 ; (cw + 3)
00:8829 : f0 01 __ BEQ $882c ; (cwin_console_newline.s5 + 0)
.s3:
00:882b : 60 __ __ RTS
.s5:
00:882c : 8e 5b 49 STX $495b ; (cw + 5)
00:882f : ce 5d 49 DEC $495d ; (cw + 7)
00:8832 : ad 58 49 LDA $4958 ; (cw + 2)
00:8835 : 85 49 __ STA T7 + 0 
00:8837 : ad 5e 49 LDA $495e ; (cw + 8)
00:883a : 85 43 __ STA T0 + 0 
00:883c : ad 5f 49 LDA $495f ; (cw + 9)
00:883f : 85 44 __ STA T0 + 1 
00:8841 : ad 60 49 LDA $4960 ; (cw + 10)
00:8844 : 85 1b __ STA ACCU + 0 
00:8846 : ad 61 49 LDA $4961 ; (cw + 11)
00:8849 : a2 00 __ LDX #$00
00:884b : f0 0f __ BEQ $885c ; (cwin_console_newline.l6 + 0)
.s9:
00:884d : a5 47 __ LDA T3 + 0 
00:884f : 85 43 __ STA T0 + 0 
00:8851 : a5 48 __ LDA T3 + 1 
00:8853 : 85 44 __ STA T0 + 1 
00:8855 : a5 45 __ LDA T2 + 0 
00:8857 : 85 1b __ STA ACCU + 0 
00:8859 : a5 46 __ LDA T2 + 1 
00:885b : e8 __ __ INX
.l6:
00:885c : 85 1c __ STA ACCU + 1 
00:885e : ad 59 49 LDA $4959 ; (cw + 3)
00:8861 : 38 __ __ SEC
00:8862 : e9 01 __ SBC #$01
00:8864 : 90 06 __ BCC $886c ; (cwin_console_newline.s8 + 0)
.s11:
00:8866 : 85 0e __ STA P1 
00:8868 : e4 0e __ CPX P1 
00:886a : b0 2e __ BCS $889a ; (cwin_console_newline.s7 + 0)
.s8:
00:886c : a5 1b __ LDA ACCU + 0 
00:886e : 69 28 __ ADC #$28
00:8870 : 85 45 __ STA T2 + 0 
00:8872 : a5 1c __ LDA ACCU + 1 
00:8874 : 69 00 __ ADC #$00
00:8876 : 85 46 __ STA T2 + 1 
00:8878 : 18 __ __ CLC
00:8879 : a5 43 __ LDA T0 + 0 
00:887b : 69 28 __ ADC #$28
00:887d : 85 47 __ STA T3 + 0 
00:887f : a5 44 __ LDA T0 + 1 
00:8881 : 69 00 __ ADC #$00
00:8883 : 85 48 __ STA T3 + 1 
00:8885 : a5 49 __ LDA T7 + 0 
00:8887 : f0 c4 __ BEQ $884d ; (cwin_console_newline.s9 + 0)
.s10:
00:8889 : a0 00 __ LDY #$00
.l12:
00:888b : b1 47 __ LDA (T3 + 0),y 
00:888d : 91 43 __ STA (T0 + 0),y 
00:888f : b1 45 __ LDA (T2 + 0),y 
00:8891 : 91 1b __ STA (ACCU + 0),y 
00:8893 : c8 __ __ INY
00:8894 : c4 49 __ CPY T7 + 0 
00:8896 : 90 f3 __ BCC $888b ; (cwin_console_newline.l12 + 0)
00:8898 : b0 b3 __ BCS $884d ; (cwin_console_newline.s9 + 0)
.s7:
00:889a : a5 49 __ LDA T7 + 0 
00:889c : 85 0f __ STA P2 
00:889e : a9 00 __ LDA #$00
00:88a0 : 85 0d __ STA P0 
00:88a2 : a9 01 __ LDA #$01
00:88a4 : 85 10 __ STA P3 
00:88a6 : 85 12 __ STA P5 
00:88a8 : ad a8 2a LDA $2aa8 
00:88ab : 49 20 __ EOR #$20
00:88ad : 85 11 __ STA P4 
--------------------------------------------------------------------
cwin_fill_rect_raw: ; cwin_fill_rect_raw(struct CharWin*,u8,u8,u8,u8,u8,u8)->void
.s4:
00:88af : a5 0f __ LDA P2 ; (w + 0)
00:88b1 : f0 2c __ BEQ $88df ; (cwin_fill_rect_raw.s3 + 0)
.s5:
00:88b3 : a5 10 __ LDA P3 ; (h + 0)
00:88b5 : f0 28 __ BEQ $88df ; (cwin_fill_rect_raw.s3 + 0)
.s6:
00:88b7 : a5 0e __ LDA P1 ; (y + 0)
00:88b9 : 0a __ __ ASL
00:88ba : aa __ __ TAX
00:88bb : ad 5e 49 LDA $495e ; (cw + 8)
00:88be : 7d 6c 2a ADC $2a6c,x 
00:88c1 : a8 __ __ TAY
00:88c2 : ad 5f 49 LDA $495f ; (cw + 9)
00:88c5 : 7d 6d 2a ADC $2a6d,x 
00:88c8 : 85 1c __ STA ACCU + 1 
00:88ca : ad 60 49 LDA $4960 ; (cw + 10)
00:88cd : 18 __ __ CLC
00:88ce : 7d 6c 2a ADC $2a6c,x 
00:88d1 : 85 43 __ STA T3 + 0 
00:88d3 : ad 61 49 LDA $4961 ; (cw + 11)
00:88d6 : 7d 6d 2a ADC $2a6d,x 
00:88d9 : 85 44 __ STA T3 + 1 
00:88db : a5 0f __ LDA P2 ; (w + 0)
00:88dd : d0 01 __ BNE $88e0 ; (cwin_fill_rect_raw.s10 + 0)
.s3:
00:88df : 60 __ __ RTS
.s10:
00:88e0 : 18 __ __ CLC
00:88e1 : a5 43 __ LDA T3 + 0 
00:88e3 : 65 0d __ ADC P0 ; (x + 0)
00:88e5 : 85 43 __ STA T3 + 0 
00:88e7 : 90 03 __ BCC $88ec ; (cwin_fill_rect_raw.s12 + 0)
.s11:
00:88e9 : e6 44 __ INC T3 + 1 
00:88eb : 18 __ __ CLC
.s12:
00:88ec : 98 __ __ TYA
00:88ed : 65 0d __ ADC P0 ; (x + 0)
00:88ef : 85 1b __ STA ACCU + 0 
00:88f1 : 90 02 __ BCC $88f5 ; (cwin_fill_rect_raw.s14 + 0)
.s13:
00:88f3 : e6 1c __ INC ACCU + 1 
.s14:
00:88f5 : a6 10 __ LDX P3 ; (h + 0)
.l7:
00:88f7 : a0 00 __ LDY #$00
.l8:
00:88f9 : a5 11 __ LDA P4 ; (ch + 0)
00:88fb : 91 1b __ STA (ACCU + 0),y 
00:88fd : a5 12 __ LDA P5 ; (color + 0)
00:88ff : 91 43 __ STA (T3 + 0),y 
00:8901 : c8 __ __ INY
00:8902 : c4 0f __ CPY P2 ; (w + 0)
00:8904 : 90 f3 __ BCC $88f9 ; (cwin_fill_rect_raw.l8 + 0)
.s9:
00:8906 : a5 43 __ LDA T3 + 0 
00:8908 : 69 27 __ ADC #$27
00:890a : 85 43 __ STA T3 + 0 
00:890c : 90 03 __ BCC $8911 ; (cwin_fill_rect_raw.s16 + 0)
.s15:
00:890e : e6 44 __ INC T3 + 1 
00:8910 : 18 __ __ CLC
.s16:
00:8911 : a5 1b __ LDA ACCU + 0 
00:8913 : 69 28 __ ADC #$28
00:8915 : 85 1b __ STA ACCU + 0 
00:8917 : 90 02 __ BCC $891b ; (cwin_fill_rect_raw.s18 + 0)
.s17:
00:8919 : e6 1c __ INC ACCU + 1 
.s18:
00:891b : ca __ __ DEX
00:891c : d0 d9 __ BNE $88f7 ; (cwin_fill_rect_raw.l7 + 0)
00:891e : 60 __ __ RTS
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
00:891f : a5 11 __ LDA P4 
00:8921 : 85 0d __ STA P0 
00:8923 : a5 12 __ LDA P5 
00:8925 : 85 0e __ STA P1 
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s4:
00:8927 : a9 00 __ LDA #$00
00:8929 : 85 1b __ STA ACCU + 0 
00:892b : 85 1c __ STA ACCU + 1 
00:892d : a8 __ __ TAY
00:892e : b1 0d __ LDA (P0),y ; (str + 0)
00:8930 : f0 10 __ BEQ $8942 ; (strlen.s3 + 0)
.s6:
00:8932 : a2 00 __ LDX #$00
.l7:
00:8934 : c8 __ __ INY
00:8935 : d0 03 __ BNE $893a ; (strlen.s9 + 0)
.s8:
00:8937 : e6 0e __ INC P1 ; (str + 1)
00:8939 : e8 __ __ INX
.s9:
00:893a : b1 0d __ LDA (P0),y ; (str + 0)
00:893c : d0 f6 __ BNE $8934 ; (strlen.l7 + 0)
.s5:
00:893e : 86 1c __ STX ACCU + 1 
00:8940 : 84 1b __ STY ACCU + 0 
.s3:
00:8942 : 60 __ __ RTS
--------------------------------------------------------------------
00:8943 : __ __ __ BYT 75 62 4f 4f 54 36 34 3a 20 20 62 4f 4f 54 20 6d : ubOOT64:  bOOT m
00:8953 : __ __ __ BYT 45 4e 55 20 46 4f 52 20 75 4c 54 49 4d 41 54 45 : ENU FOR uLTIMATE
00:8963 : __ __ __ BYT 20 44 45 56 49 43 45 53 00                      :  DEVICES.
--------------------------------------------------------------------
00:896c : __ __ __ BYT 73 54 41 52 54 49 4e 47 2e 2e 2e 2e 00          : sTARTING.....
--------------------------------------------------------------------
uii_read_file: ; uii_read_file(u16)->void
.s4:
00:8979 : a9 00 __ LDA #$00
00:897b : 85 10 __ STA P3 
00:897d : 8d f4 7f STA $7ff4 ; (cmd + 0)
00:8980 : 8d f6 7f STA $7ff6 ; (cmd + 2)
00:8983 : 8d f7 7f STA $7ff7 ; (cmd + 3)
00:8986 : a9 01 __ LDA #$01
00:8988 : 8d a6 2a STA $2aa6 
00:898b : a9 02 __ LDA #$02
00:898d : 85 0f __ STA P2 
00:898f : a9 04 __ LDA #$04
00:8991 : 8d f5 7f STA $7ff5 ; (cmd + 1)
00:8994 : a5 11 __ LDA P4 ; (length + 0)
00:8996 : 8d f6 7f STA $7ff6 ; (cmd + 2)
00:8999 : a5 12 __ LDA P5 ; (length + 1)
00:899b : 8d f7 7f STA $7ff7 ; (cmd + 3)
00:899e : a9 f4 __ LDA #$f4
00:89a0 : 85 0d __ STA P0 
00:89a2 : a9 7f __ LDA #$7f
00:89a4 : 85 0e __ STA P1 
--------------------------------------------------------------------
uii_sendcommand: ; uii_sendcommand(u8*,u16)->void
.s4:
00:89a6 : ad a6 2a LDA $2aa6 
00:89a9 : a0 00 __ LDY #$00
00:89ab : 84 1b __ STY ACCU + 0 
00:89ad : 84 1c __ STY ACCU + 1 
00:89af : 91 0d __ STA (P0),y ; (bytes + 0)
.l5:
00:89b1 : ad 1c df LDA $df1c 
00:89b4 : 29 20 __ AND #$20
00:89b6 : d0 f9 __ BNE $89b1 ; (uii_sendcommand.l5 + 0)
.s6:
00:89b8 : ad 1c df LDA $df1c 
00:89bb : 29 10 __ AND #$10
00:89bd : d0 f2 __ BNE $89b1 ; (uii_sendcommand.l5 + 0)
.s7:
00:89bf : a5 1c __ LDA ACCU + 1 
00:89c1 : c5 10 __ CMP P3 ; (count + 1)
00:89c3 : d0 04 __ BNE $89c9 ; (uii_sendcommand.s16 + 0)
.s15:
00:89c5 : a5 1b __ LDA ACCU + 0 
00:89c7 : c5 0f __ CMP P2 ; (count + 0)
.s16:
00:89c9 : b0 2f __ BCS $89fa ; (uii_sendcommand.s8 + 0)
.s12:
00:89cb : 18 __ __ CLC
00:89cc : a5 0d __ LDA P0 ; (bytes + 0)
00:89ce : 65 1b __ ADC ACCU + 0 
00:89d0 : 85 43 __ STA T3 + 0 
00:89d2 : a5 0e __ LDA P1 ; (bytes + 1)
00:89d4 : 65 1c __ ADC ACCU + 1 
00:89d6 : 85 44 __ STA T3 + 1 
00:89d8 : a6 1b __ LDX ACCU + 0 
.l13:
00:89da : a0 00 __ LDY #$00
00:89dc : b1 43 __ LDA (T3 + 0),y 
00:89de : 8d 1d df STA $df1d 
00:89e1 : e6 43 __ INC T3 + 0 
00:89e3 : d0 02 __ BNE $89e7 ; (uii_sendcommand.s19 + 0)
.s18:
00:89e5 : e6 44 __ INC T3 + 1 
.s19:
00:89e7 : e8 __ __ INX
00:89e8 : d0 02 __ BNE $89ec ; (uii_sendcommand.s21 + 0)
.s20:
00:89ea : e6 1c __ INC ACCU + 1 
.s21:
00:89ec : a5 1c __ LDA ACCU + 1 
00:89ee : c5 10 __ CMP P3 ; (count + 1)
00:89f0 : 90 e8 __ BCC $89da ; (uii_sendcommand.l13 + 0)
.s22:
00:89f2 : d0 04 __ BNE $89f8 ; (uii_sendcommand.s17 + 0)
.s14:
00:89f4 : e4 0f __ CPX P2 ; (count + 0)
00:89f6 : 90 e2 __ BCC $89da ; (uii_sendcommand.l13 + 0)
.s17:
00:89f8 : 86 1b __ STX ACCU + 0 
.s8:
00:89fa : ad 1c df LDA $df1c 
00:89fd : 09 01 __ ORA #$01
00:89ff : 8d 1c df STA $df1c 
00:8a02 : ad 1c df LDA $df1c 
00:8a05 : 29 04 __ AND #$04
00:8a07 : f0 0a __ BEQ $8a13 ; (uii_sendcommand.l9 + 0)
.s11:
00:8a09 : ad 1c df LDA $df1c 
00:8a0c : 09 08 __ ORA #$08
00:8a0e : 8d 1c df STA $df1c 
00:8a11 : b0 9e __ BCS $89b1 ; (uii_sendcommand.l5 + 0)
.l9:
00:8a13 : ad 1c df LDA $df1c 
00:8a16 : 29 20 __ AND #$20
00:8a18 : d0 07 __ BNE $8a21 ; (uii_sendcommand.s3 + 0)
.s10:
00:8a1a : ad 1c df LDA $df1c 
00:8a1d : 29 10 __ AND #$10
00:8a1f : d0 f2 __ BNE $8a13 ; (uii_sendcommand.l9 + 0)
.s3:
00:8a21 : 60 __ __ RTS
--------------------------------------------------------------------
uii_readdata: ; uii_readdata()->u16
.s4:
00:8a22 : a9 00 __ LDA #$00
00:8a24 : 8d c8 49 STA $49c8 ; (uii_data + 0)
00:8a27 : a8 __ __ TAY
00:8a28 : f0 16 __ BEQ $8a40 ; (uii_readdata.l5 + 0)
.s8:
00:8a2a : a9 c8 __ LDA #$c8
00:8a2c : 85 43 __ STA T1 + 0 
00:8a2e : 8a __ __ TXA
00:8a2f : 18 __ __ CLC
00:8a30 : 69 49 __ ADC #$49
00:8a32 : 85 44 __ STA T1 + 1 
00:8a34 : ad 1e df LDA $df1e 
00:8a37 : 91 43 __ STA (T1 + 0),y 
00:8a39 : 98 __ __ TYA
00:8a3a : 69 01 __ ADC #$01
00:8a3c : a8 __ __ TAY
00:8a3d : 8a __ __ TXA
00:8a3e : 69 00 __ ADC #$00
.l5:
00:8a40 : aa __ __ TAX
00:8a41 : 2c 1c df BIT $df1c 
00:8a44 : 10 07 __ BPL $8a4d ; (uii_readdata.s6 + 0)
.s7:
00:8a46 : e0 02 __ CPX #$02
00:8a48 : d0 e0 __ BNE $8a2a ; (uii_readdata.s8 + 0)
.s9:
00:8a4a : 98 __ __ TYA
00:8a4b : d0 dd __ BNE $8a2a ; (uii_readdata.s8 + 0)
.s6:
00:8a4d : 86 1c __ STX ACCU + 1 
00:8a4f : 84 1b __ STY ACCU + 0 
00:8a51 : a9 c8 __ LDA #$c8
00:8a53 : 85 43 __ STA T1 + 0 
00:8a55 : 8a __ __ TXA
00:8a56 : 18 __ __ CLC
00:8a57 : 69 49 __ ADC #$49
00:8a59 : 85 44 __ STA T1 + 1 
00:8a5b : a9 00 __ LDA #$00
00:8a5d : 91 43 __ STA (T1 + 0),y 
.s3:
00:8a5f : 60 __ __ RTS
--------------------------------------------------------------------
uii_readstatus: ; uii_readstatus()->void
.s4:
00:8a60 : a9 00 __ LDA #$00
00:8a62 : 8d c9 4b STA $4bc9 ; (uii_status + 0)
00:8a65 : a8 __ __ TAY
00:8a66 : f0 0d __ BEQ $8a75 ; (uii_readstatus.l5 + 0)
.s8:
00:8a68 : ad 1f df LDA $df1f 
00:8a6b : 91 1b __ STA (ACCU + 0),y 
00:8a6d : 98 __ __ TYA
00:8a6e : 18 __ __ CLC
00:8a6f : 69 01 __ ADC #$01
00:8a71 : a8 __ __ TAY
00:8a72 : 8a __ __ TXA
00:8a73 : 69 00 __ ADC #$00
.l5:
00:8a75 : aa __ __ TAX
00:8a76 : a9 c9 __ LDA #$c9
00:8a78 : 85 1b __ STA ACCU + 0 
00:8a7a : 8a __ __ TXA
00:8a7b : 18 __ __ CLC
00:8a7c : 69 4b __ ADC #$4b
00:8a7e : 85 1c __ STA ACCU + 1 
00:8a80 : ad 1c df LDA $df1c 
00:8a83 : 29 40 __ AND #$40
00:8a85 : f0 07 __ BEQ $8a8e ; (uii_readstatus.s6 + 0)
.s7:
00:8a87 : e0 01 __ CPX #$01
00:8a89 : d0 dd __ BNE $8a68 ; (uii_readstatus.s8 + 0)
.s9:
00:8a8b : 98 __ __ TYA
00:8a8c : d0 da __ BNE $8a68 ; (uii_readstatus.s8 + 0)
.s6:
00:8a8e : 91 1b __ STA (ACCU + 0),y 
.s3:
00:8a90 : 60 __ __ RTS
--------------------------------------------------------------------
uii_change_dir: ; uii_change_dir(u8*)->void
.s4:
00:8a91 : a9 af __ LDA #$af
00:8a93 : 85 0d __ STA P0 
00:8a95 : 20 65 2a JSR $2a65 
00:8a98 : a9 2a __ LDA #$2a
00:8a9a : 85 0e __ STA P1 
00:8a9c : 18 __ __ CLC
00:8a9d : a5 1b __ LDA ACCU + 0 
00:8a9f : 69 02 __ ADC #$02
00:8aa1 : 85 1b __ STA ACCU + 0 
00:8aa3 : 90 02 __ BCC $8aa7 ; (uii_change_dir.s10 + 0)
.s9:
00:8aa5 : e6 1c __ INC ACCU + 1 
.s10:
00:8aa7 : 20 4d 28 JSR $284d 
00:8aaa : a5 1b __ LDA ACCU + 0 
00:8aac : 85 45 __ STA T1 + 0 
00:8aae : a5 1c __ LDA ACCU + 1 
00:8ab0 : 85 46 __ STA T1 + 1 
00:8ab2 : a9 00 __ LDA #$00
00:8ab4 : a8 __ __ TAY
00:8ab5 : 91 1b __ STA (ACCU + 0),y 
00:8ab7 : a9 11 __ LDA #$11
00:8ab9 : c8 __ __ INY
00:8aba : 91 1b __ STA (ACCU + 0),y 
00:8abc : 20 27 0f JSR $0f27 
00:8abf : a5 1b __ LDA ACCU + 0 
00:8ac1 : 05 1c __ ORA ACCU + 1 
00:8ac3 : f0 23 __ BEQ $8ae8 ; (uii_change_dir.s5 + 0)
.s6:
00:8ac5 : a9 00 __ LDA #$00
00:8ac7 : 85 47 __ STA T2 + 0 
.l8:
00:8ac9 : a9 2a __ LDA #$2a
00:8acb : 85 0e __ STA P1 
00:8acd : a6 47 __ LDX T2 + 0 
00:8acf : 8a __ __ TXA
00:8ad0 : 18 __ __ CLC
00:8ad1 : 69 02 __ ADC #$02
00:8ad3 : a8 __ __ TAY
00:8ad4 : bd af 2a LDA $2aaf,x 
00:8ad7 : 91 45 __ STA (T1 + 0),y 
00:8ad9 : 20 27 0f JSR $0f27 
00:8adc : e6 47 __ INC T2 + 0 
00:8ade : a5 1c __ LDA ACCU + 1 
00:8ae0 : d0 e7 __ BNE $8ac9 ; (uii_change_dir.l8 + 0)
.s7:
00:8ae2 : a5 47 __ LDA T2 + 0 
00:8ae4 : c5 1b __ CMP ACCU + 0 
00:8ae6 : 90 e1 __ BCC $8ac9 ; (uii_change_dir.l8 + 0)
.s5:
00:8ae8 : a9 01 __ LDA #$01
00:8aea : 8d a6 2a STA $2aa6 
00:8aed : 20 65 2a JSR $2a65 
00:8af0 : a5 45 __ LDA T1 + 0 
00:8af2 : 85 0d __ STA P0 
00:8af4 : a5 46 __ LDA T1 + 1 
00:8af6 : 85 0e __ STA P1 
00:8af8 : 18 __ __ CLC
00:8af9 : a5 1b __ LDA ACCU + 0 
00:8afb : 69 02 __ ADC #$02
00:8afd : 85 0f __ STA P2 
00:8aff : a5 1c __ LDA ACCU + 1 
00:8b01 : 69 00 __ ADC #$00
00:8b03 : 85 10 __ STA P3 
00:8b05 : 20 a6 0f JSR $0fa6 
00:8b08 : 20 45 29 JSR $2945 
00:8b0b : 20 60 10 JSR $1060 
--------------------------------------------------------------------
uii_accept: ; uii_accept()->void
.s4:
00:8b0e : ad 1c df LDA $df1c 
00:8b11 : 09 02 __ ORA #$02
00:8b13 : 8d 1c df STA $df1c 
.l5:
00:8b16 : ad 1c df LDA $df1c 
00:8b19 : 29 02 __ AND #$02
00:8b1b : d0 f9 __ BNE $8b16 ; (uii_accept.l5 + 0)
.s3:
00:8b1d : 60 __ __ RTS
--------------------------------------------------------------------
00:8b1e : __ __ __ BYT 56 32 30 2d 32 30 32 35 30 39 31 33 2d 32 33 34 : V20-20250913-234
00:8b2e : __ __ __ BYT 34 00                                           : 4.
--------------------------------------------------------------------
uii_abort: ; uii_abort()->void
.s4:
00:8b30 : ad 1c df LDA $df1c 
00:8b33 : 09 04 __ ORA #$04
00:8b35 : 8d 1c df STA $df1c 
.s3:
00:8b38 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_put_string: ; cwin_put_string(struct CharWin*,const u8*,u8)->void
.s4:
00:8b39 : ad 5b 49 LDA $495b ; (cw + 5)
00:8b3c : 0a __ __ ASL
00:8b3d : aa __ __ TAX
00:8b3e : bd 6c 2a LDA $2a6c,x 
00:8b41 : 6d 5a 49 ADC $495a ; (cw + 4)
00:8b44 : 85 1b __ STA ACCU + 0 
00:8b46 : bd 6d 2a LDA $2a6d,x 
00:8b49 : 69 00 __ ADC #$00
00:8b4b : 85 1c __ STA ACCU + 1 
00:8b4d : ad 5e 49 LDA $495e ; (cw + 8)
00:8b50 : 65 1b __ ADC ACCU + 0 
00:8b52 : 85 43 __ STA T1 + 0 
00:8b54 : ad 5f 49 LDA $495f ; (cw + 9)
00:8b57 : 65 1c __ ADC ACCU + 1 
00:8b59 : 85 44 __ STA T1 + 1 
00:8b5b : ad 60 49 LDA $4960 ; (cw + 10)
00:8b5e : 18 __ __ CLC
00:8b5f : 65 1b __ ADC ACCU + 0 
00:8b61 : 85 1b __ STA ACCU + 0 
00:8b63 : ad 61 49 LDA $4961 ; (cw + 11)
00:8b66 : 65 1c __ ADC ACCU + 1 
00:8b68 : 85 1c __ STA ACCU + 1 
00:8b6a : a0 00 __ LDY #$00
00:8b6c : b1 0d __ LDA (P0),y ; (str + 0)
00:8b6e : f0 16 __ BEQ $8b86 ; (cwin_put_string.s5 + 0)
.l7:
00:8b70 : 4a __ __ LSR
00:8b71 : 4a __ __ LSR
00:8b72 : 4a __ __ LSR
00:8b73 : 4a __ __ LSR
00:8b74 : 4a __ __ LSR
00:8b75 : aa __ __ TAX
00:8b76 : bd a7 2a LDA $2aa7,x 
00:8b79 : 51 0d __ EOR (P0),y ; (str + 0)
00:8b7b : 91 43 __ STA (T1 + 0),y 
00:8b7d : a9 07 __ LDA #$07
00:8b7f : 91 1b __ STA (ACCU + 0),y 
00:8b81 : c8 __ __ INY
00:8b82 : b1 0d __ LDA (P0),y ; (str + 0)
00:8b84 : d0 ea __ BNE $8b70 ; (cwin_put_string.l7 + 0)
.s5:
00:8b86 : 98 __ __ TYA
00:8b87 : 18 __ __ CLC
00:8b88 : 6d 5a 49 ADC $495a ; (cw + 4)
00:8b8b : cd 58 49 CMP $4958 ; (cw + 2)
00:8b8e : 90 05 __ BCC $8b95 ; (cwin_put_string.s3 + 0)
.s6:
00:8b90 : a9 00 __ LDA #$00
00:8b92 : ee 5b 49 INC $495b ; (cw + 5)
.s3:
00:8b95 : 8d 5a 49 STA $495a ; (cw + 4)
00:8b98 : 60 __ __ RTS
--------------------------------------------------------------------
00:8b99 : __ __ __ BYT 6e 4f 20 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d : nO uLTIMATE cOMM
00:8ba9 : __ __ __ BYT 41 4e 44 20 69 4e 54 45 52 46 41 43 45 20 45 4e : AND iNTERFACE EN
00:8bb9 : __ __ __ BYT 41 42 4c 45 44 2e 00                            : ABLED..
--------------------------------------------------------------------
cwin_cursor_newline: ; cwin_cursor_newline(struct CharWin*)->void
.s4:
00:8bc0 : ad 5b 49 LDA $495b ; (cw + 5)
00:8bc3 : 18 __ __ CLC
00:8bc4 : 69 01 __ ADC #$01
00:8bc6 : a8 __ __ TAY
00:8bc7 : a9 00 __ LDA #$00
00:8bc9 : 8d 5a 49 STA $495a ; (cw + 4)
00:8bcc : 2a __ __ ROL
00:8bcd : d0 08 __ BNE $8bd7 ; (cwin_cursor_newline.s3 + 0)
.s6:
00:8bcf : cc 59 49 CPY $4959 ; (cw + 3)
00:8bd2 : b0 03 __ BCS $8bd7 ; (cwin_cursor_newline.s3 + 0)
.s5:
00:8bd4 : ee 5b 49 INC $495b ; (cw + 5)
.s3:
00:8bd7 : 60 __ __ RTS
--------------------------------------------------------------------
00:8bd8 : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 20 54 4f 20 45 58 49 : pRESS KEY TO EXI
00:8be8 : __ __ __ BYT 54 2e 00                                        : T..
--------------------------------------------------------------------
cwin_getch: ; cwin_getch()->void
.s4:
00:8beb : 20 e4 ff JSR $ffe4 
00:8bee : c9 00 __ CMP #$00
00:8bf0 : f0 f9 __ BEQ $8beb ; (cwin_getch.s4 + 0)
00:8bf2 : 85 1b __ STA ACCU + 0 
00:8bf4 : a9 00 __ LDA #$00
00:8bf6 : 85 1c __ STA ACCU + 1 
.s3:
00:8bf8 : 60 __ __ RTS
--------------------------------------------------------------------
00:8bf9 : __ __ __ BYT 30 30 2c 4f 4b 00                               : 00,OK.
--------------------------------------------------------------------
00:8bff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
00:8c00 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d 41 4e 44 : uLTIMATE cOMMAND
00:8c10 : __ __ __ BYT 20 69 4e 54 45 52 46 41 43 45 20 44 45 54 45 43 :  iNTERFACE DETEC
00:8c20 : __ __ __ BYT 54 45 44 2e 00                                  : TED..
--------------------------------------------------------------------
reu_count_pages: ; reu_count_pages()->i16
.s4:
00:8c25 : a9 00 __ LDA #$00
00:8c27 : 8d f7 7f STA $7ff7 ; (c + 0)
00:8c2a : a9 f7 __ LDA #$f7
00:8c2c : 8d 02 df STA $df02 
00:8c2f : a9 7f __ LDA #$7f
00:8c31 : 8d 03 df STA $df03 
00:8c34 : a9 00 __ LDA #$00
00:8c36 : 8d 04 df STA $df04 
00:8c39 : 8d 05 df STA $df05 
00:8c3c : 8d 06 df STA $df06 
00:8c3f : a2 01 __ LDX #$01
00:8c41 : 8e 07 df STX $df07 
00:8c44 : 8d 08 df STA $df08 
00:8c47 : 8d 0a df STA $df0a 
00:8c4a : a2 90 __ LDX #$90
00:8c4c : 8e 01 df STX $df01 
00:8c4f : a2 f6 __ LDX #$f6
00:8c51 : 8e 02 df STX $df02 
00:8c54 : a2 7f __ LDX #$7f
00:8c56 : 8e 03 df STX $df03 
00:8c59 : 8d 04 df STA $df04 
00:8c5c : 8d 05 df STA $df05 
00:8c5f : 8d 06 df STA $df06 
00:8c62 : a2 01 __ LDX #$01
00:8c64 : 8e 07 df STX $df07 
00:8c67 : 8d 08 df STA $df08 
00:8c6a : 8d 0a df STA $df0a 
00:8c6d : a9 91 __ LDA #$91
00:8c6f : 8d 01 df STA $df01 
00:8c72 : ad f6 7f LDA $7ff6 ; (d + 0)
00:8c75 : d0 52 __ BNE $8cc9 ; (reu_count_pages.s6 + 0)
.s5:
00:8c77 : a2 47 __ LDX #$47
00:8c79 : 8e f7 7f STX $7ff7 ; (c + 0)
00:8c7c : a2 f7 __ LDX #$f7
00:8c7e : 8e 02 df STX $df02 
00:8c81 : a2 7f __ LDX #$7f
00:8c83 : 8e 03 df STX $df03 
00:8c86 : 8d 04 df STA $df04 
00:8c89 : 8d 05 df STA $df05 
00:8c8c : 8d 06 df STA $df06 
00:8c8f : a2 01 __ LDX #$01
00:8c91 : 8e 07 df STX $df07 
00:8c94 : 8d 08 df STA $df08 
00:8c97 : 8d 0a df STA $df0a 
00:8c9a : a2 90 __ LDX #$90
00:8c9c : 8e 01 df STX $df01 
00:8c9f : a2 f6 __ LDX #$f6
00:8ca1 : 8e 02 df STX $df02 
00:8ca4 : a2 7f __ LDX #$7f
00:8ca6 : 8e 03 df STX $df03 
00:8ca9 : 8d 04 df STA $df04 
00:8cac : 8d 05 df STA $df05 
00:8caf : 8d 06 df STA $df06 
00:8cb2 : a2 01 __ LDX #$01
00:8cb4 : 8e 07 df STX $df07 
00:8cb7 : 8d 08 df STA $df08 
00:8cba : 8d 0a df STA $df0a 
00:8cbd : a9 91 __ LDA #$91
00:8cbf : 8d 01 df STA $df01 
00:8cc2 : ad f6 7f LDA $7ff6 ; (d + 0)
00:8cc5 : c9 47 __ CMP #$47
00:8cc7 : f0 07 __ BEQ $8cd0 ; (reu_count_pages.s7 + 0)
.s6:
00:8cc9 : a9 00 __ LDA #$00
00:8ccb : 85 1b __ STA ACCU + 0 
.s3:
00:8ccd : 85 1c __ STA ACCU + 1 
00:8ccf : 60 __ __ RTS
.s7:
00:8cd0 : a0 01 __ LDY #$01
00:8cd2 : ca __ __ DEX
.l8:
00:8cd3 : a9 47 __ LDA #$47
00:8cd5 : 8d f7 7f STA $7ff7 ; (c + 0)
00:8cd8 : a9 f7 __ LDA #$f7
00:8cda : 8d 02 df STA $df02 
00:8cdd : a9 7f __ LDA #$7f
00:8cdf : 8d 03 df STA $df03 
00:8ce2 : a9 00 __ LDA #$00
00:8ce4 : 8d 04 df STA $df04 
00:8ce7 : 8d 05 df STA $df05 
00:8cea : 8c 06 df STY $df06 
00:8ced : a9 01 __ LDA #$01
00:8cef : 8d 07 df STA $df07 
00:8cf2 : a9 00 __ LDA #$00
00:8cf4 : 8d 08 df STA $df08 
00:8cf7 : 8d 0a df STA $df0a 
00:8cfa : a9 90 __ LDA #$90
00:8cfc : 8d 01 df STA $df01 
00:8cff : a9 00 __ LDA #$00
00:8d01 : 8d f7 7f STA $7ff7 ; (c + 0)
00:8d04 : a9 f7 __ LDA #$f7
00:8d06 : 8d 02 df STA $df02 
00:8d09 : a9 7f __ LDA #$7f
00:8d0b : 8d 03 df STA $df03 
00:8d0e : a9 00 __ LDA #$00
00:8d10 : 8d 04 df STA $df04 
00:8d13 : 8d 05 df STA $df05 
00:8d16 : 8d 06 df STA $df06 
00:8d19 : a9 01 __ LDA #$01
00:8d1b : 8d 07 df STA $df07 
00:8d1e : a9 00 __ LDA #$00
00:8d20 : 8d 08 df STA $df08 
00:8d23 : 8d 0a df STA $df0a 
00:8d26 : a9 90 __ LDA #$90
00:8d28 : 8d 01 df STA $df01 
00:8d2b : a9 f6 __ LDA #$f6
00:8d2d : 8d 02 df STA $df02 
00:8d30 : a9 7f __ LDA #$7f
00:8d32 : 8d 03 df STA $df03 
00:8d35 : a9 00 __ LDA #$00
00:8d37 : 8d 04 df STA $df04 
00:8d3a : 8d 05 df STA $df05 
00:8d3d : 8c 06 df STY $df06 
00:8d40 : a9 01 __ LDA #$01
00:8d42 : 8d 07 df STA $df07 
00:8d45 : a9 00 __ LDA #$00
00:8d47 : 8d 08 df STA $df08 
00:8d4a : 8d 0a df STA $df0a 
00:8d4d : a9 91 __ LDA #$91
00:8d4f : 8d 01 df STA $df01 
00:8d52 : ad f6 7f LDA $7ff6 ; (d + 0)
00:8d55 : c9 47 __ CMP #$47
00:8d57 : f0 06 __ BEQ $8d5f ; (reu_count_pages.s9 + 0)
.s11:
00:8d59 : 84 1b __ STY ACCU + 0 
00:8d5b : 8a __ __ TXA
00:8d5c : 4c cd 12 JMP $12cd 
.s9:
00:8d5f : c8 __ __ INY
00:8d60 : d0 01 __ BNE $8d63 ; (reu_count_pages.s13 + 0)
.s12:
00:8d62 : e8 __ __ INX
.s13:
00:8d63 : 98 __ __ TYA
00:8d64 : f0 03 __ BEQ $8d69 ; (reu_count_pages.s10 + 0)
00:8d66 : 4c d3 12 JMP $12d3 
.s10:
00:8d69 : 85 1b __ STA ACCU + 0 
00:8d6b : a9 01 __ LDA #$01
00:8d6d : 4c cd 12 JMP $12cd 
--------------------------------------------------------------------
cwin_console_printf: ; cwin_console_printf(struct CharWin*,u8,const u8*)->void
.s4:
00:8d70 : a9 16 __ LDA #$16
00:8d72 : 85 16 __ STA P9 
00:8d74 : a9 7f __ LDA #$7f
00:8d76 : 85 17 __ STA P10 
00:8d78 : a0 05 __ LDY #$05
00:8d7a : b1 23 __ LDA (SP + 0),y 
00:8d7c : 8d f8 7f STA $7ff8 ; (sstack + 0)
00:8d7f : c8 __ __ INY
00:8d80 : b1 23 __ LDA (SP + 0),y 
00:8d82 : 8d f9 7f STA $7ff9 ; (sstack + 1)
00:8d85 : 18 __ __ CLC
00:8d86 : a5 23 __ LDA SP + 0 
00:8d88 : 69 07 __ ADC #$07
00:8d8a : 8d fa 7f STA $7ffa ; (sstack + 2)
00:8d8d : a5 24 __ LDA SP + 1 
00:8d8f : 69 00 __ ADC #$00
00:8d91 : 8d fb 7f STA $7ffb ; (sstack + 3)
00:8d94 : 20 44 14 JSR $1444 
00:8d97 : a9 16 __ LDA #$16
00:8d99 : 85 13 __ STA P6 ; (fmt + 3)
00:8d9b : a9 7f __ LDA #$7f
00:8d9d : 85 14 __ STA P7 
--------------------------------------------------------------------
cwin_console_write_string: ; cwin_console_write_string(struct CharWin*,const u8*,u8)->void
.s4:
00:8d9f : ad 5a 49 LDA $495a ; (cw + 4)
00:8da2 : 8d 5c 49 STA $495c ; (cw + 6)
00:8da5 : ad 5b 49 LDA $495b ; (cw + 5)
00:8da8 : 8d 5d 49 STA $495d ; (cw + 7)
00:8dab : a9 00 __ LDA #$00
00:8dad : 85 4a __ STA T4 + 0 
00:8daf : f0 02 __ BEQ $8db3 ; (cwin_console_write_string.l5 + 0)
.s9:
00:8db1 : e6 4a __ INC T4 + 0 
.l5:
00:8db3 : a4 4a __ LDY T4 + 0 
00:8db5 : b1 13 __ LDA (P6),y ; (chars + 0)
00:8db7 : d0 01 __ BNE $8dba ; (cwin_console_write_string.s6 + 0)
.s3:
00:8db9 : 60 __ __ RTS
.s6:
00:8dba : c9 0a __ CMP #$0a
00:8dbc : d0 06 __ BNE $8dc4 ; (cwin_console_write_string.s7 + 0)
.s11:
00:8dbe : 20 17 0e JSR $0e17 
00:8dc1 : 4c b1 13 JMP $13b1 
.s7:
00:8dc4 : 85 4b __ STA T5 + 0 
00:8dc6 : ad 5a 49 LDA $495a ; (cw + 4)
00:8dc9 : cd 58 49 CMP $4958 ; (cw + 2)
00:8dcc : d0 03 __ BNE $8dd1 ; (cwin_console_write_string.s8 + 0)
.s10:
00:8dce : 20 17 0e JSR $0e17 
.s8:
00:8dd1 : ad 5b 49 LDA $495b ; (cw + 5)
00:8dd4 : 0a __ __ ASL
00:8dd5 : aa __ __ TAX
00:8dd6 : bd 6c 2a LDA $2a6c,x 
00:8dd9 : 6d 5a 49 ADC $495a ; (cw + 4)
00:8ddc : 85 43 __ STA T0 + 0 
00:8dde : bd 6d 2a LDA $2a6d,x 
00:8de1 : 69 00 __ ADC #$00
00:8de3 : 85 44 __ STA T0 + 1 
00:8de5 : a5 4b __ LDA T5 + 0 
00:8de7 : 4a __ __ LSR
00:8de8 : 4a __ __ LSR
00:8de9 : 4a __ __ LSR
00:8dea : 4a __ __ LSR
00:8deb : 4a __ __ LSR
00:8dec : aa __ __ TAX
00:8ded : ad 5e 49 LDA $495e ; (cw + 8)
00:8df0 : 18 __ __ CLC
00:8df1 : 65 43 __ ADC T0 + 0 
00:8df3 : 85 45 __ STA T1 + 0 
00:8df5 : ad 5f 49 LDA $495f ; (cw + 9)
00:8df8 : 65 44 __ ADC T0 + 1 
00:8dfa : 85 46 __ STA T1 + 1 
00:8dfc : bd a7 2a LDA $2aa7,x 
00:8dff : 45 4b __ EOR T5 + 0 
00:8e01 : a0 00 __ LDY #$00
00:8e03 : 91 45 __ STA (T1 + 0),y 
00:8e05 : ad 60 49 LDA $4960 ; (cw + 10)
00:8e08 : 18 __ __ CLC
00:8e09 : 65 43 __ ADC T0 + 0 
00:8e0b : 85 45 __ STA T1 + 0 
00:8e0d : ad 61 49 LDA $4961 ; (cw + 11)
00:8e10 : 65 44 __ ADC T0 + 1 
00:8e12 : 85 46 __ STA T1 + 1 
00:8e14 : a9 07 __ LDA #$07
00:8e16 : 91 45 __ STA (T1 + 0),y 
00:8e18 : ee 5a 49 INC $495a ; (cw + 4)
00:8e1b : 4c b1 13 JMP $13b1 
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s4:
00:8e1e : a0 02 __ LDY #$02
00:8e20 : b1 23 __ LDA (SP + 0),y 
00:8e22 : 85 16 __ STA P9 
00:8e24 : c8 __ __ INY
00:8e25 : b1 23 __ LDA (SP + 0),y 
00:8e27 : 85 17 __ STA P10 
00:8e29 : c8 __ __ INY
00:8e2a : b1 23 __ LDA (SP + 0),y 
00:8e2c : 8d f8 7f STA $7ff8 ; (sstack + 0)
00:8e2f : c8 __ __ INY
00:8e30 : b1 23 __ LDA (SP + 0),y 
00:8e32 : 8d f9 7f STA $7ff9 ; (sstack + 1)
00:8e35 : 18 __ __ CLC
00:8e36 : a5 23 __ LDA SP + 0 
00:8e38 : 69 06 __ ADC #$06
00:8e3a : 8d fa 7f STA $7ffa ; (sstack + 2)
00:8e3d : a5 24 __ LDA SP + 1 
00:8e3f : 69 00 __ ADC #$00
00:8e41 : 8d fb 7f STA $7ffb ; (sstack + 3)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s4:
00:8e44 : ad f8 7f LDA $7ff8 ; (sstack + 0)
00:8e47 : 85 47 __ STA T3 + 0 
00:8e49 : a9 00 __ LDA #$00
00:8e4b : 85 1b __ STA ACCU + 0 ; (fps + 0)
00:8e4d : ad f9 7f LDA $7ff9 ; (sstack + 1)
00:8e50 : 85 48 __ STA T3 + 1 
.l5:
00:8e52 : a0 00 __ LDY #$00
00:8e54 : b1 47 __ LDA (T3 + 0),y 
00:8e56 : d0 1b __ BNE $8e73 ; (sformat.s9 + 0)
.s6:
00:8e58 : a4 1b __ LDY ACCU + 0 ; (fps + 0)
00:8e5a : 91 16 __ STA (P9),y ; (buff + 0)
00:8e5c : 98 __ __ TYA
00:8e5d : d0 07 __ BNE $8e66 ; (sformat.s8 + 0)
.s7:
00:8e5f : a5 17 __ LDA P10 ; (buff + 1)
00:8e61 : a6 16 __ LDX P9 ; (buff + 0)
00:8e63 : 4c 6e 14 JMP $146e 
.s8:
00:8e66 : 18 __ __ CLC
00:8e67 : 65 16 __ ADC P9 ; (buff + 0)
00:8e69 : aa __ __ TAX
00:8e6a : a5 17 __ LDA P10 ; (buff + 1)
00:8e6c : 69 00 __ ADC #$00
.s3:
00:8e6e : 86 1b __ STX ACCU + 0 ; (fps + 0)
00:8e70 : 85 1c __ STA ACCU + 1 ; (fps + 1)
00:8e72 : 60 __ __ RTS
.s9:
00:8e73 : c9 25 __ CMP #$25
00:8e75 : f0 22 __ BEQ $8e99 ; (sformat.s12 + 0)
.s10:
00:8e77 : a4 1b __ LDY ACCU + 0 ; (fps + 0)
00:8e79 : 91 16 __ STA (P9),y ; (buff + 0)
00:8e7b : e6 47 __ INC T3 + 0 
00:8e7d : d0 02 __ BNE $8e81 ; (sformat.s104 + 0)
.s103:
00:8e7f : e6 48 __ INC T3 + 1 
.s104:
00:8e81 : c8 __ __ INY
00:8e82 : 84 1b __ STY ACCU + 0 ; (fps + 0)
00:8e84 : 98 __ __ TYA
00:8e85 : c0 28 __ CPY #$28
00:8e87 : 90 c9 __ BCC $8e52 ; (sformat.l5 + 0)
.s11:
00:8e89 : 18 __ __ CLC
00:8e8a : 65 16 __ ADC P9 ; (buff + 0)
00:8e8c : 85 16 __ STA P9 ; (buff + 0)
00:8e8e : 90 02 __ BCC $8e92 ; (sformat.s106 + 0)
.s105:
00:8e90 : e6 17 __ INC P10 ; (buff + 1)
.s106:
00:8e92 : a9 00 __ LDA #$00
.s79:
00:8e94 : 85 1b __ STA ACCU + 0 ; (fps + 0)
00:8e96 : 4c 52 14 JMP $1452 
.s12:
00:8e99 : 8c e3 7f STY $7fe3 ; (si + 5)
00:8e9c : 8c e6 7f STY $7fe6 ; (si + 8)
00:8e9f : a9 0a __ LDA #$0a
00:8ea1 : 8d e2 7f STA $7fe2 ; (si + 4)
00:8ea4 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
00:8ea6 : f0 0c __ BEQ $8eb4 ; (sformat.s13 + 0)
.s77:
00:8ea8 : 84 1b __ STY ACCU + 0 ; (fps + 0)
00:8eaa : 18 __ __ CLC
00:8eab : 65 16 __ ADC P9 ; (buff + 0)
00:8ead : 85 16 __ STA P9 ; (buff + 0)
00:8eaf : 90 02 __ BCC $8eb3 ; (sformat.s90 + 0)
.s89:
00:8eb1 : e6 17 __ INC P10 ; (buff + 1)
.s90:
00:8eb3 : 98 __ __ TYA
.s13:
00:8eb4 : 8d e4 7f STA $7fe4 ; (si + 6)
00:8eb7 : 8d e5 7f STA $7fe5 ; (si + 7)
00:8eba : a0 01 __ LDY #$01
00:8ebc : b1 47 __ LDA (T3 + 0),y 
00:8ebe : a2 20 __ LDX #$20
00:8ec0 : 8e de 7f STX $7fde ; (si + 0)
00:8ec3 : a2 00 __ LDX #$00
00:8ec5 : 8e df 7f STX $7fdf ; (si + 1)
00:8ec8 : ca __ __ DEX
00:8ec9 : 8e e0 7f STX $7fe0 ; (si + 2)
00:8ecc : aa __ __ TAX
00:8ecd : a9 02 __ LDA #$02
00:8ecf : d0 07 __ BNE $8ed8 ; (sformat.l14 + 0)
.s73:
00:8ed1 : a0 00 __ LDY #$00
00:8ed3 : b1 47 __ LDA (T3 + 0),y 
00:8ed5 : aa __ __ TAX
00:8ed6 : a9 01 __ LDA #$01
.l14:
00:8ed8 : 18 __ __ CLC
00:8ed9 : 65 47 __ ADC T3 + 0 
00:8edb : 85 47 __ STA T3 + 0 
00:8edd : 90 02 __ BCC $8ee1 ; (sformat.s92 + 0)
.s91:
00:8edf : e6 48 __ INC T3 + 1 
.s92:
00:8ee1 : 8a __ __ TXA
00:8ee2 : e0 2b __ CPX #$2b
00:8ee4 : d0 07 __ BNE $8eed ; (sformat.s15 + 0)
.s76:
00:8ee6 : a9 01 __ LDA #$01
00:8ee8 : 8d e4 7f STA $7fe4 ; (si + 6)
00:8eeb : d0 e4 __ BNE $8ed1 ; (sformat.s73 + 0)
.s15:
00:8eed : c9 30 __ CMP #$30
00:8eef : d0 06 __ BNE $8ef7 ; (sformat.s16 + 0)
.s75:
00:8ef1 : 8d de 7f STA $7fde ; (si + 0)
00:8ef4 : 4c d1 14 JMP $14d1 
.s16:
00:8ef7 : c9 23 __ CMP #$23
00:8ef9 : d0 07 __ BNE $8f02 ; (sformat.s17 + 0)
.s74:
00:8efb : a9 01 __ LDA #$01
00:8efd : 8d e6 7f STA $7fe6 ; (si + 8)
00:8f00 : d0 cf __ BNE $8ed1 ; (sformat.s73 + 0)
.s17:
00:8f02 : c9 2d __ CMP #$2d
00:8f04 : d0 07 __ BNE $8f0d ; (sformat.s18 + 0)
.s72:
00:8f06 : a9 01 __ LDA #$01
00:8f08 : 8d e5 7f STA $7fe5 ; (si + 7)
00:8f0b : d0 c4 __ BNE $8ed1 ; (sformat.s73 + 0)
.s18:
00:8f0d : 85 1d __ STA ACCU + 2 
00:8f0f : c9 30 __ CMP #$30
00:8f11 : 90 31 __ BCC $8f44 ; (sformat.s19 + 0)
.s67:
00:8f13 : c9 3a __ CMP #$3a
00:8f15 : b0 2d __ BCS $8f44 ; (sformat.s19 + 0)
.s68:
00:8f17 : a9 00 __ LDA #$00
00:8f19 : 85 1c __ STA ACCU + 1 ; (fps + 1)
.l69:
00:8f1b : a5 1c __ LDA ACCU + 1 ; (fps + 1)
00:8f1d : 0a __ __ ASL
00:8f1e : 0a __ __ ASL
00:8f1f : 18 __ __ CLC
00:8f20 : 65 1c __ ADC ACCU + 1 ; (fps + 1)
00:8f22 : 0a __ __ ASL
00:8f23 : 18 __ __ CLC
00:8f24 : 65 1d __ ADC ACCU + 2 
00:8f26 : 38 __ __ SEC
00:8f27 : e9 30 __ SBC #$30
00:8f29 : 85 1c __ STA ACCU + 1 ; (fps + 1)
00:8f2b : a0 00 __ LDY #$00
00:8f2d : b1 47 __ LDA (T3 + 0),y 
00:8f2f : 85 1d __ STA ACCU + 2 
00:8f31 : e6 47 __ INC T3 + 0 
00:8f33 : d0 02 __ BNE $8f37 ; (sformat.s102 + 0)
.s101:
00:8f35 : e6 48 __ INC T3 + 1 
.s102:
00:8f37 : c9 30 __ CMP #$30
00:8f39 : 90 04 __ BCC $8f3f ; (sformat.s70 + 0)
.s71:
00:8f3b : c9 3a __ CMP #$3a
00:8f3d : 90 dc __ BCC $8f1b ; (sformat.l69 + 0)
.s70:
00:8f3f : a6 1c __ LDX ACCU + 1 ; (fps + 1)
00:8f41 : 8e df 7f STX $7fdf ; (si + 1)
.s19:
00:8f44 : c9 2e __ CMP #$2e
00:8f46 : d0 2d __ BNE $8f75 ; (sformat.s20 + 0)
.s62:
00:8f48 : a9 00 __ LDA #$00
00:8f4a : f0 0e __ BEQ $8f5a ; (sformat.l63 + 0)
.s66:
00:8f4c : a5 43 __ LDA T0 + 0 
00:8f4e : 0a __ __ ASL
00:8f4f : 0a __ __ ASL
00:8f50 : 18 __ __ CLC
00:8f51 : 65 43 __ ADC T0 + 0 
00:8f53 : 0a __ __ ASL
00:8f54 : 18 __ __ CLC
00:8f55 : 65 1d __ ADC ACCU + 2 
00:8f57 : 38 __ __ SEC
00:8f58 : e9 30 __ SBC #$30
.l63:
00:8f5a : 85 43 __ STA T0 + 0 
00:8f5c : a0 00 __ LDY #$00
00:8f5e : b1 47 __ LDA (T3 + 0),y 
00:8f60 : 85 1d __ STA ACCU + 2 
00:8f62 : e6 47 __ INC T3 + 0 
00:8f64 : d0 02 __ BNE $8f68 ; (sformat.s94 + 0)
.s93:
00:8f66 : e6 48 __ INC T3 + 1 
.s94:
00:8f68 : c9 30 __ CMP #$30
00:8f6a : 90 04 __ BCC $8f70 ; (sformat.s64 + 0)
.s65:
00:8f6c : c9 3a __ CMP #$3a
00:8f6e : 90 dc __ BCC $8f4c ; (sformat.s66 + 0)
.s64:
00:8f70 : a6 43 __ LDX T0 + 0 
00:8f72 : 8e e0 7f STX $7fe0 ; (si + 2)
.s20:
00:8f75 : c9 64 __ CMP #$64
00:8f77 : f0 0c __ BEQ $8f85 ; (sformat.s61 + 0)
.s21:
00:8f79 : c9 44 __ CMP #$44
00:8f7b : f0 08 __ BEQ $8f85 ; (sformat.s61 + 0)
.s22:
00:8f7d : c9 69 __ CMP #$69
00:8f7f : f0 04 __ BEQ $8f85 ; (sformat.s61 + 0)
.s23:
00:8f81 : c9 49 __ CMP #$49
00:8f83 : d0 07 __ BNE $8f8c ; (sformat.s24 + 0)
.s61:
00:8f85 : a9 01 __ LDA #$01
.s81:
00:8f87 : 85 13 __ STA P6 
00:8f89 : 4c 24 17 JMP $1724 
.s24:
00:8f8c : c9 75 __ CMP #$75
00:8f8e : f0 04 __ BEQ $8f94 ; (sformat.s60 + 0)
.s25:
00:8f90 : c9 55 __ CMP #$55
00:8f92 : d0 04 __ BNE $8f98 ; (sformat.s26 + 0)
.s60:
00:8f94 : a9 00 __ LDA #$00
00:8f96 : f0 ef __ BEQ $8f87 ; (sformat.s81 + 0)
.s26:
00:8f98 : c9 78 __ CMP #$78
00:8f9a : f0 04 __ BEQ $8fa0 ; (sformat.s58 + 0)
.s27:
00:8f9c : c9 58 __ CMP #$58
00:8f9e : d0 18 __ BNE $8fb8 ; (sformat.s28 + 0)
.s58:
00:8fa0 : a9 00 __ LDA #$00
00:8fa2 : 8d e3 7f STA $7fe3 ; (si + 5)
00:8fa5 : 85 13 __ STA P6 
00:8fa7 : a9 10 __ LDA #$10
00:8fa9 : 8d e2 7f STA $7fe2 ; (si + 4)
00:8fac : a5 1d __ LDA ACCU + 2 
00:8fae : 29 e0 __ AND #$e0
00:8fb0 : 09 01 __ ORA #$01
00:8fb2 : 8d e1 7f STA $7fe1 ; (si + 3)
00:8fb5 : 4c 24 17 JMP $1724 
.s28:
00:8fb8 : c9 6c __ CMP #$6c
00:8fba : d0 03 __ BNE $8fbf ; (sformat.s29 + 0)
00:8fbc : 4c 99 16 JMP $1699 
.s29:
00:8fbf : c9 4c __ CMP #$4c
00:8fc1 : f0 f9 __ BEQ $8fbc ; (sformat.s28 + 4)
.s30:
00:8fc3 : c9 73 __ CMP #$73
00:8fc5 : f0 3c __ BEQ $9003 ; (sformat.s38 + 0)
.s31:
00:8fc7 : c9 53 __ CMP #$53
00:8fc9 : f0 38 __ BEQ $9003 ; (sformat.s38 + 0)
.s32:
00:8fcb : c9 63 __ CMP #$63
00:8fcd : f0 13 __ BEQ $8fe2 ; (sformat.s37 + 0)
.s33:
00:8fcf : c9 43 __ CMP #$43
00:8fd1 : f0 0f __ BEQ $8fe2 ; (sformat.s37 + 0)
.s34:
00:8fd3 : aa __ __ TAX
00:8fd4 : d0 03 __ BNE $8fd9 ; (sformat.s35 + 0)
00:8fd6 : 4c 52 14 JMP $1452 
.s35:
00:8fd9 : a0 00 __ LDY #$00
00:8fdb : 91 16 __ STA (P9),y ; (buff + 0)
.s36:
00:8fdd : a9 01 __ LDA #$01
00:8fdf : 4c 94 14 JMP $1494 
.s37:
00:8fe2 : ad fa 7f LDA $7ffa ; (sstack + 2)
00:8fe5 : 85 43 __ STA T0 + 0 
00:8fe7 : ad fb 7f LDA $7ffb ; (sstack + 3)
00:8fea : 85 44 __ STA T0 + 1 
00:8fec : a0 00 __ LDY #$00
00:8fee : b1 43 __ LDA (T0 + 0),y 
00:8ff0 : 91 16 __ STA (P9),y ; (buff + 0)
00:8ff2 : a5 43 __ LDA T0 + 0 
00:8ff4 : 69 01 __ ADC #$01
00:8ff6 : 8d fa 7f STA $7ffa ; (sstack + 2)
00:8ff9 : a5 44 __ LDA T0 + 1 
00:8ffb : 69 00 __ ADC #$00
00:8ffd : 8d fb 7f STA $7ffb ; (sstack + 3)
00:9000 : 4c dd 15 JMP $15dd 
.s38:
00:9003 : ad fa 7f LDA $7ffa ; (sstack + 2)
00:9006 : 85 43 __ STA T0 + 0 
00:9008 : 69 01 __ ADC #$01
00:900a : 8d fa 7f STA $7ffa ; (sstack + 2)
00:900d : ad fb 7f LDA $7ffb ; (sstack + 3)
00:9010 : 85 44 __ STA T0 + 1 
00:9012 : 69 00 __ ADC #$00
00:9014 : 8d fb 7f STA $7ffb ; (sstack + 3)
00:9017 : a0 00 __ LDY #$00
00:9019 : 84 1d __ STY ACCU + 2 
00:901b : b1 43 __ LDA (T0 + 0),y 
00:901d : aa __ __ TAX
00:901e : c8 __ __ INY
00:901f : b1 43 __ LDA (T0 + 0),y 
00:9021 : 86 43 __ STX T0 + 0 
00:9023 : 85 44 __ STA T0 + 1 
00:9025 : ad df 7f LDA $7fdf ; (si + 1)
00:9028 : f0 0c __ BEQ $9036 ; (sformat.s39 + 0)
.s86:
00:902a : 88 __ __ DEY
00:902b : b1 43 __ LDA (T0 + 0),y 
00:902d : f0 05 __ BEQ $9034 ; (sformat.s87 + 0)
.l45:
00:902f : c8 __ __ INY
00:9030 : b1 43 __ LDA (T0 + 0),y 
00:9032 : d0 fb __ BNE $902f ; (sformat.l45 + 0)
.s87:
00:9034 : 84 1d __ STY ACCU + 2 
.s39:
00:9036 : ad e5 7f LDA $7fe5 ; (si + 7)
00:9039 : 85 1c __ STA ACCU + 1 ; (fps + 1)
00:903b : d0 19 __ BNE $9056 ; (sformat.s40 + 0)
.s84:
00:903d : a6 1d __ LDX ACCU + 2 
00:903f : ec df 7f CPX $7fdf ; (si + 1)
00:9042 : a0 00 __ LDY #$00
00:9044 : b0 0c __ BCS $9052 ; (sformat.s85 + 0)
.l44:
00:9046 : ad de 7f LDA $7fde ; (si + 0)
00:9049 : 91 16 __ STA (P9),y ; (buff + 0)
00:904b : c8 __ __ INY
00:904c : e8 __ __ INX
00:904d : ec df 7f CPX $7fdf ; (si + 1)
00:9050 : 90 f4 __ BCC $9046 ; (sformat.l44 + 0)
.s85:
00:9052 : 86 1d __ STX ACCU + 2 
00:9054 : 84 1b __ STY ACCU + 0 ; (fps + 0)
.s40:
00:9056 : a0 00 __ LDY #$00
00:9058 : b1 43 __ LDA (T0 + 0),y 
00:905a : f0 1c __ BEQ $9078 ; (sformat.s41 + 0)
.s43:
00:905c : aa __ __ TAX
00:905d : e6 43 __ INC T0 + 0 
00:905f : d0 02 __ BNE $9063 ; (sformat.s98 + 0)
.s97:
00:9061 : e6 44 __ INC T0 + 1 
.s98:
00:9063 : 8a __ __ TXA
.l78:
00:9064 : a4 1b __ LDY ACCU + 0 ; (fps + 0)
00:9066 : 91 16 __ STA (P9),y ; (buff + 0)
00:9068 : e6 1b __ INC ACCU + 0 ; (fps + 0)
00:906a : a0 00 __ LDY #$00
00:906c : b1 43 __ LDA (T0 + 0),y 
00:906e : a8 __ __ TAY
00:906f : e6 43 __ INC T0 + 0 
00:9071 : d0 02 __ BNE $9075 ; (sformat.s100 + 0)
.s99:
00:9073 : e6 44 __ INC T0 + 1 
.s100:
00:9075 : 98 __ __ TYA
00:9076 : d0 ec __ BNE $9064 ; (sformat.l78 + 0)
.s41:
00:9078 : a5 1c __ LDA ACCU + 1 ; (fps + 1)
00:907a : d0 03 __ BNE $907f ; (sformat.s83 + 0)
00:907c : 4c 52 14 JMP $1452 
.s83:
00:907f : a6 1d __ LDX ACCU + 2 
00:9081 : ec df 7f CPX $7fdf ; (si + 1)
00:9084 : a4 1b __ LDY ACCU + 0 ; (fps + 0)
00:9086 : b0 0c __ BCS $9094 ; (sformat.s88 + 0)
.l42:
00:9088 : ad de 7f LDA $7fde ; (si + 0)
00:908b : 91 16 __ STA (P9),y ; (buff + 0)
00:908d : c8 __ __ INY
00:908e : e8 __ __ INX
00:908f : ec df 7f CPX $7fdf ; (si + 1)
00:9092 : 90 f4 __ BCC $9088 ; (sformat.l42 + 0)
.s88:
00:9094 : 84 1b __ STY ACCU + 0 ; (fps + 0)
00:9096 : 4c 52 14 JMP $1452 
.s46:
00:9099 : ad fa 7f LDA $7ffa ; (sstack + 2)
00:909c : 85 43 __ STA T0 + 0 
00:909e : 69 03 __ ADC #$03
00:90a0 : 8d fa 7f STA $7ffa ; (sstack + 2)
00:90a3 : ad fb 7f LDA $7ffb ; (sstack + 3)
00:90a6 : 85 44 __ STA T0 + 1 
00:90a8 : 69 00 __ ADC #$00
00:90aa : 8d fb 7f STA $7ffb ; (sstack + 3)
00:90ad : a0 00 __ LDY #$00
00:90af : b1 47 __ LDA (T3 + 0),y 
00:90b1 : aa __ __ TAX
00:90b2 : e6 47 __ INC T3 + 0 
00:90b4 : d0 02 __ BNE $90b8 ; (sformat.s96 + 0)
.s95:
00:90b6 : e6 48 __ INC T3 + 1 
.s96:
00:90b8 : b1 43 __ LDA (T0 + 0),y 
00:90ba : 85 11 __ STA P4 
00:90bc : a0 01 __ LDY #$01
00:90be : b1 43 __ LDA (T0 + 0),y 
00:90c0 : 85 12 __ STA P5 
00:90c2 : c8 __ __ INY
00:90c3 : b1 43 __ LDA (T0 + 0),y 
00:90c5 : 85 13 __ STA P6 
00:90c7 : c8 __ __ INY
00:90c8 : b1 43 __ LDA (T0 + 0),y 
00:90ca : 85 14 __ STA P7 
00:90cc : 8a __ __ TXA
00:90cd : e0 64 __ CPX #$64
00:90cf : f0 0c __ BEQ $90dd ; (sformat.s57 + 0)
.s47:
00:90d1 : c9 44 __ CMP #$44
00:90d3 : f0 08 __ BEQ $90dd ; (sformat.s57 + 0)
.s48:
00:90d5 : c9 69 __ CMP #$69
00:90d7 : f0 04 __ BEQ $90dd ; (sformat.s57 + 0)
.s49:
00:90d9 : c9 49 __ CMP #$49
00:90db : d0 1c __ BNE $90f9 ; (sformat.s50 + 0)
.s57:
00:90dd : a9 01 __ LDA #$01
.s82:
00:90df : 85 15 __ STA P8 
.s55:
00:90e1 : a5 16 __ LDA P9 ; (buff + 0)
00:90e3 : 85 0f __ STA P2 
00:90e5 : a5 17 __ LDA P10 ; (buff + 1)
00:90e7 : 85 10 __ STA P3 
00:90e9 : a9 de __ LDA #$de
00:90eb : 85 0d __ STA P0 
00:90ed : a9 7f __ LDA #$7f
00:90ef : 85 0e __ STA P1 
00:90f1 : 20 96 18 JSR $1896 
.s80:
00:90f4 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
00:90f6 : 4c 94 14 JMP $1494 
.s50:
00:90f9 : c9 75 __ CMP #$75
00:90fb : f0 04 __ BEQ $9101 ; (sformat.s56 + 0)
.s51:
00:90fd : c9 55 __ CMP #$55
00:90ff : d0 04 __ BNE $9105 ; (sformat.s52 + 0)
.s56:
00:9101 : a9 00 __ LDA #$00
00:9103 : f0 da __ BEQ $90df ; (sformat.s82 + 0)
.s52:
00:9105 : c9 78 __ CMP #$78
00:9107 : f0 04 __ BEQ $910d ; (sformat.s54 + 0)
.s53:
00:9109 : c9 58 __ CMP #$58
00:910b : d0 89 __ BNE $9096 ; (sformat.s88 + 2)
.s54:
00:910d : a9 10 __ LDA #$10
00:910f : 8d e2 7f STA $7fe2 ; (si + 4)
00:9112 : a9 00 __ LDA #$00
00:9114 : 8d e3 7f STA $7fe3 ; (si + 5)
00:9117 : 85 15 __ STA P8 
00:9119 : 8a __ __ TXA
00:911a : 29 e0 __ AND #$e0
00:911c : 09 01 __ ORA #$01
00:911e : 8d e1 7f STA $7fe1 ; (si + 3)
00:9121 : 4c e1 16 JMP $16e1 
.s59:
00:9124 : a5 16 __ LDA P9 ; (buff + 0)
00:9126 : 85 0f __ STA P2 
00:9128 : a5 17 __ LDA P10 ; (buff + 1)
00:912a : 85 10 __ STA P3 
00:912c : ad fa 7f LDA $7ffa ; (sstack + 2)
00:912f : 85 43 __ STA T0 + 0 
00:9131 : ad fb 7f LDA $7ffb ; (sstack + 3)
00:9134 : 85 44 __ STA T0 + 1 
00:9136 : a0 00 __ LDY #$00
00:9138 : b1 43 __ LDA (T0 + 0),y 
00:913a : 85 11 __ STA P4 
00:913c : c8 __ __ INY
00:913d : b1 43 __ LDA (T0 + 0),y 
00:913f : 85 12 __ STA P5 
00:9141 : 18 __ __ CLC
00:9142 : a5 43 __ LDA T0 + 0 
00:9144 : 69 02 __ ADC #$02
00:9146 : 8d fa 7f STA $7ffa ; (sstack + 2)
00:9149 : a5 44 __ LDA T0 + 1 
00:914b : 69 00 __ ADC #$00
00:914d : 8d fb 7f STA $7ffb ; (sstack + 3)
00:9150 : a9 de __ LDA #$de
00:9152 : 85 0d __ STA P0 
00:9154 : a9 7f __ LDA #$7f
00:9156 : 85 0e __ STA P1 
00:9158 : 20 5e 17 JSR $175e 
00:915b : 4c f4 16 JMP $16f4 
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s4:
00:915e : a9 00 __ LDA #$00
00:9160 : 85 45 __ STA T5 + 0 
00:9162 : a5 13 __ LDA P6 ; (s + 0)
00:9164 : f0 13 __ BEQ $9179 ; (nformi.s5 + 0)
.s37:
00:9166 : 24 12 __ BIT P5 ; (v + 1)
00:9168 : 10 0f __ BPL $9179 ; (nformi.s5 + 0)
.s38:
00:916a : 38 __ __ SEC
00:916b : a9 00 __ LDA #$00
00:916d : e5 11 __ SBC P4 ; (v + 0)
00:916f : 85 11 __ STA P4 ; (v + 0)
00:9171 : a9 00 __ LDA #$00
00:9173 : e5 12 __ SBC P5 ; (v + 1)
00:9175 : 85 12 __ STA P5 ; (v + 1)
00:9177 : e6 45 __ INC T5 + 0 
.s5:
00:9179 : a9 10 __ LDA #$10
00:917b : 85 46 __ STA T6 + 0 
00:917d : a5 11 __ LDA P4 ; (v + 0)
00:917f : 05 12 __ ORA P5 ; (v + 1)
00:9181 : f0 4b __ BEQ $91ce ; (nformi.s6 + 0)
.s30:
00:9183 : a0 04 __ LDY #$04
00:9185 : b1 0d __ LDA (P0),y ; (si + 0)
00:9187 : 85 43 __ STA T2 + 0 
00:9189 : c8 __ __ INY
00:918a : b1 0d __ LDA (P0),y ; (si + 0)
00:918c : 85 44 __ STA T2 + 1 
.l31:
00:918e : a5 11 __ LDA P4 ; (v + 0)
00:9190 : 85 1b __ STA ACCU + 0 
00:9192 : a5 12 __ LDA P5 ; (v + 1)
00:9194 : 85 1c __ STA ACCU + 1 
00:9196 : a5 43 __ LDA T2 + 0 
00:9198 : 85 03 __ STA WORK + 0 
00:919a : a5 44 __ LDA T2 + 1 
00:919c : 85 04 __ STA WORK + 1 
00:919e : 20 d3 26 JSR $26d3 
00:91a1 : a5 06 __ LDA WORK + 3 
00:91a3 : 30 08 __ BMI $91ad ; (nformi.s32 + 0)
.s36:
00:91a5 : d0 0a __ BNE $91b1 ; (nformi.s34 + 0)
.s35:
00:91a7 : a5 05 __ LDA WORK + 2 
00:91a9 : c9 0a __ CMP #$0a
00:91ab : b0 04 __ BCS $91b1 ; (nformi.s34 + 0)
.s32:
00:91ad : a9 30 __ LDA #$30
00:91af : d0 07 __ BNE $91b8 ; (nformi.s33 + 0)
.s34:
00:91b1 : a0 03 __ LDY #$03
00:91b3 : b1 0d __ LDA (P0),y ; (si + 0)
00:91b5 : 38 __ __ SEC
00:91b6 : e9 0a __ SBC #$0a
.s33:
00:91b8 : 18 __ __ CLC
00:91b9 : 65 05 __ ADC WORK + 2 
00:91bb : a6 46 __ LDX T6 + 0 
00:91bd : 9d e7 7f STA $7fe7,x 
00:91c0 : a5 1b __ LDA ACCU + 0 
00:91c2 : 85 11 __ STA P4 ; (v + 0)
00:91c4 : a5 1c __ LDA ACCU + 1 
00:91c6 : 85 12 __ STA P5 ; (v + 1)
00:91c8 : c6 46 __ DEC T6 + 0 
00:91ca : 05 11 __ ORA P4 ; (v + 0)
00:91cc : d0 c0 __ BNE $918e ; (nformi.l31 + 0)
.s6:
00:91ce : a0 02 __ LDY #$02
00:91d0 : b1 0d __ LDA (P0),y ; (si + 0)
00:91d2 : c9 ff __ CMP #$ff
00:91d4 : d0 04 __ BNE $91da ; (nformi.s29 + 0)
.s7:
00:91d6 : a9 0f __ LDA #$0f
00:91d8 : d0 05 __ BNE $91df ; (nformi.s43 + 0)
.s29:
00:91da : 38 __ __ SEC
00:91db : a9 10 __ LDA #$10
00:91dd : f1 0d __ SBC (P0),y ; (si + 0)
.s43:
00:91df : a8 __ __ TAY
00:91e0 : c4 46 __ CPY T6 + 0 
00:91e2 : b0 0d __ BCS $91f1 ; (nformi.s8 + 0)
.s28:
00:91e4 : a9 30 __ LDA #$30
.l44:
00:91e6 : a6 46 __ LDX T6 + 0 
00:91e8 : 9d e7 7f STA $7fe7,x 
00:91eb : c6 46 __ DEC T6 + 0 
00:91ed : c4 46 __ CPY T6 + 0 
00:91ef : 90 f5 __ BCC $91e6 ; (nformi.l44 + 0)
.s8:
00:91f1 : a0 08 __ LDY #$08
00:91f3 : b1 0d __ LDA (P0),y ; (si + 0)
00:91f5 : f0 24 __ BEQ $921b ; (nformi.s9 + 0)
.s25:
00:91f7 : a0 05 __ LDY #$05
00:91f9 : b1 0d __ LDA (P0),y ; (si + 0)
00:91fb : d0 1e __ BNE $921b ; (nformi.s9 + 0)
.s27:
00:91fd : 88 __ __ DEY
00:91fe : b1 0d __ LDA (P0),y ; (si + 0)
00:9200 : c9 10 __ CMP #$10
00:9202 : d0 17 __ BNE $921b ; (nformi.s9 + 0)
.s26:
00:9204 : 88 __ __ DEY
00:9205 : b1 0d __ LDA (P0),y ; (si + 0)
00:9207 : a8 __ __ TAY
00:9208 : a9 30 __ LDA #$30
00:920a : a6 46 __ LDX T6 + 0 
00:920c : 9d e6 7f STA $7fe6,x ; (si + 8)
00:920f : 98 __ __ TYA
00:9210 : 69 16 __ ADC #$16
00:9212 : 9d e7 7f STA $7fe7,x 
00:9215 : 8a __ __ TXA
00:9216 : 18 __ __ CLC
00:9217 : 69 fe __ ADC #$fe
00:9219 : 85 46 __ STA T6 + 0 
.s9:
00:921b : a9 00 __ LDA #$00
00:921d : 85 1b __ STA ACCU + 0 
00:921f : a5 45 __ LDA T5 + 0 
00:9221 : f0 0c __ BEQ $922f ; (nformi.s10 + 0)
.s24:
00:9223 : a9 2d __ LDA #$2d
.s23:
00:9225 : a6 46 __ LDX T6 + 0 
00:9227 : 9d e7 7f STA $7fe7,x 
00:922a : c6 46 __ DEC T6 + 0 
00:922c : 4c 39 18 JMP $1839 
.s10:
00:922f : a0 06 __ LDY #$06
00:9231 : b1 0d __ LDA (P0),y ; (si + 0)
00:9233 : f0 04 __ BEQ $9239 ; (nformi.s11 + 0)
.s22:
00:9235 : a9 2b __ LDA #$2b
00:9237 : d0 ec __ BNE $9225 ; (nformi.s23 + 0)
.s11:
00:9239 : a6 46 __ LDX T6 + 0 
00:923b : a0 07 __ LDY #$07
00:923d : b1 0d __ LDA (P0),y ; (si + 0)
00:923f : d0 2d __ BNE $926e ; (nformi.s18 + 0)
.l12:
00:9241 : 8a __ __ TXA
00:9242 : 18 __ __ CLC
00:9243 : a0 01 __ LDY #$01
00:9245 : 71 0d __ ADC (P0),y ; (si + 0)
00:9247 : b0 04 __ BCS $924d ; (nformi.s16 + 0)
.s17:
00:9249 : c9 11 __ CMP #$11
00:924b : 90 0a __ BCC $9257 ; (nformi.s13 + 0)
.s16:
00:924d : a0 00 __ LDY #$00
00:924f : b1 0d __ LDA (P0),y ; (si + 0)
00:9251 : 9d e7 7f STA $7fe7,x 
00:9254 : ca __ __ DEX
00:9255 : b0 ea __ BCS $9241 ; (nformi.l12 + 0)
.s13:
00:9257 : e0 10 __ CPX #$10
00:9259 : b0 0e __ BCS $9269 ; (nformi.s14 + 0)
.s15:
00:925b : 88 __ __ DEY
.l41:
00:925c : bd e8 7f LDA $7fe8,x ; (buffer + 0)
00:925f : 91 0f __ STA (P2),y ; (str + 0)
00:9261 : c8 __ __ INY
00:9262 : e8 __ __ INX
00:9263 : e0 10 __ CPX #$10
00:9265 : 90 f5 __ BCC $925c ; (nformi.l41 + 0)
.s42:
00:9267 : 84 1b __ STY ACCU + 0 
.s14:
00:9269 : a9 00 __ LDA #$00
00:926b : 85 1c __ STA ACCU + 1 
.s3:
00:926d : 60 __ __ RTS
.s18:
00:926e : e0 10 __ CPX #$10
00:9270 : b0 1a __ BCS $928c ; (nformi.l19 + 0)
.s21:
00:9272 : a0 00 __ LDY #$00
.l39:
00:9274 : bd e8 7f LDA $7fe8,x ; (buffer + 0)
00:9277 : 91 0f __ STA (P2),y ; (str + 0)
00:9279 : c8 __ __ INY
00:927a : e8 __ __ INX
00:927b : e0 10 __ CPX #$10
00:927d : 90 f5 __ BCC $9274 ; (nformi.l39 + 0)
.s40:
00:927f : 84 1b __ STY ACCU + 0 
00:9281 : b0 09 __ BCS $928c ; (nformi.l19 + 0)
.s20:
00:9283 : 88 __ __ DEY
00:9284 : b1 0d __ LDA (P0),y ; (si + 0)
00:9286 : a4 1b __ LDY ACCU + 0 
00:9288 : 91 0f __ STA (P2),y ; (str + 0)
00:928a : e6 1b __ INC ACCU + 0 
.l19:
00:928c : a5 1b __ LDA ACCU + 0 
00:928e : a0 01 __ LDY #$01
00:9290 : d1 0d __ CMP (P0),y ; (si + 0)
00:9292 : 90 ef __ BCC $9283 ; (nformi.s20 + 0)
00:9294 : b0 d3 __ BCS $9269 ; (nformi.s14 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s4:
00:9296 : a9 00 __ LDA #$00
00:9298 : 85 45 __ STA T5 + 0 
00:929a : a5 15 __ LDA P8 ; (s + 0)
00:929c : f0 1f __ BEQ $92bd ; (nforml.s5 + 0)
.s43:
00:929e : 24 14 __ BIT P7 ; (v + 3)
00:92a0 : 10 1b __ BPL $92bd ; (nforml.s5 + 0)
.s44:
00:92a2 : 38 __ __ SEC
00:92a3 : a9 00 __ LDA #$00
00:92a5 : e5 11 __ SBC P4 ; (v + 0)
00:92a7 : 85 11 __ STA P4 ; (v + 0)
00:92a9 : a9 00 __ LDA #$00
00:92ab : e5 12 __ SBC P5 ; (v + 1)
00:92ad : 85 12 __ STA P5 ; (v + 1)
00:92af : a9 00 __ LDA #$00
00:92b1 : e5 13 __ SBC P6 ; (v + 2)
00:92b3 : 85 13 __ STA P6 ; (v + 2)
00:92b5 : a9 00 __ LDA #$00
00:92b7 : e5 14 __ SBC P7 ; (v + 3)
00:92b9 : 85 14 __ STA P7 ; (v + 3)
00:92bb : e6 45 __ INC T5 + 0 
.s5:
00:92bd : a9 10 __ LDA #$10
00:92bf : 85 46 __ STA T6 + 0 
00:92c1 : a5 14 __ LDA P7 ; (v + 3)
00:92c3 : d0 0c __ BNE $92d1 ; (nforml.s30 + 0)
.s40:
00:92c5 : a5 13 __ LDA P6 ; (v + 2)
00:92c7 : d0 08 __ BNE $92d1 ; (nforml.s30 + 0)
.s41:
00:92c9 : a5 12 __ LDA P5 ; (v + 1)
00:92cb : d0 04 __ BNE $92d1 ; (nforml.s30 + 0)
.s42:
00:92cd : c5 11 __ CMP P4 ; (v + 0)
00:92cf : b0 0e __ BCS $92df ; (nforml.s6 + 0)
.s30:
00:92d1 : a0 04 __ LDY #$04
00:92d3 : b1 0d __ LDA (P0),y ; (si + 0)
00:92d5 : 85 43 __ STA T1 + 0 
00:92d7 : c8 __ __ INY
00:92d8 : b1 0d __ LDA (P0),y ; (si + 0)
00:92da : 85 44 __ STA T1 + 1 
00:92dc : 4c a7 19 JMP $19a7 
.s6:
00:92df : a0 02 __ LDY #$02
00:92e1 : b1 0d __ LDA (P0),y ; (si + 0)
00:92e3 : c9 ff __ CMP #$ff
00:92e5 : d0 04 __ BNE $92eb ; (nforml.s29 + 0)
.s7:
00:92e7 : a9 0f __ LDA #$0f
00:92e9 : d0 05 __ BNE $92f0 ; (nforml.s49 + 0)
.s29:
00:92eb : 38 __ __ SEC
00:92ec : a9 10 __ LDA #$10
00:92ee : f1 0d __ SBC (P0),y ; (si + 0)
.s49:
00:92f0 : a8 __ __ TAY
00:92f1 : c4 46 __ CPY T6 + 0 
00:92f3 : b0 0d __ BCS $9302 ; (nforml.s8 + 0)
.s28:
00:92f5 : a9 30 __ LDA #$30
.l50:
00:92f7 : a6 46 __ LDX T6 + 0 
00:92f9 : 9d e7 7f STA $7fe7,x 
00:92fc : c6 46 __ DEC T6 + 0 
00:92fe : c4 46 __ CPY T6 + 0 
00:9300 : 90 f5 __ BCC $92f7 ; (nforml.l50 + 0)
.s8:
00:9302 : a0 08 __ LDY #$08
00:9304 : b1 0d __ LDA (P0),y ; (si + 0)
00:9306 : f0 24 __ BEQ $932c ; (nforml.s9 + 0)
.s25:
00:9308 : a0 05 __ LDY #$05
00:930a : b1 0d __ LDA (P0),y ; (si + 0)
00:930c : d0 1e __ BNE $932c ; (nforml.s9 + 0)
.s27:
00:930e : 88 __ __ DEY
00:930f : b1 0d __ LDA (P0),y ; (si + 0)
00:9311 : c9 10 __ CMP #$10
00:9313 : d0 17 __ BNE $932c ; (nforml.s9 + 0)
.s26:
00:9315 : 88 __ __ DEY
00:9316 : b1 0d __ LDA (P0),y ; (si + 0)
00:9318 : a8 __ __ TAY
00:9319 : a9 30 __ LDA #$30
00:931b : a6 46 __ LDX T6 + 0 
00:931d : 9d e6 7f STA $7fe6,x ; (si + 8)
00:9320 : 98 __ __ TYA
00:9321 : 69 16 __ ADC #$16
00:9323 : 9d e7 7f STA $7fe7,x 
00:9326 : 8a __ __ TXA
00:9327 : 18 __ __ CLC
00:9328 : 69 fe __ ADC #$fe
00:932a : 85 46 __ STA T6 + 0 
.s9:
00:932c : a9 00 __ LDA #$00
00:932e : 85 1b __ STA ACCU + 0 
00:9330 : a5 45 __ LDA T5 + 0 
00:9332 : f0 0c __ BEQ $9340 ; (nforml.s10 + 0)
.s24:
00:9334 : a9 2d __ LDA #$2d
.s23:
00:9336 : a6 46 __ LDX T6 + 0 
00:9338 : 9d e7 7f STA $7fe7,x 
00:933b : c6 46 __ DEC T6 + 0 
00:933d : 4c 4a 19 JMP $194a 
.s10:
00:9340 : a0 06 __ LDY #$06
00:9342 : b1 0d __ LDA (P0),y ; (si + 0)
00:9344 : f0 04 __ BEQ $934a ; (nforml.s11 + 0)
.s22:
00:9346 : a9 2b __ LDA #$2b
00:9348 : d0 ec __ BNE $9336 ; (nforml.s23 + 0)
.s11:
00:934a : a6 46 __ LDX T6 + 0 
00:934c : a0 07 __ LDY #$07
00:934e : b1 0d __ LDA (P0),y ; (si + 0)
00:9350 : d0 2d __ BNE $937f ; (nforml.s18 + 0)
.l12:
00:9352 : 8a __ __ TXA
00:9353 : 18 __ __ CLC
00:9354 : a0 01 __ LDY #$01
00:9356 : 71 0d __ ADC (P0),y ; (si + 0)
00:9358 : b0 04 __ BCS $935e ; (nforml.s16 + 0)
.s17:
00:935a : c9 11 __ CMP #$11
00:935c : 90 0a __ BCC $9368 ; (nforml.s13 + 0)
.s16:
00:935e : a0 00 __ LDY #$00
00:9360 : b1 0d __ LDA (P0),y ; (si + 0)
00:9362 : 9d e7 7f STA $7fe7,x 
00:9365 : ca __ __ DEX
00:9366 : b0 ea __ BCS $9352 ; (nforml.l12 + 0)
.s13:
00:9368 : e0 10 __ CPX #$10
00:936a : b0 0e __ BCS $937a ; (nforml.s14 + 0)
.s15:
00:936c : 88 __ __ DEY
.l47:
00:936d : bd e8 7f LDA $7fe8,x ; (buffer + 0)
00:9370 : 91 0f __ STA (P2),y ; (str + 0)
00:9372 : c8 __ __ INY
00:9373 : e8 __ __ INX
00:9374 : e0 10 __ CPX #$10
00:9376 : 90 f5 __ BCC $936d ; (nforml.l47 + 0)
.s48:
00:9378 : 84 1b __ STY ACCU + 0 
.s14:
00:937a : a9 00 __ LDA #$00
00:937c : 85 1c __ STA ACCU + 1 
.s3:
00:937e : 60 __ __ RTS
.s18:
00:937f : e0 10 __ CPX #$10
00:9381 : b0 1a __ BCS $939d ; (nforml.l19 + 0)
.s21:
00:9383 : a0 00 __ LDY #$00
.l45:
00:9385 : bd e8 7f LDA $7fe8,x ; (buffer + 0)
00:9388 : 91 0f __ STA (P2),y ; (str + 0)
00:938a : c8 __ __ INY
00:938b : e8 __ __ INX
00:938c : e0 10 __ CPX #$10
00:938e : 90 f5 __ BCC $9385 ; (nforml.l45 + 0)
.s46:
00:9390 : 84 1b __ STY ACCU + 0 
00:9392 : b0 09 __ BCS $939d ; (nforml.l19 + 0)
.s20:
00:9394 : 88 __ __ DEY
00:9395 : b1 0d __ LDA (P0),y ; (si + 0)
00:9397 : a4 1b __ LDY ACCU + 0 
00:9399 : 91 0f __ STA (P2),y ; (str + 0)
00:939b : e6 1b __ INC ACCU + 0 
.l19:
00:939d : a5 1b __ LDA ACCU + 0 
00:939f : a0 01 __ LDY #$01
00:93a1 : d1 0d __ CMP (P0),y ; (si + 0)
00:93a3 : 90 ef __ BCC $9394 ; (nforml.s20 + 0)
00:93a5 : b0 d3 __ BCS $937a ; (nforml.s14 + 0)
.l31:
00:93a7 : a5 11 __ LDA P4 ; (v + 0)
00:93a9 : 85 1b __ STA ACCU + 0 
00:93ab : a5 12 __ LDA P5 ; (v + 1)
00:93ad : 85 1c __ STA ACCU + 1 
00:93af : a5 13 __ LDA P6 ; (v + 2)
00:93b1 : 85 1d __ STA ACCU + 2 
00:93b3 : a5 14 __ LDA P7 ; (v + 3)
00:93b5 : 85 1e __ STA ACCU + 3 
00:93b7 : a5 43 __ LDA T1 + 0 
00:93b9 : 85 03 __ STA WORK + 0 
00:93bb : a5 44 __ LDA T1 + 1 
00:93bd : 85 04 __ STA WORK + 1 
00:93bf : a9 00 __ LDA #$00
00:93c1 : 85 05 __ STA WORK + 2 
00:93c3 : 85 06 __ STA WORK + 3 
00:93c5 : 20 76 27 JSR $2776 
00:93c8 : a5 08 __ LDA WORK + 5 
00:93ca : 30 08 __ BMI $93d4 ; (nforml.s32 + 0)
.s39:
00:93cc : d0 0a __ BNE $93d8 ; (nforml.s37 + 0)
.s38:
00:93ce : a5 07 __ LDA WORK + 4 
00:93d0 : c9 0a __ CMP #$0a
00:93d2 : b0 04 __ BCS $93d8 ; (nforml.s37 + 0)
.s32:
00:93d4 : a9 30 __ LDA #$30
00:93d6 : d0 07 __ BNE $93df ; (nforml.s33 + 0)
.s37:
00:93d8 : a0 03 __ LDY #$03
00:93da : b1 0d __ LDA (P0),y ; (si + 0)
00:93dc : 38 __ __ SEC
00:93dd : e9 0a __ SBC #$0a
.s33:
00:93df : 18 __ __ CLC
00:93e0 : 65 07 __ ADC WORK + 4 
00:93e2 : a6 46 __ LDX T6 + 0 
00:93e4 : 9d e7 7f STA $7fe7,x 
00:93e7 : a5 1b __ LDA ACCU + 0 
00:93e9 : 85 11 __ STA P4 ; (v + 0)
00:93eb : a5 1c __ LDA ACCU + 1 
00:93ed : 85 12 __ STA P5 ; (v + 1)
00:93ef : a5 1d __ LDA ACCU + 2 
00:93f1 : 85 13 __ STA P6 ; (v + 2)
00:93f3 : a5 1e __ LDA ACCU + 3 
00:93f5 : 85 14 __ STA P7 ; (v + 3)
00:93f7 : c6 46 __ DEC T6 + 0 
00:93f9 : aa __ __ TAX
00:93fa : d0 ab __ BNE $93a7 ; (nforml.l31 + 0)
.s34:
00:93fc : a5 13 __ LDA P6 ; (v + 2)
00:93fe : d0 a7 __ BNE $93a7 ; (nforml.l31 + 0)
.s35:
00:9400 : a5 12 __ LDA P5 ; (v + 1)
00:9402 : d0 a3 __ BNE $93a7 ; (nforml.l31 + 0)
.s36:
00:9404 : c5 11 __ CMP P4 ; (v + 0)
00:9406 : 90 9f __ BCC $93a7 ; (nforml.l31 + 0)
00:9408 : 4c df 18 JMP $18df 
--------------------------------------------------------------------
00:940b : __ __ __ BYT 0a 72 65 75 20 44 45 54 45 43 54 45 44 2c 20 53 : .reu DETECTED, S
00:941b : __ __ __ BYT 49 5a 45 3a 20 25 44 20 6b 62 0a 00             : IZE: %D kb..
--------------------------------------------------------------------
errorexit: ; errorexit(const u8*)->void
.s1:
00:9427 : 38 __ __ SEC
00:9428 : a5 23 __ LDA SP + 0 
00:942a : e9 09 __ SBC #$09
00:942c : 85 23 __ STA SP + 0 
00:942e : b0 02 __ BCS $9432 ; (errorexit.s4 + 0)
00:9430 : c6 24 __ DEC SP + 1 
.s4:
00:9432 : a9 5e __ LDA #$5e
00:9434 : a0 05 __ LDY #$05
00:9436 : 91 23 __ STA (SP + 0),y 
00:9438 : a9 1a __ LDA #$1a
00:943a : c8 __ __ INY
00:943b : 91 23 __ STA (SP + 0),y 
00:943d : ad fc 7f LDA $7ffc ; (sstack + 4)
00:9440 : c8 __ __ INY
00:9441 : 91 23 __ STA (SP + 0),y 
00:9443 : ad fd 7f LDA $7ffd ; (sstack + 5)
00:9446 : c8 __ __ INY
00:9447 : 91 23 __ STA (SP + 0),y 
00:9449 : 20 70 13 JSR $1370 
00:944c : 20 eb 11 JSR $11eb 
00:944f : 20 00 c0 JSR $c000 
.s3:
00:9452 : 18 __ __ CLC
00:9453 : a5 23 __ LDA SP + 0 
00:9455 : 69 09 __ ADC #$09
00:9457 : 85 23 __ STA SP + 0 
00:9459 : 90 02 __ BCC $945d ; (errorexit.s3 + 11)
00:945b : e6 24 __ INC SP + 1 
00:945d : 60 __ __ RTS
--------------------------------------------------------------------
00:945e : __ __ __ BYT 0a 25 53 0a 70 52 45 53 53 20 4b 45 59 20 54 4f : .%S.pRESS KEY TO
00:946e : __ __ __ BYT 20 45 58 49 54 20 54 4f 20 62 61 73 69 63 2e 0a :  EXIT TO basic..
00:947e : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
00:947f : __ __ __ BYT 6e 4f 20 72 65 75 20 44 45 54 45 43 54 45 44 2e : nO reu DETECTED.
00:948f : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
readconfigfile: ; readconfigfile()->void
.s1:
00:9490 : 38 __ __ SEC
00:9491 : a5 23 __ LDA SP + 0 
00:9493 : e9 07 __ SBC #$07
00:9495 : 85 23 __ STA SP + 0 
00:9497 : b0 02 __ BCS $949b ; (readconfigfile.s4 + 0)
00:9499 : c6 24 __ DEC SP + 1 
.s4:
00:949b : 20 91 10 JSR $1091 
00:949e : a9 01 __ LDA #$01
00:94a0 : 85 11 __ STA P4 
00:94a2 : 20 27 1b JSR $1b27 
00:94a5 : 20 cb 1b JSR $1bcb 
00:94a8 : aa __ __ TAX
00:94a9 : f0 1d __ BEQ $94c8 ; (readconfigfile.s5 + 0)
.s9:
00:94ab : a9 08 __ LDA #$08
00:94ad : a0 05 __ LDY #$05
00:94af : 91 23 __ STA (SP + 0),y 
00:94b1 : a9 1c __ LDA #$1c
00:94b3 : c8 __ __ INY
00:94b4 : 91 23 __ STA (SP + 0),y 
00:94b6 : 20 70 13 JSR $1370 
00:94b9 : 20 31 1c JSR $1c31 
.s3:
00:94bc : 18 __ __ CLC
00:94bd : a5 23 __ LDA SP + 0 
00:94bf : 69 07 __ ADC #$07
00:94c1 : 85 23 __ STA SP + 0 
00:94c3 : 90 02 __ BCC $94c7 ; (readconfigfile.s3 + 11)
00:94c5 : e6 24 __ INC SP + 1 
00:94c7 : 60 __ __ RTS
.s5:
00:94c8 : a9 56 __ LDA #$56
00:94ca : 85 11 __ STA P4 
00:94cc : a9 00 __ LDA #$00
00:94ce : 85 12 __ STA P5 
00:94d0 : 20 79 0f JSR $0f79 
00:94d3 : a9 34 __ LDA #$34
00:94d5 : 8d fe 7f STA $7ffe ; (sstack + 6)
00:94d8 : a9 1e __ LDA #$1e
00:94da : 8d ff 7f STA $7fff ; (sstack + 7)
00:94dd : 20 9d 1d JSR $1d9d 
00:94e0 : 20 22 10 JSR $1022 
00:94e3 : 20 0e 11 JSR $110e 
00:94e6 : a2 55 __ LDX #$55
.l6:
00:94e8 : bd c8 49 LDA $49c8,x ; (uii_data + 0)
00:94eb : 9d 00 49 STA $4900,x ; (cfg + 0)
00:94ee : ca __ __ DEX
00:94ef : 10 f7 __ BPL $94e8 ; (readconfigfile.l6 + 0)
.s7:
00:94f1 : ad c8 49 LDA $49c8 ; (uii_data + 0)
00:94f4 : c9 02 __ CMP #$02
00:94f6 : b0 29 __ BCS $9521 ; (readconfigfile.s10 + 0)
.s8:
00:94f8 : a9 43 __ LDA #$43
00:94fa : a0 05 __ LDY #$05
00:94fc : 91 23 __ STA (SP + 0),y 
00:94fe : a9 1e __ LDA #$1e
00:9500 : c8 __ __ INY
00:9501 : 91 23 __ STA (SP + 0),y 
00:9503 : 20 70 13 JSR $1370 
00:9506 : a9 63 __ LDA #$63
00:9508 : a0 05 __ LDY #$05
00:950a : 91 23 __ STA (SP + 0),y 
00:950c : a9 1e __ LDA #$1e
00:950e : c8 __ __ INY
00:950f : 91 23 __ STA (SP + 0),y 
00:9511 : 20 70 13 JSR $1370 
00:9514 : a9 ff __ LDA #$ff
00:9516 : 8d fc 7f STA $7ffc ; (sstack + 4)
00:9519 : a9 11 __ LDA #$11
00:951b : 8d fd 7f STA $7ffd ; (sstack + 5)
00:951e : 20 27 1a JSR $1a27 
.s10:
00:9521 : 20 63 1c JSR $1c63 
00:9524 : 4c bc 1a JMP $1abc 
--------------------------------------------------------------------
uii_open_file@proxy: ; uii_open_file@proxy
00:9527 : a9 b7 __ LDA #$b7
00:9529 : 85 12 __ STA P5 
00:952b : a9 2a __ LDA #$2a
00:952d : 85 13 __ STA P6 
--------------------------------------------------------------------
uii_open_file: ; uii_open_file(u8,u8*)->void
.s4:
00:952f : a5 12 __ LDA P5 ; (filename + 0)
00:9531 : 85 0d __ STA P0 
00:9533 : 20 5e 2a JSR $2a5e 
00:9536 : 18 __ __ CLC
00:9537 : a5 1b __ LDA ACCU + 0 
00:9539 : 69 03 __ ADC #$03
00:953b : 85 1b __ STA ACCU + 0 
00:953d : 90 02 __ BCC $9541 ; (uii_open_file.s10 + 0)
.s9:
00:953f : e6 1c __ INC ACCU + 1 
.s10:
00:9541 : 20 4d 28 JSR $284d 
00:9544 : a5 1b __ LDA ACCU + 0 
00:9546 : 85 45 __ STA T2 + 0 
00:9548 : a5 1c __ LDA ACCU + 1 
00:954a : 85 46 __ STA T2 + 1 
00:954c : a9 00 __ LDA #$00
00:954e : a8 __ __ TAY
00:954f : 91 1b __ STA (ACCU + 0),y 
00:9551 : a9 02 __ LDA #$02
00:9553 : c8 __ __ INY
00:9554 : 91 1b __ STA (ACCU + 0),y 
00:9556 : a5 11 __ LDA P4 ; (attrib + 0)
00:9558 : c8 __ __ INY
00:9559 : 91 1b __ STA (ACCU + 0),y 
00:955b : a9 00 __ LDA #$00
00:955d : 85 47 __ STA T3 + 0 
00:955f : 85 48 __ STA T3 + 1 
.l11:
00:9561 : 20 5e 2a JSR $2a5e 
00:9564 : a5 48 __ LDA T3 + 1 
00:9566 : c5 1c __ CMP ACCU + 1 
00:9568 : d0 5b __ BNE $95c5 ; (uii_open_file.s8 + 0)
.s7:
00:956a : a5 47 __ LDA T3 + 0 
00:956c : c5 1b __ CMP ACCU + 0 
00:956e : 90 2c __ BCC $959c ; (uii_open_file.s6 + 0)
.s5:
00:9570 : a9 01 __ LDA #$01
00:9572 : 8d a6 2a STA $2aa6 
00:9575 : 20 5e 2a JSR $2a5e 
00:9578 : a5 45 __ LDA T2 + 0 
00:957a : 85 0d __ STA P0 
00:957c : a5 46 __ LDA T2 + 1 
00:957e : 85 0e __ STA P1 
00:9580 : 18 __ __ CLC
00:9581 : a5 1b __ LDA ACCU + 0 
00:9583 : 69 03 __ ADC #$03
00:9585 : 85 0f __ STA P2 
00:9587 : a5 1c __ LDA ACCU + 1 
00:9589 : 69 00 __ ADC #$00
00:958b : 85 10 __ STA P3 
00:958d : 20 a6 0f JSR $0fa6 
00:9590 : 20 45 29 JSR $2945 
00:9593 : 20 22 10 JSR $1022 
00:9596 : 20 60 10 JSR $1060 
00:9599 : 4c 0e 11 JMP $110e 
.s6:
00:959c : 85 43 __ STA T0 + 0 
00:959e : 18 __ __ CLC
00:959f : a5 13 __ LDA P6 ; (filename + 1)
00:95a1 : 65 48 __ ADC T3 + 1 
00:95a3 : 85 44 __ STA T0 + 1 
00:95a5 : a4 12 __ LDY P5 ; (filename + 0)
00:95a7 : b1 43 __ LDA (T0 + 0),y 
00:95a9 : aa __ __ TAX
00:95aa : 18 __ __ CLC
00:95ab : a5 45 __ LDA T2 + 0 
00:95ad : 65 47 __ ADC T3 + 0 
00:95af : 85 43 __ STA T0 + 0 
00:95b1 : a5 46 __ LDA T2 + 1 
00:95b3 : 65 48 __ ADC T3 + 1 
00:95b5 : 85 44 __ STA T0 + 1 
00:95b7 : 8a __ __ TXA
00:95b8 : a0 03 __ LDY #$03
00:95ba : 91 43 __ STA (T0 + 0),y 
00:95bc : e6 47 __ INC T3 + 0 
00:95be : d0 a1 __ BNE $9561 ; (uii_open_file.l11 + 0)
.s12:
00:95c0 : e6 48 __ INC T3 + 1 
00:95c2 : 4c 61 1b JMP $1b61 
.s8:
00:95c5 : b0 a9 __ BCS $9570 ; (uii_open_file.s5 + 0)
.s13:
00:95c7 : a5 47 __ LDA T3 + 0 
00:95c9 : 90 d1 __ BCC $959c ; (uii_open_file.s6 + 0)
--------------------------------------------------------------------
strcmp@proxy: ; strcmp@proxy
00:95cb : a9 c9 __ LDA #$c9
00:95cd : 85 0d __ STA P0 
00:95cf : a9 4b __ LDA #$4b
00:95d1 : 85 0e __ STA P1 
00:95d3 : a9 f9 __ LDA #$f9
00:95d5 : 85 0f __ STA P2 
00:95d7 : a9 11 __ LDA #$11
00:95d9 : 85 10 __ STA P3 
--------------------------------------------------------------------
strcmp: ; strcmp(const u8*,const u8*)->i8
.s4:
00:95db : a0 00 __ LDY #$00
00:95dd : b1 0d __ LDA (P0),y 
00:95df : f0 16 __ BEQ $95f7 ; (strcmp.s4 + 28)
00:95e1 : d1 0f __ CMP (P2),y 
00:95e3 : d0 16 __ BNE $95fb ; (strcmp.s4 + 32)
00:95e5 : c8 __ __ INY
00:95e6 : b1 0d __ LDA (P0),y 
00:95e8 : f0 0d __ BEQ $95f7 ; (strcmp.s4 + 28)
00:95ea : d1 0f __ CMP (P2),y 
00:95ec : d0 0d __ BNE $95fb ; (strcmp.s4 + 32)
00:95ee : c8 __ __ INY
00:95ef : d0 ec __ BNE $95dd ; (strcmp.s4 + 2)
00:95f1 : e6 0e __ INC P1 
00:95f3 : e6 10 __ INC P3 
00:95f5 : d0 e6 __ BNE $95dd ; (strcmp.s4 + 2)
00:95f7 : d1 0f __ CMP (P2),y 
00:95f9 : f0 08 __ BEQ $9603 ; (strcmp.s4 + 40)
00:95fb : b0 04 __ BCS $9601 ; (strcmp.s4 + 38)
00:95fd : a9 ff __ LDA #$ff
00:95ff : 30 02 __ BMI $9603 ; (strcmp.s4 + 40)
00:9601 : a9 01 __ LDA #$01
00:9603 : 85 1b __ STA ACCU + 0 
.s3:
00:9605 : a5 1b __ LDA ACCU + 0 
00:9607 : 60 __ __ RTS
--------------------------------------------------------------------
00:9608 : __ __ __ BYT 0a 6e 4f 20 43 4f 4e 46 49 47 20 46 49 4c 45 20 : .nO CONFIG FILE 
00:9618 : __ __ __ BYT 46 4f 55 4e 44 2c 20 57 52 49 54 49 4e 47 20 44 : FOUND, WRITING D
00:9628 : __ __ __ BYT 45 46 41 55 4c 54 53 2e 00                      : EFAULTS..
--------------------------------------------------------------------
writeconfigfile: ; writeconfigfile()->void
.s4:
00:9631 : a9 b7 __ LDA #$b7
00:9633 : 85 11 __ STA P4 
00:9635 : a9 2a __ LDA #$2a
00:9637 : 85 12 __ STA P5 
00:9639 : 20 8c 1c JSR $1c8c 
00:963c : a9 06 __ LDA #$06
00:963e : 85 11 __ STA P4 
00:9640 : 20 27 1b JSR $1b27 
00:9643 : a9 56 __ LDA #$56
00:9645 : 85 13 __ STA P6 
00:9647 : a9 49 __ LDA #$49
00:9649 : 85 12 __ STA P5 
00:964b : a9 00 __ LDA #$00
00:964d : 85 14 __ STA P7 
00:964f : a9 00 __ LDA #$00
00:9651 : 85 11 __ STA P4 
00:9653 : 20 1c 1d JSR $1d1c 
00:9656 : a9 25 __ LDA #$25
00:9658 : 8d fe 7f STA $7ffe ; (sstack + 6)
00:965b : a9 1e __ LDA #$1e
00:965d : 8d ff 7f STA $7fff ; (sstack + 7)
00:9660 : 20 9d 1d JSR $1d9d 
--------------------------------------------------------------------
uii_close_file: ; uii_close_file()->void
.s4:
00:9663 : a9 00 __ LDA #$00
00:9665 : 85 10 __ STA P3 
00:9667 : 8d f6 7f STA $7ff6 ; (cmd + 0)
00:966a : a9 01 __ LDA #$01
00:966c : 8d a6 2a STA $2aa6 
00:966f : a9 02 __ LDA #$02
00:9671 : 85 0f __ STA P2 
00:9673 : a9 03 __ LDA #$03
00:9675 : 8d f7 7f STA $7ff7 ; (cmd + 1)
00:9678 : a9 f6 __ LDA #$f6
00:967a : 85 0d __ STA P0 
00:967c : a9 7f __ LDA #$7f
00:967e : 85 0e __ STA P1 
00:9680 : 20 a6 0f JSR $0fa6 
00:9683 : 20 22 10 JSR $1022 
00:9686 : 20 60 10 JSR $1060 
00:9689 : 4c 0e 11 JMP $110e 
--------------------------------------------------------------------
uii_delete_file: ; uii_delete_file(u8*)->void
.s4:
00:968c : 20 1f 0f JSR $0f1f 
00:968f : 18 __ __ CLC
00:9690 : a5 1b __ LDA ACCU + 0 
00:9692 : 69 02 __ ADC #$02
00:9694 : 85 1b __ STA ACCU + 0 
00:9696 : 90 02 __ BCC $969a ; (uii_delete_file.s10 + 0)
.s9:
00:9698 : e6 1c __ INC ACCU + 1 
.s10:
00:969a : 20 4d 28 JSR $284d 
00:969d : a5 1b __ LDA ACCU + 0 
00:969f : 85 45 __ STA T2 + 0 
00:96a1 : a5 1c __ LDA ACCU + 1 
00:96a3 : 85 46 __ STA T2 + 1 
00:96a5 : a9 00 __ LDA #$00
00:96a7 : a8 __ __ TAY
00:96a8 : 91 1b __ STA (ACCU + 0),y 
00:96aa : a9 09 __ LDA #$09
00:96ac : c8 __ __ INY
00:96ad : 91 1b __ STA (ACCU + 0),y 
00:96af : a9 00 __ LDA #$00
00:96b1 : 85 47 __ STA T3 + 0 
00:96b3 : 85 48 __ STA T3 + 1 
.l11:
00:96b5 : 20 57 2a JSR $2a57 
00:96b8 : a5 48 __ LDA T3 + 1 
00:96ba : c5 1c __ CMP ACCU + 1 
00:96bc : d0 58 __ BNE $9716 ; (uii_delete_file.s8 + 0)
.s7:
00:96be : a5 47 __ LDA T3 + 0 
00:96c0 : c5 1b __ CMP ACCU + 0 
00:96c2 : 90 29 __ BCC $96ed ; (uii_delete_file.s6 + 0)
.s5:
00:96c4 : a9 01 __ LDA #$01
00:96c6 : 8d a6 2a STA $2aa6 
00:96c9 : 20 57 2a JSR $2a57 
00:96cc : a5 45 __ LDA T2 + 0 
00:96ce : 85 0d __ STA P0 
00:96d0 : a5 46 __ LDA T2 + 1 
00:96d2 : 85 0e __ STA P1 
00:96d4 : 18 __ __ CLC
00:96d5 : a5 1b __ LDA ACCU + 0 
00:96d7 : 69 02 __ ADC #$02
00:96d9 : 85 0f __ STA P2 
00:96db : a5 1c __ LDA ACCU + 1 
00:96dd : 69 00 __ ADC #$00
00:96df : 85 10 __ STA P3 
00:96e1 : 20 a6 0f JSR $0fa6 
00:96e4 : 20 45 29 JSR $2945 
00:96e7 : 20 60 10 JSR $1060 
00:96ea : 4c 0e 11 JMP $110e 
.s6:
00:96ed : 85 43 __ STA T0 + 0 
00:96ef : 18 __ __ CLC
00:96f0 : a5 12 __ LDA P5 ; (filename + 1)
00:96f2 : 65 48 __ ADC T3 + 1 
00:96f4 : 85 44 __ STA T0 + 1 
00:96f6 : a4 11 __ LDY P4 ; (filename + 0)
00:96f8 : b1 43 __ LDA (T0 + 0),y 
00:96fa : aa __ __ TAX
00:96fb : 18 __ __ CLC
00:96fc : a5 45 __ LDA T2 + 0 
00:96fe : 65 47 __ ADC T3 + 0 
00:9700 : 85 43 __ STA T0 + 0 
00:9702 : a5 46 __ LDA T2 + 1 
00:9704 : 65 48 __ ADC T3 + 1 
00:9706 : 85 44 __ STA T0 + 1 
00:9708 : 8a __ __ TXA
00:9709 : a0 02 __ LDY #$02
00:970b : 91 43 __ STA (T0 + 0),y 
00:970d : e6 47 __ INC T3 + 0 
00:970f : d0 a4 __ BNE $96b5 ; (uii_delete_file.l11 + 0)
.s12:
00:9711 : e6 48 __ INC T3 + 1 
00:9713 : 4c b5 1c JMP $1cb5 
.s8:
00:9716 : b0 ac __ BCS $96c4 ; (uii_delete_file.s5 + 0)
.s13:
00:9718 : a5 47 __ LDA T3 + 0 
00:971a : 90 d1 __ BCC $96ed ; (uii_delete_file.s6 + 0)
--------------------------------------------------------------------
uii_write_file: ; uii_write_file(u8*,u16)->void
.s4:
00:971c : 18 __ __ CLC
00:971d : a5 13 __ LDA P6 ; (length + 0)
00:971f : 69 04 __ ADC #$04
00:9721 : 85 45 __ STA T1 + 0 
00:9723 : 85 1b __ STA ACCU + 0 
00:9725 : a5 14 __ LDA P7 ; (length + 1)
00:9727 : 69 00 __ ADC #$00
00:9729 : 85 46 __ STA T1 + 1 
00:972b : 85 1c __ STA ACCU + 1 
00:972d : 20 4d 28 JSR $284d 
00:9730 : a9 00 __ LDA #$00
00:9732 : a8 __ __ TAY
00:9733 : 91 1b __ STA (ACCU + 0),y 
00:9735 : a9 05 __ LDA #$05
00:9737 : c8 __ __ INY
00:9738 : 91 1b __ STA (ACCU + 0),y 
00:973a : a9 00 __ LDA #$00
00:973c : c8 __ __ INY
00:973d : 91 1b __ STA (ACCU + 0),y 
00:973f : c8 __ __ INY
00:9740 : 91 1b __ STA (ACCU + 0),y 
00:9742 : a5 13 __ LDA P6 ; (length + 0)
00:9744 : 05 14 __ ORA P7 ; (length + 1)
00:9746 : f0 31 __ BEQ $9779 ; (uii_write_file.s5 + 0)
.s6:
00:9748 : a5 13 __ LDA P6 ; (length + 0)
00:974a : 85 43 __ STA T0 + 0 
00:974c : a5 1b __ LDA ACCU + 0 
00:974e : 85 47 __ STA T2 + 0 
00:9750 : a5 1c __ LDA ACCU + 1 
00:9752 : 85 48 __ STA T2 + 1 
00:9754 : a6 14 __ LDX P7 ; (length + 1)
.l7:
00:9756 : a0 00 __ LDY #$00
00:9758 : b1 11 __ LDA (P4),y ; (data + 0)
00:975a : a0 04 __ LDY #$04
00:975c : 91 47 __ STA (T2 + 0),y 
00:975e : e6 47 __ INC T2 + 0 
00:9760 : d0 02 __ BNE $9764 ; (uii_write_file.s9 + 0)
.s8:
00:9762 : e6 48 __ INC T2 + 1 
.s9:
00:9764 : e6 11 __ INC P4 ; (data + 0)
00:9766 : d0 02 __ BNE $976a ; (uii_write_file.s11 + 0)
.s10:
00:9768 : e6 12 __ INC P5 ; (data + 1)
.s11:
00:976a : 38 __ __ SEC
00:976b : a5 43 __ LDA T0 + 0 
00:976d : e9 01 __ SBC #$01
00:976f : 85 43 __ STA T0 + 0 
00:9771 : b0 01 __ BCS $9774 ; (uii_write_file.s13 + 0)
.s12:
00:9773 : ca __ __ DEX
.s13:
00:9774 : 8a __ __ TXA
00:9775 : 05 43 __ ORA T0 + 0 
00:9777 : d0 dd __ BNE $9756 ; (uii_write_file.l7 + 0)
.s5:
00:9779 : a9 01 __ LDA #$01
00:977b : 8d a6 2a STA $2aa6 
00:977e : a5 1b __ LDA ACCU + 0 
00:9780 : 85 0d __ STA P0 
00:9782 : a5 1c __ LDA ACCU + 1 
00:9784 : 85 0e __ STA P1 
00:9786 : a5 45 __ LDA T1 + 0 
00:9788 : 85 0f __ STA P2 
00:978a : a5 46 __ LDA T1 + 1 
00:978c : 85 10 __ STA P3 
00:978e : 20 a6 0f JSR $0fa6 
00:9791 : 20 45 29 JSR $2945 
00:9794 : 20 22 10 JSR $1022 
00:9797 : 20 60 10 JSR $1060 
00:979a : 4c 0e 11 JMP $110e 
--------------------------------------------------------------------
CheckStatus: ; CheckStatus(const u8*)->void
.s1:
00:979d : 38 __ __ SEC
00:979e : a5 23 __ LDA SP + 0 
00:97a0 : e9 09 __ SBC #$09
00:97a2 : 85 23 __ STA SP + 0 
00:97a4 : b0 02 __ BCS $97a8 ; (CheckStatus.s4 + 0)
00:97a6 : c6 24 __ DEC SP + 1 
.s4:
00:97a8 : ad c9 4b LDA $4bc9 ; (uii_status + 0)
00:97ab : c9 30 __ CMP #$30
00:97ad : d0 07 __ BNE $97b6 ; (CheckStatus.s6 + 0)
.s5:
00:97af : ad ca 4b LDA $4bca ; (uii_status + 1)
00:97b2 : c9 30 __ CMP #$30
00:97b4 : f0 43 __ BEQ $97f9 ; (CheckStatus.s3 + 0)
.s6:
00:97b6 : a9 05 __ LDA #$05
00:97b8 : a0 05 __ LDY #$05
00:97ba : 91 23 __ STA (SP + 0),y 
00:97bc : a9 1e __ LDA #$1e
00:97be : c8 __ __ INY
00:97bf : 91 23 __ STA (SP + 0),y 
00:97c1 : ad fe 7f LDA $7ffe ; (sstack + 6)
00:97c4 : c8 __ __ INY
00:97c5 : 91 23 __ STA (SP + 0),y 
00:97c7 : ad ff 7f LDA $7fff ; (sstack + 7)
00:97ca : c8 __ __ INY
00:97cb : 91 23 __ STA (SP + 0),y 
00:97cd : 20 70 13 JSR $1370 
00:97d0 : a9 c9 __ LDA #$c9
00:97d2 : a0 07 __ LDY #$07
00:97d4 : 91 23 __ STA (SP + 0),y 
00:97d6 : a9 4b __ LDA #$4b
00:97d8 : c8 __ __ INY
00:97d9 : 91 23 __ STA (SP + 0),y 
00:97db : a9 18 __ LDA #$18
00:97dd : a0 05 __ LDY #$05
00:97df : 91 23 __ STA (SP + 0),y 
00:97e1 : a9 1e __ LDA #$1e
00:97e3 : c8 __ __ INY
00:97e4 : 91 23 __ STA (SP + 0),y 
00:97e6 : 20 70 13 JSR $1370 
00:97e9 : 20 30 11 JSR $1130 
00:97ec : a9 ff __ LDA #$ff
00:97ee : 8d fc 7f STA $7ffc ; (sstack + 4)
00:97f1 : a9 11 __ LDA #$11
00:97f3 : 8d fd 7f STA $7ffd ; (sstack + 5)
00:97f6 : 20 27 1a JSR $1a27 
.s3:
00:97f9 : 18 __ __ CLC
00:97fa : a5 23 __ LDA SP + 0 
00:97fc : 69 09 __ ADC #$09
00:97fe : 85 23 __ STA SP + 0 
00:9800 : 90 02 __ BCC $9804 ; (CheckStatus.s3 + 11)
00:9802 : e6 24 __ INC SP + 1 
00:9804 : 60 __ __ RTS
--------------------------------------------------------------------
00:9805 : __ __ __ BYT 0a 69 2f 6f 20 45 52 52 4f 52 20 49 4e 20 25 53 : .i/o ERROR IN %S
00:9815 : __ __ __ BYT 2e 0a 00                                        : ...
--------------------------------------------------------------------
00:9818 : __ __ __ BYT 0a 73 54 41 54 55 53 3a 20 25 53 0a 00          : .sTATUS: %S..
--------------------------------------------------------------------
00:9825 : __ __ __ BYT 57 52 49 54 49 4e 47 20 43 4f 4e 46 49 47 00    : WRITING CONFIG.
--------------------------------------------------------------------
00:9834 : __ __ __ BYT 52 45 41 44 49 4e 47 20 43 4f 4e 46 49 47 00    : READING CONFIG.
--------------------------------------------------------------------
00:9843 : __ __ __ BYT 0a 6f 4c 44 20 43 4f 4e 46 49 47 55 52 41 54 49 : .oLD CONFIGURATI
00:9853 : __ __ __ BYT 4f 4e 20 46 49 4c 45 20 46 4f 52 4d 41 54 2e 00 : ON FILE FORMAT..
--------------------------------------------------------------------
00:9863 : __ __ __ BYT 0a 72 55 4e 20 55 50 47 52 41 44 45 20 54 4f 4f : .rUN UPGRADE TOO
00:9873 : __ __ __ BYT 4c 20 46 49 52 53 54 2e 00                      : L FIRST..
--------------------------------------------------------------------
read_slotsfile: ; read_slotsfile(u8)->void
.s1:
00:987c : a2 06 __ LDX #$06
00:987e : b5 53 __ LDA T1 + 0,x 
00:9880 : 9d f0 7c STA $7cf0,x ; (read_slotsfile@stack + 0)
00:9883 : ca __ __ DEX
00:9884 : 10 f8 __ BPL $987e ; (read_slotsfile.s1 + 2)
00:9886 : 38 __ __ SEC
00:9887 : a5 23 __ LDA SP + 0 
00:9889 : e9 0b __ SBC #$0b
00:988b : 85 23 __ STA SP + 0 
00:988d : b0 02 __ BCS $9891 ; (read_slotsfile.s4 + 0)
00:988f : c6 24 __ DEC SP + 1 
.s4:
00:9891 : 20 91 10 JSR $1091 
00:9894 : a9 01 __ LDA #$01
00:9896 : 85 11 __ STA P4 
00:9898 : 20 4c 2a JSR $2a4c 
00:989b : 20 cb 1b JSR $1bcb 
00:989e : aa __ __ TAX
00:989f : f0 03 __ BEQ $98a4 ; (read_slotsfile.s5 + 0)
00:98a1 : 4c b1 1f JMP $1fb1 
.s5:
00:98a4 : 85 53 __ STA T1 + 0 
00:98a6 : 85 54 __ STA T1 + 1 
00:98a8 : 85 55 __ STA T1 + 2 
00:98aa : 85 56 __ STA T1 + 3 
.l6:
00:98ac : a9 f0 __ LDA #$f0
00:98ae : 85 11 __ STA P4 
00:98b0 : a9 5d __ LDA #$5d
00:98b2 : 85 12 __ STA P5 
00:98b4 : 20 79 0f JSR $0f79 
00:98b7 : 2c 1c df BIT $df1c 
00:98ba : 30 66 __ BMI $9922 ; (read_slotsfile.l13 + 0)
.s7:
00:98bc : a5 56 __ LDA T1 + 3 
00:98be : f0 4e __ BEQ $990e ; (read_slotsfile.s10 + 0)
.s17:
00:98c0 : 30 ea __ BMI $98ac ; (read_slotsfile.l6 + 0)
.s8:
00:98c2 : 20 63 1c JSR $1c63 
00:98c5 : 20 bb 23 JSR $23bb 
00:98c8 : ad 9c 4d LDA $4d9c ; (Slot + 0)
00:98cb : c9 02 __ CMP #$02
00:98cd : b0 29 __ BCS $98f8 ; (read_slotsfile.s3 + 0)
.s9:
00:98cf : a9 43 __ LDA #$43
00:98d1 : a0 05 __ LDY #$05
00:98d3 : 91 23 __ STA (SP + 0),y 
00:98d5 : a9 1e __ LDA #$1e
00:98d7 : c8 __ __ INY
00:98d8 : 91 23 __ STA (SP + 0),y 
00:98da : 20 70 13 JSR $1370 
00:98dd : a9 63 __ LDA #$63
00:98df : a0 05 __ LDY #$05
00:98e1 : 91 23 __ STA (SP + 0),y 
00:98e3 : a9 1e __ LDA #$1e
00:98e5 : c8 __ __ INY
00:98e6 : 91 23 __ STA (SP + 0),y 
00:98e8 : 20 70 13 JSR $1370 
00:98eb : a9 ff __ LDA #$ff
00:98ed : 8d fc 7f STA $7ffc ; (sstack + 4)
00:98f0 : a9 11 __ LDA #$11
00:98f2 : 8d fd 7f STA $7ffd ; (sstack + 5)
00:98f5 : 20 27 1a JSR $1a27 
.s3:
00:98f8 : 18 __ __ CLC
00:98f9 : a5 23 __ LDA SP + 0 
00:98fb : 69 0b __ ADC #$0b
00:98fd : 85 23 __ STA SP + 0 
00:98ff : 90 02 __ BCC $9903 ; (read_slotsfile.s3 + 11)
00:9901 : e6 24 __ INC SP + 1 
00:9903 : a2 06 __ LDX #$06
00:9905 : bd f0 7c LDA $7cf0,x ; (read_slotsfile@stack + 0)
00:9908 : 95 53 __ STA T1 + 0,x 
00:990a : ca __ __ DEX
00:990b : 10 f8 __ BPL $9905 ; (read_slotsfile.s3 + 13)
00:990d : 60 __ __ RTS
.s10:
00:990e : a5 55 __ LDA T1 + 2 
00:9910 : d0 b0 __ BNE $98c2 ; (read_slotsfile.s8 + 0)
.s11:
00:9912 : a5 54 __ LDA T1 + 1 
00:9914 : c9 5d __ CMP #$5d
00:9916 : 90 94 __ BCC $98ac ; (read_slotsfile.l6 + 0)
.s18:
00:9918 : d0 a8 __ BNE $98c2 ; (read_slotsfile.s8 + 0)
.s12:
00:991a : a5 53 __ LDA T1 + 0 
00:991c : c9 f0 __ CMP #$f0
00:991e : b0 a2 __ BCS $98c2 ; (read_slotsfile.s8 + 0)
00:9920 : 90 8a __ BCC $98ac ; (read_slotsfile.l6 + 0)
.l13:
00:9922 : 20 22 10 JSR $1022 
00:9925 : a5 1b __ LDA ACCU + 0 
00:9927 : 85 57 __ STA T2 + 0 
00:9929 : a5 1c __ LDA ACCU + 1 
00:992b : 85 58 __ STA T2 + 1 
00:992d : 20 0e 11 JSR $110e 
00:9930 : a9 93 __ LDA #$93
00:9932 : 8d fe 7f STA $7ffe ; (sstack + 6)
00:9935 : a9 23 __ LDA #$23
00:9937 : 8d ff 7f STA $7fff ; (sstack + 7)
00:993a : 20 9d 1d JSR $1d9d 
00:993d : a5 53 __ LDA T1 + 0 
00:993f : a0 07 __ LDY #$07
00:9941 : 91 23 __ STA (SP + 0),y 
00:9943 : a5 54 __ LDA T1 + 1 
00:9945 : c8 __ __ INY
00:9946 : 8c 5b 49 STY $495b ; (cw + 5)
00:9949 : 91 23 __ STA (SP + 0),y 
00:994b : a5 55 __ LDA T1 + 2 
00:994d : c8 __ __ INY
00:994e : 91 23 __ STA (SP + 0),y 
00:9950 : a5 56 __ LDA T1 + 3 
00:9952 : c8 __ __ INY
00:9953 : 91 23 __ STA (SP + 0),y 
00:9955 : a9 c8 __ LDA #$c8
00:9957 : 8d 02 df STA $df02 
00:995a : a9 49 __ LDA #$49
00:995c : 8d 03 df STA $df03 
00:995f : a5 53 __ LDA T1 + 0 
00:9961 : 8d 04 df STA $df04 
00:9964 : a5 54 __ LDA T1 + 1 
00:9966 : 8d 05 df STA $df05 
00:9969 : a5 55 __ LDA T1 + 2 
00:996b : 8d 06 df STA $df06 
00:996e : a5 57 __ LDA T2 + 0 
00:9970 : 8d 07 df STA $df07 
00:9973 : 18 __ __ CLC
00:9974 : 65 53 __ ADC T1 + 0 
00:9976 : 85 53 __ STA T1 + 0 
00:9978 : a5 58 __ LDA T2 + 1 
00:997a : 8d 08 df STA $df08 
00:997d : 65 54 __ ADC T1 + 1 
00:997f : 85 54 __ STA T1 + 1 
00:9981 : a9 00 __ LDA #$00
00:9983 : 8d 5a 49 STA $495a ; (cw + 4)
00:9986 : 65 55 __ ADC T1 + 2 
00:9988 : 85 55 __ STA T1 + 2 
00:998a : a9 00 __ LDA #$00
00:998c : 8d 0a df STA $df0a 
00:998f : 65 56 __ ADC T1 + 3 
00:9991 : 85 56 __ STA T1 + 3 
00:9993 : a9 90 __ LDA #$90
00:9995 : 8d 01 df STA $df01 
00:9998 : a9 a1 __ LDA #$a1
00:999a : a0 05 __ LDY #$05
00:999c : 91 23 __ STA (SP + 0),y 
00:999e : a9 23 __ LDA #$23
00:99a0 : c8 __ __ INY
00:99a1 : 91 23 __ STA (SP + 0),y 
00:99a3 : 20 70 13 JSR $1370 
00:99a6 : 2c 1c df BIT $df1c 
00:99a9 : 10 03 __ BPL $99ae ; (read_slotsfile.l13 + 140)
00:99ab : 4c 22 1f JMP $1f22 
00:99ae : 4c bc 1e JMP $1ebc 
.s14:
00:99b1 : a9 00 __ LDA #$00
00:99b3 : 85 0f __ STA P2 
00:99b5 : 85 10 __ STA P3 
00:99b7 : a9 38 __ LDA #$38
00:99b9 : 85 11 __ STA P4 
00:99bb : a9 4d __ LDA #$4d
00:99bd : 85 0e __ STA P1 
00:99bf : a9 05 __ LDA #$05
00:99c1 : 85 12 __ STA P5 
00:99c3 : a9 9c __ LDA #$9c
00:99c5 : 85 0d __ STA P0 
00:99c7 : 20 80 21 JSR $2180 
00:99ca : a9 00 __ LDA #$00
00:99cc : 85 59 __ STA T24 + 0 
00:99ce : 85 52 __ STA T0 + 0 
00:99d0 : a9 02 __ LDA #$02
00:99d2 : 8d 9c 4d STA $4d9c ; (Slot + 0)
00:99d5 : a9 01 __ LDA #$01
00:99d7 : 85 53 __ STA T1 + 0 
.l15:
00:99d9 : a9 9d __ LDA #$9d
00:99db : a0 02 __ LDY #$02
00:99dd : 91 23 __ STA (SP + 0),y 
00:99df : a9 4d __ LDA #$4d
00:99e1 : c8 __ __ INY
00:99e2 : 91 23 __ STA (SP + 0),y 
00:99e4 : a9 9c __ LDA #$9c
00:99e6 : c8 __ __ INY
00:99e7 : 91 23 __ STA (SP + 0),y 
00:99e9 : a9 21 __ LDA #$21
00:99eb : c8 __ __ INY
00:99ec : 91 23 __ STA (SP + 0),y 
00:99ee : a5 52 __ LDA T0 + 0 
00:99f0 : c8 __ __ INY
00:99f1 : 91 23 __ STA (SP + 0),y 
00:99f3 : a9 00 __ LDA #$00
00:99f5 : c8 __ __ INY
00:99f6 : 91 23 __ STA (SP + 0),y 
00:99f8 : 20 1e 14 JSR $141e 
00:99fb : a9 9d __ LDA #$9d
00:99fd : a0 02 __ LDY #$02
00:99ff : 91 23 __ STA (SP + 0),y 
00:9a01 : a9 4e __ LDA #$4e
00:9a03 : c8 __ __ INY
00:9a04 : 91 23 __ STA (SP + 0),y 
00:9a06 : a9 a5 __ LDA #$a5
00:9a08 : c8 __ __ INY
00:9a09 : 91 23 __ STA (SP + 0),y 
00:9a0b : a9 21 __ LDA #$21
00:9a0d : c8 __ __ INY
00:9a0e : 91 23 __ STA (SP + 0),y 
00:9a10 : a5 52 __ LDA T0 + 0 
00:9a12 : c8 __ __ INY
00:9a13 : 91 23 __ STA (SP + 0),y 
00:9a15 : a9 00 __ LDA #$00
00:9a17 : c8 __ __ INY
00:9a18 : 91 23 __ STA (SP + 0),y 
00:9a1a : 20 1e 14 JSR $141e 
00:9a1d : a9 b2 __ LDA #$b2
00:9a1f : a0 02 __ LDY #$02
00:9a21 : 91 23 __ STA (SP + 0),y 
00:9a23 : a9 4e __ LDA #$4e
00:9a25 : c8 __ __ INY
00:9a26 : 91 23 __ STA (SP + 0),y 
00:9a28 : a9 ae __ LDA #$ae
00:9a2a : c8 __ __ INY
00:9a2b : 91 23 __ STA (SP + 0),y 
00:9a2d : a9 21 __ LDA #$21
00:9a2f : c8 __ __ INY
00:9a30 : 91 23 __ STA (SP + 0),y 
00:9a32 : a5 52 __ LDA T0 + 0 
00:9a34 : c8 __ __ INY
00:9a35 : 91 23 __ STA (SP + 0),y 
00:9a37 : a9 00 __ LDA #$00
00:9a39 : c8 __ __ INY
00:9a3a : 91 23 __ STA (SP + 0),y 
00:9a3c : 20 1e 14 JSR $141e 
00:9a3f : a9 e5 __ LDA #$e5
00:9a41 : a0 02 __ LDY #$02
00:9a43 : 91 23 __ STA (SP + 0),y 
00:9a45 : a9 4e __ LDA #$4e
00:9a47 : c8 __ __ INY
00:9a48 : 91 23 __ STA (SP + 0),y 
00:9a4a : a9 b7 __ LDA #$b7
00:9a4c : c8 __ __ INY
00:9a4d : 91 23 __ STA (SP + 0),y 
00:9a4f : a9 21 __ LDA #$21
00:9a51 : c8 __ __ INY
00:9a52 : 91 23 __ STA (SP + 0),y 
00:9a54 : a5 52 __ LDA T0 + 0 
00:9a56 : c8 __ __ INY
00:9a57 : 91 23 __ STA (SP + 0),y 
00:9a59 : a9 00 __ LDA #$00
00:9a5b : c8 __ __ INY
00:9a5c : 91 23 __ STA (SP + 0),y 
00:9a5e : 20 1e 14 JSR $141e 
00:9a61 : a9 35 __ LDA #$35
00:9a63 : a0 02 __ LDY #$02
00:9a65 : 91 23 __ STA (SP + 0),y 
00:9a67 : a9 4f __ LDA #$4f
00:9a69 : c8 __ __ INY
00:9a6a : 91 23 __ STA (SP + 0),y 
00:9a6c : a9 bf __ LDA #$bf
00:9a6e : c8 __ __ INY
00:9a6f : 91 23 __ STA (SP + 0),y 
00:9a71 : a9 21 __ LDA #$21
00:9a73 : c8 __ __ INY
00:9a74 : 91 23 __ STA (SP + 0),y 
00:9a76 : a5 52 __ LDA T0 + 0 
00:9a78 : c8 __ __ INY
00:9a79 : 91 23 __ STA (SP + 0),y 
00:9a7b : a9 00 __ LDA #$00
00:9a7d : c8 __ __ INY
00:9a7e : 91 23 __ STA (SP + 0),y 
00:9a80 : 20 1e 14 JSR $141e 
00:9a83 : a9 68 __ LDA #$68
00:9a85 : a0 02 __ LDY #$02
00:9a87 : 91 23 __ STA (SP + 0),y 
00:9a89 : a9 4f __ LDA #$4f
00:9a8b : c8 __ __ INY
00:9a8c : 91 23 __ STA (SP + 0),y 
00:9a8e : a9 c7 __ LDA #$c7
00:9a90 : c8 __ __ INY
00:9a91 : 91 23 __ STA (SP + 0),y 
00:9a93 : a9 21 __ LDA #$21
00:9a95 : c8 __ __ INY
00:9a96 : 91 23 __ STA (SP + 0),y 
00:9a98 : a5 52 __ LDA T0 + 0 
00:9a9a : c8 __ __ INY
00:9a9b : 91 23 __ STA (SP + 0),y 
00:9a9d : a9 00 __ LDA #$00
00:9a9f : c8 __ __ INY
00:9aa0 : 91 23 __ STA (SP + 0),y 
00:9aa2 : 20 1e 14 JSR $141e 
00:9aa5 : a9 6c __ LDA #$6c
00:9aa7 : a0 02 __ LDY #$02
00:9aa9 : 91 23 __ STA (SP + 0),y 
00:9aab : a9 50 __ LDA #$50
00:9aad : c8 __ __ INY
00:9aae : 91 23 __ STA (SP + 0),y 
00:9ab0 : a9 d3 __ LDA #$d3
00:9ab2 : c8 __ __ INY
00:9ab3 : 91 23 __ STA (SP + 0),y 
00:9ab5 : a9 21 __ LDA #$21
00:9ab7 : c8 __ __ INY
00:9ab8 : 91 23 __ STA (SP + 0),y 
00:9aba : a5 59 __ LDA T24 + 0 
00:9abc : 8d 68 50 STA $5068 ; (Slot + 716)
00:9abf : 8d 69 50 STA $5069 ; (Slot + 717)
00:9ac2 : 8d 6a 50 STA $506a ; (Slot + 718)
00:9ac5 : a5 52 __ LDA T0 + 0 
00:9ac7 : c8 __ __ INY
00:9ac8 : 91 23 __ STA (SP + 0),y 
00:9aca : a9 00 __ LDA #$00
00:9acc : 8d 6b 50 STA $506b ; (Slot + 719)
00:9acf : c8 __ __ INY
00:9ad0 : 91 23 __ STA (SP + 0),y 
00:9ad2 : 20 1e 14 JSR $141e 
00:9ad5 : a9 6c __ LDA #$6c
00:9ad7 : a0 02 __ LDY #$02
00:9ad9 : 91 23 __ STA (SP + 0),y 
00:9adb : a9 51 __ LDA #$51
00:9add : c8 __ __ INY
00:9ade : 91 23 __ STA (SP + 0),y 
00:9ae0 : a9 e0 __ LDA #$e0
00:9ae2 : c8 __ __ INY
00:9ae3 : 91 23 __ STA (SP + 0),y 
00:9ae5 : a9 21 __ LDA #$21
00:9ae7 : c8 __ __ INY
00:9ae8 : 91 23 __ STA (SP + 0),y 
00:9aea : a5 52 __ LDA T0 + 0 
00:9aec : c8 __ __ INY
00:9aed : 91 23 __ STA (SP + 0),y 
00:9aef : a9 00 __ LDA #$00
00:9af1 : c8 __ __ INY
00:9af2 : 91 23 __ STA (SP + 0),y 
00:9af4 : 20 1e 14 JSR $141e 
00:9af7 : a9 a0 __ LDA #$a0
00:9af9 : a0 02 __ LDY #$02
00:9afb : 91 23 __ STA (SP + 0),y 
00:9afd : a9 51 __ LDA #$51
00:9aff : c8 __ __ INY
00:9b00 : 91 23 __ STA (SP + 0),y 
00:9b02 : a9 ed __ LDA #$ed
00:9b04 : c8 __ __ INY
00:9b05 : 91 23 __ STA (SP + 0),y 
00:9b07 : a9 21 __ LDA #$21
00:9b09 : c8 __ __ INY
00:9b0a : 91 23 __ STA (SP + 0),y 
00:9b0c : a5 59 __ LDA T24 + 0 
00:9b0e : 8d 9f 51 STA $519f ; (Slot + 1027)
00:9b11 : a5 52 __ LDA T0 + 0 
00:9b13 : c8 __ __ INY
00:9b14 : 91 23 __ STA (SP + 0),y 
00:9b16 : a9 00 __ LDA #$00
00:9b18 : c8 __ __ INY
00:9b19 : 91 23 __ STA (SP + 0),y 
00:9b1b : 20 1e 14 JSR $141e 
00:9b1e : a9 a0 __ LDA #$a0
00:9b20 : a0 02 __ LDY #$02
00:9b22 : 91 23 __ STA (SP + 0),y 
00:9b24 : a9 52 __ LDA #$52
00:9b26 : c8 __ __ INY
00:9b27 : 91 23 __ STA (SP + 0),y 
00:9b29 : a9 00 __ LDA #$00
00:9b2b : c8 __ __ INY
00:9b2c : 91 23 __ STA (SP + 0),y 
00:9b2e : a9 22 __ LDA #$22
00:9b30 : c8 __ __ INY
00:9b31 : 91 23 __ STA (SP + 0),y 
00:9b33 : a5 52 __ LDA T0 + 0 
00:9b35 : c8 __ __ INY
00:9b36 : 91 23 __ STA (SP + 0),y 
00:9b38 : a9 00 __ LDA #$00
00:9b3a : c8 __ __ INY
00:9b3b : 91 23 __ STA (SP + 0),y 
00:9b3d : 20 1e 14 JSR $141e 
00:9b40 : a9 0d __ LDA #$0d
00:9b42 : a0 05 __ LDY #$05
00:9b44 : 91 23 __ STA (SP + 0),y 
00:9b46 : a9 22 __ LDA #$22
00:9b48 : c8 __ __ INY
00:9b49 : 91 23 __ STA (SP + 0),y 
00:9b4b : a5 59 __ LDA T24 + 0 
00:9b4d : 8d d3 52 STA $52d3 ; (Slot + 1335)
00:9b50 : a5 53 __ LDA T1 + 0 
00:9b52 : c8 __ __ INY
00:9b53 : 91 23 __ STA (SP + 0),y 
00:9b55 : a9 00 __ LDA #$00
00:9b57 : 8d 5a 49 STA $495a ; (cw + 4)
00:9b5a : c8 __ __ INY
00:9b5b : 8c 5b 49 STY $495b ; (cw + 5)
00:9b5e : 91 23 __ STA (SP + 0),y 
00:9b60 : 20 70 13 JSR $1370 
00:9b63 : a5 59 __ LDA T24 + 0 
00:9b65 : 20 1f 22 JSR $221f 
00:9b68 : e6 52 __ INC T0 + 0 
00:9b6a : e6 53 __ INC T1 + 0 
00:9b6c : e6 59 __ INC T24 + 0 
00:9b6e : a5 59 __ LDA T24 + 0 
00:9b70 : c9 12 __ CMP #$12
00:9b72 : b0 03 __ BCS $9b77 ; (read_slotsfile.s16 + 0)
00:9b74 : 4c d9 1f JMP $1fd9 
.s16:
00:9b77 : 20 5c 22 JSR $225c 
00:9b7a : 20 63 1c JSR $1c63 
00:9b7d : 4c f8 1e JMP $1ef8 
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
.s4:
00:9b80 : a5 0f __ LDA P2 
00:9b82 : a6 12 __ LDX P5 
00:9b84 : f0 0c __ BEQ $9b92 ; (memset.s4 + 18)
00:9b86 : a0 00 __ LDY #$00
00:9b88 : 91 0d __ STA (P0),y 
00:9b8a : c8 __ __ INY
00:9b8b : d0 fb __ BNE $9b88 ; (memset.s4 + 8)
00:9b8d : e6 0e __ INC P1 
00:9b8f : ca __ __ DEX
00:9b90 : d0 f6 __ BNE $9b88 ; (memset.s4 + 8)
00:9b92 : a4 11 __ LDY P4 
00:9b94 : f0 05 __ BEQ $9b9b ; (memset.s3 + 0)
00:9b96 : 88 __ __ DEY
00:9b97 : 91 0d __ STA (P0),y 
00:9b99 : d0 fb __ BNE $9b96 ; (memset.s4 + 22)
.s3:
00:9b9b : 60 __ __ RTS
--------------------------------------------------------------------
00:9b9c : __ __ __ BYT 70 41 54 48 20 25 32 55 00                      : pATH %2U.
--------------------------------------------------------------------
00:9ba5 : __ __ __ BYT 6d 45 4e 55 20 25 32 55 00                      : mENU %2U.
--------------------------------------------------------------------
00:9bae : __ __ __ BYT 66 49 4c 45 20 25 32 55 00                      : fILE %2U.
--------------------------------------------------------------------
00:9bb7 : __ __ __ BYT 63 4d 44 20 25 32 55 00                         : cMD %2U.
--------------------------------------------------------------------
00:9bbf : __ __ __ BYT 72 65 75 20 25 32 55 00                         : reu %2U.
--------------------------------------------------------------------
00:9bc7 : __ __ __ BYT 72 65 75 70 41 54 48 20 25 32 55 00             : reupATH %2U.
--------------------------------------------------------------------
00:9bd3 : __ __ __ BYT 69 4d 47 61 70 41 54 48 20 25 32 55 00          : iMGapATH %2U.
--------------------------------------------------------------------
00:9be0 : __ __ __ BYT 69 4d 47 61 66 49 4c 45 20 25 32 55 00          : iMGafILE %2U.
--------------------------------------------------------------------
00:9bed : __ __ __ BYT 69 4d 47 62 70 41 54 48 20 25 32 55 00          : iMGbpATH %2U.
--------------------------------------------------------------------
00:9bfa : __ __ __ BYT 6f 4e 00                                        : oN.
--------------------------------------------------------------------
00:9bfd : __ __ __ BYT 6e 4f 00                                        : nO.
--------------------------------------------------------------------
00:9c00 : __ __ __ BYT 69 4d 47 62 66 49 4c 45 20 25 32 55 00          : iMGbfILE %2U.
--------------------------------------------------------------------
00:9c0d : __ __ __ BYT 63 52 45 41 54 49 4e 47 20 53 4c 4f 54 20 25 32 : cREATING SLOT %2
00:9c1d : __ __ __ BYT 44 00                                           : D.
--------------------------------------------------------------------
save_slot_to_reu: ; save_slot_to_reu(u8)->void
.s4:
00:9c1f : c9 12 __ CMP #$12
00:9c21 : b0 38 __ BCS $9c5b ; (save_slot_to_reu.s3 + 0)
.s5:
00:9c23 : a2 9c __ LDX #$9c
00:9c25 : 8e 02 df STX $df02 
00:9c28 : a2 4d __ LDX #$4d
00:9c2a : 8e 03 df STX $df03 
00:9c2d : a2 38 __ LDX #$38
00:9c2f : 86 1b __ STX ACCU + 0 
00:9c31 : a2 05 __ LDX #$05
00:9c33 : 86 1c __ STX ACCU + 1 
00:9c35 : 20 9b 26 JSR $269b 
00:9c38 : a5 1b __ LDA ACCU + 0 
00:9c3a : 8d 04 df STA $df04 
00:9c3d : a5 1c __ LDA ACCU + 1 
00:9c3f : 8d 05 df STA $df05 
00:9c42 : a9 00 __ LDA #$00
00:9c44 : 8d 06 df STA $df06 
00:9c47 : a9 38 __ LDA #$38
00:9c49 : 8d 07 df STA $df07 
00:9c4c : a9 05 __ LDA #$05
00:9c4e : 8d 08 df STA $df08 
00:9c51 : a9 00 __ LDA #$00
00:9c53 : 8d 0a df STA $df0a 
00:9c56 : a9 90 __ LDA #$90
00:9c58 : 8d 01 df STA $df01 
.s3:
00:9c5b : 60 __ __ RTS
--------------------------------------------------------------------
write_slotsfile: ; write_slotsfile(u8)->void
.s1:
00:9c5c : 38 __ __ SEC
00:9c5d : a5 23 __ LDA SP + 0 
00:9c5f : e9 0b __ SBC #$0b
00:9c61 : 85 23 __ STA SP + 0 
00:9c63 : b0 02 __ BCS $9c67 ; (write_slotsfile.s4 + 0)
00:9c65 : c6 24 __ DEC SP + 1 
.s4:
00:9c67 : 20 91 10 JSR $1091 
00:9c6a : a9 c2 __ LDA #$c2
00:9c6c : 85 11 __ STA P4 
00:9c6e : a9 2a __ LDA #$2a
00:9c70 : 85 12 __ STA P5 
00:9c72 : 20 8c 1c JSR $1c8c 
00:9c75 : a9 06 __ LDA #$06
00:9c77 : 85 11 __ STA P4 
00:9c79 : 20 4c 2a JSR $2a4c 
00:9c7c : a9 00 __ LDA #$00
00:9c7e : 85 4c __ STA T1 + 0 
00:9c80 : 85 4d __ STA T1 + 1 
00:9c82 : 85 4e __ STA T1 + 2 
00:9c84 : 85 4f __ STA T1 + 3 
00:9c86 : a9 f4 __ LDA #$f4
00:9c88 : 85 50 __ STA T2 + 0 
00:9c8a : a9 01 __ LDA #$01
00:9c8c : 85 51 __ STA T2 + 1 
.l5:
00:9c8e : a9 6b __ LDA #$6b
00:9c90 : a0 05 __ LDY #$05
00:9c92 : 91 23 __ STA (SP + 0),y 
00:9c94 : a9 23 __ LDA #$23
00:9c96 : c8 __ __ INY
00:9c97 : 91 23 __ STA (SP + 0),y 
00:9c99 : a5 4c __ LDA T1 + 0 
00:9c9b : c8 __ __ INY
00:9c9c : 91 23 __ STA (SP + 0),y 
00:9c9e : a5 4d __ LDA T1 + 1 
00:9ca0 : c8 __ __ INY
00:9ca1 : 8c 5b 49 STY $495b ; (cw + 5)
00:9ca4 : 91 23 __ STA (SP + 0),y 
00:9ca6 : a9 00 __ LDA #$00
00:9ca8 : c8 __ __ INY
00:9ca9 : 91 23 __ STA (SP + 0),y 
00:9cab : 8d 5a 49 STA $495a ; (cw + 4)
00:9cae : c8 __ __ INY
00:9caf : 91 23 __ STA (SP + 0),y 
00:9cb1 : 20 70 13 JSR $1370 
00:9cb4 : a9 00 __ LDA #$00
00:9cb6 : a2 fa __ LDX #$fa
.l7:
00:9cb8 : ca __ __ DEX
00:9cb9 : 9d 22 7d STA $7d22,x ; (save_buffer + 0)
00:9cbc : 9d 1c 7e STA $7e1c,x ; (save_buffer + 250)
00:9cbf : d0 f7 __ BNE $9cb8 ; (write_slotsfile.l7 + 0)
.s6:
00:9cc1 : 38 __ __ SEC
00:9cc2 : a9 f0 __ LDA #$f0
00:9cc4 : e5 4c __ SBC T1 + 0 
00:9cc6 : aa __ __ TAX
00:9cc7 : a9 5d __ LDA #$5d
00:9cc9 : e5 4d __ SBC T1 + 1 
00:9ccb : a8 __ __ TAY
00:9ccc : a9 00 __ LDA #$00
00:9cce : e5 4e __ SBC T1 + 2 
00:9cd0 : 85 1d __ STA ACCU + 2 
00:9cd2 : a9 00 __ LDA #$00
00:9cd4 : e5 4f __ SBC T1 + 3 
00:9cd6 : 38 __ __ SEC
00:9cd7 : d0 0a __ BNE $9ce3 ; (write_slotsfile.s17 + 0)
.s14:
00:9cd9 : a5 1d __ LDA ACCU + 2 
00:9cdb : d0 06 __ BNE $9ce3 ; (write_slotsfile.s17 + 0)
.s15:
00:9cdd : c0 01 __ CPY #$01
00:9cdf : d0 02 __ BNE $9ce3 ; (write_slotsfile.s17 + 0)
.s16:
00:9ce1 : e0 f4 __ CPX #$f4
.s17:
00:9ce3 : b0 04 __ BCS $9ce9 ; (write_slotsfile.s8 + 0)
.s13:
00:9ce5 : 86 50 __ STX T2 + 0 
00:9ce7 : 84 51 __ STY T2 + 1 
.s8:
00:9ce9 : a5 50 __ LDA T2 + 0 
00:9ceb : 85 13 __ STA P6 
00:9ced : 8d 07 df STA $df07 
00:9cf0 : a5 51 __ LDA T2 + 1 
00:9cf2 : 85 14 __ STA P7 
00:9cf4 : 8d 08 df STA $df08 
00:9cf7 : a9 22 __ LDA #$22
00:9cf9 : 85 11 __ STA P4 
00:9cfb : 8d 02 df STA $df02 
00:9cfe : a9 7d __ LDA #$7d
00:9d00 : 85 12 __ STA P5 
00:9d02 : 8d 03 df STA $df03 
00:9d05 : a5 4c __ LDA T1 + 0 
00:9d07 : 8d 04 df STA $df04 
00:9d0a : a5 4d __ LDA T1 + 1 
00:9d0c : 8d 05 df STA $df05 
00:9d0f : a9 00 __ LDA #$00
00:9d11 : 8d 06 df STA $df06 
00:9d14 : 8d 0a df STA $df0a 
00:9d17 : a9 91 __ LDA #$91
00:9d19 : 8d 01 df STA $df01 
00:9d1c : 20 1c 1d JSR $1d1c 
00:9d1f : a9 85 __ LDA #$85
00:9d21 : 8d fe 7f STA $7ffe ; (sstack + 6)
00:9d24 : a9 23 __ LDA #$23
00:9d26 : 8d ff 7f STA $7fff ; (sstack + 7)
00:9d29 : 20 9d 1d JSR $1d9d 
00:9d2c : 18 __ __ CLC
00:9d2d : a5 4c __ LDA T1 + 0 
00:9d2f : 69 f4 __ ADC #$f4
00:9d31 : 85 4c __ STA T1 + 0 
00:9d33 : a5 4d __ LDA T1 + 1 
00:9d35 : 69 01 __ ADC #$01
00:9d37 : 85 4d __ STA T1 + 1 
00:9d39 : a5 4e __ LDA T1 + 2 
00:9d3b : 69 00 __ ADC #$00
00:9d3d : 85 4e __ STA T1 + 2 
00:9d3f : a5 4f __ LDA T1 + 3 
00:9d41 : 69 00 __ ADC #$00
00:9d43 : d0 17 __ BNE $9d5c ; (write_slotsfile.s9 + 0)
.s10:
00:9d45 : 85 4f __ STA T1 + 3 
00:9d47 : a5 4e __ LDA T1 + 2 
00:9d49 : d0 11 __ BNE $9d5c ; (write_slotsfile.s9 + 0)
.s11:
00:9d4b : a5 4d __ LDA T1 + 1 
00:9d4d : c9 5d __ CMP #$5d
00:9d4f : b0 03 __ BCS $9d54 ; (write_slotsfile.s18 + 0)
00:9d51 : 4c 8e 22 JMP $228e 
.s18:
00:9d54 : d0 06 __ BNE $9d5c ; (write_slotsfile.s9 + 0)
.s12:
00:9d56 : a5 4c __ LDA T1 + 0 
00:9d58 : c9 f0 __ CMP #$f0
00:9d5a : 90 f5 __ BCC $9d51 ; (write_slotsfile.s11 + 6)
.s9:
00:9d5c : 20 63 1c JSR $1c63 
.s3:
00:9d5f : 18 __ __ CLC
00:9d60 : a5 23 __ LDA SP + 0 
00:9d62 : 69 0b __ ADC #$0b
00:9d64 : 85 23 __ STA SP + 0 
00:9d66 : 90 02 __ BCC $9d6a ; (write_slotsfile.s3 + 11)
00:9d68 : e6 24 __ INC SP + 1 
00:9d6a : 60 __ __ RTS
--------------------------------------------------------------------
00:9d6b : __ __ __ BYT 77 52 49 54 49 4e 47 20 53 4c 4f 54 20 44 41 54 : wRITING SLOT DAT
00:9d7b : __ __ __ BYT 41 20 41 54 20 25 4c 55 2e 00                   : A AT %LU..
--------------------------------------------------------------------
00:9d85 : __ __ __ BYT 57 52 49 54 49 4e 47 20 53 4c 4f 54 53 00       : WRITING SLOTS.
--------------------------------------------------------------------
00:9d93 : __ __ __ BYT 52 45 41 44 49 4e 47 20 53 4c 4f 54 53 00       : READING SLOTS.
--------------------------------------------------------------------
00:9da1 : __ __ __ BYT 72 45 41 44 49 4e 47 20 53 4c 4f 54 20 44 41 54 : rEADING SLOT DAT
00:9db1 : __ __ __ BYT 41 20 54 4f 20 25 4c 55 2e 00                   : A TO %LU..
--------------------------------------------------------------------
get_slot_from_reu: ; get_slot_from_reu(u8)->void
.s4:
00:9dbb : a9 9c __ LDA #$9c
00:9dbd : 8d 02 df STA $df02 
00:9dc0 : a9 4d __ LDA #$4d
00:9dc2 : 8d 03 df STA $df03 
00:9dc5 : a9 00 __ LDA #$00
00:9dc7 : 8d 04 df STA $df04 
00:9dca : 8d 05 df STA $df05 
00:9dcd : 8d 06 df STA $df06 
00:9dd0 : a9 38 __ LDA #$38
00:9dd2 : 8d 07 df STA $df07 
00:9dd5 : a9 05 __ LDA #$05
00:9dd7 : 8d 08 df STA $df08 
00:9dda : a9 00 __ LDA #$00
00:9ddc : 8d 0a df STA $df0a 
00:9ddf : a9 91 __ LDA #$91
00:9de1 : 8d 01 df STA $df01 
.s3:
00:9de4 : 60 __ __ RTS
--------------------------------------------------------------------
uii_parse_deviceinfo: ; uii_parse_deviceinfo()->u8
.s4:
00:9de5 : a9 00 __ LDA #$00
00:9de7 : 85 10 __ STA P3 
00:9de9 : 8d f6 7f STA $7ff6 ; (cmd + 0)
00:9dec : a9 04 __ LDA #$04
00:9dee : 8d a6 2a STA $2aa6 
00:9df1 : a9 02 __ LDA #$02
00:9df3 : 85 0f __ STA P2 
00:9df5 : a9 29 __ LDA #$29
00:9df7 : 8d f7 7f STA $7ff7 ; (cmd + 1)
00:9dfa : a9 f6 __ LDA #$f6
00:9dfc : 85 0d __ STA P0 
00:9dfe : a9 7f __ LDA #$7f
00:9e00 : 85 0e __ STA P1 
00:9e02 : 20 a6 0f JSR $0fa6 
00:9e05 : 20 22 10 JSR $1022 
00:9e08 : 20 60 10 JSR $1060 
00:9e0b : 20 0e 11 JSR $110e 
00:9e0e : ad c9 4b LDA $4bc9 ; (uii_status + 0)
00:9e11 : c9 30 __ CMP #$30
00:9e13 : d0 0c __ BNE $9e21 ; (uii_parse_deviceinfo.s7 + 0)
.s5:
00:9e15 : ad ca 4b LDA $4bca ; (uii_status + 1)
00:9e18 : c9 30 __ CMP #$30
00:9e1a : d0 05 __ BNE $9e21 ; (uii_parse_deviceinfo.s7 + 0)
.s6:
00:9e1c : ad c8 49 LDA $49c8 ; (uii_data + 0)
00:9e1f : d0 05 __ BNE $9e26 ; (uii_parse_deviceinfo.s8 + 0)
.s7:
00:9e21 : a9 00 __ LDA #$00
.s3:
00:9e23 : 85 1b __ STA ACCU + 0 
00:9e25 : 60 __ __ RTS
.s8:
00:9e26 : ac c9 49 LDY $49c9 ; (uii_data + 1)
00:9e29 : c0 0f __ CPY #$0f
00:9e2b : 90 07 __ BCC $9e34 ; (uii_parse_deviceinfo.s15 + 0)
.s9:
00:9e2d : a9 02 __ LDA #$02
.s10:
00:9e2f : 85 1b __ STA ACCU + 0 
00:9e31 : 98 __ __ TYA
00:9e32 : b0 3a __ BCS $9e6e ; (uii_parse_deviceinfo.s18 + 0)
.s15:
00:9e34 : 8c d5 52 STY $52d5 ; (uii_devinfo + 1)
00:9e37 : a9 01 __ LDA #$01
00:9e39 : 8d d4 52 STA $52d4 ; (uii_devinfo + 0)
00:9e3c : ad cb 49 LDA $49cb ; (uii_data + 3)
00:9e3f : 8d d6 52 STA $52d6 ; (uii_devinfo + 2)
00:9e42 : ad ca 49 LDA $49ca ; (uii_data + 2)
00:9e45 : 8d d7 52 STA $52d7 ; (uii_devinfo + 3)
00:9e48 : ac cc 49 LDY $49cc ; (uii_data + 4)
00:9e4b : c0 0f __ CPY #$0f
00:9e4d : 90 04 __ BCC $9e53 ; (uii_parse_deviceinfo.s17 + 0)
.s16:
00:9e4f : a9 05 __ LDA #$05
00:9e51 : b0 dc __ BCS $9e2f ; (uii_parse_deviceinfo.s10 + 0)
.s17:
00:9e53 : 8c d9 52 STY $52d9 ; (uii_devinfo + 5)
00:9e56 : a9 01 __ LDA #$01
00:9e58 : 8d d8 52 STA $52d8 ; (uii_devinfo + 4)
00:9e5b : ad ce 49 LDA $49ce ; (uii_data + 6)
00:9e5e : 8d da 52 STA $52da ; (uii_devinfo + 6)
00:9e61 : ad cd 49 LDA $49cd ; (uii_data + 5)
00:9e64 : 8d db 52 STA $52db ; (uii_devinfo + 7)
00:9e67 : a9 08 __ LDA #$08
00:9e69 : 85 1b __ STA ACCU + 0 
00:9e6b : ad cf 49 LDA $49cf ; (uii_data + 7)
.s18:
00:9e6e : c9 0f __ CMP #$0f
00:9e70 : d0 20 __ BNE $9e92 ; (uii_parse_deviceinfo.s11 + 0)
.s14:
00:9e72 : a9 01 __ LDA #$01
00:9e74 : 8d dc 52 STA $52dc ; (uii_devinfo + 8)
00:9e77 : a9 0f __ LDA #$0f
00:9e79 : 8d dd 52 STA $52dd ; (uii_devinfo + 9)
00:9e7c : a6 1b __ LDX ACCU + 0 
00:9e7e : bd c9 49 LDA $49c9,x ; (uii_data + 1)
00:9e81 : 8d de 52 STA $52de ; (uii_devinfo + 10)
00:9e84 : bd c8 49 LDA $49c8,x ; (uii_data + 0)
00:9e87 : 8d df 52 STA $52df ; (uii_devinfo + 11)
00:9e8a : bd ca 49 LDA $49ca,x ; (uii_data + 2)
00:9e8d : e8 __ __ INX
00:9e8e : e8 __ __ INX
00:9e8f : e8 __ __ INX
00:9e90 : 86 1b __ STX ACCU + 0 
.s11:
00:9e92 : c9 50 __ CMP #$50
00:9e94 : d0 18 __ BNE $9eae ; (uii_parse_deviceinfo.s12 + 0)
.s13:
00:9e96 : a9 01 __ LDA #$01
00:9e98 : 8d e0 52 STA $52e0 ; (uii_devinfo + 12)
00:9e9b : a9 50 __ LDA #$50
00:9e9d : 8d e1 52 STA $52e1 ; (uii_devinfo + 13)
00:9ea0 : a6 1b __ LDX ACCU + 0 
00:9ea2 : bd c9 49 LDA $49c9,x ; (uii_data + 1)
00:9ea5 : 8d e2 52 STA $52e2 ; (uii_devinfo + 14)
00:9ea8 : bd c8 49 LDA $49c8,x ; (uii_data + 0)
00:9eab : 8d e3 52 STA $52e3 ; (uii_devinfo + 15)
.s12:
00:9eae : a9 01 __ LDA #$01
00:9eb0 : 4c 23 24 JMP $2423 
--------------------------------------------------------------------
00:9eb3 : __ __ __ BYT 67 45 54 54 49 4e 47 20 44 45 56 49 43 45 20 49 : gETTING DEVICE I
00:9ec3 : __ __ __ BYT 4e 46 4f 20 46 41 49 4c 53 2e 00                : NFO FAILS..
--------------------------------------------------------------------
00:9ece : __ __ __ BYT 0a 72 45 43 4f 47 4e 49 53 45 44 20 75 4c 54 49 : .rECOGNISED uLTI
00:9ede : __ __ __ BYT 4d 41 54 45 20 44 45 56 49 43 45 53 3a 0a 00    : MATE DEVICES:..
--------------------------------------------------------------------
00:9eed : __ __ __ BYT 6f 46 46 00                                     : oFF.
--------------------------------------------------------------------
00:9ef1 : __ __ __ BYT 31 35 34 31 00                                  : 1541.
--------------------------------------------------------------------
00:9ef6 : __ __ __ BYT 31 35 37 31 00                                  : 1571.
--------------------------------------------------------------------
00:9efb : __ __ __ BYT 31 35 38 31 00                                  : 1581.
--------------------------------------------------------------------
00:9f00 : __ __ __ BYT 64 52 49 56 45 20 61 3a 20 69 64 20 25 32 44 20 : dRIVE a: id %2D 
00:9f10 : __ __ __ BYT 70 4f 57 20 25 53 2c 20 25 53 0a 00             : pOW %S, %S..
--------------------------------------------------------------------
00:9f1c : __ __ __ BYT 64 52 49 56 45 20 62 3a 20 69 64 20 25 32 44 20 : dRIVE b: id %2D 
00:9f2c : __ __ __ BYT 70 4f 57 20 25 53 2c 20 25 53 0a 00             : pOW %S, %S..
--------------------------------------------------------------------
00:9f38 : __ __ __ BYT 73 4f 46 54 69 65 63 3a 20 69 64 20 25 32 44 20 : sOFTiec: id %2D 
00:9f48 : __ __ __ BYT 70 4f 57 20 25 53 0a 00                         : pOW %S..
--------------------------------------------------------------------
00:9f50 : __ __ __ BYT 70 52 49 4e 54 45 52 3a 20 69 64 20 25 32 44 20 : pRINTER: id %2D 
00:9f60 : __ __ __ BYT 70 4f 57 20 25 53 0a 00                         : pOW %S..
--------------------------------------------------------------------
00:9f68 : __ __ __ BYT 69 64 53 20 4e 45 45 44 49 4e 47 20 4d 41 4e 55 : idS NEEDING MANU
00:9f78 : __ __ __ BYT 41 4c 20 50 4f 57 45 52 20 53 57 49 54 43 48 49 : AL POWER SWITCHI
00:9f88 : __ __ __ BYT 4e 47 3a 20 25 53 0a 00                         : NG: %S..
--------------------------------------------------------------------
CheckActiveIECdevices: ; CheckActiveIECdevices()->u8
.s4:
00:9f90 : a9 00 __ LDA #$00
00:9f92 : a2 17 __ LDX #$17
.l5:
00:9f94 : ca __ __ DEX
00:9f95 : 9d e4 52 STA $52e4,x ; (iec_devices + 0)
00:9f98 : d0 fa __ BNE $9f94 ; (CheckActiveIECdevices.l5 + 0)
.s6:
00:9f9a : 20 e5 23 JSR $23e5 
00:9f9d : a9 00 __ LDA #$00
00:9f9f : 85 50 __ STA T5 + 0 
00:9fa1 : a5 1b __ LDA ACCU + 0 
00:9fa3 : d0 0d __ BNE $9fb2 ; (CheckActiveIECdevices.s8 + 0)
.s7:
00:9fa5 : a9 b3 __ LDA #$b3
00:9fa7 : 8d fc 7f STA $7ffc ; (sstack + 4)
00:9faa : a9 24 __ LDA #$24
00:9fac : 8d fd 7f STA $7ffd ; (sstack + 5)
00:9faf : 20 27 1a JSR $1a27 
.s8:
00:9fb2 : a9 00 __ LDA #$00
00:9fb4 : 85 4d __ STA T1 + 0 
00:9fb6 : 85 4c __ STA T0 + 0 
00:9fb8 : a9 08 __ LDA #$08
00:9fba : 85 4e __ STA T2 + 0 
.l9:
00:9fbc : a5 4e __ LDA T2 + 0 
00:9fbe : 4c c3 25 JMP $25c3 
.s15:
00:9fc1 : a9 04 __ LDA #$04
.l10:
00:9fc3 : 85 4f __ STA T3 + 0 
00:9fc5 : 20 08 26 JSR $2608 
00:9fc8 : aa __ __ TAX
00:9fc9 : d0 2c __ BNE $9ff7 ; (CheckActiveIECdevices.s18 + 0)
.s11:
00:9fcb : a5 4f __ LDA T3 + 0 
00:9fcd : 20 3b 26 JSR $263b 
00:9fd0 : aa __ __ TAX
00:9fd1 : f0 0f __ BEQ $9fe2 ; (CheckActiveIECdevices.s12 + 0)
.s16:
00:9fd3 : a9 01 __ LDA #$01
00:9fd5 : a6 4d __ LDX T1 + 0 
00:9fd7 : 9d e4 52 STA $52e4,x ; (iec_devices + 0)
00:9fda : a5 50 __ LDA T5 + 0 
00:9fdc : f0 02 __ BEQ $9fe0 ; (CheckActiveIECdevices.s20 + 0)
.s21:
00:9fde : a9 01 __ LDA #$01
.s20:
00:9fe0 : 85 4c __ STA T0 + 0 
.s12:
00:9fe2 : e6 50 __ INC T5 + 0 
00:9fe4 : a5 50 __ LDA T5 + 0 
00:9fe6 : c9 17 __ CMP #$17
00:9fe8 : b0 0a __ BCS $9ff4 ; (CheckActiveIECdevices.s13 + 0)
.s14:
00:9fea : e6 4d __ INC T1 + 0 
00:9fec : e6 4e __ INC T2 + 0 
00:9fee : c9 16 __ CMP #$16
00:9ff0 : f0 cf __ BEQ $9fc1 ; (CheckActiveIECdevices.s15 + 0)
00:9ff2 : d0 c8 __ BNE $9fbc ; (CheckActiveIECdevices.l9 + 0)
.s13:
00:9ff4 : a5 4c __ LDA T0 + 0 
.s3:
00:9ff6 : 60 __ __ RTS
.s18:
00:9ff7 : c9 02 __ CMP #$02
00:9ff9 : 90 e7 __ BCC $9fe2 ; (CheckActiveIECdevices.s12 + 0)
.s19:
00:9ffb : a6 4d __ LDX T1 + 0 
00:9ffd : 9d e4 52 STA $52e4,x ; (iec_devices + 0)
00:a000 : c9 03 __ CMP #$03
00:a002 : f0 da __ BEQ $9fde ; (CheckActiveIECdevices.s21 + 0)
.s17:
00:a004 : a9 00 __ LDA #$00
00:a006 : f0 d8 __ BEQ $9fe0 ; (CheckActiveIECdevices.s20 + 0)
--------------------------------------------------------------------
CheckIfUltimateOnID: ; CheckIfUltimateOnID(u8)->u8
.s4:
00:a008 : 85 1b __ STA ACCU + 0 
00:a00a : a9 00 __ LDA #$00
00:a00c : aa __ __ TAX
.l5:
00:a00d : 0a __ __ ASL
00:a00e : 0a __ __ ASL
00:a00f : a8 __ __ TAY
00:a010 : a5 1b __ LDA ACCU + 0 
00:a012 : d9 d7 52 CMP $52d7,y ; (uii_devinfo + 3)
00:a015 : f0 09 __ BEQ $a020 ; (CheckIfUltimateOnID.s8 + 0)
.s6:
00:a017 : e8 __ __ INX
00:a018 : 8a __ __ TXA
00:a019 : e0 04 __ CPX #$04
00:a01b : 90 f0 __ BCC $a00d ; (CheckIfUltimateOnID.l5 + 0)
.s7:
00:a01d : a9 00 __ LDA #$00
.s3:
00:a01f : 60 __ __ RTS
.s8:
00:a020 : b9 d5 52 LDA $52d5,y ; (uii_devinfo + 1)
00:a023 : c9 0f __ CMP #$0f
00:a025 : a9 00 __ LDA #$00
00:a027 : b0 02 __ BCS $a02b ; (CheckIfUltimateOnID.s10 + 0)
.s11:
00:a029 : a9 04 __ LDA #$04
.s10:
00:a02b : 85 1b __ STA ACCU + 0 
00:a02d : b9 d6 52 LDA $52d6,y ; (uii_devinfo + 2)
00:a030 : f0 04 __ BEQ $a036 ; (CheckIfUltimateOnID.s12 + 0)
.s13:
00:a032 : a9 03 __ LDA #$03
00:a034 : d0 02 __ BNE $a038 ; (CheckIfUltimateOnID.s14 + 0)
.s12:
00:a036 : a9 01 __ LDA #$01
.s14:
00:a038 : 05 1b __ ORA ACCU + 0 
00:a03a : 60 __ __ RTS
--------------------------------------------------------------------
iec_present: ; iec_present(u8)->u8
.s4:
00:a03b : 85 0d __ STA P0 
00:a03d : a5 0d __ LDA P0 
00:a03f : a0 00 __ LDY #$00
00:a041 : 84 90 __ STY $90 
00:a043 : 20 b1 ff JSR $ffb1 
00:a046 : a9 ff __ LDA #$ff
00:a048 : 20 93 ff JSR $ff93 
00:a04b : a5 90 __ LDA $90 
00:a04d : 10 08 __ BPL $a057 ; (iec_present.s4 + 28)
00:a04f : 20 ae ff JSR $ffae 
00:a052 : a9 00 __ LDA #$00
00:a054 : 85 1b __ STA ACCU + 0 
00:a056 : 60 __ __ RTS
00:a057 : 20 ae ff JSR $ffae 
00:a05a : a9 01 __ LDA #$01
00:a05c : 85 1b __ STA ACCU + 0 
.s3:
00:a05e : a5 1b __ LDA ACCU + 0 
00:a060 : 60 __ __ RTS
--------------------------------------------------------------------
00:a061 : __ __ __ BYT 79 45 53 00                                     : yES.
--------------------------------------------------------------------
00:a065 : __ __ __ BYT 61 43 54 49 56 45 20 69 65 63 20 69 64 53 3a 20 : aCTIVE iec idS: 
00:a075 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
00:a076 : __ __ __ BYT 25 30 32 44 20 00                               : %02D .
--------------------------------------------------------------------
00:a07c : __ __ __ BYT 62 41 43 4b 20 49 4e 20 4d 41 49 4e 20 72 61 6d : bACK IN MAIN ram
00:a08c : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
00:a08d : __ __ __ BYT 67 4f 49 4e 47 20 54 4f 20 45 58 49 54 00       : gOING TO EXIT.
--------------------------------------------------------------------
mul16by8: ; mul16by8
00:a09b : 4a __ __ LSR
00:a09c : f0 2e __ BEQ $a0cc ; (mul16by8 + 49)
00:a09e : a2 00 __ LDX #$00
00:a0a0 : a0 00 __ LDY #$00
00:a0a2 : 90 13 __ BCC $a0b7 ; (mul16by8 + 28)
00:a0a4 : a4 1b __ LDY ACCU + 0 
00:a0a6 : a6 1c __ LDX ACCU + 1 
00:a0a8 : b0 0d __ BCS $a0b7 ; (mul16by8 + 28)
00:a0aa : 85 02 __ STA $02 
00:a0ac : 18 __ __ CLC
00:a0ad : 98 __ __ TYA
00:a0ae : 65 1b __ ADC ACCU + 0 
00:a0b0 : a8 __ __ TAY
00:a0b1 : 8a __ __ TXA
00:a0b2 : 65 1c __ ADC ACCU + 1 
00:a0b4 : aa __ __ TAX
00:a0b5 : a5 02 __ LDA $02 
00:a0b7 : 06 1b __ ASL ACCU + 0 
00:a0b9 : 26 1c __ ROL ACCU + 1 
00:a0bb : 4a __ __ LSR
00:a0bc : 90 f9 __ BCC $a0b7 ; (mul16by8 + 28)
00:a0be : d0 ea __ BNE $a0aa ; (mul16by8 + 15)
00:a0c0 : 18 __ __ CLC
00:a0c1 : 98 __ __ TYA
00:a0c2 : 65 1b __ ADC ACCU + 0 
00:a0c4 : 85 1b __ STA ACCU + 0 
00:a0c6 : 8a __ __ TXA
00:a0c7 : 65 1c __ ADC ACCU + 1 
00:a0c9 : 85 1c __ STA ACCU + 1 
00:a0cb : 60 __ __ RTS
00:a0cc : b0 04 __ BCS $a0d2 ; (mul16by8 + 55)
00:a0ce : 85 1b __ STA ACCU + 0 
00:a0d0 : 85 1c __ STA ACCU + 1 
00:a0d2 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
00:a0d3 : a5 1c __ LDA ACCU + 1 
00:a0d5 : d0 31 __ BNE $a108 ; (divmod + 53)
00:a0d7 : a5 04 __ LDA WORK + 1 
00:a0d9 : d0 1e __ BNE $a0f9 ; (divmod + 38)
00:a0db : 85 06 __ STA WORK + 3 
00:a0dd : a2 04 __ LDX #$04
00:a0df : 06 1b __ ASL ACCU + 0 
00:a0e1 : 2a __ __ ROL
00:a0e2 : c5 03 __ CMP WORK + 0 
00:a0e4 : 90 02 __ BCC $a0e8 ; (divmod + 21)
00:a0e6 : e5 03 __ SBC WORK + 0 
00:a0e8 : 26 1b __ ROL ACCU + 0 
00:a0ea : 2a __ __ ROL
00:a0eb : c5 03 __ CMP WORK + 0 
00:a0ed : 90 02 __ BCC $a0f1 ; (divmod + 30)
00:a0ef : e5 03 __ SBC WORK + 0 
00:a0f1 : 26 1b __ ROL ACCU + 0 
00:a0f3 : ca __ __ DEX
00:a0f4 : d0 eb __ BNE $a0e1 ; (divmod + 14)
00:a0f6 : 85 05 __ STA WORK + 2 
00:a0f8 : 60 __ __ RTS
00:a0f9 : a5 1b __ LDA ACCU + 0 
00:a0fb : 85 05 __ STA WORK + 2 
00:a0fd : a5 1c __ LDA ACCU + 1 
00:a0ff : 85 06 __ STA WORK + 3 
00:a101 : a9 00 __ LDA #$00
00:a103 : 85 1b __ STA ACCU + 0 
00:a105 : 85 1c __ STA ACCU + 1 
00:a107 : 60 __ __ RTS
00:a108 : a5 04 __ LDA WORK + 1 
00:a10a : d0 1f __ BNE $a12b ; (divmod + 88)
00:a10c : a5 03 __ LDA WORK + 0 
00:a10e : 30 1b __ BMI $a12b ; (divmod + 88)
00:a110 : a9 00 __ LDA #$00
00:a112 : 85 06 __ STA WORK + 3 
00:a114 : a2 10 __ LDX #$10
00:a116 : 06 1b __ ASL ACCU + 0 
00:a118 : 26 1c __ ROL ACCU + 1 
00:a11a : 2a __ __ ROL
00:a11b : c5 03 __ CMP WORK + 0 
00:a11d : 90 02 __ BCC $a121 ; (divmod + 78)
00:a11f : e5 03 __ SBC WORK + 0 
00:a121 : 26 1b __ ROL ACCU + 0 
00:a123 : 26 1c __ ROL ACCU + 1 
00:a125 : ca __ __ DEX
00:a126 : d0 f2 __ BNE $a11a ; (divmod + 71)
00:a128 : 85 05 __ STA WORK + 2 
00:a12a : 60 __ __ RTS
00:a12b : a9 00 __ LDA #$00
00:a12d : 85 05 __ STA WORK + 2 
00:a12f : 85 06 __ STA WORK + 3 
00:a131 : 84 02 __ STY $02 
00:a133 : a0 10 __ LDY #$10
00:a135 : 18 __ __ CLC
00:a136 : 26 1b __ ROL ACCU + 0 
00:a138 : 26 1c __ ROL ACCU + 1 
00:a13a : 26 05 __ ROL WORK + 2 
00:a13c : 26 06 __ ROL WORK + 3 
00:a13e : 38 __ __ SEC
00:a13f : a5 05 __ LDA WORK + 2 
00:a141 : e5 03 __ SBC WORK + 0 
00:a143 : aa __ __ TAX
00:a144 : a5 06 __ LDA WORK + 3 
00:a146 : e5 04 __ SBC WORK + 1 
00:a148 : 90 04 __ BCC $a14e ; (divmod + 123)
00:a14a : 86 05 __ STX WORK + 2 
00:a14c : 85 06 __ STA WORK + 3 
00:a14e : 88 __ __ DEY
00:a14f : d0 e5 __ BNE $a136 ; (divmod + 99)
00:a151 : 26 1b __ ROL ACCU + 0 
00:a153 : 26 1c __ ROL ACCU + 1 
00:a155 : a4 02 __ LDY $02 
00:a157 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
00:a176 : 84 02 __ STY $02 
00:a178 : a0 20 __ LDY #$20
00:a17a : a9 00 __ LDA #$00
00:a17c : 85 07 __ STA WORK + 4 
00:a17e : 85 08 __ STA WORK + 5 
00:a180 : 85 09 __ STA WORK + 6 
00:a182 : 85 0a __ STA WORK + 7 
00:a184 : a5 05 __ LDA WORK + 2 
00:a186 : 05 06 __ ORA WORK + 3 
00:a188 : d0 78 __ BNE $a202 ; (divmod32 + 140)
00:a18a : a5 04 __ LDA WORK + 1 
00:a18c : d0 27 __ BNE $a1b5 ; (divmod32 + 63)
00:a18e : 18 __ __ CLC
00:a18f : 26 1b __ ROL ACCU + 0 
00:a191 : 26 1c __ ROL ACCU + 1 
00:a193 : 26 1d __ ROL ACCU + 2 
00:a195 : 26 1e __ ROL ACCU + 3 
00:a197 : 2a __ __ ROL
00:a198 : 90 05 __ BCC $a19f ; (divmod32 + 41)
00:a19a : e5 03 __ SBC WORK + 0 
00:a19c : 38 __ __ SEC
00:a19d : b0 06 __ BCS $a1a5 ; (divmod32 + 47)
00:a19f : c5 03 __ CMP WORK + 0 
00:a1a1 : 90 02 __ BCC $a1a5 ; (divmod32 + 47)
00:a1a3 : e5 03 __ SBC WORK + 0 
00:a1a5 : 88 __ __ DEY
00:a1a6 : d0 e7 __ BNE $a18f ; (divmod32 + 25)
00:a1a8 : 85 07 __ STA WORK + 4 
00:a1aa : 26 1b __ ROL ACCU + 0 
00:a1ac : 26 1c __ ROL ACCU + 1 
00:a1ae : 26 1d __ ROL ACCU + 2 
00:a1b0 : 26 1e __ ROL ACCU + 3 
00:a1b2 : a4 02 __ LDY $02 
00:a1b4 : 60 __ __ RTS
00:a1b5 : a5 1e __ LDA ACCU + 3 
00:a1b7 : d0 10 __ BNE $a1c9 ; (divmod32 + 83)
00:a1b9 : a6 1d __ LDX ACCU + 2 
00:a1bb : 86 1e __ STX ACCU + 3 
00:a1bd : a6 1c __ LDX ACCU + 1 
00:a1bf : 86 1d __ STX ACCU + 2 
00:a1c1 : a6 1b __ LDX ACCU + 0 
00:a1c3 : 86 1c __ STX ACCU + 1 
00:a1c5 : 85 1b __ STA ACCU + 0 
00:a1c7 : a0 18 __ LDY #$18
00:a1c9 : 18 __ __ CLC
00:a1ca : 26 1b __ ROL ACCU + 0 
00:a1cc : 26 1c __ ROL ACCU + 1 
00:a1ce : 26 1d __ ROL ACCU + 2 
00:a1d0 : 26 1e __ ROL ACCU + 3 
00:a1d2 : 26 07 __ ROL WORK + 4 
00:a1d4 : 26 08 __ ROL WORK + 5 
00:a1d6 : 90 0c __ BCC $a1e4 ; (divmod32 + 110)
00:a1d8 : a5 07 __ LDA WORK + 4 
00:a1da : e5 03 __ SBC WORK + 0 
00:a1dc : aa __ __ TAX
00:a1dd : a5 08 __ LDA WORK + 5 
00:a1df : e5 04 __ SBC WORK + 1 
00:a1e1 : 38 __ __ SEC
00:a1e2 : b0 0c __ BCS $a1f0 ; (divmod32 + 122)
00:a1e4 : 38 __ __ SEC
00:a1e5 : a5 07 __ LDA WORK + 4 
00:a1e7 : e5 03 __ SBC WORK + 0 
00:a1e9 : aa __ __ TAX
00:a1ea : a5 08 __ LDA WORK + 5 
00:a1ec : e5 04 __ SBC WORK + 1 
00:a1ee : 90 04 __ BCC $a1f4 ; (divmod32 + 126)
00:a1f0 : 86 07 __ STX WORK + 4 
00:a1f2 : 85 08 __ STA WORK + 5 
00:a1f4 : 88 __ __ DEY
00:a1f5 : d0 d3 __ BNE $a1ca ; (divmod32 + 84)
00:a1f7 : 26 1b __ ROL ACCU + 0 
00:a1f9 : 26 1c __ ROL ACCU + 1 
00:a1fb : 26 1d __ ROL ACCU + 2 
00:a1fd : 26 1e __ ROL ACCU + 3 
00:a1ff : a4 02 __ LDY $02 
00:a201 : 60 __ __ RTS
00:a202 : a0 10 __ LDY #$10
00:a204 : a5 1e __ LDA ACCU + 3 
00:a206 : 85 08 __ STA WORK + 5 
00:a208 : a5 1d __ LDA ACCU + 2 
00:a20a : 85 07 __ STA WORK + 4 
00:a20c : a9 00 __ LDA #$00
00:a20e : 85 1d __ STA ACCU + 2 
00:a210 : 85 1e __ STA ACCU + 3 
00:a212 : 18 __ __ CLC
00:a213 : 26 1b __ ROL ACCU + 0 
00:a215 : 26 1c __ ROL ACCU + 1 
00:a217 : 26 07 __ ROL WORK + 4 
00:a219 : 26 08 __ ROL WORK + 5 
00:a21b : 26 09 __ ROL WORK + 6 
00:a21d : 26 0a __ ROL WORK + 7 
00:a21f : a5 07 __ LDA WORK + 4 
00:a221 : c5 03 __ CMP WORK + 0 
00:a223 : a5 08 __ LDA WORK + 5 
00:a225 : e5 04 __ SBC WORK + 1 
00:a227 : a5 09 __ LDA WORK + 6 
00:a229 : e5 05 __ SBC WORK + 2 
00:a22b : aa __ __ TAX
00:a22c : a5 0a __ LDA WORK + 7 
00:a22e : e5 06 __ SBC WORK + 3 
00:a230 : 90 11 __ BCC $a243 ; (divmod32 + 205)
00:a232 : 86 09 __ STX WORK + 6 
00:a234 : 85 0a __ STA WORK + 7 
00:a236 : a5 07 __ LDA WORK + 4 
00:a238 : e5 03 __ SBC WORK + 0 
00:a23a : 85 07 __ STA WORK + 4 
00:a23c : a5 08 __ LDA WORK + 5 
00:a23e : e5 04 __ SBC WORK + 1 
00:a240 : 85 08 __ STA WORK + 5 
00:a242 : 38 __ __ SEC
00:a243 : 88 __ __ DEY
00:a244 : d0 cd __ BNE $a213 ; (divmod32 + 157)
00:a246 : 26 1b __ ROL ACCU + 0 
00:a248 : 26 1c __ ROL ACCU + 1 
00:a24a : a4 02 __ LDY $02 
00:a24c : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
00:a24d : 18 __ __ CLC
00:a24e : a5 1b __ LDA ACCU + 0 
00:a250 : 69 0d __ ADC #$0d
00:a252 : 29 fc __ AND #$fc
00:a254 : 85 03 __ STA WORK + 0 
00:a256 : a5 1c __ LDA ACCU + 1 
00:a258 : 69 00 __ ADC #$00
00:a25a : 85 04 __ STA WORK + 1 
00:a25c : ad fd 52 LDA $52fd ; (HeapNode + 2)
00:a25f : d0 26 __ BNE $a287 ; (crt_malloc + 58)
00:a261 : a9 00 __ LDA #$00
00:a263 : 8d 02 53 STA $5302 
00:a266 : 8d 03 53 STA $5303 
00:a269 : ee fd 52 INC $52fd ; (HeapNode + 2)
00:a26c : a9 00 __ LDA #$00
00:a26e : 09 02 __ ORA #$02
00:a270 : 8d fb 52 STA $52fb ; (HeapNode + 0)
00:a273 : a9 53 __ LDA #$53
00:a275 : 8d fc 52 STA $52fc ; (HeapNode + 1)
00:a278 : 38 __ __ SEC
00:a279 : a9 00 __ LDA #$00
00:a27b : e9 02 __ SBC #$02
00:a27d : 8d 04 53 STA $5304 
00:a280 : a9 70 __ LDA #$70
00:a282 : e9 00 __ SBC #$00
00:a284 : 8d 05 53 STA $5305 
00:a287 : a9 fb __ LDA #$fb
00:a289 : a2 52 __ LDX #$52
00:a28b : 85 1d __ STA ACCU + 2 
00:a28d : 86 1e __ STX ACCU + 3 
00:a28f : 18 __ __ CLC
00:a290 : a0 00 __ LDY #$00
00:a292 : b1 1d __ LDA (ACCU + 2),y 
00:a294 : 85 1b __ STA ACCU + 0 
00:a296 : 65 03 __ ADC WORK + 0 
00:a298 : 85 05 __ STA WORK + 2 
00:a29a : c8 __ __ INY
00:a29b : b1 1d __ LDA (ACCU + 2),y 
00:a29d : 85 1c __ STA ACCU + 1 
00:a29f : f0 20 __ BEQ $a2c1 ; (crt_malloc + 116)
00:a2a1 : 65 04 __ ADC WORK + 1 
00:a2a3 : 85 06 __ STA WORK + 3 
00:a2a5 : b0 14 __ BCS $a2bb ; (crt_malloc + 110)
00:a2a7 : a0 02 __ LDY #$02
00:a2a9 : b1 1b __ LDA (ACCU + 0),y 
00:a2ab : c5 05 __ CMP WORK + 2 
00:a2ad : c8 __ __ INY
00:a2ae : b1 1b __ LDA (ACCU + 0),y 
00:a2b0 : e5 06 __ SBC WORK + 3 
00:a2b2 : b0 0f __ BCS $a2c3 ; (crt_malloc + 118)
00:a2b4 : a5 1b __ LDA ACCU + 0 
00:a2b6 : a6 1c __ LDX ACCU + 1 
00:a2b8 : 4c 8b 28 JMP $288b 
00:a2bb : a9 00 __ LDA #$00
00:a2bd : 85 1b __ STA ACCU + 0 
00:a2bf : 85 1c __ STA ACCU + 1 
00:a2c1 : 02 __ __ INV
00:a2c2 : 60 __ __ RTS
00:a2c3 : a5 05 __ LDA WORK + 2 
00:a2c5 : 85 07 __ STA WORK + 4 
00:a2c7 : a5 06 __ LDA WORK + 3 
00:a2c9 : 85 08 __ STA WORK + 5 
00:a2cb : a0 02 __ LDY #$02
00:a2cd : a5 07 __ LDA WORK + 4 
00:a2cf : d1 1b __ CMP (ACCU + 0),y 
00:a2d1 : d0 15 __ BNE $a2e8 ; (crt_malloc + 155)
00:a2d3 : c8 __ __ INY
00:a2d4 : a5 08 __ LDA WORK + 5 
00:a2d6 : d1 1b __ CMP (ACCU + 0),y 
00:a2d8 : d0 0e __ BNE $a2e8 ; (crt_malloc + 155)
00:a2da : a0 00 __ LDY #$00
00:a2dc : b1 1b __ LDA (ACCU + 0),y 
00:a2de : 91 1d __ STA (ACCU + 2),y 
00:a2e0 : c8 __ __ INY
00:a2e1 : b1 1b __ LDA (ACCU + 0),y 
00:a2e3 : 91 1d __ STA (ACCU + 2),y 
00:a2e5 : 4c 05 29 JMP $2905 
00:a2e8 : a0 00 __ LDY #$00
00:a2ea : b1 1b __ LDA (ACCU + 0),y 
00:a2ec : 91 07 __ STA (WORK + 4),y 
00:a2ee : a5 07 __ LDA WORK + 4 
00:a2f0 : 91 1d __ STA (ACCU + 2),y 
00:a2f2 : c8 __ __ INY
00:a2f3 : b1 1b __ LDA (ACCU + 0),y 
00:a2f5 : 91 07 __ STA (WORK + 4),y 
00:a2f7 : a5 08 __ LDA WORK + 5 
00:a2f9 : 91 1d __ STA (ACCU + 2),y 
00:a2fb : c8 __ __ INY
00:a2fc : b1 1b __ LDA (ACCU + 0),y 
00:a2fe : 91 07 __ STA (WORK + 4),y 
00:a300 : c8 __ __ INY
00:a301 : b1 1b __ LDA (ACCU + 0),y 
00:a303 : 91 07 __ STA (WORK + 4),y 
00:a305 : a0 00 __ LDY #$00
00:a307 : a5 05 __ LDA WORK + 2 
00:a309 : 91 1b __ STA (ACCU + 0),y 
00:a30b : c8 __ __ INY
00:a30c : a5 06 __ LDA WORK + 3 
00:a30e : 91 1b __ STA (ACCU + 0),y 
00:a310 : a0 02 __ LDY #$02
00:a312 : a9 bd __ LDA #$bd
00:a314 : 91 1b __ STA (ACCU + 0),y 
00:a316 : c8 __ __ INY
00:a317 : 91 1b __ STA (ACCU + 0),y 
00:a319 : c8 __ __ INY
00:a31a : 91 1b __ STA (ACCU + 0),y 
00:a31c : c8 __ __ INY
00:a31d : 91 1b __ STA (ACCU + 0),y 
00:a31f : 38 __ __ SEC
00:a320 : a5 05 __ LDA WORK + 2 
00:a322 : e9 04 __ SBC #$04
00:a324 : 85 05 __ STA WORK + 2 
00:a326 : b0 02 __ BCS $a32a ; (crt_malloc + 221)
00:a328 : c6 06 __ DEC WORK + 3 
00:a32a : a9 be __ LDA #$be
00:a32c : a0 00 __ LDY #$00
00:a32e : 91 05 __ STA (WORK + 2),y 
00:a330 : c8 __ __ INY
00:a331 : 91 05 __ STA (WORK + 2),y 
00:a333 : c8 __ __ INY
00:a334 : 91 05 __ STA (WORK + 2),y 
00:a336 : c8 __ __ INY
00:a337 : 91 05 __ STA (WORK + 2),y 
00:a339 : 18 __ __ CLC
00:a33a : a5 1b __ LDA ACCU + 0 
00:a33c : 69 06 __ ADC #$06
00:a33e : 85 1b __ STA ACCU + 0 
00:a340 : 90 02 __ BCC $a344 ; (crt_malloc + 247)
00:a342 : e6 1c __ INC ACCU + 1 
00:a344 : 60 __ __ RTS
--------------------------------------------------------------------
crt_free@proxy: ; crt_free@proxy
00:a345 : a5 0d __ LDA P0 
00:a347 : 85 1b __ STA ACCU + 0 
00:a349 : a5 0e __ LDA P1 
00:a34b : 85 1c __ STA ACCU + 1 
--------------------------------------------------------------------
crt_free: ; crt_free
00:a34d : a5 1b __ LDA ACCU + 0 
00:a34f : 05 1c __ ORA ACCU + 1 
00:a351 : d0 01 __ BNE $a354 ; (crt_free + 7)
00:a353 : 60 __ __ RTS
00:a354 : 38 __ __ SEC
00:a355 : a5 1b __ LDA ACCU + 0 
00:a357 : 29 03 __ AND #$03
00:a359 : d0 56 __ BNE $a3b1 ; (crt_free + 100)
00:a35b : a5 1b __ LDA ACCU + 0 
00:a35d : e9 06 __ SBC #$06
00:a35f : 85 1b __ STA ACCU + 0 
00:a361 : b0 02 __ BCS $a365 ; (crt_free + 24)
00:a363 : c6 1c __ DEC ACCU + 1 
00:a365 : a0 02 __ LDY #$02
00:a367 : a9 bd __ LDA #$bd
00:a369 : d1 1b __ CMP (ACCU + 0),y 
00:a36b : d0 44 __ BNE $a3b1 ; (crt_free + 100)
00:a36d : c8 __ __ INY
00:a36e : d1 1b __ CMP (ACCU + 0),y 
00:a370 : d0 3f __ BNE $a3b1 ; (crt_free + 100)
00:a372 : c8 __ __ INY
00:a373 : d1 1b __ CMP (ACCU + 0),y 
00:a375 : d0 3a __ BNE $a3b1 ; (crt_free + 100)
00:a377 : c8 __ __ INY
00:a378 : d1 1b __ CMP (ACCU + 0),y 
00:a37a : d0 35 __ BNE $a3b1 ; (crt_free + 100)
00:a37c : a0 00 __ LDY #$00
00:a37e : 38 __ __ SEC
00:a37f : b1 1b __ LDA (ACCU + 0),y 
00:a381 : e9 04 __ SBC #$04
00:a383 : 85 03 __ STA WORK + 0 
00:a385 : c8 __ __ INY
00:a386 : b1 1b __ LDA (ACCU + 0),y 
00:a388 : e9 00 __ SBC #$00
00:a38a : 85 04 __ STA WORK + 1 
00:a38c : a0 00 __ LDY #$00
00:a38e : a9 be __ LDA #$be
00:a390 : d1 03 __ CMP (WORK + 0),y 
00:a392 : d0 1d __ BNE $a3b1 ; (crt_free + 100)
00:a394 : c8 __ __ INY
00:a395 : d1 03 __ CMP (WORK + 0),y 
00:a397 : d0 18 __ BNE $a3b1 ; (crt_free + 100)
00:a399 : c8 __ __ INY
00:a39a : d1 03 __ CMP (WORK + 0),y 
00:a39c : d0 13 __ BNE $a3b1 ; (crt_free + 100)
00:a39e : c8 __ __ INY
00:a39f : d1 03 __ CMP (WORK + 0),y 
00:a3a1 : d0 0e __ BNE $a3b1 ; (crt_free + 100)
00:a3a3 : a5 1c __ LDA ACCU + 1 
00:a3a5 : a6 1b __ LDX ACCU + 0 
00:a3a7 : c9 53 __ CMP #$53
00:a3a9 : 90 06 __ BCC $a3b1 ; (crt_free + 100)
00:a3ab : d0 05 __ BNE $a3b2 ; (crt_free + 101)
00:a3ad : e0 00 __ CPX #$00
00:a3af : b0 01 __ BCS $a3b2 ; (crt_free + 101)
00:a3b1 : 02 __ __ INV
00:a3b2 : c9 70 __ CMP #$70
00:a3b4 : 90 06 __ BCC $a3bc ; (crt_free + 111)
00:a3b6 : d0 f9 __ BNE $a3b1 ; (crt_free + 100)
00:a3b8 : e0 00 __ CPX #$00
00:a3ba : b0 f5 __ BCS $a3b1 ; (crt_free + 100)
00:a3bc : a0 02 __ LDY #$02
00:a3be : a9 bf __ LDA #$bf
00:a3c0 : 91 1b __ STA (ACCU + 0),y 
00:a3c2 : c8 __ __ INY
00:a3c3 : 91 1b __ STA (ACCU + 0),y 
00:a3c5 : a0 00 __ LDY #$00
00:a3c7 : b1 1b __ LDA (ACCU + 0),y 
00:a3c9 : 85 1d __ STA ACCU + 2 
00:a3cb : c8 __ __ INY
00:a3cc : b1 1b __ LDA (ACCU + 0),y 
00:a3ce : 85 1e __ STA ACCU + 3 
00:a3d0 : a9 fb __ LDA #$fb
00:a3d2 : a2 52 __ LDX #$52
00:a3d4 : 85 05 __ STA WORK + 2 
00:a3d6 : 86 06 __ STX WORK + 3 
00:a3d8 : a0 01 __ LDY #$01
00:a3da : b1 05 __ LDA (WORK + 2),y 
00:a3dc : f0 28 __ BEQ $a406 ; (crt_free + 185)
00:a3de : aa __ __ TAX
00:a3df : 88 __ __ DEY
00:a3e0 : b1 05 __ LDA (WORK + 2),y 
00:a3e2 : e4 1e __ CPX ACCU + 3 
00:a3e4 : 90 ee __ BCC $a3d4 ; (crt_free + 135)
00:a3e6 : d0 1e __ BNE $a406 ; (crt_free + 185)
00:a3e8 : c5 1d __ CMP ACCU + 2 
00:a3ea : 90 e8 __ BCC $a3d4 ; (crt_free + 135)
00:a3ec : d0 18 __ BNE $a406 ; (crt_free + 185)
00:a3ee : a0 00 __ LDY #$00
00:a3f0 : b1 1d __ LDA (ACCU + 2),y 
00:a3f2 : 91 1b __ STA (ACCU + 0),y 
00:a3f4 : c8 __ __ INY
00:a3f5 : b1 1d __ LDA (ACCU + 2),y 
00:a3f7 : 91 1b __ STA (ACCU + 0),y 
00:a3f9 : c8 __ __ INY
00:a3fa : b1 1d __ LDA (ACCU + 2),y 
00:a3fc : 91 1b __ STA (ACCU + 0),y 
00:a3fe : c8 __ __ INY
00:a3ff : b1 1d __ LDA (ACCU + 2),y 
00:a401 : 91 1b __ STA (ACCU + 0),y 
00:a403 : 4c 1b 2a JMP $2a1b 
00:a406 : a0 00 __ LDY #$00
00:a408 : b1 05 __ LDA (WORK + 2),y 
00:a40a : 91 1b __ STA (ACCU + 0),y 
00:a40c : c8 __ __ INY
00:a40d : b1 05 __ LDA (WORK + 2),y 
00:a40f : 91 1b __ STA (ACCU + 0),y 
00:a411 : c8 __ __ INY
00:a412 : a5 1d __ LDA ACCU + 2 
00:a414 : 91 1b __ STA (ACCU + 0),y 
00:a416 : c8 __ __ INY
00:a417 : a5 1e __ LDA ACCU + 3 
00:a419 : 91 1b __ STA (ACCU + 0),y 
00:a41b : a0 02 __ LDY #$02
00:a41d : b1 05 __ LDA (WORK + 2),y 
00:a41f : c5 1b __ CMP ACCU + 0 
00:a421 : d0 1d __ BNE $a440 ; (crt_free + 243)
00:a423 : c8 __ __ INY
00:a424 : b1 05 __ LDA (WORK + 2),y 
00:a426 : c5 1c __ CMP ACCU + 1 
00:a428 : d0 16 __ BNE $a440 ; (crt_free + 243)
00:a42a : a0 00 __ LDY #$00
00:a42c : b1 1b __ LDA (ACCU + 0),y 
00:a42e : 91 05 __ STA (WORK + 2),y 
00:a430 : c8 __ __ INY
00:a431 : b1 1b __ LDA (ACCU + 0),y 
00:a433 : 91 05 __ STA (WORK + 2),y 
00:a435 : c8 __ __ INY
00:a436 : b1 1b __ LDA (ACCU + 0),y 
00:a438 : 91 05 __ STA (WORK + 2),y 
00:a43a : c8 __ __ INY
00:a43b : b1 1b __ LDA (ACCU + 0),y 
00:a43d : 91 05 __ STA (WORK + 2),y 
00:a43f : 60 __ __ RTS
00:a440 : a0 00 __ LDY #$00
00:a442 : a5 1b __ LDA ACCU + 0 
00:a444 : 91 05 __ STA (WORK + 2),y 
00:a446 : c8 __ __ INY
00:a447 : a5 1c __ LDA ACCU + 1 
00:a449 : 91 05 __ STA (WORK + 2),y 
00:a44b : 60 __ __ RTS
--------------------------------------------------------------------
uii_open_file@proxy: ; uii_open_file@proxy
00:a44c : a9 c2 __ LDA #$c2
00:a44e : 85 12 __ STA P5 
00:a450 : a9 2a __ LDA #$2a
00:a452 : 85 13 __ STA P6 
00:a454 : 4c 2f 1b JMP $1b2f 
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
00:a457 : a5 12 __ LDA P5 
00:a459 : 85 0e __ STA P1 
00:a45b : 4c 27 0f JMP $0f27 
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
00:a45e : a5 13 __ LDA P6 
00:a460 : 85 0e __ STA P1 
00:a462 : 4c 27 0f JMP $0f27 
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
00:a465 : a9 2a __ LDA #$2a
00:a467 : 85 0e __ STA P1 
00:a469 : 4c 27 0f JMP $0f27 
--------------------------------------------------------------------
mul40:
00:a46c : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
00:a47c : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
00:a48c : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
00:a49c : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
p2smap:
00:a49e : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
uii_target:
00:a4a6 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p2smap:
00:a4a7 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
configpath:
00:a4af : __ __ __ BYT 2f 55 53 42 2a 2f 00 00                         : /USB*/..
--------------------------------------------------------------------
configfilename:
00:a4b7 : __ __ __ BYT 44 4d 42 43 46 47 2e 43 46 47 00                : DMBCFG.CFG.
--------------------------------------------------------------------
slotfilename:
00:a4c2 : __ __ __ BYT 44 4d 42 53 4c 54 2e 43 46 47 00                : DMBSLT.CFG.
--------------------------------------------------------------------
print1: ; print1()->void
.s4:
01:8000 : a9 0e __ LDA #$0e
01:8002 : 85 0d __ STA P0 
01:8004 : a9 80 __ LDA #$80
01:8006 : 85 0e __ STA P1 
01:8008 : 20 39 11 JSR $1139 
01:800b : 4c c0 11 JMP $11c0 
--------------------------------------------------------------------
01:800e : __ __ __ BYT 74 48 49 53 20 49 53 20 46 49 52 53 54 20 42 41 : tHIS IS FIRST BA
01:801e : __ __ __ BYT 4e 4b 00                                        : NK.
--------------------------------------------------------------------
print2: ; print2()->void
.s4:
02:8000 : a9 0e __ LDA #$0e
02:8002 : 85 0d __ STA P0 
02:8004 : a9 80 __ LDA #$80
02:8006 : 85 0e __ STA P1 
02:8008 : 20 39 11 JSR $1139 
02:800b : 4c c0 11 JMP $11c0 
--------------------------------------------------------------------
02:800e : __ __ __ BYT 74 48 49 53 20 49 53 20 53 45 43 4f 4e 44 20 42 : tHIS IS SECOND B
02:801e : __ __ __ BYT 41 4e 4b 00                                     : ANK.
--------------------------------------------------------------------
print3: ; print3()->void
.s4:
03:8000 : a9 0e __ LDA #$0e
03:8002 : 85 0d __ STA P0 
03:8004 : a9 80 __ LDA #$80
03:8006 : 85 0e __ STA P1 
03:8008 : 20 39 11 JSR $1139 
03:800b : 4c c0 11 JMP $11c0 
--------------------------------------------------------------------
03:800e : __ __ __ BYT 74 48 49 53 20 49 53 20 54 48 49 52 44 20 42 41 : tHIS IS THIRD BA
03:801e : __ __ __ BYT 4e 4b 00                                        : NK.
