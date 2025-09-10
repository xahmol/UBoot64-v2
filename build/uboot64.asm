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
uii_devinfo:
4d9c : __ __ __ BSS	16
--------------------------------------------------------------------
iec_devices:
4dac : __ __ __ BSS	23
--------------------------------------------------------------------
HeapNode:
4dc3 : __ __ __ BSS	4
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
00:801b : e0 4d __ CPX #$4d
00:801d : f0 0b __ BEQ $802a ; (startup + 42)
00:801f : 91 19 __ STA (IP + 0),y 
00:8021 : c8 __ __ INY
00:8022 : d0 fb __ BNE $801f ; (startup + 31)
00:8024 : e8 __ __ INX
00:8025 : d0 f2 __ BNE $8019 ; (startup + 25)
00:8027 : 91 19 __ STA (IP + 0),y 
00:8029 : c8 __ __ INY
00:802a : c0 c7 __ CPY #$c7
00:802c : d0 f9 __ BNE $8027 ; (startup + 39)
00:802e : a9 00 __ LDA #$00
00:8030 : a2 f7 __ LDX #$f7
00:8032 : d0 03 __ BNE $8037 ; (startup + 55)
00:8034 : 95 00 __ STA $00,x 
00:8036 : e8 __ __ INX
00:8037 : e0 f7 __ CPX #$f7
00:8039 : d0 f9 __ BNE $8034 ; (startup + 52)
00:803b : a9 13 __ LDA #$13
00:803d : 85 23 __ STA SP + 0 
00:803f : a9 7f __ LDA #$7f
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
00:80ab : bd 09 81 LDA $8109,x ; (startmessage + 0)
00:80ae : f0 06 __ BEQ $80b6 ; (main.s4 + 86)
00:80b0 : 20 d2 ff JSR $ffd2 
00:80b3 : e8 __ __ INX
00:80b4 : d0 f5 __ BNE $80ab ; (main.s4 + 75)
00:80b6 : a2 00 __ LDX #$00
.l9:
00:80b8 : bd 00 82 LDA $8200,x ; (fc3_exit.s4 + 0)
00:80bb : 9d 00 c0 STA $c000,x 
00:80be : ee 20 d0 INC $d020 
00:80c1 : e8 __ __ INX
00:80c2 : d0 f4 __ BNE $80b8 ; (main.l9 + 0)
.s5:
00:80c4 : 86 43 __ STX T0 + 0 
00:80c6 : a9 83 __ LDA #$83
00:80c8 : 85 44 __ STA T0 + 1 
.l6:
00:80ca : 86 45 __ STX T1 + 0 
.l10:
00:80cc : 18 __ __ CLC
00:80cd : a5 44 __ LDA T0 + 1 
00:80cf : 69 86 __ ADC #$86
00:80d1 : 85 46 __ STA T1 + 1 
00:80d3 : a0 00 __ LDY #$00
00:80d5 : b1 43 __ LDA (T0 + 0),y 
00:80d7 : a4 43 __ LDY T0 + 0 
00:80d9 : 91 45 __ STA (T1 + 0),y 
00:80db : ee 20 d0 INC $d020 
00:80de : 98 __ __ TYA
00:80df : 18 __ __ CLC
00:80e0 : 69 01 __ ADC #$01
00:80e2 : 85 43 __ STA T0 + 0 
00:80e4 : 90 02 __ BCC $80e8 ; (main.s13 + 0)
.s12:
00:80e6 : e6 44 __ INC T0 + 1 
.s13:
00:80e8 : a8 __ __ TAY
00:80e9 : d0 e1 __ BNE $80cc ; (main.l10 + 0)
.s8:
00:80eb : a5 44 __ LDA T0 + 1 
00:80ed : c9 c0 __ CMP #$c0
00:80ef : d0 d9 __ BNE $80ca ; (main.l6 + 0)
.l11:
00:80f1 : bd 33 81 LDA $8133,x ; (logo_sprite + 0)
00:80f4 : 9d 40 03 STA $0340,x 
00:80f7 : ee 20 d0 INC $d020 
00:80fa : e8 __ __ INX
00:80fb : e0 40 __ CPX #$40
00:80fd : 90 f2 __ BCC $80f1 ; (main.l11 + 0)
.s7:
00:80ff : 20 00 09 JSR $0900 
00:8102 : a9 00 __ LDA #$00
00:8104 : 85 1b __ STA ACCU + 0 
00:8106 : 85 1c __ STA ACCU + 1 
.s3:
00:8108 : 60 __ __ RTS
--------------------------------------------------------------------
startmessage:
00:8109 : __ __ __ BYT 73 54 41 52 54 49 4e 47 20 75 62 4f 4f 54 36 34 : sTARTING ubOOT64
00:8119 : __ __ __ BYT 2e 0d 0d 63 4f 50 59 49 4e 47 20 43 4f 52 45 20 : ...cOPYING CORE 
00:8129 : __ __ __ BYT 54 4f 20 72 61 6d 2e 0d 00 00                   : TO ram....
--------------------------------------------------------------------
logo_sprite:
00:8133 : __ __ __ BYT 00 0f 80 00 10 40 00 10 40 00 13 80 00 12 00 00 : .....@..@.......
00:8143 : __ __ __ BYT 3f 00 40 c0 c0 a3 00 30 94 00 18 9a ba 94 92 a2 : ?.@....0........
00:8153 : __ __ __ BYT a2 52 bb a2 22 a8 a1 23 b8 a1 5c 00 22 93 00 22 : .R.."..#..\.".."
00:8163 : __ __ __ BYT 88 c0 d4 94 3f 18 93 00 30 a0 c0 c0 40 3f 00 07 : ....?...0...@?..
--------------------------------------------------------------------
fc3_exit: ; fc3_exit()->void
.s4:
00:8200 : a9 a7 __ LDA #$a7
00:8202 : 85 0d __ STA P0 
00:8204 : a9 c0 __ LDA #$c0
00:8206 : 85 0e __ STA P1 
00:8208 : 20 12 11 JSR $1112 
00:820b : 20 99 11 JSR $1199 
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
00:82a3 : 4c 78 a4 JMP $a478 
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
00:8302 : 8d 15 7f STA $7f15 ; (mainloop@stack + 0)
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
00:832f : bd 24 0c LDA $0c24,x 
00:8332 : 9d 02 49 STA $4902,x ; (cfg + 2)
00:8335 : d0 f7 __ BNE $832e ; (mainloop.l5 + 0)
.s6:
00:8337 : 20 31 0c JSR $0c31 
00:833a : a9 00 __ LDA #$00
00:833c : 8d 20 d0 STA $d020 
00:833f : 8d 21 d0 STA $d021 
00:8342 : 20 4b 0c JSR $0c4b 
00:8345 : 20 74 0c JSR $0c74 
00:8348 : a9 f8 __ LDA #$f8
00:834a : 8d 62 49 STA $4962 ; (vspriteScreen + 0)
00:834d : a9 07 __ LDA #$07
00:834f : 8d 63 49 STA $4963 ; (vspriteScreen + 1)
00:8352 : 20 c8 0c JSR $0cc8 
00:8355 : 20 10 0d JSR $0d10 
00:8358 : a9 00 __ LDA #$00
00:835a : 8d 5a 49 STA $495a ; (cw + 4)
00:835d : a9 03 __ LDA #$03
00:835f : 8d 5b 49 STA $495b ; (cw + 5)
00:8362 : ad 1d df LDA $df1d 
00:8365 : c9 c9 __ CMP #$c9
00:8367 : f0 25 __ BEQ $838e ; (mainloop.s60 + 0)
.s7:
00:8369 : a9 72 __ LDA #$72
00:836b : 85 0d __ STA P0 
00:836d : a9 11 __ LDA #$11
00:836f : 85 0e __ STA P1 
00:8371 : 20 12 11 JSR $1112 
00:8374 : 20 99 11 JSR $1199 
00:8377 : a9 b1 __ LDA #$b1
00:8379 : 85 0d __ STA P0 
00:837b : a9 11 __ LDA #$11
00:837d : 85 0e __ STA P1 
00:837f : 20 12 11 JSR $1112 
00:8382 : 20 99 11 JSR $1199 
00:8385 : 20 c4 11 JSR $11c4 
00:8388 : 20 00 c0 JSR $c000 
00:838b : 4c 9f 09 JMP $099f 
.s60:
00:838e : 20 f2 10 JSR $10f2 
00:8391 : a9 d2 __ LDA #$d2
00:8393 : 85 0d __ STA P0 
00:8395 : a9 11 __ LDA #$11
00:8397 : 85 0e __ STA P1 
00:8399 : 20 12 11 JSR $1112 
00:839c : 20 99 11 JSR $1199 
.s8:
00:839f : a9 00 __ LDA #$00
00:83a1 : 85 10 __ STA P3 
00:83a3 : 8d 16 7f STA $7f16 ; (cmd + 0)
00:83a6 : a9 02 __ LDA #$02
00:83a8 : 85 0f __ STA P2 
00:83aa : a9 01 __ LDA #$01
00:83ac : 8d ff 10 STA $10ff 
00:83af : 8d 17 7f STA $7f17 ; (cmd + 1)
00:83b2 : a9 16 __ LDA #$16
00:83b4 : 85 0d __ STA P0 
00:83b6 : a9 7f __ LDA #$7f
00:83b8 : 85 0e __ STA P1 
00:83ba : 20 7a 0f JSR $0f7a 
00:83bd : 20 fb 0f JSR $0ffb 
00:83c0 : 20 30 10 JSR $1030 
00:83c3 : 20 e2 10 JSR $10e2 
00:83c6 : a9 c8 __ LDA #$c8
00:83c8 : 85 0d __ STA P0 
00:83ca : a9 49 __ LDA #$49
00:83cc : 85 0e __ STA P1 
00:83ce : 20 12 11 JSR $1112 
00:83d1 : 20 99 11 JSR $1199 
00:83d4 : a9 00 __ LDA #$00
00:83d6 : 8d 09 dc STA $dc09 
00:83d9 : 8d 08 dc STA $dc08 
.l9:
00:83dc : 20 65 10 JSR $1065 
00:83df : ad c9 4b LDA $4bc9 ; (uii_status + 0)
00:83e2 : c9 30 __ CMP #$30
00:83e4 : d0 f6 __ BNE $83dc ; (mainloop.l9 + 0)
.s10:
00:83e6 : ad ca 4b LDA $4bca ; (uii_status + 1)
00:83e9 : c9 30 __ CMP #$30
00:83eb : d0 ef __ BNE $83dc ; (mainloop.l9 + 0)
.s11:
00:83ed : ad 09 dc LDA $dc09 
00:83f0 : c9 05 __ CMP #$05
00:83f2 : b0 e8 __ BCS $83dc ; (mainloop.l9 + 0)
.s12:
00:83f4 : 20 f7 11 JSR $11f7 
00:83f7 : a9 00 __ LDA #$00
00:83f9 : 8d 09 dc STA $dc09 
00:83fc : 8d 08 dc STA $dc08 
.l13:
00:83ff : ad 09 dc LDA $dc09 
00:8402 : f0 fb __ BEQ $83ff ; (mainloop.l13 + 0)
.s14:
00:8404 : 20 15 1c JSR $1c15 
00:8407 : a5 1b __ LDA ACCU + 0 
00:8409 : d0 11 __ BNE $841c ; (mainloop.s16 + 0)
.s15:
00:840b : a9 e3 __ LDA #$e3
00:840d : 85 0d __ STA P0 
00:840f : a9 1c __ LDA #$1c
00:8411 : 85 0e __ STA P1 
00:8413 : 20 12 11 JSR $1112 
00:8416 : 20 99 11 JSR $1199 
00:8419 : 20 64 1b JSR $1b64 
.s16:
00:841c : a9 00 __ LDA #$00
00:841e : a0 05 __ LDY #$05
00:8420 : 91 23 __ STA (SP + 0),y 
00:8422 : a9 1d __ LDA #$1d
00:8424 : c8 __ __ INY
00:8425 : 91 23 __ STA (SP + 0),y 
00:8427 : 20 51 13 JSR $1351 
00:842a : ad 9c 4d LDA $4d9c ; (uii_devinfo + 0)
00:842d : f0 63 __ BEQ $8492 ; (mainloop.s17 + 0)
.s49:
00:842f : a9 1f __ LDA #$1f
00:8431 : a0 05 __ LDY #$05
00:8433 : 91 23 __ STA (SP + 0),y 
00:8435 : a9 1d __ LDA #$1d
00:8437 : c8 __ __ INY
00:8438 : 91 23 __ STA (SP + 0),y 
00:843a : ad 9f 4d LDA $4d9f ; (uii_devinfo + 3)
00:843d : c8 __ __ INY
00:843e : 91 23 __ STA (SP + 0),y 
00:8440 : a9 00 __ LDA #$00
00:8442 : c8 __ __ INY
00:8443 : 91 23 __ STA (SP + 0),y 
00:8445 : ad 9e 4d LDA $4d9e ; (uii_devinfo + 2)
00:8448 : d0 07 __ BNE $8451 ; (mainloop.s59 + 0)
.s50:
00:844a : a9 1b __ LDA #$1b
00:844c : a2 f1 __ LDX #$f1
00:844e : 4c 55 0a JMP $0a55 
.s59:
00:8451 : a9 10 __ LDA #$10
00:8453 : a2 fb __ LDX #$fb
.s51:
00:8455 : a0 0a __ LDY #$0a
00:8457 : 91 23 __ STA (SP + 0),y 
00:8459 : 8a __ __ TXA
00:845a : 88 __ __ DEY
00:845b : 91 23 __ STA (SP + 0),y 
00:845d : ad 9d 4d LDA $4d9d ; (uii_devinfo + 1)
00:8460 : c9 01 __ CMP #$01
00:8462 : d0 12 __ BNE $8476 ; (mainloop.s52 + 0)
.s58:
00:8464 : a9 1b __ LDA #$1b
00:8466 : a2 fa __ LDX #$fa
.s55:
00:8468 : a0 0c __ LDY #$0c
00:846a : 91 23 __ STA (SP + 0),y 
00:846c : 8a __ __ TXA
00:846d : 88 __ __ DEY
00:846e : 91 23 __ STA (SP + 0),y 
00:8470 : 20 51 13 JSR $1351 
00:8473 : 4c 92 0a JMP $0a92 
.s52:
00:8476 : aa __ __ TAX
00:8477 : d0 07 __ BNE $8480 ; (mainloop.s53 + 0)
.s57:
00:8479 : a9 1b __ LDA #$1b
00:847b : a2 f5 __ LDX #$f5
00:847d : 4c 68 0a JMP $0a68 
.s53:
00:8480 : c9 02 __ CMP #$02
00:8482 : f0 07 __ BEQ $848b ; (mainloop.s56 + 0)
.s54:
00:8484 : a9 10 __ LDA #$10
00:8486 : a2 fe __ LDX #$fe
00:8488 : 4c 68 0a JMP $0a68 
.s56:
00:848b : a9 1d __ LDA #$1d
00:848d : a2 3b __ LDX #$3b
00:848f : 4c 68 0a JMP $0a68 
.s17:
00:8492 : ad a0 4d LDA $4da0 ; (uii_devinfo + 4)
00:8495 : f0 63 __ BEQ $84fa ; (mainloop.s18 + 0)
.s38:
00:8497 : a9 40 __ LDA #$40
00:8499 : a0 05 __ LDY #$05
00:849b : 91 23 __ STA (SP + 0),y 
00:849d : a9 1d __ LDA #$1d
00:849f : c8 __ __ INY
00:84a0 : 91 23 __ STA (SP + 0),y 
00:84a2 : ad a3 4d LDA $4da3 ; (uii_devinfo + 7)
00:84a5 : c8 __ __ INY
00:84a6 : 91 23 __ STA (SP + 0),y 
00:84a8 : a9 00 __ LDA #$00
00:84aa : c8 __ __ INY
00:84ab : 91 23 __ STA (SP + 0),y 
00:84ad : ad a2 4d LDA $4da2 ; (uii_devinfo + 6)
00:84b0 : d0 07 __ BNE $84b9 ; (mainloop.s48 + 0)
.s39:
00:84b2 : a9 1b __ LDA #$1b
00:84b4 : a2 f1 __ LDX #$f1
00:84b6 : 4c bd 0a JMP $0abd 
.s48:
00:84b9 : a9 10 __ LDA #$10
00:84bb : a2 fb __ LDX #$fb
.s40:
00:84bd : a0 0a __ LDY #$0a
00:84bf : 91 23 __ STA (SP + 0),y 
00:84c1 : 8a __ __ TXA
00:84c2 : 88 __ __ DEY
00:84c3 : 91 23 __ STA (SP + 0),y 
00:84c5 : ad a1 4d LDA $4da1 ; (uii_devinfo + 5)
00:84c8 : c9 01 __ CMP #$01
00:84ca : d0 12 __ BNE $84de ; (mainloop.s41 + 0)
.s47:
00:84cc : a9 1b __ LDA #$1b
00:84ce : a2 fa __ LDX #$fa
.s44:
00:84d0 : a0 0c __ LDY #$0c
00:84d2 : 91 23 __ STA (SP + 0),y 
00:84d4 : 8a __ __ TXA
00:84d5 : 88 __ __ DEY
00:84d6 : 91 23 __ STA (SP + 0),y 
00:84d8 : 20 51 13 JSR $1351 
00:84db : 4c fa 0a JMP $0afa 
.s41:
00:84de : aa __ __ TAX
00:84df : d0 07 __ BNE $84e8 ; (mainloop.s42 + 0)
.s46:
00:84e1 : a9 1b __ LDA #$1b
00:84e3 : a2 f5 __ LDX #$f5
00:84e5 : 4c d0 0a JMP $0ad0 
.s42:
00:84e8 : c9 02 __ CMP #$02
00:84ea : f0 07 __ BEQ $84f3 ; (mainloop.s45 + 0)
.s43:
00:84ec : a9 10 __ LDA #$10
00:84ee : a2 fe __ LDX #$fe
00:84f0 : 4c d0 0a JMP $0ad0 
.s45:
00:84f3 : a9 1d __ LDA #$1d
00:84f5 : a2 3b __ LDX #$3b
00:84f7 : 4c d0 0a JMP $0ad0 
.s18:
00:84fa : ad a4 4d LDA $4da4 ; (uii_devinfo + 8)
00:84fd : f0 31 __ BEQ $8530 ; (mainloop.s19 + 0)
.s34:
00:84ff : a9 5c __ LDA #$5c
00:8501 : a0 05 __ LDY #$05
00:8503 : 91 23 __ STA (SP + 0),y 
00:8505 : a9 1d __ LDA #$1d
00:8507 : c8 __ __ INY
00:8508 : 91 23 __ STA (SP + 0),y 
00:850a : ad a7 4d LDA $4da7 ; (uii_devinfo + 11)
00:850d : c8 __ __ INY
00:850e : 91 23 __ STA (SP + 0),y 
00:8510 : a9 00 __ LDA #$00
00:8512 : c8 __ __ INY
00:8513 : 91 23 __ STA (SP + 0),y 
00:8515 : ad a6 4d LDA $4da6 ; (uii_devinfo + 10)
00:8518 : d0 07 __ BNE $8521 ; (mainloop.s37 + 0)
.s35:
00:851a : a9 1b __ LDA #$1b
00:851c : a2 f1 __ LDX #$f1
00:851e : 4c 25 0b JMP $0b25 
.s37:
00:8521 : a9 10 __ LDA #$10
00:8523 : a2 fb __ LDX #$fb
.s36:
00:8525 : a0 0a __ LDY #$0a
00:8527 : 91 23 __ STA (SP + 0),y 
00:8529 : 8a __ __ TXA
00:852a : 88 __ __ DEY
00:852b : 91 23 __ STA (SP + 0),y 
00:852d : 20 51 13 JSR $1351 
.s19:
00:8530 : ad a8 4d LDA $4da8 ; (uii_devinfo + 12)
00:8533 : f0 31 __ BEQ $8566 ; (mainloop.s20 + 0)
.s30:
00:8535 : a9 74 __ LDA #$74
00:8537 : a0 05 __ LDY #$05
00:8539 : 91 23 __ STA (SP + 0),y 
00:853b : a9 1d __ LDA #$1d
00:853d : c8 __ __ INY
00:853e : 91 23 __ STA (SP + 0),y 
00:8540 : ad ab 4d LDA $4dab ; (uii_devinfo + 15)
00:8543 : c8 __ __ INY
00:8544 : 91 23 __ STA (SP + 0),y 
00:8546 : a9 00 __ LDA #$00
00:8548 : c8 __ __ INY
00:8549 : 91 23 __ STA (SP + 0),y 
00:854b : ad aa 4d LDA $4daa ; (uii_devinfo + 14)
00:854e : d0 07 __ BNE $8557 ; (mainloop.s33 + 0)
.s31:
00:8550 : a9 1b __ LDA #$1b
00:8552 : a2 f1 __ LDX #$f1
00:8554 : 4c 5b 0b JMP $0b5b 
.s33:
00:8557 : a9 10 __ LDA #$10
00:8559 : a2 fb __ LDX #$fb
.s32:
00:855b : a0 0a __ LDY #$0a
00:855d : 91 23 __ STA (SP + 0),y 
00:855f : 8a __ __ TXA
00:8560 : 88 __ __ DEY
00:8561 : 91 23 __ STA (SP + 0),y 
00:8563 : 20 51 13 JSR $1351 
.s20:
00:8566 : a9 8c __ LDA #$8c
00:8568 : a0 05 __ LDY #$05
00:856a : 91 23 __ STA (SP + 0),y 
00:856c : a9 1d __ LDA #$1d
00:856e : c8 __ __ INY
00:856f : 91 23 __ STA (SP + 0),y 
00:8571 : 20 b4 1d JSR $1db4 
00:8574 : aa __ __ TAX
00:8575 : d0 07 __ BNE $857e ; (mainloop.s29 + 0)
.s21:
00:8577 : a9 1e __ LDA #$1e
00:8579 : a2 72 __ LDX #$72
00:857b : 4c 82 0b JMP $0b82 
.s29:
00:857e : a9 1e __ LDA #$1e
00:8580 : a2 6e __ LDX #$6e
.s22:
00:8582 : a0 08 __ LDY #$08
00:8584 : 91 23 __ STA (SP + 0),y 
00:8586 : 8a __ __ TXA
00:8587 : 88 __ __ DEY
00:8588 : 91 23 __ STA (SP + 0),y 
00:858a : 20 51 13 JSR $1351 
00:858d : a9 75 __ LDA #$75
00:858f : a0 05 __ LDY #$05
00:8591 : 91 23 __ STA (SP + 0),y 
00:8593 : a9 1e __ LDA #$1e
00:8595 : c8 __ __ INY
00:8596 : 91 23 __ STA (SP + 0),y 
00:8598 : 20 51 13 JSR $1351 
00:859b : a2 00 __ LDX #$00
00:859d : ad ac 4d LDA $4dac ; (iec_devices + 0)
00:85a0 : d0 0a __ BNE $85ac ; (mainloop.l26 + 0)
.l24:
00:85a2 : e8 __ __ INX
00:85a3 : e0 17 __ CPX #$17
00:85a5 : b0 2f __ BCS $85d6 ; (mainloop.s25 + 0)
.s23:
00:85a7 : bd ac 4d LDA $4dac,x ; (iec_devices + 0)
00:85aa : f0 f6 __ BEQ $85a2 ; (mainloop.l24 + 0)
.l26:
00:85ac : 86 53 __ STX T2 + 0 
00:85ae : a9 86 __ LDA #$86
00:85b0 : a0 05 __ LDY #$05
00:85b2 : 91 23 __ STA (SP + 0),y 
00:85b4 : a9 1e __ LDA #$1e
00:85b6 : c8 __ __ INY
00:85b7 : 91 23 __ STA (SP + 0),y 
00:85b9 : 8a __ __ TXA
00:85ba : e0 16 __ CPX #$16
00:85bc : d0 04 __ BNE $85c2 ; (mainloop.s27 + 0)
.s28:
00:85be : a9 04 __ LDA #$04
00:85c0 : d0 03 __ BNE $85c5 ; (mainloop.s61 + 0)
.s27:
00:85c2 : 18 __ __ CLC
00:85c3 : 69 08 __ ADC #$08
.s61:
00:85c5 : a0 07 __ LDY #$07
00:85c7 : 91 23 __ STA (SP + 0),y 
00:85c9 : a9 00 __ LDA #$00
00:85cb : c8 __ __ INY
00:85cc : 91 23 __ STA (SP + 0),y 
00:85ce : 20 51 13 JSR $1351 
00:85d1 : a6 53 __ LDX T2 + 0 
00:85d3 : 4c a2 0b JMP $0ba2 
.s25:
00:85d6 : 20 99 11 JSR $1199 
00:85d9 : a9 01 __ LDA #$01
00:85db : 8d ff df STA $dfff 
00:85de : 20 00 80 JSR $8000 ; (startup + 0)
00:85e1 : a9 02 __ LDA #$02
00:85e3 : 8d ff df STA $dfff 
00:85e6 : 20 00 80 JSR $8000 ; (startup + 0)
00:85e9 : a9 03 __ LDA #$03
00:85eb : 8d ff df STA $dfff 
00:85ee : 20 00 80 JSR $8000 ; (startup + 0)
00:85f1 : a9 8c __ LDA #$8c
00:85f3 : 85 0d __ STA P0 
00:85f5 : a9 1e __ LDA #$1e
00:85f7 : 85 0e __ STA P1 
00:85f9 : 20 12 11 JSR $1112 
00:85fc : 20 99 11 JSR $1199 
00:85ff : 20 c4 11 JSR $11c4 
00:8602 : a9 9d __ LDA #$9d
00:8604 : 85 0d __ STA P0 
00:8606 : a9 1e __ LDA #$1e
00:8608 : 85 0e __ STA P1 
00:860a : 20 12 11 JSR $1112 
00:860d : 20 99 11 JSR $1199 
00:8610 : 20 00 c0 JSR $c000 
.s3:
00:8613 : 18 __ __ CLC
00:8614 : a5 23 __ LDA SP + 0 
00:8616 : 69 0d __ ADC #$0d
00:8618 : 85 23 __ STA SP + 0 
00:861a : 90 02 __ BCC $861e ; (mainloop.s3 + 11)
00:861c : e6 24 __ INC SP + 1 
00:861e : ad 15 7f LDA $7f15 ; (mainloop@stack + 0)
00:8621 : 85 53 __ STA T2 + 0 
00:8623 : 60 __ __ RTS
--------------------------------------------------------------------
00:8624 : __ __ __ BYT 50 4f 4f 4c 2e 4e 54 50 2e 4f 52 47 00          : POOL.NTP.ORG.
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
.s4:
00:8631 : a9 1b __ LDA #$1b
00:8633 : 8d 11 d0 STA $d011 
00:8636 : a9 08 __ LDA #$08
00:8638 : 8d 16 d0 STA $d016 
00:863b : ad 00 dd LDA $dd00 
00:863e : 29 fc __ AND #$fc
00:8640 : 09 03 __ ORA #$03
00:8642 : 8d 00 dd STA $dd00 
00:8645 : a9 16 __ LDA #$16
00:8647 : 8d 18 d0 STA $d018 
.s3:
00:864a : 60 __ __ RTS
--------------------------------------------------------------------
cwin_init: ; cwin_init(struct CharWin*,u8*,u8,u8,u8,u8)->void
.s4:
00:864b : a9 00 __ LDA #$00
00:864d : 8d 56 49 STA $4956 ; (cw + 0)
00:8650 : 8d 57 49 STA $4957 ; (cw + 1)
00:8653 : 8d 5a 49 STA $495a ; (cw + 4)
00:8656 : 8d 5b 49 STA $495b ; (cw + 5)
00:8659 : 8d 5e 49 STA $495e ; (cw + 8)
00:865c : 8d 60 49 STA $4960 ; (cw + 10)
00:865f : a9 28 __ LDA #$28
00:8661 : 8d 58 49 STA $4958 ; (cw + 2)
00:8664 : a9 19 __ LDA #$19
00:8666 : 8d 59 49 STA $4959 ; (cw + 3)
00:8669 : a9 04 __ LDA #$04
00:866b : 8d 5f 49 STA $495f ; (cw + 9)
00:866e : a9 d8 __ LDA #$d8
00:8670 : 8d 61 49 STA $4961 ; (cw + 11)
.s3:
00:8673 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_clear: ; cwin_clear(struct CharWin*)->void
.s4:
00:8674 : ad 59 49 LDA $4959 ; (cw + 3)
00:8677 : f0 32 __ BEQ $86ab ; (cwin_clear.s3 + 0)
.s5:
00:8679 : ad 5e 49 LDA $495e ; (cw + 8)
00:867c : 85 1b __ STA ACCU + 0 
00:867e : ad 5f 49 LDA $495f ; (cw + 9)
00:8681 : 85 1c __ STA ACCU + 1 
00:8683 : ad 60 49 LDA $4960 ; (cw + 10)
00:8686 : 85 43 __ STA T1 + 0 
00:8688 : ad 61 49 LDA $4961 ; (cw + 11)
00:868b : 85 44 __ STA T1 + 1 
00:868d : a2 00 __ LDX #$00
00:868f : ad 58 49 LDA $4958 ; (cw + 2)
00:8692 : f0 11 __ BEQ $86a5 ; (cwin_clear.l7 + 0)
.l8:
00:8694 : 85 1d __ STA ACCU + 2 
00:8696 : a0 00 __ LDY #$00
.l9:
00:8698 : a9 20 __ LDA #$20
00:869a : 91 1b __ STA (ACCU + 0),y 
00:869c : a9 01 __ LDA #$01
00:869e : 91 43 __ STA (T1 + 0),y 
00:86a0 : c8 __ __ INY
00:86a1 : c4 1d __ CPY ACCU + 2 
00:86a3 : 90 f3 __ BCC $8698 ; (cwin_clear.l9 + 0)
.l7:
00:86a5 : e8 __ __ INX
00:86a6 : ec 59 49 CPX $4959 ; (cw + 3)
00:86a9 : 90 01 __ BCC $86ac ; (cwin_clear.s6 + 0)
.s3:
00:86ab : 60 __ __ RTS
.s6:
00:86ac : a5 1b __ LDA ACCU + 0 
00:86ae : 69 28 __ ADC #$28
00:86b0 : 85 1b __ STA ACCU + 0 
00:86b2 : 90 03 __ BCC $86b7 ; (cwin_clear.s11 + 0)
.s10:
00:86b4 : e6 1c __ INC ACCU + 1 
00:86b6 : 18 __ __ CLC
.s11:
00:86b7 : a5 43 __ LDA T1 + 0 
00:86b9 : 69 28 __ ADC #$28
00:86bb : 85 43 __ STA T1 + 0 
00:86bd : 90 02 __ BCC $86c1 ; (cwin_clear.s13 + 0)
.s12:
00:86bf : e6 44 __ INC T1 + 1 
.s13:
00:86c1 : ad 58 49 LDA $4958 ; (cw + 2)
00:86c4 : f0 df __ BEQ $86a5 ; (cwin_clear.l7 + 0)
00:86c6 : d0 cc __ BNE $8694 ; (cwin_clear.l8 + 0)
--------------------------------------------------------------------
spr_set: ; spr_set(u8,bool,i16,i16,u8,u8,bool,bool,bool)->void
.s4:
00:86c8 : ad 10 d0 LDA $d010 
00:86cb : 09 01 __ ORA #$01
00:86cd : 8d 10 d0 STA $d010 
00:86d0 : ad 15 d0 LDA $d015 
00:86d3 : 09 01 __ ORA #$01
00:86d5 : 8d 15 d0 STA $d015 
00:86d8 : ad 1c d0 LDA $d01c 
00:86db : 29 fe __ AND #$fe
00:86dd : 8d 1c d0 STA $d01c 
00:86e0 : ad 1d d0 LDA $d01d 
00:86e3 : 29 fe __ AND #$fe
00:86e5 : 8d 1d d0 STA $d01d 
00:86e8 : ad 17 d0 LDA $d017 
00:86eb : 29 fe __ AND #$fe
00:86ed : 8d 17 d0 STA $d017 
00:86f0 : a9 46 __ LDA #$46
00:86f2 : 8d 01 d0 STA $d001 
00:86f5 : a9 40 __ LDA #$40
00:86f7 : 8d 00 d0 STA $d000 
00:86fa : ad 62 49 LDA $4962 ; (vspriteScreen + 0)
00:86fd : 85 1b __ STA ACCU + 0 
00:86ff : ad 63 49 LDA $4963 ; (vspriteScreen + 1)
00:8702 : 85 1c __ STA ACCU + 1 
00:8704 : a9 0d __ LDA #$0d
00:8706 : a0 00 __ LDY #$00
00:8708 : 91 1b __ STA (ACCU + 0),y 
00:870a : a9 03 __ LDA #$03
00:870c : 8d 27 d0 STA $d027 
.s3:
00:870f : 60 __ __ RTS
--------------------------------------------------------------------
headertext: ; headertext(const u8*,u8)->void
.s4:
00:8710 : a9 00 __ LDA #$00
00:8712 : 85 0d __ STA P0 
00:8714 : 85 0e __ STA P1 
00:8716 : a9 28 __ LDA #$28
00:8718 : 85 0f __ STA P2 
00:871a : a9 05 __ LDA #$05
00:871c : 85 12 __ STA P5 
00:871e : a9 01 __ LDA #$01
00:8720 : 85 10 __ STA P3 
00:8722 : a9 a0 __ LDA #$a0
00:8724 : 85 11 __ STA P4 
00:8726 : 20 87 0e JSR $0e87 
00:8729 : a9 01 __ LDA #$01
00:872b : 85 0e __ STA P1 
00:872d : a9 0d __ LDA #$0d
00:872f : 85 12 __ STA P5 
00:8731 : 20 87 0e JSR $0e87 
00:8734 : a9 00 __ LDA #$00
00:8736 : 85 0f __ STA P2 
00:8738 : 85 10 __ STA P3 
00:873a : a9 05 __ LDA #$05
00:873c : 85 13 __ STA P6 
00:873e : a9 0f __ LDA #$0f
00:8740 : 85 12 __ STA P5 
00:8742 : a9 17 __ LDA #$17
00:8744 : 85 11 __ STA P4 
00:8746 : 20 74 0d JSR $0d74 
00:8749 : e6 10 __ INC P3 
00:874b : a9 0d __ LDA #$0d
00:874d : 85 13 __ STA P6 
00:874f : a9 0f __ LDA #$0f
00:8751 : 85 12 __ STA P5 
00:8753 : a9 40 __ LDA #$40
00:8755 : 85 11 __ STA P4 
00:8757 : 20 74 0d JSR $0d74 
00:875a : a9 00 __ LDA #$00
00:875c : 85 0d __ STA P0 
00:875e : a9 11 __ LDA #$11
00:8760 : 85 0e __ STA P1 
00:8762 : 20 fb 0e JSR $0efb 
00:8765 : 38 __ __ SEC
00:8766 : a9 28 __ LDA #$28
00:8768 : e5 1b __ SBC ACCU + 0 
00:876a : 85 0f __ STA P2 
00:876c : a9 00 __ LDA #$00
00:876e : 85 11 __ STA P4 
00:8770 : a9 11 __ LDA #$11
00:8772 : 85 12 __ STA P5 
--------------------------------------------------------------------
cwin_putat_string_reverse: ; cwin_putat_string_reverse(struct CharWin*,u8,u8,const u8*,u8)->void
.s4:
00:8774 : a5 11 __ LDA P4 ; (str + 0)
00:8776 : 85 0d __ STA P0 
00:8778 : a5 12 __ LDA P5 ; (str + 1)
00:877a : 85 0e __ STA P1 
00:877c : 20 fb 0e JSR $0efb 
00:877f : a9 63 __ LDA #$63
00:8781 : c5 1b __ CMP ACCU + 0 
00:8783 : b0 06 __ BCS $878b ; (cwin_putat_string_reverse.s5 + 0)
.s10:
00:8785 : 85 1b __ STA ACCU + 0 
.s9:
00:8787 : a0 00 __ LDY #$00
00:8789 : f0 4b __ BEQ $87d6 ; (cwin_putat_string_reverse.l11 + 0)
.s5:
00:878b : a5 1b __ LDA ACCU + 0 
00:878d : d0 f8 __ BNE $8787 ; (cwin_putat_string_reverse.s9 + 0)
.s6:
00:878f : a9 00 __ LDA #$00
00:8791 : a6 1b __ LDX ACCU + 0 
00:8793 : 9d 64 49 STA $4964,x ; (linebuffer + 0)
00:8796 : a5 10 __ LDA P3 ; (y + 0)
00:8798 : 0a __ __ ASL
00:8799 : aa __ __ TAX
00:879a : bd 36 22 LDA $2236,x 
00:879d : 65 0f __ ADC P2 ; (x + 0)
00:879f : 85 1b __ STA ACCU + 0 
00:87a1 : bd 37 22 LDA $2237,x 
00:87a4 : 69 00 __ ADC #$00
00:87a6 : 85 1c __ STA ACCU + 1 
00:87a8 : ad 5e 49 LDA $495e ; (cw + 8)
00:87ab : 65 1b __ ADC ACCU + 0 
00:87ad : 85 43 __ STA T1 + 0 
00:87af : ad 5f 49 LDA $495f ; (cw + 9)
00:87b2 : 65 1c __ ADC ACCU + 1 
00:87b4 : 85 44 __ STA T1 + 1 
00:87b6 : ad 60 49 LDA $4960 ; (cw + 10)
00:87b9 : 18 __ __ CLC
00:87ba : 65 1b __ ADC ACCU + 0 
00:87bc : 85 1b __ STA ACCU + 0 
00:87be : ad 61 49 LDA $4961 ; (cw + 11)
00:87c1 : 65 1c __ ADC ACCU + 1 
00:87c3 : 85 1c __ STA ACCU + 1 
00:87c5 : a0 00 __ LDY #$00
00:87c7 : f0 07 __ BEQ $87d0 ; (cwin_putat_string_reverse.l7 + 0)
.s8:
00:87c9 : 91 43 __ STA (T1 + 0),y 
00:87cb : a5 13 __ LDA P6 ; (color + 0)
00:87cd : 91 1b __ STA (ACCU + 0),y 
00:87cf : c8 __ __ INY
.l7:
00:87d0 : b9 64 49 LDA $4964,y ; (linebuffer + 0)
00:87d3 : d0 f4 __ BNE $87c9 ; (cwin_putat_string_reverse.s8 + 0)
.s3:
00:87d5 : 60 __ __ RTS
.l11:
00:87d6 : b1 11 __ LDA (P4),y ; (str + 0)
00:87d8 : 4a __ __ LSR
00:87d9 : 4a __ __ LSR
00:87da : 4a __ __ LSR
00:87db : 4a __ __ LSR
00:87dc : 4a __ __ LSR
00:87dd : aa __ __ TAX
00:87de : bd 68 22 LDA $2268,x 
00:87e1 : 51 11 __ EOR (P4),y ; (str + 0)
00:87e3 : 09 80 __ ORA #$80
00:87e5 : 99 64 49 STA $4964,y ; (linebuffer + 0)
00:87e8 : c8 __ __ INY
00:87e9 : c4 1b __ CPY ACCU + 0 
00:87eb : 90 e9 __ BCC $87d6 ; (cwin_putat_string_reverse.l11 + 0)
00:87ed : b0 a0 __ BCS $878f ; (cwin_putat_string_reverse.s6 + 0)
--------------------------------------------------------------------
cwin_console_newline: ; cwin_console_newline(struct CharWin*)->void
.s4:
00:87ef : a9 00 __ LDA #$00
00:87f1 : 8d 5a 49 STA $495a ; (cw + 4)
00:87f4 : ad 5b 49 LDA $495b ; (cw + 5)
00:87f7 : aa __ __ TAX
00:87f8 : 18 __ __ CLC
00:87f9 : 69 01 __ ADC #$01
00:87fb : 8d 5b 49 STA $495b ; (cw + 5)
00:87fe : cd 59 49 CMP $4959 ; (cw + 3)
00:8801 : f0 01 __ BEQ $8804 ; (cwin_console_newline.s5 + 0)
.s3:
00:8803 : 60 __ __ RTS
.s5:
00:8804 : 8e 5b 49 STX $495b ; (cw + 5)
00:8807 : ce 5d 49 DEC $495d ; (cw + 7)
00:880a : ad 58 49 LDA $4958 ; (cw + 2)
00:880d : 85 49 __ STA T7 + 0 
00:880f : ad 5e 49 LDA $495e ; (cw + 8)
00:8812 : 85 43 __ STA T0 + 0 
00:8814 : ad 5f 49 LDA $495f ; (cw + 9)
00:8817 : 85 44 __ STA T0 + 1 
00:8819 : ad 60 49 LDA $4960 ; (cw + 10)
00:881c : 85 1b __ STA ACCU + 0 
00:881e : ad 61 49 LDA $4961 ; (cw + 11)
00:8821 : a2 00 __ LDX #$00
00:8823 : f0 0f __ BEQ $8834 ; (cwin_console_newline.l6 + 0)
.s9:
00:8825 : a5 47 __ LDA T3 + 0 
00:8827 : 85 43 __ STA T0 + 0 
00:8829 : a5 48 __ LDA T3 + 1 
00:882b : 85 44 __ STA T0 + 1 
00:882d : a5 45 __ LDA T2 + 0 
00:882f : 85 1b __ STA ACCU + 0 
00:8831 : a5 46 __ LDA T2 + 1 
00:8833 : e8 __ __ INX
.l6:
00:8834 : 85 1c __ STA ACCU + 1 
00:8836 : ad 59 49 LDA $4959 ; (cw + 3)
00:8839 : 38 __ __ SEC
00:883a : e9 01 __ SBC #$01
00:883c : 90 06 __ BCC $8844 ; (cwin_console_newline.s8 + 0)
.s11:
00:883e : 85 0e __ STA P1 
00:8840 : e4 0e __ CPX P1 
00:8842 : b0 2e __ BCS $8872 ; (cwin_console_newline.s7 + 0)
.s8:
00:8844 : a5 1b __ LDA ACCU + 0 
00:8846 : 69 28 __ ADC #$28
00:8848 : 85 45 __ STA T2 + 0 
00:884a : a5 1c __ LDA ACCU + 1 
00:884c : 69 00 __ ADC #$00
00:884e : 85 46 __ STA T2 + 1 
00:8850 : 18 __ __ CLC
00:8851 : a5 43 __ LDA T0 + 0 
00:8853 : 69 28 __ ADC #$28
00:8855 : 85 47 __ STA T3 + 0 
00:8857 : a5 44 __ LDA T0 + 1 
00:8859 : 69 00 __ ADC #$00
00:885b : 85 48 __ STA T3 + 1 
00:885d : a5 49 __ LDA T7 + 0 
00:885f : f0 c4 __ BEQ $8825 ; (cwin_console_newline.s9 + 0)
.s10:
00:8861 : a0 00 __ LDY #$00
.l12:
00:8863 : b1 47 __ LDA (T3 + 0),y 
00:8865 : 91 43 __ STA (T0 + 0),y 
00:8867 : b1 45 __ LDA (T2 + 0),y 
00:8869 : 91 1b __ STA (ACCU + 0),y 
00:886b : c8 __ __ INY
00:886c : c4 49 __ CPY T7 + 0 
00:886e : 90 f3 __ BCC $8863 ; (cwin_console_newline.l12 + 0)
00:8870 : b0 b3 __ BCS $8825 ; (cwin_console_newline.s9 + 0)
.s7:
00:8872 : a5 49 __ LDA T7 + 0 
00:8874 : 85 0f __ STA P2 
00:8876 : a9 00 __ LDA #$00
00:8878 : 85 0d __ STA P0 
00:887a : a9 01 __ LDA #$01
00:887c : 85 10 __ STA P3 
00:887e : 85 12 __ STA P5 
00:8880 : ad 71 22 LDA $2271 
00:8883 : 49 20 __ EOR #$20
00:8885 : 85 11 __ STA P4 
--------------------------------------------------------------------
cwin_fill_rect_raw: ; cwin_fill_rect_raw(struct CharWin*,u8,u8,u8,u8,u8,u8)->void
.s4:
00:8887 : a5 0f __ LDA P2 ; (w + 0)
00:8889 : f0 2c __ BEQ $88b7 ; (cwin_fill_rect_raw.s3 + 0)
.s5:
00:888b : a5 10 __ LDA P3 ; (h + 0)
00:888d : f0 28 __ BEQ $88b7 ; (cwin_fill_rect_raw.s3 + 0)
.s6:
00:888f : a5 0e __ LDA P1 ; (y + 0)
00:8891 : 0a __ __ ASL
00:8892 : aa __ __ TAX
00:8893 : ad 5e 49 LDA $495e ; (cw + 8)
00:8896 : 7d 36 22 ADC $2236,x 
00:8899 : a8 __ __ TAY
00:889a : ad 5f 49 LDA $495f ; (cw + 9)
00:889d : 7d 37 22 ADC $2237,x 
00:88a0 : 85 1c __ STA ACCU + 1 
00:88a2 : ad 60 49 LDA $4960 ; (cw + 10)
00:88a5 : 18 __ __ CLC
00:88a6 : 7d 36 22 ADC $2236,x 
00:88a9 : 85 43 __ STA T3 + 0 
00:88ab : ad 61 49 LDA $4961 ; (cw + 11)
00:88ae : 7d 37 22 ADC $2237,x 
00:88b1 : 85 44 __ STA T3 + 1 
00:88b3 : a5 0f __ LDA P2 ; (w + 0)
00:88b5 : d0 01 __ BNE $88b8 ; (cwin_fill_rect_raw.s10 + 0)
.s3:
00:88b7 : 60 __ __ RTS
.s10:
00:88b8 : 18 __ __ CLC
00:88b9 : a5 43 __ LDA T3 + 0 
00:88bb : 65 0d __ ADC P0 ; (x + 0)
00:88bd : 85 43 __ STA T3 + 0 
00:88bf : 90 03 __ BCC $88c4 ; (cwin_fill_rect_raw.s12 + 0)
.s11:
00:88c1 : e6 44 __ INC T3 + 1 
00:88c3 : 18 __ __ CLC
.s12:
00:88c4 : 98 __ __ TYA
00:88c5 : 65 0d __ ADC P0 ; (x + 0)
00:88c7 : 85 1b __ STA ACCU + 0 
00:88c9 : 90 02 __ BCC $88cd ; (cwin_fill_rect_raw.s14 + 0)
.s13:
00:88cb : e6 1c __ INC ACCU + 1 
.s14:
00:88cd : a6 10 __ LDX P3 ; (h + 0)
.l7:
00:88cf : a0 00 __ LDY #$00
.l8:
00:88d1 : a5 11 __ LDA P4 ; (ch + 0)
00:88d3 : 91 1b __ STA (ACCU + 0),y 
00:88d5 : a5 12 __ LDA P5 ; (color + 0)
00:88d7 : 91 43 __ STA (T3 + 0),y 
00:88d9 : c8 __ __ INY
00:88da : c4 0f __ CPY P2 ; (w + 0)
00:88dc : 90 f3 __ BCC $88d1 ; (cwin_fill_rect_raw.l8 + 0)
.s9:
00:88de : a5 43 __ LDA T3 + 0 
00:88e0 : 69 27 __ ADC #$27
00:88e2 : 85 43 __ STA T3 + 0 
00:88e4 : 90 03 __ BCC $88e9 ; (cwin_fill_rect_raw.s16 + 0)
.s15:
00:88e6 : e6 44 __ INC T3 + 1 
00:88e8 : 18 __ __ CLC
.s16:
00:88e9 : a5 1b __ LDA ACCU + 0 
00:88eb : 69 28 __ ADC #$28
00:88ed : 85 1b __ STA ACCU + 0 
00:88ef : 90 02 __ BCC $88f3 ; (cwin_fill_rect_raw.s18 + 0)
.s17:
00:88f1 : e6 1c __ INC ACCU + 1 
.s18:
00:88f3 : ca __ __ DEX
00:88f4 : d0 d9 __ BNE $88cf ; (cwin_fill_rect_raw.l7 + 0)
00:88f6 : 60 __ __ RTS
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
00:88f7 : a9 22 __ LDA #$22
00:88f9 : 85 0e __ STA P1 
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s4:
00:88fb : a9 00 __ LDA #$00
00:88fd : 85 1b __ STA ACCU + 0 
00:88ff : 85 1c __ STA ACCU + 1 
00:8901 : a8 __ __ TAY
00:8902 : b1 0d __ LDA (P0),y ; (str + 0)
00:8904 : f0 10 __ BEQ $8916 ; (strlen.s3 + 0)
.s6:
00:8906 : a2 00 __ LDX #$00
.l7:
00:8908 : c8 __ __ INY
00:8909 : d0 03 __ BNE $890e ; (strlen.s9 + 0)
.s8:
00:890b : e6 0e __ INC P1 ; (str + 1)
00:890d : e8 __ __ INX
.s9:
00:890e : b1 0d __ LDA (P0),y ; (str + 0)
00:8910 : d0 f6 __ BNE $8908 ; (strlen.l7 + 0)
.s5:
00:8912 : 86 1c __ STX ACCU + 1 
00:8914 : 84 1b __ STY ACCU + 0 
.s3:
00:8916 : 60 __ __ RTS
--------------------------------------------------------------------
00:8917 : __ __ __ BYT 75 62 4f 4f 54 36 34 3a 20 20 62 4f 4f 54 20 6d : ubOOT64:  bOOT m
00:8927 : __ __ __ BYT 45 4e 55 20 46 4f 52 20 75 4c 54 49 4d 41 54 45 : ENU FOR uLTIMATE
00:8937 : __ __ __ BYT 20 44 45 56 49 43 45 53 00                      :  DEVICES.
--------------------------------------------------------------------
00:8940 : __ __ __ BYT 73 54 41 52 54 49 4e 47 2e 2e 2e 2e 00          : sTARTING.....
--------------------------------------------------------------------
uii_read_file: ; uii_read_file(u8)->void
.s4:
00:894d : a9 00 __ LDA #$00
00:894f : 85 10 __ STA P3 
00:8951 : 8d f6 7f STA $7ff6 ; (cmd + 0)
00:8954 : 8d f8 7f STA $7ff8 ; (cmd + 2)
00:8957 : 8d f9 7f STA $7ff9 ; (cmd + 3)
00:895a : a9 01 __ LDA #$01
00:895c : 8d ff 10 STA $10ff 
00:895f : a9 02 __ LDA #$02
00:8961 : 85 0f __ STA P2 
00:8963 : a9 04 __ LDA #$04
00:8965 : 8d f7 7f STA $7ff7 ; (cmd + 1)
00:8968 : a9 56 __ LDA #$56
00:896a : 8d f8 7f STA $7ff8 ; (cmd + 2)
00:896d : a9 00 __ LDA #$00
00:896f : 8d f9 7f STA $7ff9 ; (cmd + 3)
00:8972 : a9 f6 __ LDA #$f6
00:8974 : 85 0d __ STA P0 
00:8976 : a9 7f __ LDA #$7f
00:8978 : 85 0e __ STA P1 
--------------------------------------------------------------------
uii_sendcommand: ; uii_sendcommand(u8*,u16)->void
.s4:
00:897a : ad ff 10 LDA $10ff 
00:897d : a0 00 __ LDY #$00
00:897f : 84 1b __ STY ACCU + 0 
00:8981 : 84 1c __ STY ACCU + 1 
00:8983 : 91 0d __ STA (P0),y ; (bytes + 0)
.l5:
00:8985 : ad 1c df LDA $df1c 
00:8988 : 29 20 __ AND #$20
00:898a : d0 f9 __ BNE $8985 ; (uii_sendcommand.l5 + 0)
.s6:
00:898c : ad 1c df LDA $df1c 
00:898f : 29 10 __ AND #$10
00:8991 : d0 f2 __ BNE $8985 ; (uii_sendcommand.l5 + 0)
.s7:
00:8993 : a5 1c __ LDA ACCU + 1 
00:8995 : c5 10 __ CMP P3 ; (count + 1)
00:8997 : d0 04 __ BNE $899d ; (uii_sendcommand.s16 + 0)
.s15:
00:8999 : a5 1b __ LDA ACCU + 0 
00:899b : c5 0f __ CMP P2 ; (count + 0)
.s16:
00:899d : b0 2f __ BCS $89ce ; (uii_sendcommand.s8 + 0)
.s12:
00:899f : 18 __ __ CLC
00:89a0 : a5 0d __ LDA P0 ; (bytes + 0)
00:89a2 : 65 1b __ ADC ACCU + 0 
00:89a4 : 85 43 __ STA T3 + 0 
00:89a6 : a5 0e __ LDA P1 ; (bytes + 1)
00:89a8 : 65 1c __ ADC ACCU + 1 
00:89aa : 85 44 __ STA T3 + 1 
00:89ac : a6 1b __ LDX ACCU + 0 
.l13:
00:89ae : a0 00 __ LDY #$00
00:89b0 : b1 43 __ LDA (T3 + 0),y 
00:89b2 : 8d 1d df STA $df1d 
00:89b5 : e6 43 __ INC T3 + 0 
00:89b7 : d0 02 __ BNE $89bb ; (uii_sendcommand.s19 + 0)
.s18:
00:89b9 : e6 44 __ INC T3 + 1 
.s19:
00:89bb : e8 __ __ INX
00:89bc : d0 02 __ BNE $89c0 ; (uii_sendcommand.s21 + 0)
.s20:
00:89be : e6 1c __ INC ACCU + 1 
.s21:
00:89c0 : a5 1c __ LDA ACCU + 1 
00:89c2 : c5 10 __ CMP P3 ; (count + 1)
00:89c4 : 90 e8 __ BCC $89ae ; (uii_sendcommand.l13 + 0)
.s22:
00:89c6 : d0 04 __ BNE $89cc ; (uii_sendcommand.s17 + 0)
.s14:
00:89c8 : e4 0f __ CPX P2 ; (count + 0)
00:89ca : 90 e2 __ BCC $89ae ; (uii_sendcommand.l13 + 0)
.s17:
00:89cc : 86 1b __ STX ACCU + 0 
.s8:
00:89ce : ad 1c df LDA $df1c 
00:89d1 : 09 01 __ ORA #$01
00:89d3 : 8d 1c df STA $df1c 
00:89d6 : ad 1c df LDA $df1c 
00:89d9 : 29 04 __ AND #$04
00:89db : c9 04 __ CMP #$04
00:89dd : d0 0b __ BNE $89ea ; (uii_sendcommand.l9 + 0)
.s11:
00:89df : ad 1c df LDA $df1c 
00:89e2 : 09 08 __ ORA #$08
00:89e4 : 8d 1c df STA $df1c 
00:89e7 : 4c 85 0f JMP $0f85 
.l9:
00:89ea : ad 1c df LDA $df1c 
00:89ed : 29 20 __ AND #$20
00:89ef : d0 09 __ BNE $89fa ; (uii_sendcommand.s3 + 0)
.s10:
00:89f1 : ad 1c df LDA $df1c 
00:89f4 : 29 10 __ AND #$10
00:89f6 : c9 10 __ CMP #$10
00:89f8 : f0 f0 __ BEQ $89ea ; (uii_sendcommand.l9 + 0)
.s3:
00:89fa : 60 __ __ RTS
--------------------------------------------------------------------
uii_readdata: ; uii_readdata()->void
.s4:
00:89fb : a9 00 __ LDA #$00
00:89fd : 8d c8 49 STA $49c8 ; (uii_data + 0)
00:8a00 : a8 __ __ TAY
00:8a01 : f0 0d __ BEQ $8a10 ; (uii_readdata.l5 + 0)
.s8:
00:8a03 : ad 1e df LDA $df1e 
00:8a06 : 91 1b __ STA (ACCU + 0),y 
00:8a08 : 98 __ __ TYA
00:8a09 : 18 __ __ CLC
00:8a0a : 69 01 __ ADC #$01
00:8a0c : a8 __ __ TAY
00:8a0d : 8a __ __ TXA
00:8a0e : 69 00 __ ADC #$00
.l5:
00:8a10 : aa __ __ TAX
00:8a11 : a9 c8 __ LDA #$c8
00:8a13 : 85 1b __ STA ACCU + 0 
00:8a15 : 8a __ __ TXA
00:8a16 : 18 __ __ CLC
00:8a17 : 69 49 __ ADC #$49
00:8a19 : 85 1c __ STA ACCU + 1 
00:8a1b : ad 1c df LDA $df1c 
00:8a1e : 29 80 __ AND #$80
00:8a20 : c9 80 __ CMP #$80
00:8a22 : d0 07 __ BNE $8a2b ; (uii_readdata.s6 + 0)
.s7:
00:8a24 : e0 02 __ CPX #$02
00:8a26 : d0 db __ BNE $8a03 ; (uii_readdata.s8 + 0)
.s9:
00:8a28 : 98 __ __ TYA
00:8a29 : d0 d8 __ BNE $8a03 ; (uii_readdata.s8 + 0)
.s6:
00:8a2b : a9 00 __ LDA #$00
00:8a2d : 91 1b __ STA (ACCU + 0),y 
.s3:
00:8a2f : 60 __ __ RTS
--------------------------------------------------------------------
uii_readstatus: ; uii_readstatus()->void
.s4:
00:8a30 : a9 00 __ LDA #$00
00:8a32 : 8d c9 4b STA $4bc9 ; (uii_status + 0)
00:8a35 : a8 __ __ TAY
00:8a36 : f0 0d __ BEQ $8a45 ; (uii_readstatus.l5 + 0)
.s8:
00:8a38 : ad 1f df LDA $df1f 
00:8a3b : 91 1b __ STA (ACCU + 0),y 
00:8a3d : 98 __ __ TYA
00:8a3e : 18 __ __ CLC
00:8a3f : 69 01 __ ADC #$01
00:8a41 : a8 __ __ TAY
00:8a42 : 8a __ __ TXA
00:8a43 : 69 00 __ ADC #$00
.l5:
00:8a45 : aa __ __ TAX
00:8a46 : a9 c9 __ LDA #$c9
00:8a48 : 85 1b __ STA ACCU + 0 
00:8a4a : 8a __ __ TXA
00:8a4b : 18 __ __ CLC
00:8a4c : 69 4b __ ADC #$4b
00:8a4e : 85 1c __ STA ACCU + 1 
00:8a50 : ad 1c df LDA $df1c 
00:8a53 : 29 40 __ AND #$40
00:8a55 : c9 40 __ CMP #$40
00:8a57 : d0 07 __ BNE $8a60 ; (uii_readstatus.s6 + 0)
.s7:
00:8a59 : e0 01 __ CPX #$01
00:8a5b : d0 db __ BNE $8a38 ; (uii_readstatus.s8 + 0)
.s9:
00:8a5d : 98 __ __ TYA
00:8a5e : d0 d8 __ BNE $8a38 ; (uii_readstatus.s8 + 0)
.s6:
00:8a60 : a9 00 __ LDA #$00
00:8a62 : 91 1b __ STA (ACCU + 0),y 
.s3:
00:8a64 : 60 __ __ RTS
--------------------------------------------------------------------
uii_change_dir: ; uii_change_dir(u8*)->void
.s4:
00:8a65 : a9 78 __ LDA #$78
00:8a67 : 85 0d __ STA P0 
00:8a69 : 20 2f 22 JSR $222f 
00:8a6c : a9 22 __ LDA #$22
00:8a6e : 85 0e __ STA P1 
00:8a70 : 18 __ __ CLC
00:8a71 : a5 1b __ LDA ACCU + 0 
00:8a73 : 69 02 __ ADC #$02
00:8a75 : 85 1b __ STA ACCU + 0 
00:8a77 : 90 02 __ BCC $8a7b ; (uii_change_dir.s10 + 0)
.s9:
00:8a79 : e6 1c __ INC ACCU + 1 
.s10:
00:8a7b : 20 25 20 JSR $2025 
00:8a7e : a5 1b __ LDA ACCU + 0 
00:8a80 : 85 45 __ STA T1 + 0 
00:8a82 : a5 1c __ LDA ACCU + 1 
00:8a84 : 85 46 __ STA T1 + 1 
00:8a86 : a9 00 __ LDA #$00
00:8a88 : a8 __ __ TAY
00:8a89 : 91 1b __ STA (ACCU + 0),y 
00:8a8b : a9 11 __ LDA #$11
00:8a8d : c8 __ __ INY
00:8a8e : 91 1b __ STA (ACCU + 0),y 
00:8a90 : 20 fb 0e JSR $0efb 
00:8a93 : a5 1b __ LDA ACCU + 0 
00:8a95 : 05 1c __ ORA ACCU + 1 
00:8a97 : f0 23 __ BEQ $8abc ; (uii_change_dir.s5 + 0)
.s6:
00:8a99 : a9 00 __ LDA #$00
00:8a9b : 85 47 __ STA T2 + 0 
.l8:
00:8a9d : a9 22 __ LDA #$22
00:8a9f : 85 0e __ STA P1 
00:8aa1 : a6 47 __ LDX T2 + 0 
00:8aa3 : 8a __ __ TXA
00:8aa4 : 18 __ __ CLC
00:8aa5 : 69 02 __ ADC #$02
00:8aa7 : a8 __ __ TAY
00:8aa8 : bd 78 22 LDA $2278,x 
00:8aab : 91 45 __ STA (T1 + 0),y 
00:8aad : 20 fb 0e JSR $0efb 
00:8ab0 : e6 47 __ INC T2 + 0 
00:8ab2 : a5 1c __ LDA ACCU + 1 
00:8ab4 : d0 e7 __ BNE $8a9d ; (uii_change_dir.l8 + 0)
.s7:
00:8ab6 : a5 47 __ LDA T2 + 0 
00:8ab8 : c5 1b __ CMP ACCU + 0 
00:8aba : 90 e1 __ BCC $8a9d ; (uii_change_dir.l8 + 0)
.s5:
00:8abc : a9 01 __ LDA #$01
00:8abe : 8d ff 10 STA $10ff 
00:8ac1 : 20 2f 22 JSR $222f 
00:8ac4 : a5 45 __ LDA T1 + 0 
00:8ac6 : 85 0d __ STA P0 
00:8ac8 : a5 46 __ LDA T1 + 1 
00:8aca : 85 0e __ STA P1 
00:8acc : 18 __ __ CLC
00:8acd : a5 1b __ LDA ACCU + 0 
00:8acf : 69 02 __ ADC #$02
00:8ad1 : 85 0f __ STA P2 
00:8ad3 : a5 1c __ LDA ACCU + 1 
00:8ad5 : 69 00 __ ADC #$00
00:8ad7 : 85 10 __ STA P3 
00:8ad9 : 20 7a 0f JSR $0f7a 
00:8adc : 20 1d 21 JSR $211d 
00:8adf : 20 30 10 JSR $1030 
--------------------------------------------------------------------
uii_accept: ; uii_accept()->void
.s4:
00:8ae2 : ad 1c df LDA $df1c 
00:8ae5 : 09 02 __ ORA #$02
00:8ae7 : 8d 1c df STA $df1c 
.l5:
00:8aea : ad 1c df LDA $df1c 
00:8aed : 29 02 __ AND #$02
00:8aef : d0 f9 __ BNE $8aea ; (uii_accept.l5 + 0)
.s3:
00:8af1 : 60 __ __ RTS
--------------------------------------------------------------------
uii_abort: ; uii_abort()->void
.s4:
00:8af2 : ad 1c df LDA $df1c 
00:8af5 : 09 04 __ ORA #$04
00:8af7 : 8d 1c df STA $df1c 
.s3:
00:8afa : 60 __ __ RTS
--------------------------------------------------------------------
00:8afb : __ __ __ BYT 6f 4e 00                                        : oN.
--------------------------------------------------------------------
00:8afe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
uii_target:
00:8aff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
00:8b00 : __ __ __ BYT 56 32 30 2d 32 30 32 35 30 39 31 30 2d 31 32 30 : V20-20250910-120
00:8b10 : __ __ __ BYT 33 00                                           : 3.
--------------------------------------------------------------------
cwin_put_string: ; cwin_put_string(struct CharWin*,const u8*,u8)->void
.s4:
00:8b12 : ad 5b 49 LDA $495b ; (cw + 5)
00:8b15 : 0a __ __ ASL
00:8b16 : aa __ __ TAX
00:8b17 : bd 36 22 LDA $2236,x 
00:8b1a : 6d 5a 49 ADC $495a ; (cw + 4)
00:8b1d : 85 1b __ STA ACCU + 0 
00:8b1f : bd 37 22 LDA $2237,x 
00:8b22 : 69 00 __ ADC #$00
00:8b24 : 85 1c __ STA ACCU + 1 
00:8b26 : ad 5e 49 LDA $495e ; (cw + 8)
00:8b29 : 65 1b __ ADC ACCU + 0 
00:8b2b : 85 43 __ STA T1 + 0 
00:8b2d : ad 5f 49 LDA $495f ; (cw + 9)
00:8b30 : 65 1c __ ADC ACCU + 1 
00:8b32 : 85 44 __ STA T1 + 1 
00:8b34 : ad 60 49 LDA $4960 ; (cw + 10)
00:8b37 : 18 __ __ CLC
00:8b38 : 65 1b __ ADC ACCU + 0 
00:8b3a : 85 1b __ STA ACCU + 0 
00:8b3c : ad 61 49 LDA $4961 ; (cw + 11)
00:8b3f : 65 1c __ ADC ACCU + 1 
00:8b41 : 85 1c __ STA ACCU + 1 
00:8b43 : a0 00 __ LDY #$00
00:8b45 : b1 0d __ LDA (P0),y ; (str + 0)
00:8b47 : f0 16 __ BEQ $8b5f ; (cwin_put_string.s5 + 0)
.l7:
00:8b49 : 4a __ __ LSR
00:8b4a : 4a __ __ LSR
00:8b4b : 4a __ __ LSR
00:8b4c : 4a __ __ LSR
00:8b4d : 4a __ __ LSR
00:8b4e : aa __ __ TAX
00:8b4f : bd 70 22 LDA $2270,x 
00:8b52 : 51 0d __ EOR (P0),y ; (str + 0)
00:8b54 : 91 43 __ STA (T1 + 0),y 
00:8b56 : a9 07 __ LDA #$07
00:8b58 : 91 1b __ STA (ACCU + 0),y 
00:8b5a : c8 __ __ INY
00:8b5b : b1 0d __ LDA (P0),y ; (str + 0)
00:8b5d : d0 ea __ BNE $8b49 ; (cwin_put_string.l7 + 0)
.s5:
00:8b5f : 98 __ __ TYA
00:8b60 : 18 __ __ CLC
00:8b61 : 6d 5a 49 ADC $495a ; (cw + 4)
00:8b64 : cd 58 49 CMP $4958 ; (cw + 2)
00:8b67 : 90 05 __ BCC $8b6e ; (cwin_put_string.s3 + 0)
.s6:
00:8b69 : a9 00 __ LDA #$00
00:8b6b : ee 5b 49 INC $495b ; (cw + 5)
.s3:
00:8b6e : 8d 5a 49 STA $495a ; (cw + 4)
00:8b71 : 60 __ __ RTS
--------------------------------------------------------------------
00:8b72 : __ __ __ BYT 6e 4f 20 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d : nO uLTIMATE cOMM
00:8b82 : __ __ __ BYT 41 4e 44 20 69 4e 54 45 52 46 41 43 45 20 45 4e : AND iNTERFACE EN
00:8b92 : __ __ __ BYT 41 42 4c 45 44 2e 00                            : ABLED..
--------------------------------------------------------------------
cwin_cursor_newline: ; cwin_cursor_newline(struct CharWin*)->void
.s4:
00:8b99 : ad 5b 49 LDA $495b ; (cw + 5)
00:8b9c : 18 __ __ CLC
00:8b9d : 69 01 __ ADC #$01
00:8b9f : a8 __ __ TAY
00:8ba0 : a9 00 __ LDA #$00
00:8ba2 : 8d 5a 49 STA $495a ; (cw + 4)
00:8ba5 : 2a __ __ ROL
00:8ba6 : d0 08 __ BNE $8bb0 ; (cwin_cursor_newline.s3 + 0)
.s6:
00:8ba8 : cc 59 49 CPY $4959 ; (cw + 3)
00:8bab : b0 03 __ BCS $8bb0 ; (cwin_cursor_newline.s3 + 0)
.s5:
00:8bad : ee 5b 49 INC $495b ; (cw + 5)
.s3:
00:8bb0 : 60 __ __ RTS
--------------------------------------------------------------------
00:8bb1 : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 20 54 4f 20 45 58 49 : pRESS KEY TO EXI
00:8bc1 : __ __ __ BYT 54 2e 00                                        : T..
--------------------------------------------------------------------
cwin_getch: ; cwin_getch()->void
.s4:
00:8bc4 : 20 e4 ff JSR $ffe4 
00:8bc7 : c9 00 __ CMP #$00
00:8bc9 : f0 f9 __ BEQ $8bc4 ; (cwin_getch.s4 + 0)
00:8bcb : 85 1b __ STA ACCU + 0 
00:8bcd : a9 00 __ LDA #$00
00:8bcf : 85 1c __ STA ACCU + 1 
.s3:
00:8bd1 : 60 __ __ RTS
--------------------------------------------------------------------
00:8bd2 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d 41 4e 44 : uLTIMATE cOMMAND
00:8be2 : __ __ __ BYT 20 69 4e 54 45 52 46 41 43 45 20 44 45 54 45 43 :  iNTERFACE DETEC
00:8bf2 : __ __ __ BYT 54 45 44 2e 00                                  : TED..
--------------------------------------------------------------------
readconfigfile: ; readconfigfile()->void
.s1:
00:8bf7 : 38 __ __ SEC
00:8bf8 : a5 23 __ LDA SP + 0 
00:8bfa : e9 07 __ SBC #$07
00:8bfc : 85 23 __ STA SP + 0 
00:8bfe : b0 02 __ BCS $8c02 ; (readconfigfile.s4 + 0)
00:8c00 : c6 24 __ DEC SP + 1 
.s4:
00:8c02 : 20 65 10 JSR $1065 
00:8c05 : a9 01 __ LDA #$01
00:8c07 : 85 11 __ STA P4 
00:8c09 : 20 9a 12 JSR $129a 
00:8c0c : a9 c9 __ LDA #$c9
00:8c0e : 85 0d __ STA P0 
00:8c10 : a9 13 __ LDA #$13
00:8c12 : 85 10 __ STA P3 
00:8c14 : a9 4b __ LDA #$4b
00:8c16 : 85 0e __ STA P1 
00:8c18 : a9 4b __ LDA #$4b
00:8c1a : 85 0f __ STA P2 
00:8c1c : 20 1e 13 JSR $131e 
00:8c1f : aa __ __ TAX
00:8c20 : f0 1d __ BEQ $8c3f ; (readconfigfile.s5 + 0)
.s9:
00:8c22 : a9 b0 __ LDA #$b0
00:8c24 : a0 05 __ LDY #$05
00:8c26 : 91 23 __ STA (SP + 0),y 
00:8c28 : a9 19 __ LDA #$19
00:8c2a : c8 __ __ INY
00:8c2b : 91 23 __ STA (SP + 0),y 
00:8c2d : 20 51 13 JSR $1351 
00:8c30 : 20 d9 19 JSR $19d9 
.s3:
00:8c33 : 18 __ __ CLC
00:8c34 : a5 23 __ LDA SP + 0 
00:8c36 : 69 07 __ ADC #$07
00:8c38 : 85 23 __ STA SP + 0 
00:8c3a : 90 02 __ BCC $8c3e ; (readconfigfile.s3 + 11)
00:8c3c : e6 24 __ INC SP + 1 
00:8c3e : 60 __ __ RTS
.s5:
00:8c3f : 20 4d 0f JSR $0f4d 
00:8c42 : a9 aa __ LDA #$aa
00:8c44 : 8d fe 7f STA $7ffe ; (sstack + 4)
00:8c47 : a9 1b __ LDA #$1b
00:8c49 : 8d ff 7f STA $7fff ; (sstack + 5)
00:8c4c : 20 e6 1a JSR $1ae6 
00:8c4f : 20 fb 0f JSR $0ffb 
00:8c52 : 20 e2 10 JSR $10e2 
00:8c55 : a2 55 __ LDX #$55
.l6:
00:8c57 : bd c8 49 LDA $49c8,x ; (uii_data + 0)
00:8c5a : 9d 00 49 STA $4900,x ; (cfg + 0)
00:8c5d : ca __ __ DEX
00:8c5e : 10 f7 __ BPL $8c57 ; (readconfigfile.l6 + 0)
.s7:
00:8c60 : ad c8 49 LDA $49c8 ; (uii_data + 0)
00:8c63 : c9 02 __ CMP #$02
00:8c65 : b0 2d __ BCS $8c94 ; (readconfigfile.s10 + 0)
.s8:
00:8c67 : a9 b8 __ LDA #$b8
00:8c69 : a0 05 __ LDY #$05
00:8c6b : 91 23 __ STA (SP + 0),y 
00:8c6d : a9 1b __ LDA #$1b
00:8c6f : c8 __ __ INY
00:8c70 : 91 23 __ STA (SP + 0),y 
00:8c72 : 20 51 13 JSR $1351 
00:8c75 : a9 d8 __ LDA #$d8
00:8c77 : a0 05 __ LDY #$05
00:8c79 : 91 23 __ STA (SP + 0),y 
00:8c7b : a9 1b __ LDA #$1b
00:8c7d : c8 __ __ INY
00:8c7e : 91 23 __ STA (SP + 0),y 
00:8c80 : 20 51 13 JSR $1351 
00:8c83 : a9 00 __ LDA #$00
00:8c85 : a0 05 __ LDY #$05
00:8c87 : 91 23 __ STA (SP + 0),y 
00:8c89 : a9 1c __ LDA #$1c
00:8c8b : c8 __ __ INY
00:8c8c : 91 23 __ STA (SP + 0),y 
00:8c8e : 20 51 13 JSR $1351 
00:8c91 : 20 64 1b JSR $1b64 
.s10:
00:8c94 : 20 6c 1a JSR $1a6c 
00:8c97 : 4c 33 12 JMP $1233 
--------------------------------------------------------------------
uii_open_file: ; uii_open_file(u8,u8*)->void
.s4:
00:8c9a : 20 24 22 JSR $2224 
00:8c9d : a9 22 __ LDA #$22
00:8c9f : 85 0e __ STA P1 
00:8ca1 : 18 __ __ CLC
00:8ca2 : a5 1b __ LDA ACCU + 0 
00:8ca4 : 69 03 __ ADC #$03
00:8ca6 : 85 1b __ STA ACCU + 0 
00:8ca8 : 90 02 __ BCC $8cac ; (uii_open_file.s10 + 0)
.s9:
00:8caa : e6 1c __ INC ACCU + 1 
.s10:
00:8cac : 20 25 20 JSR $2025 
00:8caf : a5 1b __ LDA ACCU + 0 
00:8cb1 : 85 45 __ STA T1 + 0 
00:8cb3 : a5 1c __ LDA ACCU + 1 
00:8cb5 : 85 46 __ STA T1 + 1 
00:8cb7 : a9 00 __ LDA #$00
00:8cb9 : a8 __ __ TAY
00:8cba : 91 1b __ STA (ACCU + 0),y 
00:8cbc : a9 02 __ LDA #$02
00:8cbe : c8 __ __ INY
00:8cbf : 91 1b __ STA (ACCU + 0),y 
00:8cc1 : a5 11 __ LDA P4 ; (attrib + 0)
00:8cc3 : c8 __ __ INY
00:8cc4 : 91 1b __ STA (ACCU + 0),y 
00:8cc6 : 20 fb 0e JSR $0efb 
00:8cc9 : a5 1b __ LDA ACCU + 0 
00:8ccb : 05 1c __ ORA ACCU + 1 
00:8ccd : f0 23 __ BEQ $8cf2 ; (uii_open_file.s5 + 0)
.s6:
00:8ccf : a9 00 __ LDA #$00
00:8cd1 : 85 47 __ STA T2 + 0 
.l8:
00:8cd3 : a9 22 __ LDA #$22
00:8cd5 : 85 0e __ STA P1 
00:8cd7 : a6 47 __ LDX T2 + 0 
00:8cd9 : 8a __ __ TXA
00:8cda : 18 __ __ CLC
00:8cdb : 69 03 __ ADC #$03
00:8cdd : a8 __ __ TAY
00:8cde : bd 80 22 LDA $2280,x 
00:8ce1 : 91 45 __ STA (T1 + 0),y 
00:8ce3 : 20 fb 0e JSR $0efb 
00:8ce6 : e6 47 __ INC T2 + 0 
00:8ce8 : a5 1c __ LDA ACCU + 1 
00:8cea : d0 e7 __ BNE $8cd3 ; (uii_open_file.l8 + 0)
.s7:
00:8cec : a5 47 __ LDA T2 + 0 
00:8cee : c5 1b __ CMP ACCU + 0 
00:8cf0 : 90 e1 __ BCC $8cd3 ; (uii_open_file.l8 + 0)
.s5:
00:8cf2 : a9 01 __ LDA #$01
00:8cf4 : 8d ff 10 STA $10ff 
00:8cf7 : 20 f7 0e JSR $0ef7 
00:8cfa : a5 45 __ LDA T1 + 0 
00:8cfc : 85 0d __ STA P0 
00:8cfe : a5 46 __ LDA T1 + 1 
00:8d00 : 85 0e __ STA P1 
00:8d02 : 18 __ __ CLC
00:8d03 : a5 1b __ LDA ACCU + 0 
00:8d05 : 69 03 __ ADC #$03
00:8d07 : 85 0f __ STA P2 
00:8d09 : a5 1c __ LDA ACCU + 1 
00:8d0b : 69 00 __ ADC #$00
00:8d0d : 85 10 __ STA P3 
00:8d0f : 20 7a 0f JSR $0f7a 
00:8d12 : 20 1d 21 JSR $211d 
00:8d15 : 20 fb 0f JSR $0ffb 
00:8d18 : 20 30 10 JSR $1030 
00:8d1b : 4c e2 10 JMP $10e2 
--------------------------------------------------------------------
strcmp: ; strcmp(const u8*,const u8*)->i8
.s4:
00:8d1e : a0 00 __ LDY #$00
00:8d20 : b1 0d __ LDA (P0),y 
00:8d22 : f0 16 __ BEQ $8d3a ; (strcmp.s4 + 28)
00:8d24 : d1 0f __ CMP (P2),y 
00:8d26 : d0 16 __ BNE $8d3e ; (strcmp.s4 + 32)
00:8d28 : c8 __ __ INY
00:8d29 : b1 0d __ LDA (P0),y 
00:8d2b : f0 0d __ BEQ $8d3a ; (strcmp.s4 + 28)
00:8d2d : d1 0f __ CMP (P2),y 
00:8d2f : d0 0d __ BNE $8d3e ; (strcmp.s4 + 32)
00:8d31 : c8 __ __ INY
00:8d32 : d0 ec __ BNE $8d20 ; (strcmp.s4 + 2)
00:8d34 : e6 0e __ INC P1 
00:8d36 : e6 10 __ INC P3 
00:8d38 : d0 e6 __ BNE $8d20 ; (strcmp.s4 + 2)
00:8d3a : d1 0f __ CMP (P2),y 
00:8d3c : f0 08 __ BEQ $8d46 ; (strcmp.s4 + 40)
00:8d3e : b0 04 __ BCS $8d44 ; (strcmp.s4 + 38)
00:8d40 : a9 ff __ LDA #$ff
00:8d42 : 30 02 __ BMI $8d46 ; (strcmp.s4 + 40)
00:8d44 : a9 01 __ LDA #$01
00:8d46 : 85 1b __ STA ACCU + 0 
.s3:
00:8d48 : a5 1b __ LDA ACCU + 0 
00:8d4a : 60 __ __ RTS
--------------------------------------------------------------------
00:8d4b : __ __ __ BYT 30 30 2c 4f 4b 00                               : 00,OK.
--------------------------------------------------------------------
cwin_console_printf: ; cwin_console_printf(struct CharWin*,u8,const u8*)->void
.s4:
00:8d51 : a9 18 __ LDA #$18
00:8d53 : 85 16 __ STA P9 
00:8d55 : a9 7f __ LDA #$7f
00:8d57 : 85 17 __ STA P10 
00:8d59 : a0 05 __ LDY #$05
00:8d5b : b1 23 __ LDA (SP + 0),y 
00:8d5d : 8d fa 7f STA $7ffa ; (sstack + 0)
00:8d60 : c8 __ __ INY
00:8d61 : b1 23 __ LDA (SP + 0),y 
00:8d63 : 8d fb 7f STA $7ffb ; (sstack + 1)
00:8d66 : 18 __ __ CLC
00:8d67 : a5 23 __ LDA SP + 0 
00:8d69 : 69 07 __ ADC #$07
00:8d6b : 8d fc 7f STA $7ffc ; (sstack + 2)
00:8d6e : a5 24 __ LDA SP + 1 
00:8d70 : 69 00 __ ADC #$00
00:8d72 : 8d fd 7f STA $7ffd ; (sstack + 3)
00:8d75 : 20 ff 13 JSR $13ff 
00:8d78 : a9 18 __ LDA #$18
00:8d7a : 85 13 __ STA P6 ; (fmt + 3)
00:8d7c : a9 7f __ LDA #$7f
00:8d7e : 85 14 __ STA P7 
--------------------------------------------------------------------
cwin_console_write_string: ; cwin_console_write_string(struct CharWin*,const u8*,u8)->void
.s4:
00:8d80 : ad 5a 49 LDA $495a ; (cw + 4)
00:8d83 : 8d 5c 49 STA $495c ; (cw + 6)
00:8d86 : ad 5b 49 LDA $495b ; (cw + 5)
00:8d89 : 8d 5d 49 STA $495d ; (cw + 7)
00:8d8c : a9 00 __ LDA #$00
00:8d8e : 85 4a __ STA T4 + 0 
00:8d90 : f0 02 __ BEQ $8d94 ; (cwin_console_write_string.l5 + 0)
.s9:
00:8d92 : e6 4a __ INC T4 + 0 
.l5:
00:8d94 : a4 4a __ LDY T4 + 0 
00:8d96 : b1 13 __ LDA (P6),y ; (chars + 0)
00:8d98 : d0 01 __ BNE $8d9b ; (cwin_console_write_string.s6 + 0)
.s3:
00:8d9a : 60 __ __ RTS
.s6:
00:8d9b : c9 0a __ CMP #$0a
00:8d9d : d0 06 __ BNE $8da5 ; (cwin_console_write_string.s7 + 0)
.s11:
00:8d9f : 20 ef 0d JSR $0def 
00:8da2 : 4c 92 13 JMP $1392 
.s7:
00:8da5 : 85 4b __ STA T5 + 0 
00:8da7 : ad 5a 49 LDA $495a ; (cw + 4)
00:8daa : cd 58 49 CMP $4958 ; (cw + 2)
00:8dad : d0 03 __ BNE $8db2 ; (cwin_console_write_string.s8 + 0)
.s10:
00:8daf : 20 ef 0d JSR $0def 
.s8:
00:8db2 : ad 5b 49 LDA $495b ; (cw + 5)
00:8db5 : 0a __ __ ASL
00:8db6 : aa __ __ TAX
00:8db7 : bd 36 22 LDA $2236,x 
00:8dba : 6d 5a 49 ADC $495a ; (cw + 4)
00:8dbd : 85 43 __ STA T0 + 0 
00:8dbf : bd 37 22 LDA $2237,x 
00:8dc2 : 69 00 __ ADC #$00
00:8dc4 : 85 44 __ STA T0 + 1 
00:8dc6 : a5 4b __ LDA T5 + 0 
00:8dc8 : 4a __ __ LSR
00:8dc9 : 4a __ __ LSR
00:8dca : 4a __ __ LSR
00:8dcb : 4a __ __ LSR
00:8dcc : 4a __ __ LSR
00:8dcd : aa __ __ TAX
00:8dce : ad 5e 49 LDA $495e ; (cw + 8)
00:8dd1 : 18 __ __ CLC
00:8dd2 : 65 43 __ ADC T0 + 0 
00:8dd4 : 85 45 __ STA T1 + 0 
00:8dd6 : ad 5f 49 LDA $495f ; (cw + 9)
00:8dd9 : 65 44 __ ADC T0 + 1 
00:8ddb : 85 46 __ STA T1 + 1 
00:8ddd : bd 70 22 LDA $2270,x 
00:8de0 : 45 4b __ EOR T5 + 0 
00:8de2 : a0 00 __ LDY #$00
00:8de4 : 91 45 __ STA (T1 + 0),y 
00:8de6 : ad 60 49 LDA $4960 ; (cw + 10)
00:8de9 : 18 __ __ CLC
00:8dea : 65 43 __ ADC T0 + 0 
00:8dec : 85 45 __ STA T1 + 0 
00:8dee : ad 61 49 LDA $4961 ; (cw + 11)
00:8df1 : 65 44 __ ADC T0 + 1 
00:8df3 : 85 46 __ STA T1 + 1 
00:8df5 : a9 07 __ LDA #$07
00:8df7 : 91 45 __ STA (T1 + 0),y 
00:8df9 : ee 5a 49 INC $495a ; (cw + 4)
00:8dfc : 4c 92 13 JMP $1392 
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->void
.s4:
00:8dff : ad fa 7f LDA $7ffa ; (sstack + 0)
00:8e02 : 85 47 __ STA T3 + 0 
00:8e04 : a9 00 __ LDA #$00
00:8e06 : 85 1b __ STA ACCU + 0 ; (fps + 0)
00:8e08 : ad fb 7f LDA $7ffb ; (sstack + 1)
00:8e0b : 85 48 __ STA T3 + 1 
.l5:
00:8e0d : a0 00 __ LDY #$00
00:8e0f : b1 47 __ LDA (T3 + 0),y 
00:8e11 : d0 05 __ BNE $8e18 ; (sformat.s7 + 0)
.s6:
00:8e13 : a4 1b __ LDY ACCU + 0 ; (fps + 0)
00:8e15 : 91 16 __ STA (P9),y ; (buff + 0)
.s3:
00:8e17 : 60 __ __ RTS
.s7:
00:8e18 : c9 25 __ CMP #$25
00:8e1a : f0 22 __ BEQ $8e3e ; (sformat.s10 + 0)
.s8:
00:8e1c : a4 1b __ LDY ACCU + 0 ; (fps + 0)
00:8e1e : 91 16 __ STA (P9),y ; (buff + 0)
00:8e20 : e6 47 __ INC T3 + 0 
00:8e22 : d0 02 __ BNE $8e26 ; (sformat.s102 + 0)
.s101:
00:8e24 : e6 48 __ INC T3 + 1 
.s102:
00:8e26 : c8 __ __ INY
00:8e27 : 84 1b __ STY ACCU + 0 ; (fps + 0)
00:8e29 : 98 __ __ TYA
00:8e2a : c0 28 __ CPY #$28
00:8e2c : 90 df __ BCC $8e0d ; (sformat.l5 + 0)
.s9:
00:8e2e : 18 __ __ CLC
00:8e2f : 65 16 __ ADC P9 ; (buff + 0)
00:8e31 : 85 16 __ STA P9 ; (buff + 0)
00:8e33 : 90 02 __ BCC $8e37 ; (sformat.s104 + 0)
.s103:
00:8e35 : e6 17 __ INC P10 ; (buff + 1)
.s104:
00:8e37 : a9 00 __ LDA #$00
.s77:
00:8e39 : 85 1b __ STA ACCU + 0 ; (fps + 0)
00:8e3b : 4c 0d 14 JMP $140d 
.s10:
00:8e3e : 8c e5 7f STY $7fe5 ; (si + 5)
00:8e41 : 8c e8 7f STY $7fe8 ; (si + 8)
00:8e44 : a9 0a __ LDA #$0a
00:8e46 : 8d e4 7f STA $7fe4 ; (si + 4)
00:8e49 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
00:8e4b : f0 0c __ BEQ $8e59 ; (sformat.s11 + 0)
.s75:
00:8e4d : 84 1b __ STY ACCU + 0 ; (fps + 0)
00:8e4f : 18 __ __ CLC
00:8e50 : 65 16 __ ADC P9 ; (buff + 0)
00:8e52 : 85 16 __ STA P9 ; (buff + 0)
00:8e54 : 90 02 __ BCC $8e58 ; (sformat.s88 + 0)
.s87:
00:8e56 : e6 17 __ INC P10 ; (buff + 1)
.s88:
00:8e58 : 98 __ __ TYA
.s11:
00:8e59 : 8d e6 7f STA $7fe6 ; (si + 6)
00:8e5c : 8d e7 7f STA $7fe7 ; (si + 7)
00:8e5f : a0 01 __ LDY #$01
00:8e61 : b1 47 __ LDA (T3 + 0),y 
00:8e63 : a2 20 __ LDX #$20
00:8e65 : 8e e0 7f STX $7fe0 ; (si + 0)
00:8e68 : a2 00 __ LDX #$00
00:8e6a : 8e e1 7f STX $7fe1 ; (si + 1)
00:8e6d : ca __ __ DEX
00:8e6e : 8e e2 7f STX $7fe2 ; (si + 2)
00:8e71 : aa __ __ TAX
00:8e72 : a9 02 __ LDA #$02
00:8e74 : d0 07 __ BNE $8e7d ; (sformat.l12 + 0)
.s71:
00:8e76 : a0 00 __ LDY #$00
00:8e78 : b1 47 __ LDA (T3 + 0),y 
00:8e7a : aa __ __ TAX
00:8e7b : a9 01 __ LDA #$01
.l12:
00:8e7d : 18 __ __ CLC
00:8e7e : 65 47 __ ADC T3 + 0 
00:8e80 : 85 47 __ STA T3 + 0 
00:8e82 : 90 02 __ BCC $8e86 ; (sformat.s90 + 0)
.s89:
00:8e84 : e6 48 __ INC T3 + 1 
.s90:
00:8e86 : 8a __ __ TXA
00:8e87 : e0 2b __ CPX #$2b
00:8e89 : d0 07 __ BNE $8e92 ; (sformat.s13 + 0)
.s74:
00:8e8b : a9 01 __ LDA #$01
00:8e8d : 8d e6 7f STA $7fe6 ; (si + 6)
00:8e90 : d0 e4 __ BNE $8e76 ; (sformat.s71 + 0)
.s13:
00:8e92 : c9 30 __ CMP #$30
00:8e94 : d0 06 __ BNE $8e9c ; (sformat.s14 + 0)
.s73:
00:8e96 : 8d e0 7f STA $7fe0 ; (si + 0)
00:8e99 : 4c 76 14 JMP $1476 
.s14:
00:8e9c : c9 23 __ CMP #$23
00:8e9e : d0 07 __ BNE $8ea7 ; (sformat.s15 + 0)
.s72:
00:8ea0 : a9 01 __ LDA #$01
00:8ea2 : 8d e8 7f STA $7fe8 ; (si + 8)
00:8ea5 : d0 cf __ BNE $8e76 ; (sformat.s71 + 0)
.s15:
00:8ea7 : c9 2d __ CMP #$2d
00:8ea9 : d0 07 __ BNE $8eb2 ; (sformat.s16 + 0)
.s70:
00:8eab : a9 01 __ LDA #$01
00:8ead : 8d e7 7f STA $7fe7 ; (si + 7)
00:8eb0 : d0 c4 __ BNE $8e76 ; (sformat.s71 + 0)
.s16:
00:8eb2 : 85 1d __ STA ACCU + 2 
00:8eb4 : c9 30 __ CMP #$30
00:8eb6 : 90 31 __ BCC $8ee9 ; (sformat.s17 + 0)
.s65:
00:8eb8 : c9 3a __ CMP #$3a
00:8eba : b0 2d __ BCS $8ee9 ; (sformat.s17 + 0)
.s66:
00:8ebc : a9 00 __ LDA #$00
00:8ebe : 85 1c __ STA ACCU + 1 ; (fps + 1)
.l67:
00:8ec0 : a5 1c __ LDA ACCU + 1 ; (fps + 1)
00:8ec2 : 0a __ __ ASL
00:8ec3 : 0a __ __ ASL
00:8ec4 : 18 __ __ CLC
00:8ec5 : 65 1c __ ADC ACCU + 1 ; (fps + 1)
00:8ec7 : 0a __ __ ASL
00:8ec8 : 18 __ __ CLC
00:8ec9 : 65 1d __ ADC ACCU + 2 
00:8ecb : 38 __ __ SEC
00:8ecc : e9 30 __ SBC #$30
00:8ece : 85 1c __ STA ACCU + 1 ; (fps + 1)
00:8ed0 : a0 00 __ LDY #$00
00:8ed2 : b1 47 __ LDA (T3 + 0),y 
00:8ed4 : 85 1d __ STA ACCU + 2 
00:8ed6 : e6 47 __ INC T3 + 0 
00:8ed8 : d0 02 __ BNE $8edc ; (sformat.s100 + 0)
.s99:
00:8eda : e6 48 __ INC T3 + 1 
.s100:
00:8edc : c9 30 __ CMP #$30
00:8ede : 90 04 __ BCC $8ee4 ; (sformat.s68 + 0)
.s69:
00:8ee0 : c9 3a __ CMP #$3a
00:8ee2 : 90 dc __ BCC $8ec0 ; (sformat.l67 + 0)
.s68:
00:8ee4 : a6 1c __ LDX ACCU + 1 ; (fps + 1)
00:8ee6 : 8e e1 7f STX $7fe1 ; (si + 1)
.s17:
00:8ee9 : c9 2e __ CMP #$2e
00:8eeb : d0 2d __ BNE $8f1a ; (sformat.s18 + 0)
.s60:
00:8eed : a9 00 __ LDA #$00
00:8eef : f0 0e __ BEQ $8eff ; (sformat.l61 + 0)
.s64:
00:8ef1 : a5 43 __ LDA T0 + 0 
00:8ef3 : 0a __ __ ASL
00:8ef4 : 0a __ __ ASL
00:8ef5 : 18 __ __ CLC
00:8ef6 : 65 43 __ ADC T0 + 0 
00:8ef8 : 0a __ __ ASL
00:8ef9 : 18 __ __ CLC
00:8efa : 65 1d __ ADC ACCU + 2 
00:8efc : 38 __ __ SEC
00:8efd : e9 30 __ SBC #$30
.l61:
00:8eff : 85 43 __ STA T0 + 0 
00:8f01 : a0 00 __ LDY #$00
00:8f03 : b1 47 __ LDA (T3 + 0),y 
00:8f05 : 85 1d __ STA ACCU + 2 
00:8f07 : e6 47 __ INC T3 + 0 
00:8f09 : d0 02 __ BNE $8f0d ; (sformat.s92 + 0)
.s91:
00:8f0b : e6 48 __ INC T3 + 1 
.s92:
00:8f0d : c9 30 __ CMP #$30
00:8f0f : 90 04 __ BCC $8f15 ; (sformat.s62 + 0)
.s63:
00:8f11 : c9 3a __ CMP #$3a
00:8f13 : 90 dc __ BCC $8ef1 ; (sformat.s64 + 0)
.s62:
00:8f15 : a6 43 __ LDX T0 + 0 
00:8f17 : 8e e2 7f STX $7fe2 ; (si + 2)
.s18:
00:8f1a : c9 64 __ CMP #$64
00:8f1c : f0 0c __ BEQ $8f2a ; (sformat.s59 + 0)
.s19:
00:8f1e : c9 44 __ CMP #$44
00:8f20 : f0 08 __ BEQ $8f2a ; (sformat.s59 + 0)
.s20:
00:8f22 : c9 69 __ CMP #$69
00:8f24 : f0 04 __ BEQ $8f2a ; (sformat.s59 + 0)
.s21:
00:8f26 : c9 49 __ CMP #$49
00:8f28 : d0 07 __ BNE $8f31 ; (sformat.s22 + 0)
.s59:
00:8f2a : a9 01 __ LDA #$01
.s79:
00:8f2c : 85 13 __ STA P6 
00:8f2e : 4c c9 16 JMP $16c9 
.s22:
00:8f31 : c9 75 __ CMP #$75
00:8f33 : f0 04 __ BEQ $8f39 ; (sformat.s58 + 0)
.s23:
00:8f35 : c9 55 __ CMP #$55
00:8f37 : d0 04 __ BNE $8f3d ; (sformat.s24 + 0)
.s58:
00:8f39 : a9 00 __ LDA #$00
00:8f3b : f0 ef __ BEQ $8f2c ; (sformat.s79 + 0)
.s24:
00:8f3d : c9 78 __ CMP #$78
00:8f3f : f0 04 __ BEQ $8f45 ; (sformat.s56 + 0)
.s25:
00:8f41 : c9 58 __ CMP #$58
00:8f43 : d0 18 __ BNE $8f5d ; (sformat.s26 + 0)
.s56:
00:8f45 : a9 00 __ LDA #$00
00:8f47 : 8d e5 7f STA $7fe5 ; (si + 5)
00:8f4a : 85 13 __ STA P6 
00:8f4c : a9 10 __ LDA #$10
00:8f4e : 8d e4 7f STA $7fe4 ; (si + 4)
00:8f51 : a5 1d __ LDA ACCU + 2 
00:8f53 : 29 e0 __ AND #$e0
00:8f55 : 09 01 __ ORA #$01
00:8f57 : 8d e3 7f STA $7fe3 ; (si + 3)
00:8f5a : 4c c9 16 JMP $16c9 
.s26:
00:8f5d : c9 6c __ CMP #$6c
00:8f5f : d0 03 __ BNE $8f64 ; (sformat.s27 + 0)
00:8f61 : 4c 3e 16 JMP $163e 
.s27:
00:8f64 : c9 4c __ CMP #$4c
00:8f66 : f0 f9 __ BEQ $8f61 ; (sformat.s26 + 4)
.s28:
00:8f68 : c9 73 __ CMP #$73
00:8f6a : f0 3c __ BEQ $8fa8 ; (sformat.s36 + 0)
.s29:
00:8f6c : c9 53 __ CMP #$53
00:8f6e : f0 38 __ BEQ $8fa8 ; (sformat.s36 + 0)
.s30:
00:8f70 : c9 63 __ CMP #$63
00:8f72 : f0 13 __ BEQ $8f87 ; (sformat.s35 + 0)
.s31:
00:8f74 : c9 43 __ CMP #$43
00:8f76 : f0 0f __ BEQ $8f87 ; (sformat.s35 + 0)
.s32:
00:8f78 : aa __ __ TAX
00:8f79 : d0 03 __ BNE $8f7e ; (sformat.s33 + 0)
00:8f7b : 4c 0d 14 JMP $140d 
.s33:
00:8f7e : a0 00 __ LDY #$00
00:8f80 : 91 16 __ STA (P9),y ; (buff + 0)
.s34:
00:8f82 : a9 01 __ LDA #$01
00:8f84 : 4c 39 14 JMP $1439 
.s35:
00:8f87 : ad fc 7f LDA $7ffc ; (sstack + 2)
00:8f8a : 85 43 __ STA T0 + 0 
00:8f8c : ad fd 7f LDA $7ffd ; (sstack + 3)
00:8f8f : 85 44 __ STA T0 + 1 
00:8f91 : a0 00 __ LDY #$00
00:8f93 : b1 43 __ LDA (T0 + 0),y 
00:8f95 : 91 16 __ STA (P9),y ; (buff + 0)
00:8f97 : a5 43 __ LDA T0 + 0 
00:8f99 : 69 01 __ ADC #$01
00:8f9b : 8d fc 7f STA $7ffc ; (sstack + 2)
00:8f9e : a5 44 __ LDA T0 + 1 
00:8fa0 : 69 00 __ ADC #$00
00:8fa2 : 8d fd 7f STA $7ffd ; (sstack + 3)
00:8fa5 : 4c 82 15 JMP $1582 
.s36:
00:8fa8 : ad fc 7f LDA $7ffc ; (sstack + 2)
00:8fab : 85 43 __ STA T0 + 0 
00:8fad : 69 01 __ ADC #$01
00:8faf : 8d fc 7f STA $7ffc ; (sstack + 2)
00:8fb2 : ad fd 7f LDA $7ffd ; (sstack + 3)
00:8fb5 : 85 44 __ STA T0 + 1 
00:8fb7 : 69 00 __ ADC #$00
00:8fb9 : 8d fd 7f STA $7ffd ; (sstack + 3)
00:8fbc : a0 00 __ LDY #$00
00:8fbe : 84 1d __ STY ACCU + 2 
00:8fc0 : b1 43 __ LDA (T0 + 0),y 
00:8fc2 : aa __ __ TAX
00:8fc3 : c8 __ __ INY
00:8fc4 : b1 43 __ LDA (T0 + 0),y 
00:8fc6 : 86 43 __ STX T0 + 0 
00:8fc8 : 85 44 __ STA T0 + 1 
00:8fca : ad e1 7f LDA $7fe1 ; (si + 1)
00:8fcd : f0 0c __ BEQ $8fdb ; (sformat.s37 + 0)
.s84:
00:8fcf : 88 __ __ DEY
00:8fd0 : b1 43 __ LDA (T0 + 0),y 
00:8fd2 : f0 05 __ BEQ $8fd9 ; (sformat.s85 + 0)
.l43:
00:8fd4 : c8 __ __ INY
00:8fd5 : b1 43 __ LDA (T0 + 0),y 
00:8fd7 : d0 fb __ BNE $8fd4 ; (sformat.l43 + 0)
.s85:
00:8fd9 : 84 1d __ STY ACCU + 2 
.s37:
00:8fdb : ad e7 7f LDA $7fe7 ; (si + 7)
00:8fde : 85 1c __ STA ACCU + 1 ; (fps + 1)
00:8fe0 : d0 19 __ BNE $8ffb ; (sformat.s38 + 0)
.s82:
00:8fe2 : a6 1d __ LDX ACCU + 2 
00:8fe4 : ec e1 7f CPX $7fe1 ; (si + 1)
00:8fe7 : a0 00 __ LDY #$00
00:8fe9 : b0 0c __ BCS $8ff7 ; (sformat.s83 + 0)
.l42:
00:8feb : ad e0 7f LDA $7fe0 ; (si + 0)
00:8fee : 91 16 __ STA (P9),y ; (buff + 0)
00:8ff0 : c8 __ __ INY
00:8ff1 : e8 __ __ INX
00:8ff2 : ec e1 7f CPX $7fe1 ; (si + 1)
00:8ff5 : 90 f4 __ BCC $8feb ; (sformat.l42 + 0)
.s83:
00:8ff7 : 86 1d __ STX ACCU + 2 
00:8ff9 : 84 1b __ STY ACCU + 0 ; (fps + 0)
.s38:
00:8ffb : a0 00 __ LDY #$00
00:8ffd : b1 43 __ LDA (T0 + 0),y 
00:8fff : f0 1c __ BEQ $901d ; (sformat.s39 + 0)
.s41:
00:9001 : aa __ __ TAX
00:9002 : e6 43 __ INC T0 + 0 
00:9004 : d0 02 __ BNE $9008 ; (sformat.s96 + 0)
.s95:
00:9006 : e6 44 __ INC T0 + 1 
.s96:
00:9008 : 8a __ __ TXA
.l76:
00:9009 : a4 1b __ LDY ACCU + 0 ; (fps + 0)
00:900b : 91 16 __ STA (P9),y ; (buff + 0)
00:900d : e6 1b __ INC ACCU + 0 ; (fps + 0)
00:900f : a0 00 __ LDY #$00
00:9011 : b1 43 __ LDA (T0 + 0),y 
00:9013 : a8 __ __ TAY
00:9014 : e6 43 __ INC T0 + 0 
00:9016 : d0 02 __ BNE $901a ; (sformat.s98 + 0)
.s97:
00:9018 : e6 44 __ INC T0 + 1 
.s98:
00:901a : 98 __ __ TYA
00:901b : d0 ec __ BNE $9009 ; (sformat.l76 + 0)
.s39:
00:901d : a5 1c __ LDA ACCU + 1 ; (fps + 1)
00:901f : d0 03 __ BNE $9024 ; (sformat.s81 + 0)
00:9021 : 4c 0d 14 JMP $140d 
.s81:
00:9024 : a6 1d __ LDX ACCU + 2 
00:9026 : ec e1 7f CPX $7fe1 ; (si + 1)
00:9029 : a4 1b __ LDY ACCU + 0 ; (fps + 0)
00:902b : b0 0c __ BCS $9039 ; (sformat.s86 + 0)
.l40:
00:902d : ad e0 7f LDA $7fe0 ; (si + 0)
00:9030 : 91 16 __ STA (P9),y ; (buff + 0)
00:9032 : c8 __ __ INY
00:9033 : e8 __ __ INX
00:9034 : ec e1 7f CPX $7fe1 ; (si + 1)
00:9037 : 90 f4 __ BCC $902d ; (sformat.l40 + 0)
.s86:
00:9039 : 84 1b __ STY ACCU + 0 ; (fps + 0)
00:903b : 4c 0d 14 JMP $140d 
.s44:
00:903e : ad fc 7f LDA $7ffc ; (sstack + 2)
00:9041 : 85 43 __ STA T0 + 0 
00:9043 : 69 03 __ ADC #$03
00:9045 : 8d fc 7f STA $7ffc ; (sstack + 2)
00:9048 : ad fd 7f LDA $7ffd ; (sstack + 3)
00:904b : 85 44 __ STA T0 + 1 
00:904d : 69 00 __ ADC #$00
00:904f : 8d fd 7f STA $7ffd ; (sstack + 3)
00:9052 : a0 00 __ LDY #$00
00:9054 : b1 47 __ LDA (T3 + 0),y 
00:9056 : aa __ __ TAX
00:9057 : e6 47 __ INC T3 + 0 
00:9059 : d0 02 __ BNE $905d ; (sformat.s94 + 0)
.s93:
00:905b : e6 48 __ INC T3 + 1 
.s94:
00:905d : b1 43 __ LDA (T0 + 0),y 
00:905f : 85 11 __ STA P4 
00:9061 : a0 01 __ LDY #$01
00:9063 : b1 43 __ LDA (T0 + 0),y 
00:9065 : 85 12 __ STA P5 
00:9067 : c8 __ __ INY
00:9068 : b1 43 __ LDA (T0 + 0),y 
00:906a : 85 13 __ STA P6 
00:906c : c8 __ __ INY
00:906d : b1 43 __ LDA (T0 + 0),y 
00:906f : 85 14 __ STA P7 
00:9071 : 8a __ __ TXA
00:9072 : e0 64 __ CPX #$64
00:9074 : f0 0c __ BEQ $9082 ; (sformat.s55 + 0)
.s45:
00:9076 : c9 44 __ CMP #$44
00:9078 : f0 08 __ BEQ $9082 ; (sformat.s55 + 0)
.s46:
00:907a : c9 69 __ CMP #$69
00:907c : f0 04 __ BEQ $9082 ; (sformat.s55 + 0)
.s47:
00:907e : c9 49 __ CMP #$49
00:9080 : d0 1c __ BNE $909e ; (sformat.s48 + 0)
.s55:
00:9082 : a9 01 __ LDA #$01
.s80:
00:9084 : 85 15 __ STA P8 
.s53:
00:9086 : a5 16 __ LDA P9 ; (buff + 0)
00:9088 : 85 0f __ STA P2 
00:908a : a5 17 __ LDA P10 ; (buff + 1)
00:908c : 85 10 __ STA P3 
00:908e : a9 e0 __ LDA #$e0
00:9090 : 85 0d __ STA P0 
00:9092 : a9 7f __ LDA #$7f
00:9094 : 85 0e __ STA P1 
00:9096 : 20 3b 18 JSR $183b 
.s78:
00:9099 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
00:909b : 4c 39 14 JMP $1439 
.s48:
00:909e : c9 75 __ CMP #$75
00:90a0 : f0 04 __ BEQ $90a6 ; (sformat.s54 + 0)
.s49:
00:90a2 : c9 55 __ CMP #$55
00:90a4 : d0 04 __ BNE $90aa ; (sformat.s50 + 0)
.s54:
00:90a6 : a9 00 __ LDA #$00
00:90a8 : f0 da __ BEQ $9084 ; (sformat.s80 + 0)
.s50:
00:90aa : c9 78 __ CMP #$78
00:90ac : f0 04 __ BEQ $90b2 ; (sformat.s52 + 0)
.s51:
00:90ae : c9 58 __ CMP #$58
00:90b0 : d0 89 __ BNE $903b ; (sformat.s86 + 2)
.s52:
00:90b2 : a9 10 __ LDA #$10
00:90b4 : 8d e4 7f STA $7fe4 ; (si + 4)
00:90b7 : a9 00 __ LDA #$00
00:90b9 : 8d e5 7f STA $7fe5 ; (si + 5)
00:90bc : 85 15 __ STA P8 
00:90be : 8a __ __ TXA
00:90bf : 29 e0 __ AND #$e0
00:90c1 : 09 01 __ ORA #$01
00:90c3 : 8d e3 7f STA $7fe3 ; (si + 3)
00:90c6 : 4c 86 16 JMP $1686 
.s57:
00:90c9 : a5 16 __ LDA P9 ; (buff + 0)
00:90cb : 85 0f __ STA P2 
00:90cd : a5 17 __ LDA P10 ; (buff + 1)
00:90cf : 85 10 __ STA P3 
00:90d1 : ad fc 7f LDA $7ffc ; (sstack + 2)
00:90d4 : 85 43 __ STA T0 + 0 
00:90d6 : ad fd 7f LDA $7ffd ; (sstack + 3)
00:90d9 : 85 44 __ STA T0 + 1 
00:90db : a0 00 __ LDY #$00
00:90dd : b1 43 __ LDA (T0 + 0),y 
00:90df : 85 11 __ STA P4 
00:90e1 : c8 __ __ INY
00:90e2 : b1 43 __ LDA (T0 + 0),y 
00:90e4 : 85 12 __ STA P5 
00:90e6 : 18 __ __ CLC
00:90e7 : a5 43 __ LDA T0 + 0 
00:90e9 : 69 02 __ ADC #$02
00:90eb : 8d fc 7f STA $7ffc ; (sstack + 2)
00:90ee : a5 44 __ LDA T0 + 1 
00:90f0 : 69 00 __ ADC #$00
00:90f2 : 8d fd 7f STA $7ffd ; (sstack + 3)
00:90f5 : a9 e0 __ LDA #$e0
00:90f7 : 85 0d __ STA P0 
00:90f9 : a9 7f __ LDA #$7f
00:90fb : 85 0e __ STA P1 
00:90fd : 20 03 17 JSR $1703 
00:9100 : 4c 99 16 JMP $1699 
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s4:
00:9103 : a9 00 __ LDA #$00
00:9105 : 85 45 __ STA T5 + 0 
00:9107 : a5 13 __ LDA P6 ; (s + 0)
00:9109 : f0 13 __ BEQ $911e ; (nformi.s5 + 0)
.s37:
00:910b : 24 12 __ BIT P5 ; (v + 1)
00:910d : 10 0f __ BPL $911e ; (nformi.s5 + 0)
.s38:
00:910f : 38 __ __ SEC
00:9110 : a9 00 __ LDA #$00
00:9112 : e5 11 __ SBC P4 ; (v + 0)
00:9114 : 85 11 __ STA P4 ; (v + 0)
00:9116 : a9 00 __ LDA #$00
00:9118 : e5 12 __ SBC P5 ; (v + 1)
00:911a : 85 12 __ STA P5 ; (v + 1)
00:911c : e6 45 __ INC T5 + 0 
.s5:
00:911e : a9 10 __ LDA #$10
00:9120 : 85 46 __ STA T6 + 0 
00:9122 : a5 11 __ LDA P4 ; (v + 0)
00:9124 : 05 12 __ ORA P5 ; (v + 1)
00:9126 : f0 4b __ BEQ $9173 ; (nformi.s6 + 0)
.s30:
00:9128 : a0 04 __ LDY #$04
00:912a : b1 0d __ LDA (P0),y ; (si + 0)
00:912c : 85 43 __ STA T2 + 0 
00:912e : c8 __ __ INY
00:912f : b1 0d __ LDA (P0),y ; (si + 0)
00:9131 : 85 44 __ STA T2 + 1 
.l31:
00:9133 : a5 11 __ LDA P4 ; (v + 0)
00:9135 : 85 1b __ STA ACCU + 0 
00:9137 : a5 12 __ LDA P5 ; (v + 1)
00:9139 : 85 1c __ STA ACCU + 1 
00:913b : a5 43 __ LDA T2 + 0 
00:913d : 85 03 __ STA WORK + 0 
00:913f : a5 44 __ LDA T2 + 1 
00:9141 : 85 04 __ STA WORK + 1 
00:9143 : 20 ab 1e JSR $1eab 
00:9146 : a5 06 __ LDA WORK + 3 
00:9148 : 30 08 __ BMI $9152 ; (nformi.s32 + 0)
.s36:
00:914a : d0 0a __ BNE $9156 ; (nformi.s34 + 0)
.s35:
00:914c : a5 05 __ LDA WORK + 2 
00:914e : c9 0a __ CMP #$0a
00:9150 : b0 04 __ BCS $9156 ; (nformi.s34 + 0)
.s32:
00:9152 : a9 30 __ LDA #$30
00:9154 : d0 07 __ BNE $915d ; (nformi.s33 + 0)
.s34:
00:9156 : a0 03 __ LDY #$03
00:9158 : b1 0d __ LDA (P0),y ; (si + 0)
00:915a : 38 __ __ SEC
00:915b : e9 0a __ SBC #$0a
.s33:
00:915d : 18 __ __ CLC
00:915e : 65 05 __ ADC WORK + 2 
00:9160 : a6 46 __ LDX T6 + 0 
00:9162 : 9d e9 7f STA $7fe9,x 
00:9165 : a5 1b __ LDA ACCU + 0 
00:9167 : 85 11 __ STA P4 ; (v + 0)
00:9169 : a5 1c __ LDA ACCU + 1 
00:916b : 85 12 __ STA P5 ; (v + 1)
00:916d : c6 46 __ DEC T6 + 0 
00:916f : 05 11 __ ORA P4 ; (v + 0)
00:9171 : d0 c0 __ BNE $9133 ; (nformi.l31 + 0)
.s6:
00:9173 : a0 02 __ LDY #$02
00:9175 : b1 0d __ LDA (P0),y ; (si + 0)
00:9177 : c9 ff __ CMP #$ff
00:9179 : d0 04 __ BNE $917f ; (nformi.s29 + 0)
.s7:
00:917b : a9 0f __ LDA #$0f
00:917d : d0 05 __ BNE $9184 ; (nformi.s43 + 0)
.s29:
00:917f : 38 __ __ SEC
00:9180 : a9 10 __ LDA #$10
00:9182 : f1 0d __ SBC (P0),y ; (si + 0)
.s43:
00:9184 : a8 __ __ TAY
00:9185 : c4 46 __ CPY T6 + 0 
00:9187 : b0 0d __ BCS $9196 ; (nformi.s8 + 0)
.s28:
00:9189 : a9 30 __ LDA #$30
.l44:
00:918b : a6 46 __ LDX T6 + 0 
00:918d : 9d e9 7f STA $7fe9,x 
00:9190 : c6 46 __ DEC T6 + 0 
00:9192 : c4 46 __ CPY T6 + 0 
00:9194 : 90 f5 __ BCC $918b ; (nformi.l44 + 0)
.s8:
00:9196 : a0 08 __ LDY #$08
00:9198 : b1 0d __ LDA (P0),y ; (si + 0)
00:919a : f0 24 __ BEQ $91c0 ; (nformi.s9 + 0)
.s25:
00:919c : a0 05 __ LDY #$05
00:919e : b1 0d __ LDA (P0),y ; (si + 0)
00:91a0 : d0 1e __ BNE $91c0 ; (nformi.s9 + 0)
.s27:
00:91a2 : 88 __ __ DEY
00:91a3 : b1 0d __ LDA (P0),y ; (si + 0)
00:91a5 : c9 10 __ CMP #$10
00:91a7 : d0 17 __ BNE $91c0 ; (nformi.s9 + 0)
.s26:
00:91a9 : 88 __ __ DEY
00:91aa : b1 0d __ LDA (P0),y ; (si + 0)
00:91ac : a8 __ __ TAY
00:91ad : a9 30 __ LDA #$30
00:91af : a6 46 __ LDX T6 + 0 
00:91b1 : 9d e8 7f STA $7fe8,x ; (si + 8)
00:91b4 : 98 __ __ TYA
00:91b5 : 69 16 __ ADC #$16
00:91b7 : 9d e9 7f STA $7fe9,x 
00:91ba : 8a __ __ TXA
00:91bb : 18 __ __ CLC
00:91bc : 69 fe __ ADC #$fe
00:91be : 85 46 __ STA T6 + 0 
.s9:
00:91c0 : a9 00 __ LDA #$00
00:91c2 : 85 1b __ STA ACCU + 0 
00:91c4 : a5 45 __ LDA T5 + 0 
00:91c6 : f0 0c __ BEQ $91d4 ; (nformi.s10 + 0)
.s24:
00:91c8 : a9 2d __ LDA #$2d
.s23:
00:91ca : a6 46 __ LDX T6 + 0 
00:91cc : 9d e9 7f STA $7fe9,x 
00:91cf : c6 46 __ DEC T6 + 0 
00:91d1 : 4c de 17 JMP $17de 
.s10:
00:91d4 : a0 06 __ LDY #$06
00:91d6 : b1 0d __ LDA (P0),y ; (si + 0)
00:91d8 : f0 04 __ BEQ $91de ; (nformi.s11 + 0)
.s22:
00:91da : a9 2b __ LDA #$2b
00:91dc : d0 ec __ BNE $91ca ; (nformi.s23 + 0)
.s11:
00:91de : a6 46 __ LDX T6 + 0 
00:91e0 : a0 07 __ LDY #$07
00:91e2 : b1 0d __ LDA (P0),y ; (si + 0)
00:91e4 : d0 2d __ BNE $9213 ; (nformi.s18 + 0)
.l12:
00:91e6 : 8a __ __ TXA
00:91e7 : 18 __ __ CLC
00:91e8 : a0 01 __ LDY #$01
00:91ea : 71 0d __ ADC (P0),y ; (si + 0)
00:91ec : b0 04 __ BCS $91f2 ; (nformi.s16 + 0)
.s17:
00:91ee : c9 11 __ CMP #$11
00:91f0 : 90 0a __ BCC $91fc ; (nformi.s13 + 0)
.s16:
00:91f2 : a0 00 __ LDY #$00
00:91f4 : b1 0d __ LDA (P0),y ; (si + 0)
00:91f6 : 9d e9 7f STA $7fe9,x 
00:91f9 : ca __ __ DEX
00:91fa : b0 ea __ BCS $91e6 ; (nformi.l12 + 0)
.s13:
00:91fc : e0 10 __ CPX #$10
00:91fe : b0 0e __ BCS $920e ; (nformi.s14 + 0)
.s15:
00:9200 : 88 __ __ DEY
.l41:
00:9201 : bd ea 7f LDA $7fea,x ; (buffer + 0)
00:9204 : 91 0f __ STA (P2),y ; (str + 0)
00:9206 : c8 __ __ INY
00:9207 : e8 __ __ INX
00:9208 : e0 10 __ CPX #$10
00:920a : 90 f5 __ BCC $9201 ; (nformi.l41 + 0)
.s42:
00:920c : 84 1b __ STY ACCU + 0 
.s14:
00:920e : a9 00 __ LDA #$00
00:9210 : 85 1c __ STA ACCU + 1 
.s3:
00:9212 : 60 __ __ RTS
.s18:
00:9213 : e0 10 __ CPX #$10
00:9215 : b0 1a __ BCS $9231 ; (nformi.l19 + 0)
.s21:
00:9217 : a0 00 __ LDY #$00
.l39:
00:9219 : bd ea 7f LDA $7fea,x ; (buffer + 0)
00:921c : 91 0f __ STA (P2),y ; (str + 0)
00:921e : c8 __ __ INY
00:921f : e8 __ __ INX
00:9220 : e0 10 __ CPX #$10
00:9222 : 90 f5 __ BCC $9219 ; (nformi.l39 + 0)
.s40:
00:9224 : 84 1b __ STY ACCU + 0 
00:9226 : b0 09 __ BCS $9231 ; (nformi.l19 + 0)
.s20:
00:9228 : 88 __ __ DEY
00:9229 : b1 0d __ LDA (P0),y ; (si + 0)
00:922b : a4 1b __ LDY ACCU + 0 
00:922d : 91 0f __ STA (P2),y ; (str + 0)
00:922f : e6 1b __ INC ACCU + 0 
.l19:
00:9231 : a5 1b __ LDA ACCU + 0 
00:9233 : a0 01 __ LDY #$01
00:9235 : d1 0d __ CMP (P0),y ; (si + 0)
00:9237 : 90 ef __ BCC $9228 ; (nformi.s20 + 0)
00:9239 : b0 d3 __ BCS $920e ; (nformi.s14 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s4:
00:923b : a9 00 __ LDA #$00
00:923d : 85 45 __ STA T5 + 0 
00:923f : a5 15 __ LDA P8 ; (s + 0)
00:9241 : f0 1f __ BEQ $9262 ; (nforml.s5 + 0)
.s43:
00:9243 : 24 14 __ BIT P7 ; (v + 3)
00:9245 : 10 1b __ BPL $9262 ; (nforml.s5 + 0)
.s44:
00:9247 : 38 __ __ SEC
00:9248 : a9 00 __ LDA #$00
00:924a : e5 11 __ SBC P4 ; (v + 0)
00:924c : 85 11 __ STA P4 ; (v + 0)
00:924e : a9 00 __ LDA #$00
00:9250 : e5 12 __ SBC P5 ; (v + 1)
00:9252 : 85 12 __ STA P5 ; (v + 1)
00:9254 : a9 00 __ LDA #$00
00:9256 : e5 13 __ SBC P6 ; (v + 2)
00:9258 : 85 13 __ STA P6 ; (v + 2)
00:925a : a9 00 __ LDA #$00
00:925c : e5 14 __ SBC P7 ; (v + 3)
00:925e : 85 14 __ STA P7 ; (v + 3)
00:9260 : e6 45 __ INC T5 + 0 
.s5:
00:9262 : a9 10 __ LDA #$10
00:9264 : 85 46 __ STA T6 + 0 
00:9266 : a5 14 __ LDA P7 ; (v + 3)
00:9268 : d0 0c __ BNE $9276 ; (nforml.s30 + 0)
.s40:
00:926a : a5 13 __ LDA P6 ; (v + 2)
00:926c : d0 08 __ BNE $9276 ; (nforml.s30 + 0)
.s41:
00:926e : a5 12 __ LDA P5 ; (v + 1)
00:9270 : d0 04 __ BNE $9276 ; (nforml.s30 + 0)
.s42:
00:9272 : c5 11 __ CMP P4 ; (v + 0)
00:9274 : b0 0e __ BCS $9284 ; (nforml.s6 + 0)
.s30:
00:9276 : a0 04 __ LDY #$04
00:9278 : b1 0d __ LDA (P0),y ; (si + 0)
00:927a : 85 43 __ STA T1 + 0 
00:927c : c8 __ __ INY
00:927d : b1 0d __ LDA (P0),y ; (si + 0)
00:927f : 85 44 __ STA T1 + 1 
00:9281 : 4c 4c 19 JMP $194c 
.s6:
00:9284 : a0 02 __ LDY #$02
00:9286 : b1 0d __ LDA (P0),y ; (si + 0)
00:9288 : c9 ff __ CMP #$ff
00:928a : d0 04 __ BNE $9290 ; (nforml.s29 + 0)
.s7:
00:928c : a9 0f __ LDA #$0f
00:928e : d0 05 __ BNE $9295 ; (nforml.s49 + 0)
.s29:
00:9290 : 38 __ __ SEC
00:9291 : a9 10 __ LDA #$10
00:9293 : f1 0d __ SBC (P0),y ; (si + 0)
.s49:
00:9295 : a8 __ __ TAY
00:9296 : c4 46 __ CPY T6 + 0 
00:9298 : b0 0d __ BCS $92a7 ; (nforml.s8 + 0)
.s28:
00:929a : a9 30 __ LDA #$30
.l50:
00:929c : a6 46 __ LDX T6 + 0 
00:929e : 9d e9 7f STA $7fe9,x 
00:92a1 : c6 46 __ DEC T6 + 0 
00:92a3 : c4 46 __ CPY T6 + 0 
00:92a5 : 90 f5 __ BCC $929c ; (nforml.l50 + 0)
.s8:
00:92a7 : a0 08 __ LDY #$08
00:92a9 : b1 0d __ LDA (P0),y ; (si + 0)
00:92ab : f0 24 __ BEQ $92d1 ; (nforml.s9 + 0)
.s25:
00:92ad : a0 05 __ LDY #$05
00:92af : b1 0d __ LDA (P0),y ; (si + 0)
00:92b1 : d0 1e __ BNE $92d1 ; (nforml.s9 + 0)
.s27:
00:92b3 : 88 __ __ DEY
00:92b4 : b1 0d __ LDA (P0),y ; (si + 0)
00:92b6 : c9 10 __ CMP #$10
00:92b8 : d0 17 __ BNE $92d1 ; (nforml.s9 + 0)
.s26:
00:92ba : 88 __ __ DEY
00:92bb : b1 0d __ LDA (P0),y ; (si + 0)
00:92bd : a8 __ __ TAY
00:92be : a9 30 __ LDA #$30
00:92c0 : a6 46 __ LDX T6 + 0 
00:92c2 : 9d e8 7f STA $7fe8,x ; (si + 8)
00:92c5 : 98 __ __ TYA
00:92c6 : 69 16 __ ADC #$16
00:92c8 : 9d e9 7f STA $7fe9,x 
00:92cb : 8a __ __ TXA
00:92cc : 18 __ __ CLC
00:92cd : 69 fe __ ADC #$fe
00:92cf : 85 46 __ STA T6 + 0 
.s9:
00:92d1 : a9 00 __ LDA #$00
00:92d3 : 85 1b __ STA ACCU + 0 
00:92d5 : a5 45 __ LDA T5 + 0 
00:92d7 : f0 0c __ BEQ $92e5 ; (nforml.s10 + 0)
.s24:
00:92d9 : a9 2d __ LDA #$2d
.s23:
00:92db : a6 46 __ LDX T6 + 0 
00:92dd : 9d e9 7f STA $7fe9,x 
00:92e0 : c6 46 __ DEC T6 + 0 
00:92e2 : 4c ef 18 JMP $18ef 
.s10:
00:92e5 : a0 06 __ LDY #$06
00:92e7 : b1 0d __ LDA (P0),y ; (si + 0)
00:92e9 : f0 04 __ BEQ $92ef ; (nforml.s11 + 0)
.s22:
00:92eb : a9 2b __ LDA #$2b
00:92ed : d0 ec __ BNE $92db ; (nforml.s23 + 0)
.s11:
00:92ef : a6 46 __ LDX T6 + 0 
00:92f1 : a0 07 __ LDY #$07
00:92f3 : b1 0d __ LDA (P0),y ; (si + 0)
00:92f5 : d0 2d __ BNE $9324 ; (nforml.s18 + 0)
.l12:
00:92f7 : 8a __ __ TXA
00:92f8 : 18 __ __ CLC
00:92f9 : a0 01 __ LDY #$01
00:92fb : 71 0d __ ADC (P0),y ; (si + 0)
00:92fd : b0 04 __ BCS $9303 ; (nforml.s16 + 0)
.s17:
00:92ff : c9 11 __ CMP #$11
00:9301 : 90 0a __ BCC $930d ; (nforml.s13 + 0)
.s16:
00:9303 : a0 00 __ LDY #$00
00:9305 : b1 0d __ LDA (P0),y ; (si + 0)
00:9307 : 9d e9 7f STA $7fe9,x 
00:930a : ca __ __ DEX
00:930b : b0 ea __ BCS $92f7 ; (nforml.l12 + 0)
.s13:
00:930d : e0 10 __ CPX #$10
00:930f : b0 0e __ BCS $931f ; (nforml.s14 + 0)
.s15:
00:9311 : 88 __ __ DEY
.l47:
00:9312 : bd ea 7f LDA $7fea,x ; (buffer + 0)
00:9315 : 91 0f __ STA (P2),y ; (str + 0)
00:9317 : c8 __ __ INY
00:9318 : e8 __ __ INX
00:9319 : e0 10 __ CPX #$10
00:931b : 90 f5 __ BCC $9312 ; (nforml.l47 + 0)
.s48:
00:931d : 84 1b __ STY ACCU + 0 
.s14:
00:931f : a9 00 __ LDA #$00
00:9321 : 85 1c __ STA ACCU + 1 
.s3:
00:9323 : 60 __ __ RTS
.s18:
00:9324 : e0 10 __ CPX #$10
00:9326 : b0 1a __ BCS $9342 ; (nforml.l19 + 0)
.s21:
00:9328 : a0 00 __ LDY #$00
.l45:
00:932a : bd ea 7f LDA $7fea,x ; (buffer + 0)
00:932d : 91 0f __ STA (P2),y ; (str + 0)
00:932f : c8 __ __ INY
00:9330 : e8 __ __ INX
00:9331 : e0 10 __ CPX #$10
00:9333 : 90 f5 __ BCC $932a ; (nforml.l45 + 0)
.s46:
00:9335 : 84 1b __ STY ACCU + 0 
00:9337 : b0 09 __ BCS $9342 ; (nforml.l19 + 0)
.s20:
00:9339 : 88 __ __ DEY
00:933a : b1 0d __ LDA (P0),y ; (si + 0)
00:933c : a4 1b __ LDY ACCU + 0 
00:933e : 91 0f __ STA (P2),y ; (str + 0)
00:9340 : e6 1b __ INC ACCU + 0 
.l19:
00:9342 : a5 1b __ LDA ACCU + 0 
00:9344 : a0 01 __ LDY #$01
00:9346 : d1 0d __ CMP (P0),y ; (si + 0)
00:9348 : 90 ef __ BCC $9339 ; (nforml.s20 + 0)
00:934a : b0 d3 __ BCS $931f ; (nforml.s14 + 0)
.l31:
00:934c : a5 11 __ LDA P4 ; (v + 0)
00:934e : 85 1b __ STA ACCU + 0 
00:9350 : a5 12 __ LDA P5 ; (v + 1)
00:9352 : 85 1c __ STA ACCU + 1 
00:9354 : a5 13 __ LDA P6 ; (v + 2)
00:9356 : 85 1d __ STA ACCU + 2 
00:9358 : a5 14 __ LDA P7 ; (v + 3)
00:935a : 85 1e __ STA ACCU + 3 
00:935c : a5 43 __ LDA T1 + 0 
00:935e : 85 03 __ STA WORK + 0 
00:9360 : a5 44 __ LDA T1 + 1 
00:9362 : 85 04 __ STA WORK + 1 
00:9364 : a9 00 __ LDA #$00
00:9366 : 85 05 __ STA WORK + 2 
00:9368 : 85 06 __ STA WORK + 3 
00:936a : 20 4e 1f JSR $1f4e 
00:936d : a5 08 __ LDA WORK + 5 
00:936f : 30 08 __ BMI $9379 ; (nforml.s32 + 0)
.s39:
00:9371 : d0 0a __ BNE $937d ; (nforml.s37 + 0)
.s38:
00:9373 : a5 07 __ LDA WORK + 4 
00:9375 : c9 0a __ CMP #$0a
00:9377 : b0 04 __ BCS $937d ; (nforml.s37 + 0)
.s32:
00:9379 : a9 30 __ LDA #$30
00:937b : d0 07 __ BNE $9384 ; (nforml.s33 + 0)
.s37:
00:937d : a0 03 __ LDY #$03
00:937f : b1 0d __ LDA (P0),y ; (si + 0)
00:9381 : 38 __ __ SEC
00:9382 : e9 0a __ SBC #$0a
.s33:
00:9384 : 18 __ __ CLC
00:9385 : 65 07 __ ADC WORK + 4 
00:9387 : a6 46 __ LDX T6 + 0 
00:9389 : 9d e9 7f STA $7fe9,x 
00:938c : a5 1b __ LDA ACCU + 0 
00:938e : 85 11 __ STA P4 ; (v + 0)
00:9390 : a5 1c __ LDA ACCU + 1 
00:9392 : 85 12 __ STA P5 ; (v + 1)
00:9394 : a5 1d __ LDA ACCU + 2 
00:9396 : 85 13 __ STA P6 ; (v + 2)
00:9398 : a5 1e __ LDA ACCU + 3 
00:939a : 85 14 __ STA P7 ; (v + 3)
00:939c : c6 46 __ DEC T6 + 0 
00:939e : aa __ __ TAX
00:939f : d0 ab __ BNE $934c ; (nforml.l31 + 0)
.s34:
00:93a1 : a5 13 __ LDA P6 ; (v + 2)
00:93a3 : d0 a7 __ BNE $934c ; (nforml.l31 + 0)
.s35:
00:93a5 : a5 12 __ LDA P5 ; (v + 1)
00:93a7 : d0 a3 __ BNE $934c ; (nforml.l31 + 0)
.s36:
00:93a9 : c5 11 __ CMP P4 ; (v + 0)
00:93ab : 90 9f __ BCC $934c ; (nforml.l31 + 0)
00:93ad : 4c 84 18 JMP $1884 
--------------------------------------------------------------------
00:93b0 : __ __ __ BYT 0a 6e 4f 20 43 4f 4e 46 49 47 20 46 49 4c 45 20 : .nO CONFIG FILE 
00:93c0 : __ __ __ BYT 46 4f 55 4e 44 2c 20 57 52 49 54 49 4e 47 20 44 : FOUND, WRITING D
00:93d0 : __ __ __ BYT 45 46 41 55 4c 54 53 2e 00                      : EFAULTS..
--------------------------------------------------------------------
writeconfigfile: ; writeconfigfile()->void
.s4:
00:93d9 : 20 24 22 JSR $2224 
00:93dc : a9 22 __ LDA #$22
00:93de : 85 0e __ STA P1 
00:93e0 : 18 __ __ CLC
00:93e1 : a5 1b __ LDA ACCU + 0 
00:93e3 : 69 02 __ ADC #$02
00:93e5 : 85 1b __ STA ACCU + 0 
00:93e7 : 90 02 __ BCC $93eb ; (writeconfigfile.s10 + 0)
.s9:
00:93e9 : e6 1c __ INC ACCU + 1 
.s10:
00:93eb : 20 25 20 JSR $2025 
00:93ee : a5 1b __ LDA ACCU + 0 
00:93f0 : 85 4c __ STA T1 + 0 
00:93f2 : a5 1c __ LDA ACCU + 1 
00:93f4 : 85 4d __ STA T1 + 1 
00:93f6 : a9 00 __ LDA #$00
00:93f8 : a8 __ __ TAY
00:93f9 : 91 1b __ STA (ACCU + 0),y 
00:93fb : a9 09 __ LDA #$09
00:93fd : c8 __ __ INY
00:93fe : 91 1b __ STA (ACCU + 0),y 
00:9400 : 20 fb 0e JSR $0efb 
00:9403 : a5 1b __ LDA ACCU + 0 
00:9405 : 05 1c __ ORA ACCU + 1 
00:9407 : f0 23 __ BEQ $942c ; (writeconfigfile.s5 + 0)
.s6:
00:9409 : a9 00 __ LDA #$00
00:940b : 85 4e __ STA T2 + 0 
.l8:
00:940d : a9 22 __ LDA #$22
00:940f : 85 0e __ STA P1 
00:9411 : a6 4e __ LDX T2 + 0 
00:9413 : 8a __ __ TXA
00:9414 : 18 __ __ CLC
00:9415 : 69 02 __ ADC #$02
00:9417 : a8 __ __ TAY
00:9418 : bd 80 22 LDA $2280,x 
00:941b : 91 4c __ STA (T1 + 0),y 
00:941d : 20 fb 0e JSR $0efb 
00:9420 : e6 4e __ INC T2 + 0 
00:9422 : a5 1c __ LDA ACCU + 1 
00:9424 : d0 e7 __ BNE $940d ; (writeconfigfile.l8 + 0)
.s7:
00:9426 : a5 4e __ LDA T2 + 0 
00:9428 : c5 1b __ CMP ACCU + 0 
00:942a : 90 e1 __ BCC $940d ; (writeconfigfile.l8 + 0)
.s5:
00:942c : a9 01 __ LDA #$01
00:942e : 8d ff 10 STA $10ff 
00:9431 : 20 f7 0e JSR $0ef7 
00:9434 : a5 4c __ LDA T1 + 0 
00:9436 : 85 0d __ STA P0 
00:9438 : a5 4d __ LDA T1 + 1 
00:943a : 85 0e __ STA P1 
00:943c : 18 __ __ CLC
00:943d : a5 1b __ LDA ACCU + 0 
00:943f : 69 02 __ ADC #$02
00:9441 : 85 0f __ STA P2 
00:9443 : a5 1c __ LDA ACCU + 1 
00:9445 : 69 00 __ ADC #$00
00:9447 : 85 10 __ STA P3 
00:9449 : 20 7a 0f JSR $0f7a 
00:944c : 20 1d 21 JSR $211d 
00:944f : a9 06 __ LDA #$06
00:9451 : 85 11 __ STA P4 
00:9453 : 20 30 10 JSR $1030 
00:9456 : 20 e2 10 JSR $10e2 
00:9459 : 20 9a 12 JSR $129a 
00:945c : 20 95 1a JSR $1a95 
00:945f : a9 9b __ LDA #$9b
00:9461 : 8d fe 7f STA $7ffe ; (sstack + 4)
00:9464 : a9 1b __ LDA #$1b
00:9466 : 8d ff 7f STA $7fff ; (sstack + 5)
00:9469 : 20 e6 1a JSR $1ae6 
--------------------------------------------------------------------
uii_close_file: ; uii_close_file()->void
.s4:
00:946c : a9 00 __ LDA #$00
00:946e : 85 10 __ STA P3 
00:9470 : 8d f8 7f STA $7ff8 ; (cmd + 0)
00:9473 : a9 01 __ LDA #$01
00:9475 : 8d ff 10 STA $10ff 
00:9478 : a9 02 __ LDA #$02
00:947a : 85 0f __ STA P2 
00:947c : a9 03 __ LDA #$03
00:947e : 8d f9 7f STA $7ff9 ; (cmd + 1)
00:9481 : a9 f8 __ LDA #$f8
00:9483 : 85 0d __ STA P0 
00:9485 : a9 7f __ LDA #$7f
00:9487 : 85 0e __ STA P1 
00:9489 : 20 7a 0f JSR $0f7a 
00:948c : 20 fb 0f JSR $0ffb 
00:948f : 20 30 10 JSR $1030 
00:9492 : 4c e2 10 JMP $10e2 
--------------------------------------------------------------------
uii_write_file: ; uii_write_file(u8*,u16)->void
.s4:
00:9495 : a9 5a __ LDA #$5a
00:9497 : 85 1b __ STA ACCU + 0 
00:9499 : a9 00 __ LDA #$00
00:949b : 85 1c __ STA ACCU + 1 
00:949d : 20 25 20 JSR $2025 
00:94a0 : a9 00 __ LDA #$00
00:94a2 : a8 __ __ TAY
00:94a3 : 91 1b __ STA (ACCU + 0),y 
00:94a5 : a9 05 __ LDA #$05
00:94a7 : c8 __ __ INY
00:94a8 : 91 1b __ STA (ACCU + 0),y 
00:94aa : a9 00 __ LDA #$00
00:94ac : c8 __ __ INY
00:94ad : 91 1b __ STA (ACCU + 0),y 
00:94af : c8 __ __ INY
00:94b0 : 91 1b __ STA (ACCU + 0),y 
00:94b2 : aa __ __ TAX
00:94b3 : 18 __ __ CLC
.l6:
00:94b4 : 8a __ __ TXA
00:94b5 : 69 04 __ ADC #$04
00:94b7 : a8 __ __ TAY
00:94b8 : bd 00 49 LDA $4900,x ; (cfg + 0)
00:94bb : 91 1b __ STA (ACCU + 0),y 
00:94bd : e8 __ __ INX
00:94be : e0 56 __ CPX #$56
00:94c0 : 90 f2 __ BCC $94b4 ; (uii_write_file.l6 + 0)
.s5:
00:94c2 : a9 01 __ LDA #$01
00:94c4 : 8d ff 10 STA $10ff 
00:94c7 : a5 1b __ LDA ACCU + 0 
00:94c9 : 85 0d __ STA P0 
00:94cb : a5 1c __ LDA ACCU + 1 
00:94cd : 85 0e __ STA P1 
00:94cf : a9 5a __ LDA #$5a
00:94d1 : 85 0f __ STA P2 
00:94d3 : a9 00 __ LDA #$00
00:94d5 : 85 10 __ STA P3 
00:94d7 : 20 7a 0f JSR $0f7a 
00:94da : 20 1d 21 JSR $211d 
00:94dd : 20 fb 0f JSR $0ffb 
00:94e0 : 20 30 10 JSR $1030 
00:94e3 : 4c e2 10 JMP $10e2 
--------------------------------------------------------------------
CheckStatus: ; CheckStatus(const u8*)->void
.s1:
00:94e6 : 38 __ __ SEC
00:94e7 : a5 23 __ LDA SP + 0 
00:94e9 : e9 09 __ SBC #$09
00:94eb : 85 23 __ STA SP + 0 
00:94ed : b0 02 __ BCS $94f1 ; (CheckStatus.s4 + 0)
00:94ef : c6 24 __ DEC SP + 1 
.s4:
00:94f1 : ad c9 4b LDA $4bc9 ; (uii_status + 0)
00:94f4 : c9 30 __ CMP #$30
00:94f6 : d0 07 __ BNE $94ff ; (CheckStatus.s6 + 0)
.s5:
00:94f8 : ad ca 4b LDA $4bca ; (uii_status + 1)
00:94fb : c9 30 __ CMP #$30
00:94fd : f0 39 __ BEQ $9538 ; (CheckStatus.s3 + 0)
.s6:
00:94ff : a9 44 __ LDA #$44
00:9501 : a0 05 __ LDY #$05
00:9503 : 91 23 __ STA (SP + 0),y 
00:9505 : a9 1b __ LDA #$1b
00:9507 : c8 __ __ INY
00:9508 : 91 23 __ STA (SP + 0),y 
00:950a : ad fe 7f LDA $7ffe ; (sstack + 4)
00:950d : c8 __ __ INY
00:950e : 91 23 __ STA (SP + 0),y 
00:9510 : ad ff 7f LDA $7fff ; (sstack + 5)
00:9513 : c8 __ __ INY
00:9514 : 91 23 __ STA (SP + 0),y 
00:9516 : 20 51 13 JSR $1351 
00:9519 : a9 c9 __ LDA #$c9
00:951b : a0 07 __ LDY #$07
00:951d : 91 23 __ STA (SP + 0),y 
00:951f : a9 4b __ LDA #$4b
00:9521 : c8 __ __ INY
00:9522 : 91 23 __ STA (SP + 0),y 
00:9524 : a9 57 __ LDA #$57
00:9526 : a0 05 __ LDY #$05
00:9528 : 91 23 __ STA (SP + 0),y 
00:952a : a9 1b __ LDA #$1b
00:952c : c8 __ __ INY
00:952d : 91 23 __ STA (SP + 0),y 
00:952f : 20 51 13 JSR $1351 
00:9532 : 20 f2 10 JSR $10f2 
00:9535 : 20 64 1b JSR $1b64 
.s3:
00:9538 : 18 __ __ CLC
00:9539 : a5 23 __ LDA SP + 0 
00:953b : 69 09 __ ADC #$09
00:953d : 85 23 __ STA SP + 0 
00:953f : 90 02 __ BCC $9543 ; (CheckStatus.s3 + 11)
00:9541 : e6 24 __ INC SP + 1 
00:9543 : 60 __ __ RTS
--------------------------------------------------------------------
00:9544 : __ __ __ BYT 0a 69 2f 6f 20 45 52 52 4f 52 20 49 4e 20 25 53 : .i/o ERROR IN %S
00:9554 : __ __ __ BYT 2e 0a 00                                        : ...
--------------------------------------------------------------------
00:9557 : __ __ __ BYT 0a 73 54 41 54 55 53 3a 20 25 53 0a 00          : .sTATUS: %S..
--------------------------------------------------------------------
errorexit: ; errorexit()->void
.s4:
00:9564 : a9 78 __ LDA #$78
00:9566 : 85 0d __ STA P0 
00:9568 : a9 1b __ LDA #$1b
00:956a : 85 0e __ STA P1 
00:956c : 20 12 11 JSR $1112 
00:956f : 20 99 11 JSR $1199 
00:9572 : 20 c4 11 JSR $11c4 
00:9575 : 4c 00 c0 JMP $c000 
--------------------------------------------------------------------
00:9578 : __ __ __ BYT 65 52 52 4f 52 2e 20 70 52 45 53 53 20 4b 45 59 : eRROR. pRESS KEY
00:9588 : __ __ __ BYT 20 54 4f 20 45 58 49 54 20 54 4f 20 62 61 73 69 :  TO EXIT TO basi
00:9598 : __ __ __ BYT 63 2e 00                                        : c..
--------------------------------------------------------------------
00:959b : __ __ __ BYT 57 52 49 54 49 4e 47 20 43 4f 4e 46 49 47 00    : WRITING CONFIG.
--------------------------------------------------------------------
00:95aa : __ __ __ BYT 45 41 44 49 4e 47 20 43 4f 4e 46 49 47 00       : EADING CONFIG.
--------------------------------------------------------------------
00:95b8 : __ __ __ BYT 0a 6f 4c 44 20 43 4f 4e 46 49 47 55 52 41 54 49 : .oLD CONFIGURATI
00:95c8 : __ __ __ BYT 4f 4e 20 46 49 4c 45 20 46 4f 52 4d 41 54 2e 00 : ON FILE FORMAT..
--------------------------------------------------------------------
00:95d8 : __ __ __ BYT 0a 72 55 4e 20 55 50 47 52 41 44 45 20 54 4f 4f : .rUN UPGRADE TOO
00:95e8 : __ __ __ BYT 4c 20 46 49 52 53 54 2e 00                      : L FIRST..
--------------------------------------------------------------------
00:95f1 : __ __ __ BYT 6f 46 46 00                                     : oFF.
--------------------------------------------------------------------
00:95f5 : __ __ __ BYT 31 35 34 31 00                                  : 1541.
--------------------------------------------------------------------
00:95fa : __ __ __ BYT 31 35 37 31 00                                  : 1571.
--------------------------------------------------------------------
00:9600 : __ __ __ BYT 0a 70 52 45 53 53 20 4b 45 59 20 54 4f 20 45 58 : .pRESS KEY TO EX
00:9610 : __ __ __ BYT 49 54 2e 0a 00                                  : IT...
--------------------------------------------------------------------
uii_parse_deviceinfo: ; uii_parse_deviceinfo()->u8
.s4:
00:9615 : a9 00 __ LDA #$00
00:9617 : 85 10 __ STA P3 
00:9619 : 8d f8 7f STA $7ff8 ; (cmd + 0)
00:961c : a9 04 __ LDA #$04
00:961e : 8d ff 10 STA $10ff 
00:9621 : a9 02 __ LDA #$02
00:9623 : 85 0f __ STA P2 
00:9625 : a9 29 __ LDA #$29
00:9627 : 8d f9 7f STA $7ff9 ; (cmd + 1)
00:962a : a9 f8 __ LDA #$f8
00:962c : 85 0d __ STA P0 
00:962e : a9 7f __ LDA #$7f
00:9630 : 85 0e __ STA P1 
00:9632 : 20 7a 0f JSR $0f7a 
00:9635 : 20 fb 0f JSR $0ffb 
00:9638 : 20 30 10 JSR $1030 
00:963b : 20 e2 10 JSR $10e2 
00:963e : ad c9 4b LDA $4bc9 ; (uii_status + 0)
00:9641 : c9 30 __ CMP #$30
00:9643 : d0 0c __ BNE $9651 ; (uii_parse_deviceinfo.s7 + 0)
.s5:
00:9645 : ad ca 4b LDA $4bca ; (uii_status + 1)
00:9648 : c9 30 __ CMP #$30
00:964a : d0 05 __ BNE $9651 ; (uii_parse_deviceinfo.s7 + 0)
.s6:
00:964c : ad c8 49 LDA $49c8 ; (uii_data + 0)
00:964f : d0 05 __ BNE $9656 ; (uii_parse_deviceinfo.s8 + 0)
.s7:
00:9651 : a9 00 __ LDA #$00
.s3:
00:9653 : 85 1b __ STA ACCU + 0 
00:9655 : 60 __ __ RTS
.s8:
00:9656 : ac c9 49 LDY $49c9 ; (uii_data + 1)
00:9659 : c0 0f __ CPY #$0f
00:965b : 90 07 __ BCC $9664 ; (uii_parse_deviceinfo.s15 + 0)
.s9:
00:965d : a9 02 __ LDA #$02
.s10:
00:965f : 85 1b __ STA ACCU + 0 
00:9661 : 98 __ __ TYA
00:9662 : b0 3a __ BCS $969e ; (uii_parse_deviceinfo.s18 + 0)
.s15:
00:9664 : 8c 9d 4d STY $4d9d ; (uii_devinfo + 1)
00:9667 : a9 01 __ LDA #$01
00:9669 : 8d 9c 4d STA $4d9c ; (uii_devinfo + 0)
00:966c : ad cb 49 LDA $49cb ; (uii_data + 3)
00:966f : 8d 9e 4d STA $4d9e ; (uii_devinfo + 2)
00:9672 : ad ca 49 LDA $49ca ; (uii_data + 2)
00:9675 : 8d 9f 4d STA $4d9f ; (uii_devinfo + 3)
00:9678 : ac cc 49 LDY $49cc ; (uii_data + 4)
00:967b : c0 0f __ CPY #$0f
00:967d : 90 04 __ BCC $9683 ; (uii_parse_deviceinfo.s17 + 0)
.s16:
00:967f : a9 05 __ LDA #$05
00:9681 : b0 dc __ BCS $965f ; (uii_parse_deviceinfo.s10 + 0)
.s17:
00:9683 : 8c a1 4d STY $4da1 ; (uii_devinfo + 5)
00:9686 : a9 01 __ LDA #$01
00:9688 : 8d a0 4d STA $4da0 ; (uii_devinfo + 4)
00:968b : ad ce 49 LDA $49ce ; (uii_data + 6)
00:968e : 8d a2 4d STA $4da2 ; (uii_devinfo + 6)
00:9691 : ad cd 49 LDA $49cd ; (uii_data + 5)
00:9694 : 8d a3 4d STA $4da3 ; (uii_devinfo + 7)
00:9697 : a9 08 __ LDA #$08
00:9699 : 85 1b __ STA ACCU + 0 
00:969b : ad cf 49 LDA $49cf ; (uii_data + 7)
.s18:
00:969e : c9 0f __ CMP #$0f
00:96a0 : d0 20 __ BNE $96c2 ; (uii_parse_deviceinfo.s11 + 0)
.s14:
00:96a2 : a9 01 __ LDA #$01
00:96a4 : 8d a4 4d STA $4da4 ; (uii_devinfo + 8)
00:96a7 : a9 0f __ LDA #$0f
00:96a9 : 8d a5 4d STA $4da5 ; (uii_devinfo + 9)
00:96ac : a6 1b __ LDX ACCU + 0 
00:96ae : bd c9 49 LDA $49c9,x ; (uii_data + 1)
00:96b1 : 8d a6 4d STA $4da6 ; (uii_devinfo + 10)
00:96b4 : bd c8 49 LDA $49c8,x ; (uii_data + 0)
00:96b7 : 8d a7 4d STA $4da7 ; (uii_devinfo + 11)
00:96ba : bd ca 49 LDA $49ca,x ; (uii_data + 2)
00:96bd : e8 __ __ INX
00:96be : e8 __ __ INX
00:96bf : e8 __ __ INX
00:96c0 : 86 1b __ STX ACCU + 0 
.s11:
00:96c2 : c9 50 __ CMP #$50
00:96c4 : d0 18 __ BNE $96de ; (uii_parse_deviceinfo.s12 + 0)
.s13:
00:96c6 : a9 01 __ LDA #$01
00:96c8 : 8d a8 4d STA $4da8 ; (uii_devinfo + 12)
00:96cb : a9 50 __ LDA #$50
00:96cd : 8d a9 4d STA $4da9 ; (uii_devinfo + 13)
00:96d0 : a6 1b __ LDX ACCU + 0 
00:96d2 : bd c9 49 LDA $49c9,x ; (uii_data + 1)
00:96d5 : 8d aa 4d STA $4daa ; (uii_devinfo + 14)
00:96d8 : bd c8 49 LDA $49c8,x ; (uii_data + 0)
00:96db : 8d ab 4d STA $4dab ; (uii_devinfo + 15)
.s12:
00:96de : a9 01 __ LDA #$01
00:96e0 : 4c 53 1c JMP $1c53 
--------------------------------------------------------------------
00:96e3 : __ __ __ BYT 67 45 54 54 49 4e 47 20 44 45 56 49 43 45 20 49 : gETTING DEVICE I
00:96f3 : __ __ __ BYT 4e 46 4f 20 46 41 49 4c 53 2e 00                : NFO FAILS..
--------------------------------------------------------------------
00:9700 : __ __ __ BYT 0a 72 45 43 4f 47 4e 49 53 45 44 20 75 4c 54 49 : .rECOGNISED uLTI
00:9710 : __ __ __ BYT 4d 41 54 45 20 44 45 56 49 43 45 53 3a 0a 00    : MATE DEVICES:..
--------------------------------------------------------------------
00:971f : __ __ __ BYT 64 52 49 56 45 20 61 3a 20 69 64 20 25 32 44 20 : dRIVE a: id %2D 
00:972f : __ __ __ BYT 70 4f 57 20 25 53 2c 20 25 53 0a 00             : pOW %S, %S..
--------------------------------------------------------------------
00:973b : __ __ __ BYT 31 35 38 31 00                                  : 1581.
--------------------------------------------------------------------
00:9740 : __ __ __ BYT 64 52 49 56 45 20 62 3a 20 69 64 20 25 32 44 20 : dRIVE b: id %2D 
00:9750 : __ __ __ BYT 70 4f 57 20 25 53 2c 20 25 53 0a 00             : pOW %S, %S..
--------------------------------------------------------------------
00:975c : __ __ __ BYT 73 4f 46 54 69 65 63 3a 20 69 64 20 25 32 44 20 : sOFTiec: id %2D 
00:976c : __ __ __ BYT 70 4f 57 20 25 53 0a 00                         : pOW %S..
--------------------------------------------------------------------
00:9774 : __ __ __ BYT 70 52 49 4e 54 45 52 3a 20 69 64 20 25 32 44 20 : pRINTER: id %2D 
00:9784 : __ __ __ BYT 70 4f 57 20 25 53 0a 00                         : pOW %S..
--------------------------------------------------------------------
00:978c : __ __ __ BYT 69 64 53 20 4e 45 45 44 49 4e 47 20 4d 41 4e 55 : idS NEEDING MANU
00:979c : __ __ __ BYT 41 4c 20 50 4f 57 45 52 20 53 57 49 54 43 48 49 : AL POWER SWITCHI
00:97ac : __ __ __ BYT 4e 47 3a 20 25 53 0a 00                         : NG: %S..
--------------------------------------------------------------------
CheckActiveIECdevices: ; CheckActiveIECdevices()->u8
.s4:
00:97b4 : a9 00 __ LDA #$00
00:97b6 : a2 17 __ LDX #$17
.l5:
00:97b8 : ca __ __ DEX
00:97b9 : 9d ac 4d STA $4dac,x ; (iec_devices + 0)
00:97bc : d0 fa __ BNE $97b8 ; (CheckActiveIECdevices.l5 + 0)
.s6:
00:97be : 20 15 1c JSR $1c15 
00:97c1 : a9 00 __ LDA #$00
00:97c3 : 85 48 __ STA T7 + 0 
00:97c5 : a5 1b __ LDA ACCU + 0 
00:97c7 : d0 03 __ BNE $97cc ; (CheckActiveIECdevices.s8 + 0)
.s7:
00:97c9 : 20 64 1b JSR $1b64 
.s8:
00:97cc : a9 00 __ LDA #$00
00:97ce : 85 45 __ STA T3 + 0 
00:97d0 : 85 47 __ STA T5 + 0 
00:97d2 : a9 08 __ LDA #$08
00:97d4 : 85 46 __ STA T4 + 0 
.l9:
00:97d6 : a5 46 __ LDA T4 + 0 
.l10:
00:97d8 : 85 43 __ STA T0 + 0 
00:97da : a9 00 __ LDA #$00
00:97dc : aa __ __ TAX
.l11:
00:97dd : 0a __ __ ASL
00:97de : 0a __ __ ASL
00:97df : a8 __ __ TAY
00:97e0 : a5 43 __ LDA T0 + 0 
00:97e2 : d9 9f 4d CMP $4d9f,y ; (uii_devinfo + 3)
00:97e5 : f0 34 __ BEQ $981b ; (CheckActiveIECdevices.s21 + 0)
.s12:
00:97e7 : e8 __ __ INX
00:97e8 : 8a __ __ TXA
00:97e9 : e0 04 __ CPX #$04
00:97eb : 90 f0 __ BCC $97dd ; (CheckActiveIECdevices.l11 + 0)
.s13:
00:97ed : a5 43 __ LDA T0 + 0 
00:97ef : 20 48 1e JSR $1e48 
00:97f2 : aa __ __ TAX
00:97f3 : f0 0f __ BEQ $9804 ; (CheckActiveIECdevices.s14 + 0)
.s18:
00:97f5 : a9 01 __ LDA #$01
00:97f7 : a6 45 __ LDX T3 + 0 
00:97f9 : 9d ac 4d STA $4dac,x ; (iec_devices + 0)
00:97fc : a5 48 __ LDA T7 + 0 
00:97fe : f0 02 __ BEQ $9802 ; (CheckActiveIECdevices.s27 + 0)
.s20:
00:9800 : a9 01 __ LDA #$01
.s27:
00:9802 : 85 47 __ STA T5 + 0 
.s14:
00:9804 : e6 48 __ INC T7 + 0 
00:9806 : a5 48 __ LDA T7 + 0 
00:9808 : c9 17 __ CMP #$17
00:980a : b0 0c __ BCS $9818 ; (CheckActiveIECdevices.s15 + 0)
.s16:
00:980c : e6 45 __ INC T3 + 0 
00:980e : e6 46 __ INC T4 + 0 
00:9810 : c9 16 __ CMP #$16
00:9812 : d0 c2 __ BNE $97d6 ; (CheckActiveIECdevices.l9 + 0)
.s17:
00:9814 : a9 04 __ LDA #$04
00:9816 : d0 c0 __ BNE $97d8 ; (CheckActiveIECdevices.l10 + 0)
.s15:
00:9818 : a5 47 __ LDA T5 + 0 
.s3:
00:981a : 60 __ __ RTS
.s21:
00:981b : b9 9d 4d LDA $4d9d,y ; (uii_devinfo + 1)
00:981e : c9 0f __ CMP #$0f
00:9820 : a9 00 __ LDA #$00
00:9822 : b0 02 __ BCS $9826 ; (CheckActiveIECdevices.s23 + 0)
.s26:
00:9824 : a9 04 __ LDA #$04
.s23:
00:9826 : 85 1b __ STA ACCU + 0 
00:9828 : b9 9e 4d LDA $4d9e,y ; (uii_devinfo + 2)
00:982b : f0 04 __ BEQ $9831 ; (CheckActiveIECdevices.s28 + 0)
.s29:
00:982d : a9 03 __ LDA #$03
00:982f : d0 02 __ BNE $9833 ; (CheckActiveIECdevices.s30 + 0)
.s28:
00:9831 : a9 01 __ LDA #$01
.s30:
00:9833 : 05 1b __ ORA ACCU + 0 
00:9835 : f0 b6 __ BEQ $97ed ; (CheckActiveIECdevices.s13 + 0)
.s24:
00:9837 : c9 02 __ CMP #$02
00:9839 : 90 c9 __ BCC $9804 ; (CheckActiveIECdevices.s14 + 0)
.s25:
00:983b : a6 45 __ LDX T3 + 0 
00:983d : 9d ac 4d STA $4dac,x ; (iec_devices + 0)
00:9840 : c9 03 __ CMP #$03
00:9842 : f0 bc __ BEQ $9800 ; (CheckActiveIECdevices.s20 + 0)
.s19:
00:9844 : a9 00 __ LDA #$00
00:9846 : f0 ba __ BEQ $9802 ; (CheckActiveIECdevices.s27 + 0)
--------------------------------------------------------------------
iec_present: ; iec_present(u8)->u8
.s4:
00:9848 : 85 0d __ STA P0 
00:984a : a5 0d __ LDA P0 
00:984c : a0 00 __ LDY #$00
00:984e : 84 90 __ STY $90 
00:9850 : 20 b1 ff JSR $ffb1 
00:9853 : a9 ff __ LDA #$ff
00:9855 : 20 93 ff JSR $ff93 
00:9858 : a5 90 __ LDA $90 
00:985a : 10 08 __ BPL $9864 ; (iec_present.s4 + 28)
00:985c : 20 ae ff JSR $ffae 
00:985f : a9 00 __ LDA #$00
00:9861 : 85 1b __ STA ACCU + 0 
00:9863 : 60 __ __ RTS
00:9864 : 20 ae ff JSR $ffae 
00:9867 : a9 01 __ LDA #$01
00:9869 : 85 1b __ STA ACCU + 0 
.s3:
00:986b : a5 1b __ LDA ACCU + 0 
00:986d : 60 __ __ RTS
--------------------------------------------------------------------
00:986e : __ __ __ BYT 79 45 53 00                                     : yES.
--------------------------------------------------------------------
00:9872 : __ __ __ BYT 6e 4f 00                                        : nO.
--------------------------------------------------------------------
00:9875 : __ __ __ BYT 61 43 54 49 56 45 20 69 65 63 20 69 64 53 3a 20 : aCTIVE iec idS: 
00:9885 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
00:9886 : __ __ __ BYT 25 30 32 44 20 00                               : %02D .
--------------------------------------------------------------------
00:988c : __ __ __ BYT 62 41 43 4b 20 49 4e 20 4d 41 49 4e 20 72 61 6d : bACK IN MAIN ram
00:989c : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
00:989d : __ __ __ BYT 67 4f 49 4e 47 20 54 4f 20 45 58 49 54 00       : gOING TO EXIT.
--------------------------------------------------------------------
divmod: ; divmod
00:98ab : a5 1c __ LDA ACCU + 1 
00:98ad : d0 31 __ BNE $98e0 ; (divmod + 53)
00:98af : a5 04 __ LDA WORK + 1 
00:98b1 : d0 1e __ BNE $98d1 ; (divmod + 38)
00:98b3 : 85 06 __ STA WORK + 3 
00:98b5 : a2 04 __ LDX #$04
00:98b7 : 06 1b __ ASL ACCU + 0 
00:98b9 : 2a __ __ ROL
00:98ba : c5 03 __ CMP WORK + 0 
00:98bc : 90 02 __ BCC $98c0 ; (divmod + 21)
00:98be : e5 03 __ SBC WORK + 0 
00:98c0 : 26 1b __ ROL ACCU + 0 
00:98c2 : 2a __ __ ROL
00:98c3 : c5 03 __ CMP WORK + 0 
00:98c5 : 90 02 __ BCC $98c9 ; (divmod + 30)
00:98c7 : e5 03 __ SBC WORK + 0 
00:98c9 : 26 1b __ ROL ACCU + 0 
00:98cb : ca __ __ DEX
00:98cc : d0 eb __ BNE $98b9 ; (divmod + 14)
00:98ce : 85 05 __ STA WORK + 2 
00:98d0 : 60 __ __ RTS
00:98d1 : a5 1b __ LDA ACCU + 0 
00:98d3 : 85 05 __ STA WORK + 2 
00:98d5 : a5 1c __ LDA ACCU + 1 
00:98d7 : 85 06 __ STA WORK + 3 
00:98d9 : a9 00 __ LDA #$00
00:98db : 85 1b __ STA ACCU + 0 
00:98dd : 85 1c __ STA ACCU + 1 
00:98df : 60 __ __ RTS
00:98e0 : a5 04 __ LDA WORK + 1 
00:98e2 : d0 1f __ BNE $9903 ; (divmod + 88)
00:98e4 : a5 03 __ LDA WORK + 0 
00:98e6 : 30 1b __ BMI $9903 ; (divmod + 88)
00:98e8 : a9 00 __ LDA #$00
00:98ea : 85 06 __ STA WORK + 3 
00:98ec : a2 10 __ LDX #$10
00:98ee : 06 1b __ ASL ACCU + 0 
00:98f0 : 26 1c __ ROL ACCU + 1 
00:98f2 : 2a __ __ ROL
00:98f3 : c5 03 __ CMP WORK + 0 
00:98f5 : 90 02 __ BCC $98f9 ; (divmod + 78)
00:98f7 : e5 03 __ SBC WORK + 0 
00:98f9 : 26 1b __ ROL ACCU + 0 
00:98fb : 26 1c __ ROL ACCU + 1 
00:98fd : ca __ __ DEX
00:98fe : d0 f2 __ BNE $98f2 ; (divmod + 71)
00:9900 : 85 05 __ STA WORK + 2 
00:9902 : 60 __ __ RTS
00:9903 : a9 00 __ LDA #$00
00:9905 : 85 05 __ STA WORK + 2 
00:9907 : 85 06 __ STA WORK + 3 
00:9909 : 84 02 __ STY $02 
00:990b : a0 10 __ LDY #$10
00:990d : 18 __ __ CLC
00:990e : 26 1b __ ROL ACCU + 0 
00:9910 : 26 1c __ ROL ACCU + 1 
00:9912 : 26 05 __ ROL WORK + 2 
00:9914 : 26 06 __ ROL WORK + 3 
00:9916 : 38 __ __ SEC
00:9917 : a5 05 __ LDA WORK + 2 
00:9919 : e5 03 __ SBC WORK + 0 
00:991b : aa __ __ TAX
00:991c : a5 06 __ LDA WORK + 3 
00:991e : e5 04 __ SBC WORK + 1 
00:9920 : 90 04 __ BCC $9926 ; (divmod + 123)
00:9922 : 86 05 __ STX WORK + 2 
00:9924 : 85 06 __ STA WORK + 3 
00:9926 : 88 __ __ DEY
00:9927 : d0 e5 __ BNE $990e ; (divmod + 99)
00:9929 : 26 1b __ ROL ACCU + 0 
00:992b : 26 1c __ ROL ACCU + 1 
00:992d : a4 02 __ LDY $02 
00:992f : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
00:994e : 84 02 __ STY $02 
00:9950 : a0 20 __ LDY #$20
00:9952 : a9 00 __ LDA #$00
00:9954 : 85 07 __ STA WORK + 4 
00:9956 : 85 08 __ STA WORK + 5 
00:9958 : 85 09 __ STA WORK + 6 
00:995a : 85 0a __ STA WORK + 7 
00:995c : a5 05 __ LDA WORK + 2 
00:995e : 05 06 __ ORA WORK + 3 
00:9960 : d0 78 __ BNE $99da ; (divmod32 + 140)
00:9962 : a5 04 __ LDA WORK + 1 
00:9964 : d0 27 __ BNE $998d ; (divmod32 + 63)
00:9966 : 18 __ __ CLC
00:9967 : 26 1b __ ROL ACCU + 0 
00:9969 : 26 1c __ ROL ACCU + 1 
00:996b : 26 1d __ ROL ACCU + 2 
00:996d : 26 1e __ ROL ACCU + 3 
00:996f : 2a __ __ ROL
00:9970 : 90 05 __ BCC $9977 ; (divmod32 + 41)
00:9972 : e5 03 __ SBC WORK + 0 
00:9974 : 38 __ __ SEC
00:9975 : b0 06 __ BCS $997d ; (divmod32 + 47)
00:9977 : c5 03 __ CMP WORK + 0 
00:9979 : 90 02 __ BCC $997d ; (divmod32 + 47)
00:997b : e5 03 __ SBC WORK + 0 
00:997d : 88 __ __ DEY
00:997e : d0 e7 __ BNE $9967 ; (divmod32 + 25)
00:9980 : 85 07 __ STA WORK + 4 
00:9982 : 26 1b __ ROL ACCU + 0 
00:9984 : 26 1c __ ROL ACCU + 1 
00:9986 : 26 1d __ ROL ACCU + 2 
00:9988 : 26 1e __ ROL ACCU + 3 
00:998a : a4 02 __ LDY $02 
00:998c : 60 __ __ RTS
00:998d : a5 1e __ LDA ACCU + 3 
00:998f : d0 10 __ BNE $99a1 ; (divmod32 + 83)
00:9991 : a6 1d __ LDX ACCU + 2 
00:9993 : 86 1e __ STX ACCU + 3 
00:9995 : a6 1c __ LDX ACCU + 1 
00:9997 : 86 1d __ STX ACCU + 2 
00:9999 : a6 1b __ LDX ACCU + 0 
00:999b : 86 1c __ STX ACCU + 1 
00:999d : 85 1b __ STA ACCU + 0 
00:999f : a0 18 __ LDY #$18
00:99a1 : 18 __ __ CLC
00:99a2 : 26 1b __ ROL ACCU + 0 
00:99a4 : 26 1c __ ROL ACCU + 1 
00:99a6 : 26 1d __ ROL ACCU + 2 
00:99a8 : 26 1e __ ROL ACCU + 3 
00:99aa : 26 07 __ ROL WORK + 4 
00:99ac : 26 08 __ ROL WORK + 5 
00:99ae : 90 0c __ BCC $99bc ; (divmod32 + 110)
00:99b0 : a5 07 __ LDA WORK + 4 
00:99b2 : e5 03 __ SBC WORK + 0 
00:99b4 : aa __ __ TAX
00:99b5 : a5 08 __ LDA WORK + 5 
00:99b7 : e5 04 __ SBC WORK + 1 
00:99b9 : 38 __ __ SEC
00:99ba : b0 0c __ BCS $99c8 ; (divmod32 + 122)
00:99bc : 38 __ __ SEC
00:99bd : a5 07 __ LDA WORK + 4 
00:99bf : e5 03 __ SBC WORK + 0 
00:99c1 : aa __ __ TAX
00:99c2 : a5 08 __ LDA WORK + 5 
00:99c4 : e5 04 __ SBC WORK + 1 
00:99c6 : 90 04 __ BCC $99cc ; (divmod32 + 126)
00:99c8 : 86 07 __ STX WORK + 4 
00:99ca : 85 08 __ STA WORK + 5 
00:99cc : 88 __ __ DEY
00:99cd : d0 d3 __ BNE $99a2 ; (divmod32 + 84)
00:99cf : 26 1b __ ROL ACCU + 0 
00:99d1 : 26 1c __ ROL ACCU + 1 
00:99d3 : 26 1d __ ROL ACCU + 2 
00:99d5 : 26 1e __ ROL ACCU + 3 
00:99d7 : a4 02 __ LDY $02 
00:99d9 : 60 __ __ RTS
00:99da : a0 10 __ LDY #$10
00:99dc : a5 1e __ LDA ACCU + 3 
00:99de : 85 08 __ STA WORK + 5 
00:99e0 : a5 1d __ LDA ACCU + 2 
00:99e2 : 85 07 __ STA WORK + 4 
00:99e4 : a9 00 __ LDA #$00
00:99e6 : 85 1d __ STA ACCU + 2 
00:99e8 : 85 1e __ STA ACCU + 3 
00:99ea : 18 __ __ CLC
00:99eb : 26 1b __ ROL ACCU + 0 
00:99ed : 26 1c __ ROL ACCU + 1 
00:99ef : 26 07 __ ROL WORK + 4 
00:99f1 : 26 08 __ ROL WORK + 5 
00:99f3 : 26 09 __ ROL WORK + 6 
00:99f5 : 26 0a __ ROL WORK + 7 
00:99f7 : a5 07 __ LDA WORK + 4 
00:99f9 : c5 03 __ CMP WORK + 0 
00:99fb : a5 08 __ LDA WORK + 5 
00:99fd : e5 04 __ SBC WORK + 1 
00:99ff : a5 09 __ LDA WORK + 6 
00:9a01 : e5 05 __ SBC WORK + 2 
00:9a03 : aa __ __ TAX
00:9a04 : a5 0a __ LDA WORK + 7 
00:9a06 : e5 06 __ SBC WORK + 3 
00:9a08 : 90 11 __ BCC $9a1b ; (divmod32 + 205)
00:9a0a : 86 09 __ STX WORK + 6 
00:9a0c : 85 0a __ STA WORK + 7 
00:9a0e : a5 07 __ LDA WORK + 4 
00:9a10 : e5 03 __ SBC WORK + 0 
00:9a12 : 85 07 __ STA WORK + 4 
00:9a14 : a5 08 __ LDA WORK + 5 
00:9a16 : e5 04 __ SBC WORK + 1 
00:9a18 : 85 08 __ STA WORK + 5 
00:9a1a : 38 __ __ SEC
00:9a1b : 88 __ __ DEY
00:9a1c : d0 cd __ BNE $99eb ; (divmod32 + 157)
00:9a1e : 26 1b __ ROL ACCU + 0 
00:9a20 : 26 1c __ ROL ACCU + 1 
00:9a22 : a4 02 __ LDY $02 
00:9a24 : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
00:9a25 : 18 __ __ CLC
00:9a26 : a5 1b __ LDA ACCU + 0 
00:9a28 : 69 0d __ ADC #$0d
00:9a2a : 29 fc __ AND #$fc
00:9a2c : 85 03 __ STA WORK + 0 
00:9a2e : a5 1c __ LDA ACCU + 1 
00:9a30 : 69 00 __ ADC #$00
00:9a32 : 85 04 __ STA WORK + 1 
00:9a34 : ad c5 4d LDA $4dc5 ; (HeapNode + 2)
00:9a37 : d0 26 __ BNE $9a5f ; (crt_malloc + 58)
00:9a39 : a9 00 __ LDA #$00
00:9a3b : 8d ca 4d STA $4dca 
00:9a3e : 8d cb 4d STA $4dcb 
00:9a41 : ee c5 4d INC $4dc5 ; (HeapNode + 2)
00:9a44 : a9 c8 __ LDA #$c8
00:9a46 : 09 02 __ ORA #$02
00:9a48 : 8d c3 4d STA $4dc3 ; (HeapNode + 0)
00:9a4b : a9 4d __ LDA #$4d
00:9a4d : 8d c4 4d STA $4dc4 ; (HeapNode + 1)
00:9a50 : 38 __ __ SEC
00:9a51 : a9 00 __ LDA #$00
00:9a53 : e9 02 __ SBC #$02
00:9a55 : 8d cc 4d STA $4dcc 
00:9a58 : a9 70 __ LDA #$70
00:9a5a : e9 00 __ SBC #$00
00:9a5c : 8d cd 4d STA $4dcd 
00:9a5f : a9 c3 __ LDA #$c3
00:9a61 : a2 4d __ LDX #$4d
00:9a63 : 85 1d __ STA ACCU + 2 
00:9a65 : 86 1e __ STX ACCU + 3 
00:9a67 : 18 __ __ CLC
00:9a68 : a0 00 __ LDY #$00
00:9a6a : b1 1d __ LDA (ACCU + 2),y 
00:9a6c : 85 1b __ STA ACCU + 0 
00:9a6e : 65 03 __ ADC WORK + 0 
00:9a70 : 85 05 __ STA WORK + 2 
00:9a72 : c8 __ __ INY
00:9a73 : b1 1d __ LDA (ACCU + 2),y 
00:9a75 : 85 1c __ STA ACCU + 1 
00:9a77 : f0 20 __ BEQ $9a99 ; (crt_malloc + 116)
00:9a79 : 65 04 __ ADC WORK + 1 
00:9a7b : 85 06 __ STA WORK + 3 
00:9a7d : b0 14 __ BCS $9a93 ; (crt_malloc + 110)
00:9a7f : a0 02 __ LDY #$02
00:9a81 : b1 1b __ LDA (ACCU + 0),y 
00:9a83 : c5 05 __ CMP WORK + 2 
00:9a85 : c8 __ __ INY
00:9a86 : b1 1b __ LDA (ACCU + 0),y 
00:9a88 : e5 06 __ SBC WORK + 3 
00:9a8a : b0 0f __ BCS $9a9b ; (crt_malloc + 118)
00:9a8c : a5 1b __ LDA ACCU + 0 
00:9a8e : a6 1c __ LDX ACCU + 1 
00:9a90 : 4c 63 20 JMP $2063 
00:9a93 : a9 00 __ LDA #$00
00:9a95 : 85 1b __ STA ACCU + 0 
00:9a97 : 85 1c __ STA ACCU + 1 
00:9a99 : 02 __ __ INV
00:9a9a : 60 __ __ RTS
00:9a9b : a5 05 __ LDA WORK + 2 
00:9a9d : 85 07 __ STA WORK + 4 
00:9a9f : a5 06 __ LDA WORK + 3 
00:9aa1 : 85 08 __ STA WORK + 5 
00:9aa3 : a0 02 __ LDY #$02
00:9aa5 : a5 07 __ LDA WORK + 4 
00:9aa7 : d1 1b __ CMP (ACCU + 0),y 
00:9aa9 : d0 15 __ BNE $9ac0 ; (crt_malloc + 155)
00:9aab : c8 __ __ INY
00:9aac : a5 08 __ LDA WORK + 5 
00:9aae : d1 1b __ CMP (ACCU + 0),y 
00:9ab0 : d0 0e __ BNE $9ac0 ; (crt_malloc + 155)
00:9ab2 : a0 00 __ LDY #$00
00:9ab4 : b1 1b __ LDA (ACCU + 0),y 
00:9ab6 : 91 1d __ STA (ACCU + 2),y 
00:9ab8 : c8 __ __ INY
00:9ab9 : b1 1b __ LDA (ACCU + 0),y 
00:9abb : 91 1d __ STA (ACCU + 2),y 
00:9abd : 4c dd 20 JMP $20dd 
00:9ac0 : a0 00 __ LDY #$00
00:9ac2 : b1 1b __ LDA (ACCU + 0),y 
00:9ac4 : 91 07 __ STA (WORK + 4),y 
00:9ac6 : a5 07 __ LDA WORK + 4 
00:9ac8 : 91 1d __ STA (ACCU + 2),y 
00:9aca : c8 __ __ INY
00:9acb : b1 1b __ LDA (ACCU + 0),y 
00:9acd : 91 07 __ STA (WORK + 4),y 
00:9acf : a5 08 __ LDA WORK + 5 
00:9ad1 : 91 1d __ STA (ACCU + 2),y 
00:9ad3 : c8 __ __ INY
00:9ad4 : b1 1b __ LDA (ACCU + 0),y 
00:9ad6 : 91 07 __ STA (WORK + 4),y 
00:9ad8 : c8 __ __ INY
00:9ad9 : b1 1b __ LDA (ACCU + 0),y 
00:9adb : 91 07 __ STA (WORK + 4),y 
00:9add : a0 00 __ LDY #$00
00:9adf : a5 05 __ LDA WORK + 2 
00:9ae1 : 91 1b __ STA (ACCU + 0),y 
00:9ae3 : c8 __ __ INY
00:9ae4 : a5 06 __ LDA WORK + 3 
00:9ae6 : 91 1b __ STA (ACCU + 0),y 
00:9ae8 : a0 02 __ LDY #$02
00:9aea : a9 bd __ LDA #$bd
00:9aec : 91 1b __ STA (ACCU + 0),y 
00:9aee : c8 __ __ INY
00:9aef : 91 1b __ STA (ACCU + 0),y 
00:9af1 : c8 __ __ INY
00:9af2 : 91 1b __ STA (ACCU + 0),y 
00:9af4 : c8 __ __ INY
00:9af5 : 91 1b __ STA (ACCU + 0),y 
00:9af7 : 38 __ __ SEC
00:9af8 : a5 05 __ LDA WORK + 2 
00:9afa : e9 04 __ SBC #$04
00:9afc : 85 05 __ STA WORK + 2 
00:9afe : b0 02 __ BCS $9b02 ; (crt_malloc + 221)
00:9b00 : c6 06 __ DEC WORK + 3 
00:9b02 : a9 be __ LDA #$be
00:9b04 : a0 00 __ LDY #$00
00:9b06 : 91 05 __ STA (WORK + 2),y 
00:9b08 : c8 __ __ INY
00:9b09 : 91 05 __ STA (WORK + 2),y 
00:9b0b : c8 __ __ INY
00:9b0c : 91 05 __ STA (WORK + 2),y 
00:9b0e : c8 __ __ INY
00:9b0f : 91 05 __ STA (WORK + 2),y 
00:9b11 : 18 __ __ CLC
00:9b12 : a5 1b __ LDA ACCU + 0 
00:9b14 : 69 06 __ ADC #$06
00:9b16 : 85 1b __ STA ACCU + 0 
00:9b18 : 90 02 __ BCC $9b1c ; (crt_malloc + 247)
00:9b1a : e6 1c __ INC ACCU + 1 
00:9b1c : 60 __ __ RTS
--------------------------------------------------------------------
crt_free@proxy: ; crt_free@proxy
00:9b1d : a5 0d __ LDA P0 
00:9b1f : 85 1b __ STA ACCU + 0 
00:9b21 : a5 0e __ LDA P1 
00:9b23 : 85 1c __ STA ACCU + 1 
--------------------------------------------------------------------
crt_free: ; crt_free
00:9b25 : a5 1b __ LDA ACCU + 0 
00:9b27 : 05 1c __ ORA ACCU + 1 
00:9b29 : d0 01 __ BNE $9b2c ; (crt_free + 7)
00:9b2b : 60 __ __ RTS
00:9b2c : 38 __ __ SEC
00:9b2d : a5 1b __ LDA ACCU + 0 
00:9b2f : 29 03 __ AND #$03
00:9b31 : d0 56 __ BNE $9b89 ; (crt_free + 100)
00:9b33 : a5 1b __ LDA ACCU + 0 
00:9b35 : e9 06 __ SBC #$06
00:9b37 : 85 1b __ STA ACCU + 0 
00:9b39 : b0 02 __ BCS $9b3d ; (crt_free + 24)
00:9b3b : c6 1c __ DEC ACCU + 1 
00:9b3d : a0 02 __ LDY #$02
00:9b3f : a9 bd __ LDA #$bd
00:9b41 : d1 1b __ CMP (ACCU + 0),y 
00:9b43 : d0 44 __ BNE $9b89 ; (crt_free + 100)
00:9b45 : c8 __ __ INY
00:9b46 : d1 1b __ CMP (ACCU + 0),y 
00:9b48 : d0 3f __ BNE $9b89 ; (crt_free + 100)
00:9b4a : c8 __ __ INY
00:9b4b : d1 1b __ CMP (ACCU + 0),y 
00:9b4d : d0 3a __ BNE $9b89 ; (crt_free + 100)
00:9b4f : c8 __ __ INY
00:9b50 : d1 1b __ CMP (ACCU + 0),y 
00:9b52 : d0 35 __ BNE $9b89 ; (crt_free + 100)
00:9b54 : a0 00 __ LDY #$00
00:9b56 : 38 __ __ SEC
00:9b57 : b1 1b __ LDA (ACCU + 0),y 
00:9b59 : e9 04 __ SBC #$04
00:9b5b : 85 03 __ STA WORK + 0 
00:9b5d : c8 __ __ INY
00:9b5e : b1 1b __ LDA (ACCU + 0),y 
00:9b60 : e9 00 __ SBC #$00
00:9b62 : 85 04 __ STA WORK + 1 
00:9b64 : a0 00 __ LDY #$00
00:9b66 : a9 be __ LDA #$be
00:9b68 : d1 03 __ CMP (WORK + 0),y 
00:9b6a : d0 1d __ BNE $9b89 ; (crt_free + 100)
00:9b6c : c8 __ __ INY
00:9b6d : d1 03 __ CMP (WORK + 0),y 
00:9b6f : d0 18 __ BNE $9b89 ; (crt_free + 100)
00:9b71 : c8 __ __ INY
00:9b72 : d1 03 __ CMP (WORK + 0),y 
00:9b74 : d0 13 __ BNE $9b89 ; (crt_free + 100)
00:9b76 : c8 __ __ INY
00:9b77 : d1 03 __ CMP (WORK + 0),y 
00:9b79 : d0 0e __ BNE $9b89 ; (crt_free + 100)
00:9b7b : a5 1c __ LDA ACCU + 1 
00:9b7d : a6 1b __ LDX ACCU + 0 
00:9b7f : c9 4d __ CMP #$4d
00:9b81 : 90 06 __ BCC $9b89 ; (crt_free + 100)
00:9b83 : d0 05 __ BNE $9b8a ; (crt_free + 101)
00:9b85 : e0 c8 __ CPX #$c8
00:9b87 : b0 01 __ BCS $9b8a ; (crt_free + 101)
00:9b89 : 02 __ __ INV
00:9b8a : c9 70 __ CMP #$70
00:9b8c : 90 06 __ BCC $9b94 ; (crt_free + 111)
00:9b8e : d0 f9 __ BNE $9b89 ; (crt_free + 100)
00:9b90 : e0 00 __ CPX #$00
00:9b92 : b0 f5 __ BCS $9b89 ; (crt_free + 100)
00:9b94 : a0 02 __ LDY #$02
00:9b96 : a9 bf __ LDA #$bf
00:9b98 : 91 1b __ STA (ACCU + 0),y 
00:9b9a : c8 __ __ INY
00:9b9b : 91 1b __ STA (ACCU + 0),y 
00:9b9d : a0 00 __ LDY #$00
00:9b9f : b1 1b __ LDA (ACCU + 0),y 
00:9ba1 : 85 1d __ STA ACCU + 2 
00:9ba3 : c8 __ __ INY
00:9ba4 : b1 1b __ LDA (ACCU + 0),y 
00:9ba6 : 85 1e __ STA ACCU + 3 
00:9ba8 : a9 c3 __ LDA #$c3
00:9baa : a2 4d __ LDX #$4d
00:9bac : 85 05 __ STA WORK + 2 
00:9bae : 86 06 __ STX WORK + 3 
00:9bb0 : a0 01 __ LDY #$01
00:9bb2 : b1 05 __ LDA (WORK + 2),y 
00:9bb4 : f0 28 __ BEQ $9bde ; (crt_free + 185)
00:9bb6 : aa __ __ TAX
00:9bb7 : 88 __ __ DEY
00:9bb8 : b1 05 __ LDA (WORK + 2),y 
00:9bba : e4 1e __ CPX ACCU + 3 
00:9bbc : 90 ee __ BCC $9bac ; (crt_free + 135)
00:9bbe : d0 1e __ BNE $9bde ; (crt_free + 185)
00:9bc0 : c5 1d __ CMP ACCU + 2 
00:9bc2 : 90 e8 __ BCC $9bac ; (crt_free + 135)
00:9bc4 : d0 18 __ BNE $9bde ; (crt_free + 185)
00:9bc6 : a0 00 __ LDY #$00
00:9bc8 : b1 1d __ LDA (ACCU + 2),y 
00:9bca : 91 1b __ STA (ACCU + 0),y 
00:9bcc : c8 __ __ INY
00:9bcd : b1 1d __ LDA (ACCU + 2),y 
00:9bcf : 91 1b __ STA (ACCU + 0),y 
00:9bd1 : c8 __ __ INY
00:9bd2 : b1 1d __ LDA (ACCU + 2),y 
00:9bd4 : 91 1b __ STA (ACCU + 0),y 
00:9bd6 : c8 __ __ INY
00:9bd7 : b1 1d __ LDA (ACCU + 2),y 
00:9bd9 : 91 1b __ STA (ACCU + 0),y 
00:9bdb : 4c f3 21 JMP $21f3 
00:9bde : a0 00 __ LDY #$00
00:9be0 : b1 05 __ LDA (WORK + 2),y 
00:9be2 : 91 1b __ STA (ACCU + 0),y 
00:9be4 : c8 __ __ INY
00:9be5 : b1 05 __ LDA (WORK + 2),y 
00:9be7 : 91 1b __ STA (ACCU + 0),y 
00:9be9 : c8 __ __ INY
00:9bea : a5 1d __ LDA ACCU + 2 
00:9bec : 91 1b __ STA (ACCU + 0),y 
00:9bee : c8 __ __ INY
00:9bef : a5 1e __ LDA ACCU + 3 
00:9bf1 : 91 1b __ STA (ACCU + 0),y 
00:9bf3 : a0 02 __ LDY #$02
00:9bf5 : b1 05 __ LDA (WORK + 2),y 
00:9bf7 : c5 1b __ CMP ACCU + 0 
00:9bf9 : d0 1d __ BNE $9c18 ; (crt_free + 243)
00:9bfb : c8 __ __ INY
00:9bfc : b1 05 __ LDA (WORK + 2),y 
00:9bfe : c5 1c __ CMP ACCU + 1 
00:9c00 : d0 16 __ BNE $9c18 ; (crt_free + 243)
00:9c02 : a0 00 __ LDY #$00
00:9c04 : b1 1b __ LDA (ACCU + 0),y 
00:9c06 : 91 05 __ STA (WORK + 2),y 
00:9c08 : c8 __ __ INY
00:9c09 : b1 1b __ LDA (ACCU + 0),y 
00:9c0b : 91 05 __ STA (WORK + 2),y 
00:9c0d : c8 __ __ INY
00:9c0e : b1 1b __ LDA (ACCU + 0),y 
00:9c10 : 91 05 __ STA (WORK + 2),y 
00:9c12 : c8 __ __ INY
00:9c13 : b1 1b __ LDA (ACCU + 0),y 
00:9c15 : 91 05 __ STA (WORK + 2),y 
00:9c17 : 60 __ __ RTS
00:9c18 : a0 00 __ LDY #$00
00:9c1a : a5 1b __ LDA ACCU + 0 
00:9c1c : 91 05 __ STA (WORK + 2),y 
00:9c1e : c8 __ __ INY
00:9c1f : a5 1c __ LDA ACCU + 1 
00:9c21 : 91 05 __ STA (WORK + 2),y 
00:9c23 : 60 __ __ RTS
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
00:9c24 : a9 80 __ LDA #$80
00:9c26 : 85 0d __ STA P0 
00:9c28 : a9 22 __ LDA #$22
00:9c2a : 85 0e __ STA P1 
00:9c2c : 4c fb 0e JMP $0efb 
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
00:9c2f : a9 22 __ LDA #$22
00:9c31 : 85 0e __ STA P1 
00:9c33 : 4c fb 0e JMP $0efb 
--------------------------------------------------------------------
mul40:
00:9c36 : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
00:9c46 : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
00:9c56 : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
00:9c66 : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
p2smap:
00:9c68 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
p2smap:
00:9c70 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
configpath:
00:9c78 : __ __ __ BYT 2f 55 53 42 2a 2f 00 00                         : /USB*/..
--------------------------------------------------------------------
configfilename:
00:9c80 : __ __ __ BYT 44 4d 42 43 46 47 2e 43 46 47 00                : DMBCFG.CFG.
--------------------------------------------------------------------
print1: ; print1()->void
.s4:
01:8000 : a9 0e __ LDA #$0e
01:8002 : 85 0d __ STA P0 
01:8004 : a9 80 __ LDA #$80
01:8006 : 85 0e __ STA P1 
01:8008 : 20 12 11 JSR $1112 
01:800b : 4c 99 11 JMP $1199 
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
02:8008 : 20 12 11 JSR $1112 
02:800b : 4c 99 11 JMP $1199 
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
03:8008 : 20 12 11 JSR $1112 
03:800b : 4c 99 11 JMP $1199 
--------------------------------------------------------------------
03:800e : __ __ __ BYT 74 48 49 53 20 49 53 20 54 48 49 52 44 20 42 41 : tHIS IS THIRD BA
03:801e : __ __ __ BYT 4e 4b 00                                        : NK.
