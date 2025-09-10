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
00:8208 : 20 49 11 JSR $1149 
00:820b : 20 d0 11 JSR $11d0 
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
00:82a3 : 4c 78 a4 JMP $a478 ; (mul40 + 16)
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
00:8369 : a9 a9 __ LDA #$a9
00:836b : 85 0d __ STA P0 
00:836d : a9 11 __ LDA #$11
00:836f : 85 0e __ STA P1 
00:8371 : 20 49 11 JSR $1149 
00:8374 : 20 d0 11 JSR $11d0 
00:8377 : a9 e8 __ LDA #$e8
00:8379 : 85 0d __ STA P0 
00:837b : a9 11 __ LDA #$11
00:837d : 85 0e __ STA P1 
00:837f : 20 49 11 JSR $1149 
00:8382 : 20 d0 11 JSR $11d0 
00:8385 : 20 fb 11 JSR $11fb 
00:8388 : 20 00 c0 JSR $c000 
00:838b : 4c 9f 09 JMP $099f 
.s61:
00:838e : 20 40 11 JSR $1140 
00:8391 : a9 09 __ LDA #$09
00:8393 : 85 0d __ STA P0 
00:8395 : a9 12 __ LDA #$12
00:8397 : 85 0e __ STA P1 
00:8399 : 20 49 11 JSR $1149 
00:839c : 20 d0 11 JSR $11d0 
.s8:
00:839f : a9 00 __ LDA #$00
00:83a1 : 85 10 __ STA P3 
00:83a3 : 8d ee 7c STA $7cee ; (cmd + 0)
00:83a6 : a9 02 __ LDA #$02
00:83a8 : 85 0f __ STA P2 
00:83aa : a9 01 __ LDA #$01
00:83ac : 8d fe 24 STA $24fe 
00:83af : 8d ef 7c STA $7cef ; (cmd + 1)
00:83b2 : a9 ee __ LDA #$ee
00:83b4 : 85 0d __ STA P0 
00:83b6 : a9 7c __ LDA #$7c
00:83b8 : 85 0e __ STA P1 
00:83ba : 20 a6 0f JSR $0fa6 
00:83bd : 20 27 10 JSR $1027 
00:83c0 : 20 6c 10 JSR $106c 
00:83c3 : 20 1e 11 JSR $111e 
00:83c6 : a9 c8 __ LDA #$c8
00:83c8 : 85 0d __ STA P0 
00:83ca : a9 49 __ LDA #$49
00:83cc : 85 0e __ STA P1 
00:83ce : 20 49 11 JSR $1149 
00:83d1 : 20 d0 11 JSR $11d0 
00:83d4 : 20 2e 12 JSR $122e 
00:83d7 : a5 1c __ LDA ACCU + 1 
00:83d9 : 05 1b __ ORA ACCU + 0 
00:83db : d0 10 __ BNE $83ed ; (mainloop.s60 + 0)
.s9:
00:83dd : a9 88 __ LDA #$88
00:83df : 8d fc 7f STA $7ffc ; (sstack + 4)
00:83e2 : a9 1a __ LDA #$1a
00:83e4 : 8d fd 7f STA $7ffd ; (sstack + 5)
00:83e7 : 20 30 1a JSR $1a30 
00:83ea : 4c 12 0a JMP $0a12 
.s60:
00:83ed : a9 14 __ LDA #$14
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
00:840f : 20 79 13 JSR $1379 
.s10:
00:8412 : a9 00 __ LDA #$00
00:8414 : 8d 09 dc STA $dc09 
00:8417 : 8d 08 dc STA $dc08 
.l11:
00:841a : 20 a1 10 JSR $10a1 
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
00:8432 : 20 99 1a JSR $1a99 
00:8435 : 20 8c 1e JSR $1e8c 
00:8438 : 20 e5 23 JSR $23e5 
00:843b : a5 1b __ LDA ACCU + 0 
00:843d : d0 0d __ BNE $844c ; (mainloop.s16 + 0)
.s15:
00:843f : a9 b3 __ LDA #$b3
00:8441 : 8d fc 7f STA $7ffc ; (sstack + 4)
00:8444 : a9 24 __ LDA #$24
00:8446 : 8d fd 7f STA $7ffd ; (sstack + 5)
00:8449 : 20 30 1a JSR $1a30 
.s16:
00:844c : a9 ce __ LDA #$ce
00:844e : a0 05 __ LDY #$05
00:8450 : 91 23 __ STA (SP + 0),y 
00:8452 : a9 24 __ LDA #$24
00:8454 : c8 __ __ INY
00:8455 : 91 23 __ STA (SP + 0),y 
00:8457 : 20 79 13 JSR $1379 
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
00:847a : a9 21 __ LDA #$21
00:847c : a2 f7 __ LDX #$f7
00:847e : 4c 85 0a JMP $0a85 
.s59:
00:8481 : a9 21 __ LDA #$21
00:8483 : a2 f4 __ LDX #$f4
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
00:8496 : a2 ed __ LDX #$ed
.s55:
00:8498 : a0 0c __ LDY #$0c
00:849a : 91 23 __ STA (SP + 0),y 
00:849c : 8a __ __ TXA
00:849d : 88 __ __ DEY
00:849e : 91 23 __ STA (SP + 0),y 
00:84a0 : 20 79 13 JSR $1379 
00:84a3 : 4c c2 0a JMP $0ac2 
.s52:
00:84a6 : aa __ __ TAX
00:84a7 : d0 07 __ BNE $84b0 ; (mainloop.s53 + 0)
.s57:
00:84a9 : a9 21 __ LDA #$21
00:84ab : a2 fb __ LDX #$fb
00:84ad : 4c 98 0a JMP $0a98 
.s53:
00:84b0 : c9 02 __ CMP #$02
00:84b2 : f0 07 __ BEQ $84bb ; (mainloop.s56 + 0)
.s54:
00:84b4 : a9 1e __ LDA #$1e
00:84b6 : a2 34 __ LDX #$34
00:84b8 : 4c 98 0a JMP $0a98 
.s56:
00:84bb : a9 24 __ LDA #$24
00:84bd : a2 f2 __ LDX #$f2
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
00:84e2 : a9 21 __ LDA #$21
00:84e4 : a2 f7 __ LDX #$f7
00:84e6 : 4c ed 0a JMP $0aed 
.s48:
00:84e9 : a9 21 __ LDA #$21
00:84eb : a2 f4 __ LDX #$f4
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
00:84fe : a2 ed __ LDX #$ed
.s44:
00:8500 : a0 0c __ LDY #$0c
00:8502 : 91 23 __ STA (SP + 0),y 
00:8504 : 8a __ __ TXA
00:8505 : 88 __ __ DEY
00:8506 : 91 23 __ STA (SP + 0),y 
00:8508 : 20 79 13 JSR $1379 
00:850b : 4c 2a 0b JMP $0b2a 
.s41:
00:850e : aa __ __ TAX
00:850f : d0 07 __ BNE $8518 ; (mainloop.s42 + 0)
.s46:
00:8511 : a9 21 __ LDA #$21
00:8513 : a2 fb __ LDX #$fb
00:8515 : 4c 00 0b JMP $0b00 
.s42:
00:8518 : c9 02 __ CMP #$02
00:851a : f0 07 __ BEQ $8523 ; (mainloop.s45 + 0)
.s43:
00:851c : a9 1e __ LDA #$1e
00:851e : a2 34 __ LDX #$34
00:8520 : 4c 00 0b JMP $0b00 
.s45:
00:8523 : a9 24 __ LDA #$24
00:8525 : a2 f2 __ LDX #$f2
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
00:854a : a9 21 __ LDA #$21
00:854c : a2 f7 __ LDX #$f7
00:854e : 4c 55 0b JMP $0b55 
.s37:
00:8551 : a9 21 __ LDA #$21
00:8553 : a2 f4 __ LDX #$f4
.s36:
00:8555 : a0 0a __ LDY #$0a
00:8557 : 91 23 __ STA (SP + 0),y 
00:8559 : 8a __ __ TXA
00:855a : 88 __ __ DEY
00:855b : 91 23 __ STA (SP + 0),y 
00:855d : 20 79 13 JSR $1379 
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
00:8580 : a9 21 __ LDA #$21
00:8582 : a2 f7 __ LDX #$f7
00:8584 : 4c 8b 0b JMP $0b8b 
.s33:
00:8587 : a9 21 __ LDA #$21
00:8589 : a2 f4 __ LDX #$f4
.s32:
00:858b : a0 0a __ LDY #$0a
00:858d : 91 23 __ STA (SP + 0),y 
00:858f : 8a __ __ TXA
00:8590 : 88 __ __ DEY
00:8591 : 91 23 __ STA (SP + 0),y 
00:8593 : 20 79 13 JSR $1379 
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
00:85a7 : a9 24 __ LDA #$24
00:85a9 : a2 fb __ LDX #$fb
00:85ab : 4c b2 0b JMP $0bb2 
.s29:
00:85ae : a9 24 __ LDA #$24
00:85b0 : a2 f7 __ LDX #$f7
.s22:
00:85b2 : a0 08 __ LDY #$08
00:85b4 : 91 23 __ STA (SP + 0),y 
00:85b6 : 8a __ __ TXA
00:85b7 : 88 __ __ DEY
00:85b8 : 91 23 __ STA (SP + 0),y 
00:85ba : 20 79 13 JSR $1379 
00:85bd : a9 61 __ LDA #$61
00:85bf : a0 05 __ LDY #$05
00:85c1 : 91 23 __ STA (SP + 0),y 
00:85c3 : a9 26 __ LDA #$26
00:85c5 : c8 __ __ INY
00:85c6 : 91 23 __ STA (SP + 0),y 
00:85c8 : 20 79 13 JSR $1379 
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
00:85de : a9 72 __ LDA #$72
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
00:85fe : 20 79 13 JSR $1379 
00:8601 : a6 53 __ LDX T2 + 0 
00:8603 : 4c d2 0b JMP $0bd2 
.s25:
00:8606 : 20 d0 11 JSR $11d0 
00:8609 : a9 01 __ LDA #$01
00:860b : 8d ff df STA $dfff 
00:860e : 20 00 80 JSR $8000 ; (startup + 0)
00:8611 : a9 02 __ LDA #$02
00:8613 : 8d ff df STA $dfff 
00:8616 : 20 00 80 JSR $8000 ; (startup + 0)
00:8619 : a9 03 __ LDA #$03
00:861b : 8d ff df STA $dfff 
00:861e : 20 00 80 JSR $8000 ; (startup + 0)
00:8621 : a9 78 __ LDA #$78
00:8623 : 85 0d __ STA P0 
00:8625 : a9 26 __ LDA #$26
00:8627 : 85 0e __ STA P1 
00:8629 : 20 49 11 JSR $1149 
00:862c : 20 d0 11 JSR $11d0 
00:862f : 20 fb 11 JSR $11fb 
00:8632 : a9 89 __ LDA #$89
00:8634 : 85 0d __ STA P0 
00:8636 : a9 26 __ LDA #$26
00:8638 : 85 0e __ STA P1 
00:863a : 20 49 11 JSR $1149 
00:863d : 20 d0 11 JSR $11d0 
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
00:878a : a9 2e __ LDA #$2e
00:878c : 85 0d __ STA P0 
00:878e : a9 11 __ LDA #$11
00:8790 : 85 0e __ STA P1 
00:8792 : 20 27 0f JSR $0f27 
00:8795 : 38 __ __ SEC
00:8796 : a9 28 __ LDA #$28
00:8798 : e5 1b __ SBC ACCU + 0 
00:879a : 85 0f __ STA P2 
00:879c : a9 2e __ LDA #$2e
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
00:87c2 : bd 68 2a LDA $2a68,x 
00:87c5 : 65 0f __ ADC P2 ; (x + 0)
00:87c7 : 85 1b __ STA ACCU + 0 
00:87c9 : bd 69 2a LDA $2a69,x 
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
00:8806 : bd 9a 2a LDA $2a9a,x 
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
00:88a8 : ad a3 2a LDA $2aa3 
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
00:88be : 7d 68 2a ADC $2a68,x 
00:88c1 : a8 __ __ TAY
00:88c2 : ad 5f 49 LDA $495f ; (cw + 9)
00:88c5 : 7d 69 2a ADC $2a69,x 
00:88c8 : 85 1c __ STA ACCU + 1 
00:88ca : ad 60 49 LDA $4960 ; (cw + 10)
00:88cd : 18 __ __ CLC
00:88ce : 7d 68 2a ADC $2a68,x 
00:88d1 : 85 43 __ STA T3 + 0 
00:88d3 : ad 61 49 LDA $4961 ; (cw + 11)
00:88d6 : 7d 69 2a ADC $2a69,x 
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
00:8988 : 8d fe 24 STA $24fe 
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
00:89a6 : ad fe 24 LDA $24fe 
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
00:8a07 : c9 04 __ CMP #$04
00:8a09 : d0 0b __ BNE $8a16 ; (uii_sendcommand.l9 + 0)
.s11:
00:8a0b : ad 1c df LDA $df1c 
00:8a0e : 09 08 __ ORA #$08
00:8a10 : 8d 1c df STA $df1c 
00:8a13 : 4c b1 0f JMP $0fb1 
.l9:
00:8a16 : ad 1c df LDA $df1c 
00:8a19 : 29 20 __ AND #$20
00:8a1b : d0 09 __ BNE $8a26 ; (uii_sendcommand.s3 + 0)
.s10:
00:8a1d : ad 1c df LDA $df1c 
00:8a20 : 29 10 __ AND #$10
00:8a22 : c9 10 __ CMP #$10
00:8a24 : f0 f0 __ BEQ $8a16 ; (uii_sendcommand.l9 + 0)
.s3:
00:8a26 : 60 __ __ RTS
--------------------------------------------------------------------
uii_readdata: ; uii_readdata()->u16
.s4:
00:8a27 : a9 00 __ LDA #$00
00:8a29 : 8d c8 49 STA $49c8 ; (uii_data + 0)
00:8a2c : a8 __ __ TAY
00:8a2d : f0 19 __ BEQ $8a48 ; (uii_readdata.l5 + 0)
.s8:
00:8a2f : ad 1e df LDA $df1e 
00:8a32 : a9 c8 __ LDA #$c8
00:8a34 : 85 43 __ STA T1 + 0 
00:8a36 : 8a __ __ TXA
00:8a37 : 18 __ __ CLC
00:8a38 : 69 49 __ ADC #$49
00:8a3a : 85 44 __ STA T1 + 1 
00:8a3c : ad 1e df LDA $df1e 
00:8a3f : 91 43 __ STA (T1 + 0),y 
00:8a41 : 98 __ __ TYA
00:8a42 : 69 01 __ ADC #$01
00:8a44 : a8 __ __ TAY
00:8a45 : 8a __ __ TXA
00:8a46 : 69 00 __ ADC #$00
.l5:
00:8a48 : aa __ __ TAX
00:8a49 : ad 1c df LDA $df1c 
00:8a4c : 29 80 __ AND #$80
00:8a4e : c9 80 __ CMP #$80
00:8a50 : d0 07 __ BNE $8a59 ; (uii_readdata.s6 + 0)
.s7:
00:8a52 : e0 02 __ CPX #$02
00:8a54 : d0 d9 __ BNE $8a2f ; (uii_readdata.s8 + 0)
.s9:
00:8a56 : 98 __ __ TYA
00:8a57 : d0 d6 __ BNE $8a2f ; (uii_readdata.s8 + 0)
.s6:
00:8a59 : 86 1c __ STX ACCU + 1 
00:8a5b : 84 1b __ STY ACCU + 0 
00:8a5d : a9 c8 __ LDA #$c8
00:8a5f : 85 43 __ STA T1 + 0 
00:8a61 : 8a __ __ TXA
00:8a62 : 18 __ __ CLC
00:8a63 : 69 49 __ ADC #$49
00:8a65 : 85 44 __ STA T1 + 1 
00:8a67 : a9 00 __ LDA #$00
00:8a69 : 91 43 __ STA (T1 + 0),y 
.s3:
00:8a6b : 60 __ __ RTS
--------------------------------------------------------------------
uii_readstatus: ; uii_readstatus()->void
.s4:
00:8a6c : a9 00 __ LDA #$00
00:8a6e : 8d c9 4b STA $4bc9 ; (uii_status + 0)
00:8a71 : a8 __ __ TAY
00:8a72 : f0 0d __ BEQ $8a81 ; (uii_readstatus.l5 + 0)
.s8:
00:8a74 : ad 1f df LDA $df1f 
00:8a77 : 91 1b __ STA (ACCU + 0),y 
00:8a79 : 98 __ __ TYA
00:8a7a : 18 __ __ CLC
00:8a7b : 69 01 __ ADC #$01
00:8a7d : a8 __ __ TAY
00:8a7e : 8a __ __ TXA
00:8a7f : 69 00 __ ADC #$00
.l5:
00:8a81 : aa __ __ TAX
00:8a82 : a9 c9 __ LDA #$c9
00:8a84 : 85 1b __ STA ACCU + 0 
00:8a86 : 8a __ __ TXA
00:8a87 : 18 __ __ CLC
00:8a88 : 69 4b __ ADC #$4b
00:8a8a : 85 1c __ STA ACCU + 1 
00:8a8c : ad 1c df LDA $df1c 
00:8a8f : 29 40 __ AND #$40
00:8a91 : c9 40 __ CMP #$40
00:8a93 : d0 07 __ BNE $8a9c ; (uii_readstatus.s6 + 0)
.s7:
00:8a95 : e0 01 __ CPX #$01
00:8a97 : d0 db __ BNE $8a74 ; (uii_readstatus.s8 + 0)
.s9:
00:8a99 : 98 __ __ TYA
00:8a9a : d0 d8 __ BNE $8a74 ; (uii_readstatus.s8 + 0)
.s6:
00:8a9c : a9 00 __ LDA #$00
00:8a9e : 91 1b __ STA (ACCU + 0),y 
.s3:
00:8aa0 : 60 __ __ RTS
--------------------------------------------------------------------
uii_change_dir: ; uii_change_dir(u8*)->void
.s4:
00:8aa1 : a9 aa __ LDA #$aa
00:8aa3 : 85 0d __ STA P0 
00:8aa5 : 20 61 2a JSR $2a61 
00:8aa8 : a9 2a __ LDA #$2a
00:8aaa : 85 0e __ STA P1 
00:8aac : 18 __ __ CLC
00:8aad : a5 1b __ LDA ACCU + 0 
00:8aaf : 69 02 __ ADC #$02
00:8ab1 : 85 1b __ STA ACCU + 0 
00:8ab3 : 90 02 __ BCC $8ab7 ; (uii_change_dir.s10 + 0)
.s9:
00:8ab5 : e6 1c __ INC ACCU + 1 
.s10:
00:8ab7 : 20 49 28 JSR $2849 
00:8aba : a5 1b __ LDA ACCU + 0 
00:8abc : 85 45 __ STA T1 + 0 
00:8abe : a5 1c __ LDA ACCU + 1 
00:8ac0 : 85 46 __ STA T1 + 1 
00:8ac2 : a9 00 __ LDA #$00
00:8ac4 : a8 __ __ TAY
00:8ac5 : 91 1b __ STA (ACCU + 0),y 
00:8ac7 : a9 11 __ LDA #$11
00:8ac9 : c8 __ __ INY
00:8aca : 91 1b __ STA (ACCU + 0),y 
00:8acc : 20 27 0f JSR $0f27 
00:8acf : a5 1b __ LDA ACCU + 0 
00:8ad1 : 05 1c __ ORA ACCU + 1 
00:8ad3 : f0 23 __ BEQ $8af8 ; (uii_change_dir.s5 + 0)
.s6:
00:8ad5 : a9 00 __ LDA #$00
00:8ad7 : 85 47 __ STA T2 + 0 
.l8:
00:8ad9 : a9 2a __ LDA #$2a
00:8adb : 85 0e __ STA P1 
00:8add : a6 47 __ LDX T2 + 0 
00:8adf : 8a __ __ TXA
00:8ae0 : 18 __ __ CLC
00:8ae1 : 69 02 __ ADC #$02
00:8ae3 : a8 __ __ TAY
00:8ae4 : bd aa 2a LDA $2aaa,x 
00:8ae7 : 91 45 __ STA (T1 + 0),y 
00:8ae9 : 20 27 0f JSR $0f27 
00:8aec : e6 47 __ INC T2 + 0 
00:8aee : a5 1c __ LDA ACCU + 1 
00:8af0 : d0 e7 __ BNE $8ad9 ; (uii_change_dir.l8 + 0)
.s7:
00:8af2 : a5 47 __ LDA T2 + 0 
00:8af4 : c5 1b __ CMP ACCU + 0 
00:8af6 : 90 e1 __ BCC $8ad9 ; (uii_change_dir.l8 + 0)
.s5:
00:8af8 : a9 01 __ LDA #$01
00:8afa : 8d fe 24 STA $24fe 
00:8afd : 20 61 2a JSR $2a61 
00:8b00 : a5 45 __ LDA T1 + 0 
00:8b02 : 85 0d __ STA P0 
00:8b04 : a5 46 __ LDA T1 + 1 
00:8b06 : 85 0e __ STA P1 
00:8b08 : 18 __ __ CLC
00:8b09 : a5 1b __ LDA ACCU + 0 
00:8b0b : 69 02 __ ADC #$02
00:8b0d : 85 0f __ STA P2 
00:8b0f : a5 1c __ LDA ACCU + 1 
00:8b11 : 69 00 __ ADC #$00
00:8b13 : 85 10 __ STA P3 
00:8b15 : 20 a6 0f JSR $0fa6 
00:8b18 : 20 41 29 JSR $2941 
00:8b1b : 20 6c 10 JSR $106c 
--------------------------------------------------------------------
uii_accept: ; uii_accept()->void
.s4:
00:8b1e : ad 1c df LDA $df1c 
00:8b21 : 09 02 __ ORA #$02
00:8b23 : 8d 1c df STA $df1c 
.l5:
00:8b26 : ad 1c df LDA $df1c 
00:8b29 : 29 02 __ AND #$02
00:8b2b : d0 f9 __ BNE $8b26 ; (uii_accept.l5 + 0)
.s3:
00:8b2d : 60 __ __ RTS
--------------------------------------------------------------------
00:8b2e : __ __ __ BYT 56 32 30 2d 32 30 32 35 30 39 31 30 2d 31 36 35 : V20-20250910-165
00:8b3e : __ __ __ BYT 34 00                                           : 4.
--------------------------------------------------------------------
uii_abort: ; uii_abort()->void
.s4:
00:8b40 : ad 1c df LDA $df1c 
00:8b43 : 09 04 __ ORA #$04
00:8b45 : 8d 1c df STA $df1c 
.s3:
00:8b48 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_put_string: ; cwin_put_string(struct CharWin*,const u8*,u8)->void
.s4:
00:8b49 : ad 5b 49 LDA $495b ; (cw + 5)
00:8b4c : 0a __ __ ASL
00:8b4d : aa __ __ TAX
00:8b4e : bd 68 2a LDA $2a68,x 
00:8b51 : 6d 5a 49 ADC $495a ; (cw + 4)
00:8b54 : 85 1b __ STA ACCU + 0 
00:8b56 : bd 69 2a LDA $2a69,x 
00:8b59 : 69 00 __ ADC #$00
00:8b5b : 85 1c __ STA ACCU + 1 
00:8b5d : ad 5e 49 LDA $495e ; (cw + 8)
00:8b60 : 65 1b __ ADC ACCU + 0 
00:8b62 : 85 43 __ STA T1 + 0 
00:8b64 : ad 5f 49 LDA $495f ; (cw + 9)
00:8b67 : 65 1c __ ADC ACCU + 1 
00:8b69 : 85 44 __ STA T1 + 1 
00:8b6b : ad 60 49 LDA $4960 ; (cw + 10)
00:8b6e : 18 __ __ CLC
00:8b6f : 65 1b __ ADC ACCU + 0 
00:8b71 : 85 1b __ STA ACCU + 0 
00:8b73 : ad 61 49 LDA $4961 ; (cw + 11)
00:8b76 : 65 1c __ ADC ACCU + 1 
00:8b78 : 85 1c __ STA ACCU + 1 
00:8b7a : a0 00 __ LDY #$00
00:8b7c : b1 0d __ LDA (P0),y ; (str + 0)
00:8b7e : f0 16 __ BEQ $8b96 ; (cwin_put_string.s5 + 0)
.l7:
00:8b80 : 4a __ __ LSR
00:8b81 : 4a __ __ LSR
00:8b82 : 4a __ __ LSR
00:8b83 : 4a __ __ LSR
00:8b84 : 4a __ __ LSR
00:8b85 : aa __ __ TAX
00:8b86 : bd a2 2a LDA $2aa2,x 
00:8b89 : 51 0d __ EOR (P0),y ; (str + 0)
00:8b8b : 91 43 __ STA (T1 + 0),y 
00:8b8d : a9 07 __ LDA #$07
00:8b8f : 91 1b __ STA (ACCU + 0),y 
00:8b91 : c8 __ __ INY
00:8b92 : b1 0d __ LDA (P0),y ; (str + 0)
00:8b94 : d0 ea __ BNE $8b80 ; (cwin_put_string.l7 + 0)
.s5:
00:8b96 : 98 __ __ TYA
00:8b97 : 18 __ __ CLC
00:8b98 : 6d 5a 49 ADC $495a ; (cw + 4)
00:8b9b : cd 58 49 CMP $4958 ; (cw + 2)
00:8b9e : 90 05 __ BCC $8ba5 ; (cwin_put_string.s3 + 0)
.s6:
00:8ba0 : a9 00 __ LDA #$00
00:8ba2 : ee 5b 49 INC $495b ; (cw + 5)
.s3:
00:8ba5 : 8d 5a 49 STA $495a ; (cw + 4)
00:8ba8 : 60 __ __ RTS
--------------------------------------------------------------------
00:8ba9 : __ __ __ BYT 6e 4f 20 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d : nO uLTIMATE cOMM
00:8bb9 : __ __ __ BYT 41 4e 44 20 69 4e 54 45 52 46 41 43 45 20 45 4e : AND iNTERFACE EN
00:8bc9 : __ __ __ BYT 41 42 4c 45 44 2e 00                            : ABLED..
--------------------------------------------------------------------
cwin_cursor_newline: ; cwin_cursor_newline(struct CharWin*)->void
.s4:
00:8bd0 : ad 5b 49 LDA $495b ; (cw + 5)
00:8bd3 : 18 __ __ CLC
00:8bd4 : 69 01 __ ADC #$01
00:8bd6 : a8 __ __ TAY
00:8bd7 : a9 00 __ LDA #$00
00:8bd9 : 8d 5a 49 STA $495a ; (cw + 4)
00:8bdc : 2a __ __ ROL
00:8bdd : d0 08 __ BNE $8be7 ; (cwin_cursor_newline.s3 + 0)
.s6:
00:8bdf : cc 59 49 CPY $4959 ; (cw + 3)
00:8be2 : b0 03 __ BCS $8be7 ; (cwin_cursor_newline.s3 + 0)
.s5:
00:8be4 : ee 5b 49 INC $495b ; (cw + 5)
.s3:
00:8be7 : 60 __ __ RTS
--------------------------------------------------------------------
00:8be8 : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 20 54 4f 20 45 58 49 : pRESS KEY TO EXI
00:8bf8 : __ __ __ BYT 54 2e 00                                        : T..
--------------------------------------------------------------------
cwin_getch: ; cwin_getch()->void
.s4:
00:8bfb : 20 e4 ff JSR $ffe4 
00:8bfe : c9 00 __ CMP #$00
00:8c00 : f0 f9 __ BEQ $8bfb ; (cwin_getch.s4 + 0)
00:8c02 : 85 1b __ STA ACCU + 0 
00:8c04 : a9 00 __ LDA #$00
00:8c06 : 85 1c __ STA ACCU + 1 
.s3:
00:8c08 : 60 __ __ RTS
--------------------------------------------------------------------
00:8c09 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d 41 4e 44 : uLTIMATE cOMMAND
00:8c19 : __ __ __ BYT 20 69 4e 54 45 52 46 41 43 45 20 44 45 54 45 43 :  iNTERFACE DETEC
00:8c29 : __ __ __ BYT 54 45 44 2e 00                                  : TED..
--------------------------------------------------------------------
reu_count_pages: ; reu_count_pages()->i16
.s4:
00:8c2e : a9 00 __ LDA #$00
00:8c30 : 8d f7 7f STA $7ff7 ; (c + 0)
00:8c33 : a9 f7 __ LDA #$f7
00:8c35 : 8d 02 df STA $df02 
00:8c38 : a9 7f __ LDA #$7f
00:8c3a : 8d 03 df STA $df03 
00:8c3d : a9 00 __ LDA #$00
00:8c3f : 8d 04 df STA $df04 
00:8c42 : 8d 05 df STA $df05 
00:8c45 : 8d 06 df STA $df06 
00:8c48 : a2 01 __ LDX #$01
00:8c4a : 8e 07 df STX $df07 
00:8c4d : 8d 08 df STA $df08 
00:8c50 : 8d 0a df STA $df0a 
00:8c53 : a2 90 __ LDX #$90
00:8c55 : 8e 01 df STX $df01 
00:8c58 : a2 f6 __ LDX #$f6
00:8c5a : 8e 02 df STX $df02 
00:8c5d : a2 7f __ LDX #$7f
00:8c5f : 8e 03 df STX $df03 
00:8c62 : 8d 04 df STA $df04 
00:8c65 : 8d 05 df STA $df05 
00:8c68 : 8d 06 df STA $df06 
00:8c6b : a2 01 __ LDX #$01
00:8c6d : 8e 07 df STX $df07 
00:8c70 : 8d 08 df STA $df08 
00:8c73 : 8d 0a df STA $df0a 
00:8c76 : a9 91 __ LDA #$91
00:8c78 : 8d 01 df STA $df01 
00:8c7b : ad f6 7f LDA $7ff6 ; (d + 0)
00:8c7e : d0 52 __ BNE $8cd2 ; (reu_count_pages.s6 + 0)
.s5:
00:8c80 : a2 47 __ LDX #$47
00:8c82 : 8e f7 7f STX $7ff7 ; (c + 0)
00:8c85 : a2 f7 __ LDX #$f7
00:8c87 : 8e 02 df STX $df02 
00:8c8a : a2 7f __ LDX #$7f
00:8c8c : 8e 03 df STX $df03 
00:8c8f : 8d 04 df STA $df04 
00:8c92 : 8d 05 df STA $df05 
00:8c95 : 8d 06 df STA $df06 
00:8c98 : a2 01 __ LDX #$01
00:8c9a : 8e 07 df STX $df07 
00:8c9d : 8d 08 df STA $df08 
00:8ca0 : 8d 0a df STA $df0a 
00:8ca3 : a2 90 __ LDX #$90
00:8ca5 : 8e 01 df STX $df01 
00:8ca8 : a2 f6 __ LDX #$f6
00:8caa : 8e 02 df STX $df02 
00:8cad : a2 7f __ LDX #$7f
00:8caf : 8e 03 df STX $df03 
00:8cb2 : 8d 04 df STA $df04 
00:8cb5 : 8d 05 df STA $df05 
00:8cb8 : 8d 06 df STA $df06 
00:8cbb : a2 01 __ LDX #$01
00:8cbd : 8e 07 df STX $df07 
00:8cc0 : 8d 08 df STA $df08 
00:8cc3 : 8d 0a df STA $df0a 
00:8cc6 : a9 91 __ LDA #$91
00:8cc8 : 8d 01 df STA $df01 
00:8ccb : ad f6 7f LDA $7ff6 ; (d + 0)
00:8cce : c9 47 __ CMP #$47
00:8cd0 : f0 07 __ BEQ $8cd9 ; (reu_count_pages.s7 + 0)
.s6:
00:8cd2 : a9 00 __ LDA #$00
00:8cd4 : 85 1b __ STA ACCU + 0 
.s3:
00:8cd6 : 85 1c __ STA ACCU + 1 
00:8cd8 : 60 __ __ RTS
.s7:
00:8cd9 : a0 01 __ LDY #$01
00:8cdb : ca __ __ DEX
.l8:
00:8cdc : a9 47 __ LDA #$47
00:8cde : 8d f7 7f STA $7ff7 ; (c + 0)
00:8ce1 : a9 f7 __ LDA #$f7
00:8ce3 : 8d 02 df STA $df02 
00:8ce6 : a9 7f __ LDA #$7f
00:8ce8 : 8d 03 df STA $df03 
00:8ceb : a9 00 __ LDA #$00
00:8ced : 8d 04 df STA $df04 
00:8cf0 : 8d 05 df STA $df05 
00:8cf3 : 8c 06 df STY $df06 
00:8cf6 : a9 01 __ LDA #$01
00:8cf8 : 8d 07 df STA $df07 
00:8cfb : a9 00 __ LDA #$00
00:8cfd : 8d 08 df STA $df08 
00:8d00 : 8d 0a df STA $df0a 
00:8d03 : a9 90 __ LDA #$90
00:8d05 : 8d 01 df STA $df01 
00:8d08 : a9 00 __ LDA #$00
00:8d0a : 8d f7 7f STA $7ff7 ; (c + 0)
00:8d0d : a9 f7 __ LDA #$f7
00:8d0f : 8d 02 df STA $df02 
00:8d12 : a9 7f __ LDA #$7f
00:8d14 : 8d 03 df STA $df03 
00:8d17 : a9 00 __ LDA #$00
00:8d19 : 8d 04 df STA $df04 
00:8d1c : 8d 05 df STA $df05 
00:8d1f : 8d 06 df STA $df06 
00:8d22 : a9 01 __ LDA #$01
00:8d24 : 8d 07 df STA $df07 
00:8d27 : a9 00 __ LDA #$00
00:8d29 : 8d 08 df STA $df08 
00:8d2c : 8d 0a df STA $df0a 
00:8d2f : a9 90 __ LDA #$90
00:8d31 : 8d 01 df STA $df01 
00:8d34 : a9 f6 __ LDA #$f6
00:8d36 : 8d 02 df STA $df02 
00:8d39 : a9 7f __ LDA #$7f
00:8d3b : 8d 03 df STA $df03 
00:8d3e : a9 00 __ LDA #$00
00:8d40 : 8d 04 df STA $df04 
00:8d43 : 8d 05 df STA $df05 
00:8d46 : 8c 06 df STY $df06 
00:8d49 : a9 01 __ LDA #$01
00:8d4b : 8d 07 df STA $df07 
00:8d4e : a9 00 __ LDA #$00
00:8d50 : 8d 08 df STA $df08 
00:8d53 : 8d 0a df STA $df0a 
00:8d56 : a9 91 __ LDA #$91
00:8d58 : 8d 01 df STA $df01 
00:8d5b : ad f6 7f LDA $7ff6 ; (d + 0)
00:8d5e : c9 47 __ CMP #$47
00:8d60 : f0 06 __ BEQ $8d68 ; (reu_count_pages.s9 + 0)
.s11:
00:8d62 : 84 1b __ STY ACCU + 0 
00:8d64 : 8a __ __ TXA
00:8d65 : 4c d6 12 JMP $12d6 
.s9:
00:8d68 : c8 __ __ INY
00:8d69 : d0 01 __ BNE $8d6c ; (reu_count_pages.s13 + 0)
.s12:
00:8d6b : e8 __ __ INX
.s13:
00:8d6c : 98 __ __ TYA
00:8d6d : f0 03 __ BEQ $8d72 ; (reu_count_pages.s10 + 0)
00:8d6f : 4c dc 12 JMP $12dc 
.s10:
00:8d72 : 85 1b __ STA ACCU + 0 
00:8d74 : a9 01 __ LDA #$01
00:8d76 : 4c d6 12 JMP $12d6 
--------------------------------------------------------------------
cwin_console_printf: ; cwin_console_printf(struct CharWin*,u8,const u8*)->void
.s4:
00:8d79 : a9 16 __ LDA #$16
00:8d7b : 85 16 __ STA P9 
00:8d7d : a9 7f __ LDA #$7f
00:8d7f : 85 17 __ STA P10 
00:8d81 : a0 05 __ LDY #$05
00:8d83 : b1 23 __ LDA (SP + 0),y 
00:8d85 : 8d f8 7f STA $7ff8 ; (sstack + 0)
00:8d88 : c8 __ __ INY
00:8d89 : b1 23 __ LDA (SP + 0),y 
00:8d8b : 8d f9 7f STA $7ff9 ; (sstack + 1)
00:8d8e : 18 __ __ CLC
00:8d8f : a5 23 __ LDA SP + 0 
00:8d91 : 69 07 __ ADC #$07
00:8d93 : 8d fa 7f STA $7ffa ; (sstack + 2)
00:8d96 : a5 24 __ LDA SP + 1 
00:8d98 : 69 00 __ ADC #$00
00:8d9a : 8d fb 7f STA $7ffb ; (sstack + 3)
00:8d9d : 20 4d 14 JSR $144d 
00:8da0 : a9 16 __ LDA #$16
00:8da2 : 85 13 __ STA P6 ; (fmt + 3)
00:8da4 : a9 7f __ LDA #$7f
00:8da6 : 85 14 __ STA P7 
--------------------------------------------------------------------
cwin_console_write_string: ; cwin_console_write_string(struct CharWin*,const u8*,u8)->void
.s4:
00:8da8 : ad 5a 49 LDA $495a ; (cw + 4)
00:8dab : 8d 5c 49 STA $495c ; (cw + 6)
00:8dae : ad 5b 49 LDA $495b ; (cw + 5)
00:8db1 : 8d 5d 49 STA $495d ; (cw + 7)
00:8db4 : a9 00 __ LDA #$00
00:8db6 : 85 4a __ STA T4 + 0 
00:8db8 : f0 02 __ BEQ $8dbc ; (cwin_console_write_string.l5 + 0)
.s9:
00:8dba : e6 4a __ INC T4 + 0 
.l5:
00:8dbc : a4 4a __ LDY T4 + 0 
00:8dbe : b1 13 __ LDA (P6),y ; (chars + 0)
00:8dc0 : d0 01 __ BNE $8dc3 ; (cwin_console_write_string.s6 + 0)
.s3:
00:8dc2 : 60 __ __ RTS
.s6:
00:8dc3 : c9 0a __ CMP #$0a
00:8dc5 : d0 06 __ BNE $8dcd ; (cwin_console_write_string.s7 + 0)
.s11:
00:8dc7 : 20 17 0e JSR $0e17 
00:8dca : 4c ba 13 JMP $13ba 
.s7:
00:8dcd : 85 4b __ STA T5 + 0 
00:8dcf : ad 5a 49 LDA $495a ; (cw + 4)
00:8dd2 : cd 58 49 CMP $4958 ; (cw + 2)
00:8dd5 : d0 03 __ BNE $8dda ; (cwin_console_write_string.s8 + 0)
.s10:
00:8dd7 : 20 17 0e JSR $0e17 
.s8:
00:8dda : ad 5b 49 LDA $495b ; (cw + 5)
00:8ddd : 0a __ __ ASL
00:8dde : aa __ __ TAX
00:8ddf : bd 68 2a LDA $2a68,x 
00:8de2 : 6d 5a 49 ADC $495a ; (cw + 4)
00:8de5 : 85 43 __ STA T0 + 0 
00:8de7 : bd 69 2a LDA $2a69,x 
00:8dea : 69 00 __ ADC #$00
00:8dec : 85 44 __ STA T0 + 1 
00:8dee : a5 4b __ LDA T5 + 0 
00:8df0 : 4a __ __ LSR
00:8df1 : 4a __ __ LSR
00:8df2 : 4a __ __ LSR
00:8df3 : 4a __ __ LSR
00:8df4 : 4a __ __ LSR
00:8df5 : aa __ __ TAX
00:8df6 : ad 5e 49 LDA $495e ; (cw + 8)
00:8df9 : 18 __ __ CLC
00:8dfa : 65 43 __ ADC T0 + 0 
00:8dfc : 85 45 __ STA T1 + 0 
00:8dfe : ad 5f 49 LDA $495f ; (cw + 9)
00:8e01 : 65 44 __ ADC T0 + 1 
00:8e03 : 85 46 __ STA T1 + 1 
00:8e05 : bd a2 2a LDA $2aa2,x 
00:8e08 : 45 4b __ EOR T5 + 0 
00:8e0a : a0 00 __ LDY #$00
00:8e0c : 91 45 __ STA (T1 + 0),y 
00:8e0e : ad 60 49 LDA $4960 ; (cw + 10)
00:8e11 : 18 __ __ CLC
00:8e12 : 65 43 __ ADC T0 + 0 
00:8e14 : 85 45 __ STA T1 + 0 
00:8e16 : ad 61 49 LDA $4961 ; (cw + 11)
00:8e19 : 65 44 __ ADC T0 + 1 
00:8e1b : 85 46 __ STA T1 + 1 
00:8e1d : a9 07 __ LDA #$07
00:8e1f : 91 45 __ STA (T1 + 0),y 
00:8e21 : ee 5a 49 INC $495a ; (cw + 4)
00:8e24 : 4c ba 13 JMP $13ba 
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s4:
00:8e27 : a0 02 __ LDY #$02
00:8e29 : b1 23 __ LDA (SP + 0),y 
00:8e2b : 85 16 __ STA P9 
00:8e2d : c8 __ __ INY
00:8e2e : b1 23 __ LDA (SP + 0),y 
00:8e30 : 85 17 __ STA P10 
00:8e32 : c8 __ __ INY
00:8e33 : b1 23 __ LDA (SP + 0),y 
00:8e35 : 8d f8 7f STA $7ff8 ; (sstack + 0)
00:8e38 : c8 __ __ INY
00:8e39 : b1 23 __ LDA (SP + 0),y 
00:8e3b : 8d f9 7f STA $7ff9 ; (sstack + 1)
00:8e3e : 18 __ __ CLC
00:8e3f : a5 23 __ LDA SP + 0 
00:8e41 : 69 06 __ ADC #$06
00:8e43 : 8d fa 7f STA $7ffa ; (sstack + 2)
00:8e46 : a5 24 __ LDA SP + 1 
00:8e48 : 69 00 __ ADC #$00
00:8e4a : 8d fb 7f STA $7ffb ; (sstack + 3)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s4:
00:8e4d : ad f8 7f LDA $7ff8 ; (sstack + 0)
00:8e50 : 85 47 __ STA T3 + 0 
00:8e52 : a9 00 __ LDA #$00
00:8e54 : 85 1b __ STA ACCU + 0 ; (fps + 0)
00:8e56 : ad f9 7f LDA $7ff9 ; (sstack + 1)
00:8e59 : 85 48 __ STA T3 + 1 
.l5:
00:8e5b : a0 00 __ LDY #$00
00:8e5d : b1 47 __ LDA (T3 + 0),y 
00:8e5f : d0 1b __ BNE $8e7c ; (sformat.s9 + 0)
.s6:
00:8e61 : a4 1b __ LDY ACCU + 0 ; (fps + 0)
00:8e63 : 91 16 __ STA (P9),y ; (buff + 0)
00:8e65 : 98 __ __ TYA
00:8e66 : d0 07 __ BNE $8e6f ; (sformat.s8 + 0)
.s7:
00:8e68 : a5 17 __ LDA P10 ; (buff + 1)
00:8e6a : a6 16 __ LDX P9 ; (buff + 0)
00:8e6c : 4c 77 14 JMP $1477 
.s8:
00:8e6f : 18 __ __ CLC
00:8e70 : 65 16 __ ADC P9 ; (buff + 0)
00:8e72 : aa __ __ TAX
00:8e73 : a5 17 __ LDA P10 ; (buff + 1)
00:8e75 : 69 00 __ ADC #$00
.s3:
00:8e77 : 86 1b __ STX ACCU + 0 ; (fps + 0)
00:8e79 : 85 1c __ STA ACCU + 1 ; (fps + 1)
00:8e7b : 60 __ __ RTS
.s9:
00:8e7c : c9 25 __ CMP #$25
00:8e7e : f0 22 __ BEQ $8ea2 ; (sformat.s12 + 0)
.s10:
00:8e80 : a4 1b __ LDY ACCU + 0 ; (fps + 0)
00:8e82 : 91 16 __ STA (P9),y ; (buff + 0)
00:8e84 : e6 47 __ INC T3 + 0 
00:8e86 : d0 02 __ BNE $8e8a ; (sformat.s104 + 0)
.s103:
00:8e88 : e6 48 __ INC T3 + 1 
.s104:
00:8e8a : c8 __ __ INY
00:8e8b : 84 1b __ STY ACCU + 0 ; (fps + 0)
00:8e8d : 98 __ __ TYA
00:8e8e : c0 28 __ CPY #$28
00:8e90 : 90 c9 __ BCC $8e5b ; (sformat.l5 + 0)
.s11:
00:8e92 : 18 __ __ CLC
00:8e93 : 65 16 __ ADC P9 ; (buff + 0)
00:8e95 : 85 16 __ STA P9 ; (buff + 0)
00:8e97 : 90 02 __ BCC $8e9b ; (sformat.s106 + 0)
.s105:
00:8e99 : e6 17 __ INC P10 ; (buff + 1)
.s106:
00:8e9b : a9 00 __ LDA #$00
.s79:
00:8e9d : 85 1b __ STA ACCU + 0 ; (fps + 0)
00:8e9f : 4c 5b 14 JMP $145b 
.s12:
00:8ea2 : 8c e3 7f STY $7fe3 ; (si + 5)
00:8ea5 : 8c e6 7f STY $7fe6 ; (si + 8)
00:8ea8 : a9 0a __ LDA #$0a
00:8eaa : 8d e2 7f STA $7fe2 ; (si + 4)
00:8ead : a5 1b __ LDA ACCU + 0 ; (fps + 0)
00:8eaf : f0 0c __ BEQ $8ebd ; (sformat.s13 + 0)
.s77:
00:8eb1 : 84 1b __ STY ACCU + 0 ; (fps + 0)
00:8eb3 : 18 __ __ CLC
00:8eb4 : 65 16 __ ADC P9 ; (buff + 0)
00:8eb6 : 85 16 __ STA P9 ; (buff + 0)
00:8eb8 : 90 02 __ BCC $8ebc ; (sformat.s90 + 0)
.s89:
00:8eba : e6 17 __ INC P10 ; (buff + 1)
.s90:
00:8ebc : 98 __ __ TYA
.s13:
00:8ebd : 8d e4 7f STA $7fe4 ; (si + 6)
00:8ec0 : 8d e5 7f STA $7fe5 ; (si + 7)
00:8ec3 : a0 01 __ LDY #$01
00:8ec5 : b1 47 __ LDA (T3 + 0),y 
00:8ec7 : a2 20 __ LDX #$20
00:8ec9 : 8e de 7f STX $7fde ; (si + 0)
00:8ecc : a2 00 __ LDX #$00
00:8ece : 8e df 7f STX $7fdf ; (si + 1)
00:8ed1 : ca __ __ DEX
00:8ed2 : 8e e0 7f STX $7fe0 ; (si + 2)
00:8ed5 : aa __ __ TAX
00:8ed6 : a9 02 __ LDA #$02
00:8ed8 : d0 07 __ BNE $8ee1 ; (sformat.l14 + 0)
.s73:
00:8eda : a0 00 __ LDY #$00
00:8edc : b1 47 __ LDA (T3 + 0),y 
00:8ede : aa __ __ TAX
00:8edf : a9 01 __ LDA #$01
.l14:
00:8ee1 : 18 __ __ CLC
00:8ee2 : 65 47 __ ADC T3 + 0 
00:8ee4 : 85 47 __ STA T3 + 0 
00:8ee6 : 90 02 __ BCC $8eea ; (sformat.s92 + 0)
.s91:
00:8ee8 : e6 48 __ INC T3 + 1 
.s92:
00:8eea : 8a __ __ TXA
00:8eeb : e0 2b __ CPX #$2b
00:8eed : d0 07 __ BNE $8ef6 ; (sformat.s15 + 0)
.s76:
00:8eef : a9 01 __ LDA #$01
00:8ef1 : 8d e4 7f STA $7fe4 ; (si + 6)
00:8ef4 : d0 e4 __ BNE $8eda ; (sformat.s73 + 0)
.s15:
00:8ef6 : c9 30 __ CMP #$30
00:8ef8 : d0 06 __ BNE $8f00 ; (sformat.s16 + 0)
.s75:
00:8efa : 8d de 7f STA $7fde ; (si + 0)
00:8efd : 4c da 14 JMP $14da 
.s16:
00:8f00 : c9 23 __ CMP #$23
00:8f02 : d0 07 __ BNE $8f0b ; (sformat.s17 + 0)
.s74:
00:8f04 : a9 01 __ LDA #$01
00:8f06 : 8d e6 7f STA $7fe6 ; (si + 8)
00:8f09 : d0 cf __ BNE $8eda ; (sformat.s73 + 0)
.s17:
00:8f0b : c9 2d __ CMP #$2d
00:8f0d : d0 07 __ BNE $8f16 ; (sformat.s18 + 0)
.s72:
00:8f0f : a9 01 __ LDA #$01
00:8f11 : 8d e5 7f STA $7fe5 ; (si + 7)
00:8f14 : d0 c4 __ BNE $8eda ; (sformat.s73 + 0)
.s18:
00:8f16 : 85 1d __ STA ACCU + 2 
00:8f18 : c9 30 __ CMP #$30
00:8f1a : 90 31 __ BCC $8f4d ; (sformat.s19 + 0)
.s67:
00:8f1c : c9 3a __ CMP #$3a
00:8f1e : b0 2d __ BCS $8f4d ; (sformat.s19 + 0)
.s68:
00:8f20 : a9 00 __ LDA #$00
00:8f22 : 85 1c __ STA ACCU + 1 ; (fps + 1)
.l69:
00:8f24 : a5 1c __ LDA ACCU + 1 ; (fps + 1)
00:8f26 : 0a __ __ ASL
00:8f27 : 0a __ __ ASL
00:8f28 : 18 __ __ CLC
00:8f29 : 65 1c __ ADC ACCU + 1 ; (fps + 1)
00:8f2b : 0a __ __ ASL
00:8f2c : 18 __ __ CLC
00:8f2d : 65 1d __ ADC ACCU + 2 
00:8f2f : 38 __ __ SEC
00:8f30 : e9 30 __ SBC #$30
00:8f32 : 85 1c __ STA ACCU + 1 ; (fps + 1)
00:8f34 : a0 00 __ LDY #$00
00:8f36 : b1 47 __ LDA (T3 + 0),y 
00:8f38 : 85 1d __ STA ACCU + 2 
00:8f3a : e6 47 __ INC T3 + 0 
00:8f3c : d0 02 __ BNE $8f40 ; (sformat.s102 + 0)
.s101:
00:8f3e : e6 48 __ INC T3 + 1 
.s102:
00:8f40 : c9 30 __ CMP #$30
00:8f42 : 90 04 __ BCC $8f48 ; (sformat.s70 + 0)
.s71:
00:8f44 : c9 3a __ CMP #$3a
00:8f46 : 90 dc __ BCC $8f24 ; (sformat.l69 + 0)
.s70:
00:8f48 : a6 1c __ LDX ACCU + 1 ; (fps + 1)
00:8f4a : 8e df 7f STX $7fdf ; (si + 1)
.s19:
00:8f4d : c9 2e __ CMP #$2e
00:8f4f : d0 2d __ BNE $8f7e ; (sformat.s20 + 0)
.s62:
00:8f51 : a9 00 __ LDA #$00
00:8f53 : f0 0e __ BEQ $8f63 ; (sformat.l63 + 0)
.s66:
00:8f55 : a5 43 __ LDA T0 + 0 
00:8f57 : 0a __ __ ASL
00:8f58 : 0a __ __ ASL
00:8f59 : 18 __ __ CLC
00:8f5a : 65 43 __ ADC T0 + 0 
00:8f5c : 0a __ __ ASL
00:8f5d : 18 __ __ CLC
00:8f5e : 65 1d __ ADC ACCU + 2 
00:8f60 : 38 __ __ SEC
00:8f61 : e9 30 __ SBC #$30
.l63:
00:8f63 : 85 43 __ STA T0 + 0 
00:8f65 : a0 00 __ LDY #$00
00:8f67 : b1 47 __ LDA (T3 + 0),y 
00:8f69 : 85 1d __ STA ACCU + 2 
00:8f6b : e6 47 __ INC T3 + 0 
00:8f6d : d0 02 __ BNE $8f71 ; (sformat.s94 + 0)
.s93:
00:8f6f : e6 48 __ INC T3 + 1 
.s94:
00:8f71 : c9 30 __ CMP #$30
00:8f73 : 90 04 __ BCC $8f79 ; (sformat.s64 + 0)
.s65:
00:8f75 : c9 3a __ CMP #$3a
00:8f77 : 90 dc __ BCC $8f55 ; (sformat.s66 + 0)
.s64:
00:8f79 : a6 43 __ LDX T0 + 0 
00:8f7b : 8e e0 7f STX $7fe0 ; (si + 2)
.s20:
00:8f7e : c9 64 __ CMP #$64
00:8f80 : f0 0c __ BEQ $8f8e ; (sformat.s61 + 0)
.s21:
00:8f82 : c9 44 __ CMP #$44
00:8f84 : f0 08 __ BEQ $8f8e ; (sformat.s61 + 0)
.s22:
00:8f86 : c9 69 __ CMP #$69
00:8f88 : f0 04 __ BEQ $8f8e ; (sformat.s61 + 0)
.s23:
00:8f8a : c9 49 __ CMP #$49
00:8f8c : d0 07 __ BNE $8f95 ; (sformat.s24 + 0)
.s61:
00:8f8e : a9 01 __ LDA #$01
.s81:
00:8f90 : 85 13 __ STA P6 
00:8f92 : 4c 2d 17 JMP $172d 
.s24:
00:8f95 : c9 75 __ CMP #$75
00:8f97 : f0 04 __ BEQ $8f9d ; (sformat.s60 + 0)
.s25:
00:8f99 : c9 55 __ CMP #$55
00:8f9b : d0 04 __ BNE $8fa1 ; (sformat.s26 + 0)
.s60:
00:8f9d : a9 00 __ LDA #$00
00:8f9f : f0 ef __ BEQ $8f90 ; (sformat.s81 + 0)
.s26:
00:8fa1 : c9 78 __ CMP #$78
00:8fa3 : f0 04 __ BEQ $8fa9 ; (sformat.s58 + 0)
.s27:
00:8fa5 : c9 58 __ CMP #$58
00:8fa7 : d0 18 __ BNE $8fc1 ; (sformat.s28 + 0)
.s58:
00:8fa9 : a9 00 __ LDA #$00
00:8fab : 8d e3 7f STA $7fe3 ; (si + 5)
00:8fae : 85 13 __ STA P6 
00:8fb0 : a9 10 __ LDA #$10
00:8fb2 : 8d e2 7f STA $7fe2 ; (si + 4)
00:8fb5 : a5 1d __ LDA ACCU + 2 
00:8fb7 : 29 e0 __ AND #$e0
00:8fb9 : 09 01 __ ORA #$01
00:8fbb : 8d e1 7f STA $7fe1 ; (si + 3)
00:8fbe : 4c 2d 17 JMP $172d 
.s28:
00:8fc1 : c9 6c __ CMP #$6c
00:8fc3 : d0 03 __ BNE $8fc8 ; (sformat.s29 + 0)
00:8fc5 : 4c a2 16 JMP $16a2 
.s29:
00:8fc8 : c9 4c __ CMP #$4c
00:8fca : f0 f9 __ BEQ $8fc5 ; (sformat.s28 + 4)
.s30:
00:8fcc : c9 73 __ CMP #$73
00:8fce : f0 3c __ BEQ $900c ; (sformat.s38 + 0)
.s31:
00:8fd0 : c9 53 __ CMP #$53
00:8fd2 : f0 38 __ BEQ $900c ; (sformat.s38 + 0)
.s32:
00:8fd4 : c9 63 __ CMP #$63
00:8fd6 : f0 13 __ BEQ $8feb ; (sformat.s37 + 0)
.s33:
00:8fd8 : c9 43 __ CMP #$43
00:8fda : f0 0f __ BEQ $8feb ; (sformat.s37 + 0)
.s34:
00:8fdc : aa __ __ TAX
00:8fdd : d0 03 __ BNE $8fe2 ; (sformat.s35 + 0)
00:8fdf : 4c 5b 14 JMP $145b 
.s35:
00:8fe2 : a0 00 __ LDY #$00
00:8fe4 : 91 16 __ STA (P9),y ; (buff + 0)
.s36:
00:8fe6 : a9 01 __ LDA #$01
00:8fe8 : 4c 9d 14 JMP $149d 
.s37:
00:8feb : ad fa 7f LDA $7ffa ; (sstack + 2)
00:8fee : 85 43 __ STA T0 + 0 
00:8ff0 : ad fb 7f LDA $7ffb ; (sstack + 3)
00:8ff3 : 85 44 __ STA T0 + 1 
00:8ff5 : a0 00 __ LDY #$00
00:8ff7 : b1 43 __ LDA (T0 + 0),y 
00:8ff9 : 91 16 __ STA (P9),y ; (buff + 0)
00:8ffb : a5 43 __ LDA T0 + 0 
00:8ffd : 69 01 __ ADC #$01
00:8fff : 8d fa 7f STA $7ffa ; (sstack + 2)
00:9002 : a5 44 __ LDA T0 + 1 
00:9004 : 69 00 __ ADC #$00
00:9006 : 8d fb 7f STA $7ffb ; (sstack + 3)
00:9009 : 4c e6 15 JMP $15e6 
.s38:
00:900c : ad fa 7f LDA $7ffa ; (sstack + 2)
00:900f : 85 43 __ STA T0 + 0 
00:9011 : 69 01 __ ADC #$01
00:9013 : 8d fa 7f STA $7ffa ; (sstack + 2)
00:9016 : ad fb 7f LDA $7ffb ; (sstack + 3)
00:9019 : 85 44 __ STA T0 + 1 
00:901b : 69 00 __ ADC #$00
00:901d : 8d fb 7f STA $7ffb ; (sstack + 3)
00:9020 : a0 00 __ LDY #$00
00:9022 : 84 1d __ STY ACCU + 2 
00:9024 : b1 43 __ LDA (T0 + 0),y 
00:9026 : aa __ __ TAX
00:9027 : c8 __ __ INY
00:9028 : b1 43 __ LDA (T0 + 0),y 
00:902a : 86 43 __ STX T0 + 0 
00:902c : 85 44 __ STA T0 + 1 
00:902e : ad df 7f LDA $7fdf ; (si + 1)
00:9031 : f0 0c __ BEQ $903f ; (sformat.s39 + 0)
.s86:
00:9033 : 88 __ __ DEY
00:9034 : b1 43 __ LDA (T0 + 0),y 
00:9036 : f0 05 __ BEQ $903d ; (sformat.s87 + 0)
.l45:
00:9038 : c8 __ __ INY
00:9039 : b1 43 __ LDA (T0 + 0),y 
00:903b : d0 fb __ BNE $9038 ; (sformat.l45 + 0)
.s87:
00:903d : 84 1d __ STY ACCU + 2 
.s39:
00:903f : ad e5 7f LDA $7fe5 ; (si + 7)
00:9042 : 85 1c __ STA ACCU + 1 ; (fps + 1)
00:9044 : d0 19 __ BNE $905f ; (sformat.s40 + 0)
.s84:
00:9046 : a6 1d __ LDX ACCU + 2 
00:9048 : ec df 7f CPX $7fdf ; (si + 1)
00:904b : a0 00 __ LDY #$00
00:904d : b0 0c __ BCS $905b ; (sformat.s85 + 0)
.l44:
00:904f : ad de 7f LDA $7fde ; (si + 0)
00:9052 : 91 16 __ STA (P9),y ; (buff + 0)
00:9054 : c8 __ __ INY
00:9055 : e8 __ __ INX
00:9056 : ec df 7f CPX $7fdf ; (si + 1)
00:9059 : 90 f4 __ BCC $904f ; (sformat.l44 + 0)
.s85:
00:905b : 86 1d __ STX ACCU + 2 
00:905d : 84 1b __ STY ACCU + 0 ; (fps + 0)
.s40:
00:905f : a0 00 __ LDY #$00
00:9061 : b1 43 __ LDA (T0 + 0),y 
00:9063 : f0 1c __ BEQ $9081 ; (sformat.s41 + 0)
.s43:
00:9065 : aa __ __ TAX
00:9066 : e6 43 __ INC T0 + 0 
00:9068 : d0 02 __ BNE $906c ; (sformat.s98 + 0)
.s97:
00:906a : e6 44 __ INC T0 + 1 
.s98:
00:906c : 8a __ __ TXA
.l78:
00:906d : a4 1b __ LDY ACCU + 0 ; (fps + 0)
00:906f : 91 16 __ STA (P9),y ; (buff + 0)
00:9071 : e6 1b __ INC ACCU + 0 ; (fps + 0)
00:9073 : a0 00 __ LDY #$00
00:9075 : b1 43 __ LDA (T0 + 0),y 
00:9077 : a8 __ __ TAY
00:9078 : e6 43 __ INC T0 + 0 
00:907a : d0 02 __ BNE $907e ; (sformat.s100 + 0)
.s99:
00:907c : e6 44 __ INC T0 + 1 
.s100:
00:907e : 98 __ __ TYA
00:907f : d0 ec __ BNE $906d ; (sformat.l78 + 0)
.s41:
00:9081 : a5 1c __ LDA ACCU + 1 ; (fps + 1)
00:9083 : d0 03 __ BNE $9088 ; (sformat.s83 + 0)
00:9085 : 4c 5b 14 JMP $145b 
.s83:
00:9088 : a6 1d __ LDX ACCU + 2 
00:908a : ec df 7f CPX $7fdf ; (si + 1)
00:908d : a4 1b __ LDY ACCU + 0 ; (fps + 0)
00:908f : b0 0c __ BCS $909d ; (sformat.s88 + 0)
.l42:
00:9091 : ad de 7f LDA $7fde ; (si + 0)
00:9094 : 91 16 __ STA (P9),y ; (buff + 0)
00:9096 : c8 __ __ INY
00:9097 : e8 __ __ INX
00:9098 : ec df 7f CPX $7fdf ; (si + 1)
00:909b : 90 f4 __ BCC $9091 ; (sformat.l42 + 0)
.s88:
00:909d : 84 1b __ STY ACCU + 0 ; (fps + 0)
00:909f : 4c 5b 14 JMP $145b 
.s46:
00:90a2 : ad fa 7f LDA $7ffa ; (sstack + 2)
00:90a5 : 85 43 __ STA T0 + 0 
00:90a7 : 69 03 __ ADC #$03
00:90a9 : 8d fa 7f STA $7ffa ; (sstack + 2)
00:90ac : ad fb 7f LDA $7ffb ; (sstack + 3)
00:90af : 85 44 __ STA T0 + 1 
00:90b1 : 69 00 __ ADC #$00
00:90b3 : 8d fb 7f STA $7ffb ; (sstack + 3)
00:90b6 : a0 00 __ LDY #$00
00:90b8 : b1 47 __ LDA (T3 + 0),y 
00:90ba : aa __ __ TAX
00:90bb : e6 47 __ INC T3 + 0 
00:90bd : d0 02 __ BNE $90c1 ; (sformat.s96 + 0)
.s95:
00:90bf : e6 48 __ INC T3 + 1 
.s96:
00:90c1 : b1 43 __ LDA (T0 + 0),y 
00:90c3 : 85 11 __ STA P4 
00:90c5 : a0 01 __ LDY #$01
00:90c7 : b1 43 __ LDA (T0 + 0),y 
00:90c9 : 85 12 __ STA P5 
00:90cb : c8 __ __ INY
00:90cc : b1 43 __ LDA (T0 + 0),y 
00:90ce : 85 13 __ STA P6 
00:90d0 : c8 __ __ INY
00:90d1 : b1 43 __ LDA (T0 + 0),y 
00:90d3 : 85 14 __ STA P7 
00:90d5 : 8a __ __ TXA
00:90d6 : e0 64 __ CPX #$64
00:90d8 : f0 0c __ BEQ $90e6 ; (sformat.s57 + 0)
.s47:
00:90da : c9 44 __ CMP #$44
00:90dc : f0 08 __ BEQ $90e6 ; (sformat.s57 + 0)
.s48:
00:90de : c9 69 __ CMP #$69
00:90e0 : f0 04 __ BEQ $90e6 ; (sformat.s57 + 0)
.s49:
00:90e2 : c9 49 __ CMP #$49
00:90e4 : d0 1c __ BNE $9102 ; (sformat.s50 + 0)
.s57:
00:90e6 : a9 01 __ LDA #$01
.s82:
00:90e8 : 85 15 __ STA P8 
.s55:
00:90ea : a5 16 __ LDA P9 ; (buff + 0)
00:90ec : 85 0f __ STA P2 
00:90ee : a5 17 __ LDA P10 ; (buff + 1)
00:90f0 : 85 10 __ STA P3 
00:90f2 : a9 de __ LDA #$de
00:90f4 : 85 0d __ STA P0 
00:90f6 : a9 7f __ LDA #$7f
00:90f8 : 85 0e __ STA P1 
00:90fa : 20 9f 18 JSR $189f 
.s80:
00:90fd : a5 1b __ LDA ACCU + 0 ; (fps + 0)
00:90ff : 4c 9d 14 JMP $149d 
.s50:
00:9102 : c9 75 __ CMP #$75
00:9104 : f0 04 __ BEQ $910a ; (sformat.s56 + 0)
.s51:
00:9106 : c9 55 __ CMP #$55
00:9108 : d0 04 __ BNE $910e ; (sformat.s52 + 0)
.s56:
00:910a : a9 00 __ LDA #$00
00:910c : f0 da __ BEQ $90e8 ; (sformat.s82 + 0)
.s52:
00:910e : c9 78 __ CMP #$78
00:9110 : f0 04 __ BEQ $9116 ; (sformat.s54 + 0)
.s53:
00:9112 : c9 58 __ CMP #$58
00:9114 : d0 89 __ BNE $909f ; (sformat.s88 + 2)
.s54:
00:9116 : a9 10 __ LDA #$10
00:9118 : 8d e2 7f STA $7fe2 ; (si + 4)
00:911b : a9 00 __ LDA #$00
00:911d : 8d e3 7f STA $7fe3 ; (si + 5)
00:9120 : 85 15 __ STA P8 
00:9122 : 8a __ __ TXA
00:9123 : 29 e0 __ AND #$e0
00:9125 : 09 01 __ ORA #$01
00:9127 : 8d e1 7f STA $7fe1 ; (si + 3)
00:912a : 4c ea 16 JMP $16ea 
.s59:
00:912d : a5 16 __ LDA P9 ; (buff + 0)
00:912f : 85 0f __ STA P2 
00:9131 : a5 17 __ LDA P10 ; (buff + 1)
00:9133 : 85 10 __ STA P3 
00:9135 : ad fa 7f LDA $7ffa ; (sstack + 2)
00:9138 : 85 43 __ STA T0 + 0 
00:913a : ad fb 7f LDA $7ffb ; (sstack + 3)
00:913d : 85 44 __ STA T0 + 1 
00:913f : a0 00 __ LDY #$00
00:9141 : b1 43 __ LDA (T0 + 0),y 
00:9143 : 85 11 __ STA P4 
00:9145 : c8 __ __ INY
00:9146 : b1 43 __ LDA (T0 + 0),y 
00:9148 : 85 12 __ STA P5 
00:914a : 18 __ __ CLC
00:914b : a5 43 __ LDA T0 + 0 
00:914d : 69 02 __ ADC #$02
00:914f : 8d fa 7f STA $7ffa ; (sstack + 2)
00:9152 : a5 44 __ LDA T0 + 1 
00:9154 : 69 00 __ ADC #$00
00:9156 : 8d fb 7f STA $7ffb ; (sstack + 3)
00:9159 : a9 de __ LDA #$de
00:915b : 85 0d __ STA P0 
00:915d : a9 7f __ LDA #$7f
00:915f : 85 0e __ STA P1 
00:9161 : 20 67 17 JSR $1767 
00:9164 : 4c fd 16 JMP $16fd 
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s4:
00:9167 : a9 00 __ LDA #$00
00:9169 : 85 45 __ STA T5 + 0 
00:916b : a5 13 __ LDA P6 ; (s + 0)
00:916d : f0 13 __ BEQ $9182 ; (nformi.s5 + 0)
.s37:
00:916f : 24 12 __ BIT P5 ; (v + 1)
00:9171 : 10 0f __ BPL $9182 ; (nformi.s5 + 0)
.s38:
00:9173 : 38 __ __ SEC
00:9174 : a9 00 __ LDA #$00
00:9176 : e5 11 __ SBC P4 ; (v + 0)
00:9178 : 85 11 __ STA P4 ; (v + 0)
00:917a : a9 00 __ LDA #$00
00:917c : e5 12 __ SBC P5 ; (v + 1)
00:917e : 85 12 __ STA P5 ; (v + 1)
00:9180 : e6 45 __ INC T5 + 0 
.s5:
00:9182 : a9 10 __ LDA #$10
00:9184 : 85 46 __ STA T6 + 0 
00:9186 : a5 11 __ LDA P4 ; (v + 0)
00:9188 : 05 12 __ ORA P5 ; (v + 1)
00:918a : f0 4b __ BEQ $91d7 ; (nformi.s6 + 0)
.s30:
00:918c : a0 04 __ LDY #$04
00:918e : b1 0d __ LDA (P0),y ; (si + 0)
00:9190 : 85 43 __ STA T2 + 0 
00:9192 : c8 __ __ INY
00:9193 : b1 0d __ LDA (P0),y ; (si + 0)
00:9195 : 85 44 __ STA T2 + 1 
.l31:
00:9197 : a5 11 __ LDA P4 ; (v + 0)
00:9199 : 85 1b __ STA ACCU + 0 
00:919b : a5 12 __ LDA P5 ; (v + 1)
00:919d : 85 1c __ STA ACCU + 1 
00:919f : a5 43 __ LDA T2 + 0 
00:91a1 : 85 03 __ STA WORK + 0 
00:91a3 : a5 44 __ LDA T2 + 1 
00:91a5 : 85 04 __ STA WORK + 1 
00:91a7 : 20 cf 26 JSR $26cf 
00:91aa : a5 06 __ LDA WORK + 3 
00:91ac : 30 08 __ BMI $91b6 ; (nformi.s32 + 0)
.s36:
00:91ae : d0 0a __ BNE $91ba ; (nformi.s34 + 0)
.s35:
00:91b0 : a5 05 __ LDA WORK + 2 
00:91b2 : c9 0a __ CMP #$0a
00:91b4 : b0 04 __ BCS $91ba ; (nformi.s34 + 0)
.s32:
00:91b6 : a9 30 __ LDA #$30
00:91b8 : d0 07 __ BNE $91c1 ; (nformi.s33 + 0)
.s34:
00:91ba : a0 03 __ LDY #$03
00:91bc : b1 0d __ LDA (P0),y ; (si + 0)
00:91be : 38 __ __ SEC
00:91bf : e9 0a __ SBC #$0a
.s33:
00:91c1 : 18 __ __ CLC
00:91c2 : 65 05 __ ADC WORK + 2 
00:91c4 : a6 46 __ LDX T6 + 0 
00:91c6 : 9d e7 7f STA $7fe7,x 
00:91c9 : a5 1b __ LDA ACCU + 0 
00:91cb : 85 11 __ STA P4 ; (v + 0)
00:91cd : a5 1c __ LDA ACCU + 1 
00:91cf : 85 12 __ STA P5 ; (v + 1)
00:91d1 : c6 46 __ DEC T6 + 0 
00:91d3 : 05 11 __ ORA P4 ; (v + 0)
00:91d5 : d0 c0 __ BNE $9197 ; (nformi.l31 + 0)
.s6:
00:91d7 : a0 02 __ LDY #$02
00:91d9 : b1 0d __ LDA (P0),y ; (si + 0)
00:91db : c9 ff __ CMP #$ff
00:91dd : d0 04 __ BNE $91e3 ; (nformi.s29 + 0)
.s7:
00:91df : a9 0f __ LDA #$0f
00:91e1 : d0 05 __ BNE $91e8 ; (nformi.s43 + 0)
.s29:
00:91e3 : 38 __ __ SEC
00:91e4 : a9 10 __ LDA #$10
00:91e6 : f1 0d __ SBC (P0),y ; (si + 0)
.s43:
00:91e8 : a8 __ __ TAY
00:91e9 : c4 46 __ CPY T6 + 0 
00:91eb : b0 0d __ BCS $91fa ; (nformi.s8 + 0)
.s28:
00:91ed : a9 30 __ LDA #$30
.l44:
00:91ef : a6 46 __ LDX T6 + 0 
00:91f1 : 9d e7 7f STA $7fe7,x 
00:91f4 : c6 46 __ DEC T6 + 0 
00:91f6 : c4 46 __ CPY T6 + 0 
00:91f8 : 90 f5 __ BCC $91ef ; (nformi.l44 + 0)
.s8:
00:91fa : a0 08 __ LDY #$08
00:91fc : b1 0d __ LDA (P0),y ; (si + 0)
00:91fe : f0 24 __ BEQ $9224 ; (nformi.s9 + 0)
.s25:
00:9200 : a0 05 __ LDY #$05
00:9202 : b1 0d __ LDA (P0),y ; (si + 0)
00:9204 : d0 1e __ BNE $9224 ; (nformi.s9 + 0)
.s27:
00:9206 : 88 __ __ DEY
00:9207 : b1 0d __ LDA (P0),y ; (si + 0)
00:9209 : c9 10 __ CMP #$10
00:920b : d0 17 __ BNE $9224 ; (nformi.s9 + 0)
.s26:
00:920d : 88 __ __ DEY
00:920e : b1 0d __ LDA (P0),y ; (si + 0)
00:9210 : a8 __ __ TAY
00:9211 : a9 30 __ LDA #$30
00:9213 : a6 46 __ LDX T6 + 0 
00:9215 : 9d e6 7f STA $7fe6,x ; (si + 8)
00:9218 : 98 __ __ TYA
00:9219 : 69 16 __ ADC #$16
00:921b : 9d e7 7f STA $7fe7,x 
00:921e : 8a __ __ TXA
00:921f : 18 __ __ CLC
00:9220 : 69 fe __ ADC #$fe
00:9222 : 85 46 __ STA T6 + 0 
.s9:
00:9224 : a9 00 __ LDA #$00
00:9226 : 85 1b __ STA ACCU + 0 
00:9228 : a5 45 __ LDA T5 + 0 
00:922a : f0 0c __ BEQ $9238 ; (nformi.s10 + 0)
.s24:
00:922c : a9 2d __ LDA #$2d
.s23:
00:922e : a6 46 __ LDX T6 + 0 
00:9230 : 9d e7 7f STA $7fe7,x 
00:9233 : c6 46 __ DEC T6 + 0 
00:9235 : 4c 42 18 JMP $1842 
.s10:
00:9238 : a0 06 __ LDY #$06
00:923a : b1 0d __ LDA (P0),y ; (si + 0)
00:923c : f0 04 __ BEQ $9242 ; (nformi.s11 + 0)
.s22:
00:923e : a9 2b __ LDA #$2b
00:9240 : d0 ec __ BNE $922e ; (nformi.s23 + 0)
.s11:
00:9242 : a6 46 __ LDX T6 + 0 
00:9244 : a0 07 __ LDY #$07
00:9246 : b1 0d __ LDA (P0),y ; (si + 0)
00:9248 : d0 2d __ BNE $9277 ; (nformi.s18 + 0)
.l12:
00:924a : 8a __ __ TXA
00:924b : 18 __ __ CLC
00:924c : a0 01 __ LDY #$01
00:924e : 71 0d __ ADC (P0),y ; (si + 0)
00:9250 : b0 04 __ BCS $9256 ; (nformi.s16 + 0)
.s17:
00:9252 : c9 11 __ CMP #$11
00:9254 : 90 0a __ BCC $9260 ; (nformi.s13 + 0)
.s16:
00:9256 : a0 00 __ LDY #$00
00:9258 : b1 0d __ LDA (P0),y ; (si + 0)
00:925a : 9d e7 7f STA $7fe7,x 
00:925d : ca __ __ DEX
00:925e : b0 ea __ BCS $924a ; (nformi.l12 + 0)
.s13:
00:9260 : e0 10 __ CPX #$10
00:9262 : b0 0e __ BCS $9272 ; (nformi.s14 + 0)
.s15:
00:9264 : 88 __ __ DEY
.l41:
00:9265 : bd e8 7f LDA $7fe8,x ; (buffer + 0)
00:9268 : 91 0f __ STA (P2),y ; (str + 0)
00:926a : c8 __ __ INY
00:926b : e8 __ __ INX
00:926c : e0 10 __ CPX #$10
00:926e : 90 f5 __ BCC $9265 ; (nformi.l41 + 0)
.s42:
00:9270 : 84 1b __ STY ACCU + 0 
.s14:
00:9272 : a9 00 __ LDA #$00
00:9274 : 85 1c __ STA ACCU + 1 
.s3:
00:9276 : 60 __ __ RTS
.s18:
00:9277 : e0 10 __ CPX #$10
00:9279 : b0 1a __ BCS $9295 ; (nformi.l19 + 0)
.s21:
00:927b : a0 00 __ LDY #$00
.l39:
00:927d : bd e8 7f LDA $7fe8,x ; (buffer + 0)
00:9280 : 91 0f __ STA (P2),y ; (str + 0)
00:9282 : c8 __ __ INY
00:9283 : e8 __ __ INX
00:9284 : e0 10 __ CPX #$10
00:9286 : 90 f5 __ BCC $927d ; (nformi.l39 + 0)
.s40:
00:9288 : 84 1b __ STY ACCU + 0 
00:928a : b0 09 __ BCS $9295 ; (nformi.l19 + 0)
.s20:
00:928c : 88 __ __ DEY
00:928d : b1 0d __ LDA (P0),y ; (si + 0)
00:928f : a4 1b __ LDY ACCU + 0 
00:9291 : 91 0f __ STA (P2),y ; (str + 0)
00:9293 : e6 1b __ INC ACCU + 0 
.l19:
00:9295 : a5 1b __ LDA ACCU + 0 
00:9297 : a0 01 __ LDY #$01
00:9299 : d1 0d __ CMP (P0),y ; (si + 0)
00:929b : 90 ef __ BCC $928c ; (nformi.s20 + 0)
00:929d : b0 d3 __ BCS $9272 ; (nformi.s14 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s4:
00:929f : a9 00 __ LDA #$00
00:92a1 : 85 45 __ STA T5 + 0 
00:92a3 : a5 15 __ LDA P8 ; (s + 0)
00:92a5 : f0 1f __ BEQ $92c6 ; (nforml.s5 + 0)
.s43:
00:92a7 : 24 14 __ BIT P7 ; (v + 3)
00:92a9 : 10 1b __ BPL $92c6 ; (nforml.s5 + 0)
.s44:
00:92ab : 38 __ __ SEC
00:92ac : a9 00 __ LDA #$00
00:92ae : e5 11 __ SBC P4 ; (v + 0)
00:92b0 : 85 11 __ STA P4 ; (v + 0)
00:92b2 : a9 00 __ LDA #$00
00:92b4 : e5 12 __ SBC P5 ; (v + 1)
00:92b6 : 85 12 __ STA P5 ; (v + 1)
00:92b8 : a9 00 __ LDA #$00
00:92ba : e5 13 __ SBC P6 ; (v + 2)
00:92bc : 85 13 __ STA P6 ; (v + 2)
00:92be : a9 00 __ LDA #$00
00:92c0 : e5 14 __ SBC P7 ; (v + 3)
00:92c2 : 85 14 __ STA P7 ; (v + 3)
00:92c4 : e6 45 __ INC T5 + 0 
.s5:
00:92c6 : a9 10 __ LDA #$10
00:92c8 : 85 46 __ STA T6 + 0 
00:92ca : a5 14 __ LDA P7 ; (v + 3)
00:92cc : d0 0c __ BNE $92da ; (nforml.s30 + 0)
.s40:
00:92ce : a5 13 __ LDA P6 ; (v + 2)
00:92d0 : d0 08 __ BNE $92da ; (nforml.s30 + 0)
.s41:
00:92d2 : a5 12 __ LDA P5 ; (v + 1)
00:92d4 : d0 04 __ BNE $92da ; (nforml.s30 + 0)
.s42:
00:92d6 : c5 11 __ CMP P4 ; (v + 0)
00:92d8 : b0 0e __ BCS $92e8 ; (nforml.s6 + 0)
.s30:
00:92da : a0 04 __ LDY #$04
00:92dc : b1 0d __ LDA (P0),y ; (si + 0)
00:92de : 85 43 __ STA T1 + 0 
00:92e0 : c8 __ __ INY
00:92e1 : b1 0d __ LDA (P0),y ; (si + 0)
00:92e3 : 85 44 __ STA T1 + 1 
00:92e5 : 4c b0 19 JMP $19b0 
.s6:
00:92e8 : a0 02 __ LDY #$02
00:92ea : b1 0d __ LDA (P0),y ; (si + 0)
00:92ec : c9 ff __ CMP #$ff
00:92ee : d0 04 __ BNE $92f4 ; (nforml.s29 + 0)
.s7:
00:92f0 : a9 0f __ LDA #$0f
00:92f2 : d0 05 __ BNE $92f9 ; (nforml.s49 + 0)
.s29:
00:92f4 : 38 __ __ SEC
00:92f5 : a9 10 __ LDA #$10
00:92f7 : f1 0d __ SBC (P0),y ; (si + 0)
.s49:
00:92f9 : a8 __ __ TAY
00:92fa : c4 46 __ CPY T6 + 0 
00:92fc : b0 0d __ BCS $930b ; (nforml.s8 + 0)
.s28:
00:92fe : a9 30 __ LDA #$30
.l50:
00:9300 : a6 46 __ LDX T6 + 0 
00:9302 : 9d e7 7f STA $7fe7,x 
00:9305 : c6 46 __ DEC T6 + 0 
00:9307 : c4 46 __ CPY T6 + 0 
00:9309 : 90 f5 __ BCC $9300 ; (nforml.l50 + 0)
.s8:
00:930b : a0 08 __ LDY #$08
00:930d : b1 0d __ LDA (P0),y ; (si + 0)
00:930f : f0 24 __ BEQ $9335 ; (nforml.s9 + 0)
.s25:
00:9311 : a0 05 __ LDY #$05
00:9313 : b1 0d __ LDA (P0),y ; (si + 0)
00:9315 : d0 1e __ BNE $9335 ; (nforml.s9 + 0)
.s27:
00:9317 : 88 __ __ DEY
00:9318 : b1 0d __ LDA (P0),y ; (si + 0)
00:931a : c9 10 __ CMP #$10
00:931c : d0 17 __ BNE $9335 ; (nforml.s9 + 0)
.s26:
00:931e : 88 __ __ DEY
00:931f : b1 0d __ LDA (P0),y ; (si + 0)
00:9321 : a8 __ __ TAY
00:9322 : a9 30 __ LDA #$30
00:9324 : a6 46 __ LDX T6 + 0 
00:9326 : 9d e6 7f STA $7fe6,x ; (si + 8)
00:9329 : 98 __ __ TYA
00:932a : 69 16 __ ADC #$16
00:932c : 9d e7 7f STA $7fe7,x 
00:932f : 8a __ __ TXA
00:9330 : 18 __ __ CLC
00:9331 : 69 fe __ ADC #$fe
00:9333 : 85 46 __ STA T6 + 0 
.s9:
00:9335 : a9 00 __ LDA #$00
00:9337 : 85 1b __ STA ACCU + 0 
00:9339 : a5 45 __ LDA T5 + 0 
00:933b : f0 0c __ BEQ $9349 ; (nforml.s10 + 0)
.s24:
00:933d : a9 2d __ LDA #$2d
.s23:
00:933f : a6 46 __ LDX T6 + 0 
00:9341 : 9d e7 7f STA $7fe7,x 
00:9344 : c6 46 __ DEC T6 + 0 
00:9346 : 4c 53 19 JMP $1953 
.s10:
00:9349 : a0 06 __ LDY #$06
00:934b : b1 0d __ LDA (P0),y ; (si + 0)
00:934d : f0 04 __ BEQ $9353 ; (nforml.s11 + 0)
.s22:
00:934f : a9 2b __ LDA #$2b
00:9351 : d0 ec __ BNE $933f ; (nforml.s23 + 0)
.s11:
00:9353 : a6 46 __ LDX T6 + 0 
00:9355 : a0 07 __ LDY #$07
00:9357 : b1 0d __ LDA (P0),y ; (si + 0)
00:9359 : d0 2d __ BNE $9388 ; (nforml.s18 + 0)
.l12:
00:935b : 8a __ __ TXA
00:935c : 18 __ __ CLC
00:935d : a0 01 __ LDY #$01
00:935f : 71 0d __ ADC (P0),y ; (si + 0)
00:9361 : b0 04 __ BCS $9367 ; (nforml.s16 + 0)
.s17:
00:9363 : c9 11 __ CMP #$11
00:9365 : 90 0a __ BCC $9371 ; (nforml.s13 + 0)
.s16:
00:9367 : a0 00 __ LDY #$00
00:9369 : b1 0d __ LDA (P0),y ; (si + 0)
00:936b : 9d e7 7f STA $7fe7,x 
00:936e : ca __ __ DEX
00:936f : b0 ea __ BCS $935b ; (nforml.l12 + 0)
.s13:
00:9371 : e0 10 __ CPX #$10
00:9373 : b0 0e __ BCS $9383 ; (nforml.s14 + 0)
.s15:
00:9375 : 88 __ __ DEY
.l47:
00:9376 : bd e8 7f LDA $7fe8,x ; (buffer + 0)
00:9379 : 91 0f __ STA (P2),y ; (str + 0)
00:937b : c8 __ __ INY
00:937c : e8 __ __ INX
00:937d : e0 10 __ CPX #$10
00:937f : 90 f5 __ BCC $9376 ; (nforml.l47 + 0)
.s48:
00:9381 : 84 1b __ STY ACCU + 0 
.s14:
00:9383 : a9 00 __ LDA #$00
00:9385 : 85 1c __ STA ACCU + 1 
.s3:
00:9387 : 60 __ __ RTS
.s18:
00:9388 : e0 10 __ CPX #$10
00:938a : b0 1a __ BCS $93a6 ; (nforml.l19 + 0)
.s21:
00:938c : a0 00 __ LDY #$00
.l45:
00:938e : bd e8 7f LDA $7fe8,x ; (buffer + 0)
00:9391 : 91 0f __ STA (P2),y ; (str + 0)
00:9393 : c8 __ __ INY
00:9394 : e8 __ __ INX
00:9395 : e0 10 __ CPX #$10
00:9397 : 90 f5 __ BCC $938e ; (nforml.l45 + 0)
.s46:
00:9399 : 84 1b __ STY ACCU + 0 
00:939b : b0 09 __ BCS $93a6 ; (nforml.l19 + 0)
.s20:
00:939d : 88 __ __ DEY
00:939e : b1 0d __ LDA (P0),y ; (si + 0)
00:93a0 : a4 1b __ LDY ACCU + 0 
00:93a2 : 91 0f __ STA (P2),y ; (str + 0)
00:93a4 : e6 1b __ INC ACCU + 0 
.l19:
00:93a6 : a5 1b __ LDA ACCU + 0 
00:93a8 : a0 01 __ LDY #$01
00:93aa : d1 0d __ CMP (P0),y ; (si + 0)
00:93ac : 90 ef __ BCC $939d ; (nforml.s20 + 0)
00:93ae : b0 d3 __ BCS $9383 ; (nforml.s14 + 0)
.l31:
00:93b0 : a5 11 __ LDA P4 ; (v + 0)
00:93b2 : 85 1b __ STA ACCU + 0 
00:93b4 : a5 12 __ LDA P5 ; (v + 1)
00:93b6 : 85 1c __ STA ACCU + 1 
00:93b8 : a5 13 __ LDA P6 ; (v + 2)
00:93ba : 85 1d __ STA ACCU + 2 
00:93bc : a5 14 __ LDA P7 ; (v + 3)
00:93be : 85 1e __ STA ACCU + 3 
00:93c0 : a5 43 __ LDA T1 + 0 
00:93c2 : 85 03 __ STA WORK + 0 
00:93c4 : a5 44 __ LDA T1 + 1 
00:93c6 : 85 04 __ STA WORK + 1 
00:93c8 : a9 00 __ LDA #$00
00:93ca : 85 05 __ STA WORK + 2 
00:93cc : 85 06 __ STA WORK + 3 
00:93ce : 20 72 27 JSR $2772 
00:93d1 : a5 08 __ LDA WORK + 5 
00:93d3 : 30 08 __ BMI $93dd ; (nforml.s32 + 0)
.s39:
00:93d5 : d0 0a __ BNE $93e1 ; (nforml.s37 + 0)
.s38:
00:93d7 : a5 07 __ LDA WORK + 4 
00:93d9 : c9 0a __ CMP #$0a
00:93db : b0 04 __ BCS $93e1 ; (nforml.s37 + 0)
.s32:
00:93dd : a9 30 __ LDA #$30
00:93df : d0 07 __ BNE $93e8 ; (nforml.s33 + 0)
.s37:
00:93e1 : a0 03 __ LDY #$03
00:93e3 : b1 0d __ LDA (P0),y ; (si + 0)
00:93e5 : 38 __ __ SEC
00:93e6 : e9 0a __ SBC #$0a
.s33:
00:93e8 : 18 __ __ CLC
00:93e9 : 65 07 __ ADC WORK + 4 
00:93eb : a6 46 __ LDX T6 + 0 
00:93ed : 9d e7 7f STA $7fe7,x 
00:93f0 : a5 1b __ LDA ACCU + 0 
00:93f2 : 85 11 __ STA P4 ; (v + 0)
00:93f4 : a5 1c __ LDA ACCU + 1 
00:93f6 : 85 12 __ STA P5 ; (v + 1)
00:93f8 : a5 1d __ LDA ACCU + 2 
00:93fa : 85 13 __ STA P6 ; (v + 2)
00:93fc : a5 1e __ LDA ACCU + 3 
00:93fe : 85 14 __ STA P7 ; (v + 3)
00:9400 : c6 46 __ DEC T6 + 0 
00:9402 : aa __ __ TAX
00:9403 : d0 ab __ BNE $93b0 ; (nforml.l31 + 0)
.s34:
00:9405 : a5 13 __ LDA P6 ; (v + 2)
00:9407 : d0 a7 __ BNE $93b0 ; (nforml.l31 + 0)
.s35:
00:9409 : a5 12 __ LDA P5 ; (v + 1)
00:940b : d0 a3 __ BNE $93b0 ; (nforml.l31 + 0)
.s36:
00:940d : c5 11 __ CMP P4 ; (v + 0)
00:940f : 90 9f __ BCC $93b0 ; (nforml.l31 + 0)
00:9411 : 4c e8 18 JMP $18e8 
--------------------------------------------------------------------
00:9414 : __ __ __ BYT 0a 72 65 75 20 44 45 54 45 43 54 45 44 2c 20 53 : .reu DETECTED, S
00:9424 : __ __ __ BYT 49 5a 45 3a 20 25 44 20 6b 62 0a 00             : IZE: %D kb..
--------------------------------------------------------------------
errorexit: ; errorexit(const u8*)->void
.s1:
00:9430 : 38 __ __ SEC
00:9431 : a5 23 __ LDA SP + 0 
00:9433 : e9 09 __ SBC #$09
00:9435 : 85 23 __ STA SP + 0 
00:9437 : b0 02 __ BCS $943b ; (errorexit.s4 + 0)
00:9439 : c6 24 __ DEC SP + 1 
.s4:
00:943b : a9 67 __ LDA #$67
00:943d : a0 05 __ LDY #$05
00:943f : 91 23 __ STA (SP + 0),y 
00:9441 : a9 1a __ LDA #$1a
00:9443 : c8 __ __ INY
00:9444 : 91 23 __ STA (SP + 0),y 
00:9446 : ad fc 7f LDA $7ffc ; (sstack + 4)
00:9449 : c8 __ __ INY
00:944a : 91 23 __ STA (SP + 0),y 
00:944c : ad fd 7f LDA $7ffd ; (sstack + 5)
00:944f : c8 __ __ INY
00:9450 : 91 23 __ STA (SP + 0),y 
00:9452 : 20 79 13 JSR $1379 
00:9455 : 20 fb 11 JSR $11fb 
00:9458 : 20 00 c0 JSR $c000 
.s3:
00:945b : 18 __ __ CLC
00:945c : a5 23 __ LDA SP + 0 
00:945e : 69 09 __ ADC #$09
00:9460 : 85 23 __ STA SP + 0 
00:9462 : 90 02 __ BCC $9466 ; (errorexit.s3 + 11)
00:9464 : e6 24 __ INC SP + 1 
00:9466 : 60 __ __ RTS
--------------------------------------------------------------------
00:9467 : __ __ __ BYT 0a 25 53 0a 70 52 45 53 53 20 4b 45 59 20 54 4f : .%S.pRESS KEY TO
00:9477 : __ __ __ BYT 20 45 58 49 54 20 54 4f 20 62 61 73 69 63 2e 0a :  EXIT TO basic..
00:9487 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
00:9488 : __ __ __ BYT 6e 4f 20 72 65 75 20 44 45 54 45 43 54 45 44 2e : nO reu DETECTED.
00:9498 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
readconfigfile: ; readconfigfile()->void
.s1:
00:9499 : 38 __ __ SEC
00:949a : a5 23 __ LDA SP + 0 
00:949c : e9 07 __ SBC #$07
00:949e : 85 23 __ STA SP + 0 
00:94a0 : b0 02 __ BCS $94a4 ; (readconfigfile.s4 + 0)
00:94a2 : c6 24 __ DEC SP + 1 
.s4:
00:94a4 : 20 a1 10 JSR $10a1 
00:94a7 : a9 01 __ LDA #$01
00:94a9 : 85 11 __ STA P4 
00:94ab : 20 30 1b JSR $1b30 
00:94ae : 20 d4 1b JSR $1bd4 
00:94b1 : aa __ __ TAX
00:94b2 : f0 1d __ BEQ $94d1 ; (readconfigfile.s5 + 0)
.s9:
00:94b4 : a9 17 __ LDA #$17
00:94b6 : a0 05 __ LDY #$05
00:94b8 : 91 23 __ STA (SP + 0),y 
00:94ba : a9 1c __ LDA #$1c
00:94bc : c8 __ __ INY
00:94bd : 91 23 __ STA (SP + 0),y 
00:94bf : 20 79 13 JSR $1379 
00:94c2 : 20 40 1c JSR $1c40 
.s3:
00:94c5 : 18 __ __ CLC
00:94c6 : a5 23 __ LDA SP + 0 
00:94c8 : 69 07 __ ADC #$07
00:94ca : 85 23 __ STA SP + 0 
00:94cc : 90 02 __ BCC $94d0 ; (readconfigfile.s3 + 11)
00:94ce : e6 24 __ INC SP + 1 
00:94d0 : 60 __ __ RTS
.s5:
00:94d1 : a9 56 __ LDA #$56
00:94d3 : 85 11 __ STA P4 
00:94d5 : a9 00 __ LDA #$00
00:94d7 : 85 12 __ STA P5 
00:94d9 : 20 79 0f JSR $0f79 
00:94dc : a9 44 __ LDA #$44
00:94de : 8d fe 7f STA $7ffe ; (sstack + 6)
00:94e1 : a9 1e __ LDA #$1e
00:94e3 : 8d ff 7f STA $7fff ; (sstack + 7)
00:94e6 : 20 ac 1d JSR $1dac 
00:94e9 : 20 27 10 JSR $1027 
00:94ec : 20 1e 11 JSR $111e 
00:94ef : a2 55 __ LDX #$55
.l6:
00:94f1 : bd c8 49 LDA $49c8,x ; (uii_data + 0)
00:94f4 : 9d 00 49 STA $4900,x ; (cfg + 0)
00:94f7 : ca __ __ DEX
00:94f8 : 10 f7 __ BPL $94f1 ; (readconfigfile.l6 + 0)
.s7:
00:94fa : ad c8 49 LDA $49c8 ; (uii_data + 0)
00:94fd : c9 02 __ CMP #$02
00:94ff : b0 29 __ BCS $952a ; (readconfigfile.s10 + 0)
.s8:
00:9501 : a9 53 __ LDA #$53
00:9503 : a0 05 __ LDY #$05
00:9505 : 91 23 __ STA (SP + 0),y 
00:9507 : a9 1e __ LDA #$1e
00:9509 : c8 __ __ INY
00:950a : 91 23 __ STA (SP + 0),y 
00:950c : 20 79 13 JSR $1379 
00:950f : a9 73 __ LDA #$73
00:9511 : a0 05 __ LDY #$05
00:9513 : 91 23 __ STA (SP + 0),y 
00:9515 : a9 1e __ LDA #$1e
00:9517 : c8 __ __ INY
00:9518 : 91 23 __ STA (SP + 0),y 
00:951a : 20 79 13 JSR $1379 
00:951d : a9 34 __ LDA #$34
00:951f : 8d fc 7f STA $7ffc ; (sstack + 4)
00:9522 : a9 1e __ LDA #$1e
00:9524 : 8d fd 7f STA $7ffd ; (sstack + 5)
00:9527 : 20 30 1a JSR $1a30 
.s10:
00:952a : 20 72 1c JSR $1c72 
00:952d : 4c c5 1a JMP $1ac5 
--------------------------------------------------------------------
uii_open_file@proxy: ; uii_open_file@proxy
00:9530 : a9 b2 __ LDA #$b2
00:9532 : 85 12 __ STA P5 
00:9534 : a9 2a __ LDA #$2a
00:9536 : 85 13 __ STA P6 
--------------------------------------------------------------------
uii_open_file: ; uii_open_file(u8,u8*)->void
.s4:
00:9538 : a5 12 __ LDA P5 ; (filename + 0)
00:953a : 85 0d __ STA P0 
00:953c : 20 5a 2a JSR $2a5a 
00:953f : 18 __ __ CLC
00:9540 : a5 1b __ LDA ACCU + 0 
00:9542 : 69 03 __ ADC #$03
00:9544 : 85 1b __ STA ACCU + 0 
00:9546 : 90 02 __ BCC $954a ; (uii_open_file.s10 + 0)
.s9:
00:9548 : e6 1c __ INC ACCU + 1 
.s10:
00:954a : 20 49 28 JSR $2849 
00:954d : a5 1b __ LDA ACCU + 0 
00:954f : 85 45 __ STA T2 + 0 
00:9551 : a5 1c __ LDA ACCU + 1 
00:9553 : 85 46 __ STA T2 + 1 
00:9555 : a9 00 __ LDA #$00
00:9557 : a8 __ __ TAY
00:9558 : 91 1b __ STA (ACCU + 0),y 
00:955a : a9 02 __ LDA #$02
00:955c : c8 __ __ INY
00:955d : 91 1b __ STA (ACCU + 0),y 
00:955f : a5 11 __ LDA P4 ; (attrib + 0)
00:9561 : c8 __ __ INY
00:9562 : 91 1b __ STA (ACCU + 0),y 
00:9564 : a9 00 __ LDA #$00
00:9566 : 85 47 __ STA T3 + 0 
00:9568 : 85 48 __ STA T3 + 1 
.l11:
00:956a : 20 5a 2a JSR $2a5a 
00:956d : a5 48 __ LDA T3 + 1 
00:956f : c5 1c __ CMP ACCU + 1 
00:9571 : d0 5b __ BNE $95ce ; (uii_open_file.s8 + 0)
.s7:
00:9573 : a5 47 __ LDA T3 + 0 
00:9575 : c5 1b __ CMP ACCU + 0 
00:9577 : 90 2c __ BCC $95a5 ; (uii_open_file.s6 + 0)
.s5:
00:9579 : a9 01 __ LDA #$01
00:957b : 8d fe 24 STA $24fe 
00:957e : 20 5a 2a JSR $2a5a 
00:9581 : a5 45 __ LDA T2 + 0 
00:9583 : 85 0d __ STA P0 
00:9585 : a5 46 __ LDA T2 + 1 
00:9587 : 85 0e __ STA P1 
00:9589 : 18 __ __ CLC
00:958a : a5 1b __ LDA ACCU + 0 
00:958c : 69 03 __ ADC #$03
00:958e : 85 0f __ STA P2 
00:9590 : a5 1c __ LDA ACCU + 1 
00:9592 : 69 00 __ ADC #$00
00:9594 : 85 10 __ STA P3 
00:9596 : 20 a6 0f JSR $0fa6 
00:9599 : 20 41 29 JSR $2941 
00:959c : 20 27 10 JSR $1027 
00:959f : 20 6c 10 JSR $106c 
00:95a2 : 4c 1e 11 JMP $111e 
.s6:
00:95a5 : 85 43 __ STA T0 + 0 
00:95a7 : 18 __ __ CLC
00:95a8 : a5 13 __ LDA P6 ; (filename + 1)
00:95aa : 65 48 __ ADC T3 + 1 
00:95ac : 85 44 __ STA T0 + 1 
00:95ae : a4 12 __ LDY P5 ; (filename + 0)
00:95b0 : b1 43 __ LDA (T0 + 0),y 
00:95b2 : aa __ __ TAX
00:95b3 : 18 __ __ CLC
00:95b4 : a5 45 __ LDA T2 + 0 
00:95b6 : 65 47 __ ADC T3 + 0 
00:95b8 : 85 43 __ STA T0 + 0 
00:95ba : a5 46 __ LDA T2 + 1 
00:95bc : 65 48 __ ADC T3 + 1 
00:95be : 85 44 __ STA T0 + 1 
00:95c0 : 8a __ __ TXA
00:95c1 : a0 03 __ LDY #$03
00:95c3 : 91 43 __ STA (T0 + 0),y 
00:95c5 : e6 47 __ INC T3 + 0 
00:95c7 : d0 a1 __ BNE $956a ; (uii_open_file.l11 + 0)
.s12:
00:95c9 : e6 48 __ INC T3 + 1 
00:95cb : 4c 6a 1b JMP $1b6a 
.s8:
00:95ce : b0 a9 __ BCS $9579 ; (uii_open_file.s5 + 0)
.s13:
00:95d0 : a5 47 __ LDA T3 + 0 
00:95d2 : 90 d1 __ BCC $95a5 ; (uii_open_file.s6 + 0)
--------------------------------------------------------------------
strcmp@proxy: ; strcmp@proxy
00:95d4 : a9 c9 __ LDA #$c9
00:95d6 : 85 0d __ STA P0 
00:95d8 : a9 4b __ LDA #$4b
00:95da : 85 0e __ STA P1 
00:95dc : a9 11 __ LDA #$11
00:95de : 85 0f __ STA P2 
00:95e0 : a9 1c __ LDA #$1c
00:95e2 : 85 10 __ STA P3 
--------------------------------------------------------------------
strcmp: ; strcmp(const u8*,const u8*)->i8
.s4:
00:95e4 : a0 00 __ LDY #$00
00:95e6 : b1 0d __ LDA (P0),y 
00:95e8 : f0 16 __ BEQ $9600 ; (strcmp.s4 + 28)
00:95ea : d1 0f __ CMP (P2),y 
00:95ec : d0 16 __ BNE $9604 ; (strcmp.s4 + 32)
00:95ee : c8 __ __ INY
00:95ef : b1 0d __ LDA (P0),y 
00:95f1 : f0 0d __ BEQ $9600 ; (strcmp.s4 + 28)
00:95f3 : d1 0f __ CMP (P2),y 
00:95f5 : d0 0d __ BNE $9604 ; (strcmp.s4 + 32)
00:95f7 : c8 __ __ INY
00:95f8 : d0 ec __ BNE $95e6 ; (strcmp.s4 + 2)
00:95fa : e6 0e __ INC P1 
00:95fc : e6 10 __ INC P3 
00:95fe : d0 e6 __ BNE $95e6 ; (strcmp.s4 + 2)
00:9600 : d1 0f __ CMP (P2),y 
00:9602 : f0 08 __ BEQ $960c ; (strcmp.s4 + 40)
00:9604 : b0 04 __ BCS $960a ; (strcmp.s4 + 38)
00:9606 : a9 ff __ LDA #$ff
00:9608 : 30 02 __ BMI $960c ; (strcmp.s4 + 40)
00:960a : a9 01 __ LDA #$01
00:960c : 85 1b __ STA ACCU + 0 
.s3:
00:960e : a5 1b __ LDA ACCU + 0 
00:9610 : 60 __ __ RTS
--------------------------------------------------------------------
00:9611 : __ __ __ BYT 30 30 2c 4f 4b 00                               : 00,OK.
--------------------------------------------------------------------
00:9617 : __ __ __ BYT 0a 6e 4f 20 43 4f 4e 46 49 47 20 46 49 4c 45 20 : .nO CONFIG FILE 
00:9627 : __ __ __ BYT 46 4f 55 4e 44 2c 20 57 52 49 54 49 4e 47 20 44 : FOUND, WRITING D
00:9637 : __ __ __ BYT 45 46 41 55 4c 54 53 2e 00                      : EFAULTS..
--------------------------------------------------------------------
writeconfigfile: ; writeconfigfile()->void
.s4:
00:9640 : a9 b2 __ LDA #$b2
00:9642 : 85 11 __ STA P4 
00:9644 : a9 2a __ LDA #$2a
00:9646 : 85 12 __ STA P5 
00:9648 : 20 9b 1c JSR $1c9b 
00:964b : a9 06 __ LDA #$06
00:964d : 85 11 __ STA P4 
00:964f : 20 30 1b JSR $1b30 
00:9652 : a9 56 __ LDA #$56
00:9654 : 85 13 __ STA P6 
00:9656 : a9 49 __ LDA #$49
00:9658 : 85 12 __ STA P5 
00:965a : a9 00 __ LDA #$00
00:965c : 85 14 __ STA P7 
00:965e : a9 00 __ LDA #$00
00:9660 : 85 11 __ STA P4 
00:9662 : 20 2b 1d JSR $1d2b 
00:9665 : a9 35 __ LDA #$35
00:9667 : 8d fe 7f STA $7ffe ; (sstack + 6)
00:966a : a9 1e __ LDA #$1e
00:966c : 8d ff 7f STA $7fff ; (sstack + 7)
00:966f : 20 ac 1d JSR $1dac 
--------------------------------------------------------------------
uii_close_file: ; uii_close_file()->void
.s4:
00:9672 : a9 00 __ LDA #$00
00:9674 : 85 10 __ STA P3 
00:9676 : 8d f6 7f STA $7ff6 ; (cmd + 0)
00:9679 : a9 01 __ LDA #$01
00:967b : 8d fe 24 STA $24fe 
00:967e : a9 02 __ LDA #$02
00:9680 : 85 0f __ STA P2 
00:9682 : a9 03 __ LDA #$03
00:9684 : 8d f7 7f STA $7ff7 ; (cmd + 1)
00:9687 : a9 f6 __ LDA #$f6
00:9689 : 85 0d __ STA P0 
00:968b : a9 7f __ LDA #$7f
00:968d : 85 0e __ STA P1 
00:968f : 20 a6 0f JSR $0fa6 
00:9692 : 20 27 10 JSR $1027 
00:9695 : 20 6c 10 JSR $106c 
00:9698 : 4c 1e 11 JMP $111e 
--------------------------------------------------------------------
uii_delete_file: ; uii_delete_file(u8*)->void
.s4:
00:969b : 20 1f 0f JSR $0f1f 
00:969e : 18 __ __ CLC
00:969f : a5 1b __ LDA ACCU + 0 
00:96a1 : 69 02 __ ADC #$02
00:96a3 : 85 1b __ STA ACCU + 0 
00:96a5 : 90 02 __ BCC $96a9 ; (uii_delete_file.s10 + 0)
.s9:
00:96a7 : e6 1c __ INC ACCU + 1 
.s10:
00:96a9 : 20 49 28 JSR $2849 
00:96ac : a5 1b __ LDA ACCU + 0 
00:96ae : 85 45 __ STA T2 + 0 
00:96b0 : a5 1c __ LDA ACCU + 1 
00:96b2 : 85 46 __ STA T2 + 1 
00:96b4 : a9 00 __ LDA #$00
00:96b6 : a8 __ __ TAY
00:96b7 : 91 1b __ STA (ACCU + 0),y 
00:96b9 : a9 09 __ LDA #$09
00:96bb : c8 __ __ INY
00:96bc : 91 1b __ STA (ACCU + 0),y 
00:96be : a9 00 __ LDA #$00
00:96c0 : 85 47 __ STA T3 + 0 
00:96c2 : 85 48 __ STA T3 + 1 
.l11:
00:96c4 : 20 53 2a JSR $2a53 
00:96c7 : a5 48 __ LDA T3 + 1 
00:96c9 : c5 1c __ CMP ACCU + 1 
00:96cb : d0 58 __ BNE $9725 ; (uii_delete_file.s8 + 0)
.s7:
00:96cd : a5 47 __ LDA T3 + 0 
00:96cf : c5 1b __ CMP ACCU + 0 
00:96d1 : 90 29 __ BCC $96fc ; (uii_delete_file.s6 + 0)
.s5:
00:96d3 : a9 01 __ LDA #$01
00:96d5 : 8d fe 24 STA $24fe 
00:96d8 : 20 53 2a JSR $2a53 
00:96db : a5 45 __ LDA T2 + 0 
00:96dd : 85 0d __ STA P0 
00:96df : a5 46 __ LDA T2 + 1 
00:96e1 : 85 0e __ STA P1 
00:96e3 : 18 __ __ CLC
00:96e4 : a5 1b __ LDA ACCU + 0 
00:96e6 : 69 02 __ ADC #$02
00:96e8 : 85 0f __ STA P2 
00:96ea : a5 1c __ LDA ACCU + 1 
00:96ec : 69 00 __ ADC #$00
00:96ee : 85 10 __ STA P3 
00:96f0 : 20 a6 0f JSR $0fa6 
00:96f3 : 20 41 29 JSR $2941 
00:96f6 : 20 6c 10 JSR $106c 
00:96f9 : 4c 1e 11 JMP $111e 
.s6:
00:96fc : 85 43 __ STA T0 + 0 
00:96fe : 18 __ __ CLC
00:96ff : a5 12 __ LDA P5 ; (filename + 1)
00:9701 : 65 48 __ ADC T3 + 1 
00:9703 : 85 44 __ STA T0 + 1 
00:9705 : a4 11 __ LDY P4 ; (filename + 0)
00:9707 : b1 43 __ LDA (T0 + 0),y 
00:9709 : aa __ __ TAX
00:970a : 18 __ __ CLC
00:970b : a5 45 __ LDA T2 + 0 
00:970d : 65 47 __ ADC T3 + 0 
00:970f : 85 43 __ STA T0 + 0 
00:9711 : a5 46 __ LDA T2 + 1 
00:9713 : 65 48 __ ADC T3 + 1 
00:9715 : 85 44 __ STA T0 + 1 
00:9717 : 8a __ __ TXA
00:9718 : a0 02 __ LDY #$02
00:971a : 91 43 __ STA (T0 + 0),y 
00:971c : e6 47 __ INC T3 + 0 
00:971e : d0 a4 __ BNE $96c4 ; (uii_delete_file.l11 + 0)
.s12:
00:9720 : e6 48 __ INC T3 + 1 
00:9722 : 4c c4 1c JMP $1cc4 
.s8:
00:9725 : b0 ac __ BCS $96d3 ; (uii_delete_file.s5 + 0)
.s13:
00:9727 : a5 47 __ LDA T3 + 0 
00:9729 : 90 d1 __ BCC $96fc ; (uii_delete_file.s6 + 0)
--------------------------------------------------------------------
uii_write_file: ; uii_write_file(u8*,u16)->void
.s4:
00:972b : 18 __ __ CLC
00:972c : a5 13 __ LDA P6 ; (length + 0)
00:972e : 69 04 __ ADC #$04
00:9730 : 85 45 __ STA T1 + 0 
00:9732 : 85 1b __ STA ACCU + 0 
00:9734 : a5 14 __ LDA P7 ; (length + 1)
00:9736 : 69 00 __ ADC #$00
00:9738 : 85 46 __ STA T1 + 1 
00:973a : 85 1c __ STA ACCU + 1 
00:973c : 20 49 28 JSR $2849 
00:973f : a9 00 __ LDA #$00
00:9741 : a8 __ __ TAY
00:9742 : 91 1b __ STA (ACCU + 0),y 
00:9744 : a9 05 __ LDA #$05
00:9746 : c8 __ __ INY
00:9747 : 91 1b __ STA (ACCU + 0),y 
00:9749 : a9 00 __ LDA #$00
00:974b : c8 __ __ INY
00:974c : 91 1b __ STA (ACCU + 0),y 
00:974e : c8 __ __ INY
00:974f : 91 1b __ STA (ACCU + 0),y 
00:9751 : a5 13 __ LDA P6 ; (length + 0)
00:9753 : 05 14 __ ORA P7 ; (length + 1)
00:9755 : f0 31 __ BEQ $9788 ; (uii_write_file.s5 + 0)
.s6:
00:9757 : a5 13 __ LDA P6 ; (length + 0)
00:9759 : 85 43 __ STA T0 + 0 
00:975b : a5 1b __ LDA ACCU + 0 
00:975d : 85 47 __ STA T2 + 0 
00:975f : a5 1c __ LDA ACCU + 1 
00:9761 : 85 48 __ STA T2 + 1 
00:9763 : a6 14 __ LDX P7 ; (length + 1)
.l7:
00:9765 : a0 00 __ LDY #$00
00:9767 : b1 11 __ LDA (P4),y ; (data + 0)
00:9769 : a0 04 __ LDY #$04
00:976b : 91 47 __ STA (T2 + 0),y 
00:976d : e6 47 __ INC T2 + 0 
00:976f : d0 02 __ BNE $9773 ; (uii_write_file.s9 + 0)
.s8:
00:9771 : e6 48 __ INC T2 + 1 
.s9:
00:9773 : e6 11 __ INC P4 ; (data + 0)
00:9775 : d0 02 __ BNE $9779 ; (uii_write_file.s11 + 0)
.s10:
00:9777 : e6 12 __ INC P5 ; (data + 1)
.s11:
00:9779 : 38 __ __ SEC
00:977a : a5 43 __ LDA T0 + 0 
00:977c : e9 01 __ SBC #$01
00:977e : 85 43 __ STA T0 + 0 
00:9780 : b0 01 __ BCS $9783 ; (uii_write_file.s13 + 0)
.s12:
00:9782 : ca __ __ DEX
.s13:
00:9783 : 8a __ __ TXA
00:9784 : 05 43 __ ORA T0 + 0 
00:9786 : d0 dd __ BNE $9765 ; (uii_write_file.l7 + 0)
.s5:
00:9788 : a9 01 __ LDA #$01
00:978a : 8d fe 24 STA $24fe 
00:978d : a5 1b __ LDA ACCU + 0 
00:978f : 85 0d __ STA P0 
00:9791 : a5 1c __ LDA ACCU + 1 
00:9793 : 85 0e __ STA P1 
00:9795 : a5 45 __ LDA T1 + 0 
00:9797 : 85 0f __ STA P2 
00:9799 : a5 46 __ LDA T1 + 1 
00:979b : 85 10 __ STA P3 
00:979d : 20 a6 0f JSR $0fa6 
00:97a0 : 20 41 29 JSR $2941 
00:97a3 : 20 27 10 JSR $1027 
00:97a6 : 20 6c 10 JSR $106c 
00:97a9 : 4c 1e 11 JMP $111e 
--------------------------------------------------------------------
CheckStatus: ; CheckStatus(const u8*)->void
.s1:
00:97ac : 38 __ __ SEC
00:97ad : a5 23 __ LDA SP + 0 
00:97af : e9 09 __ SBC #$09
00:97b1 : 85 23 __ STA SP + 0 
00:97b3 : b0 02 __ BCS $97b7 ; (CheckStatus.s4 + 0)
00:97b5 : c6 24 __ DEC SP + 1 
.s4:
00:97b7 : ad c9 4b LDA $4bc9 ; (uii_status + 0)
00:97ba : c9 30 __ CMP #$30
00:97bc : d0 07 __ BNE $97c5 ; (CheckStatus.s6 + 0)
.s5:
00:97be : ad ca 4b LDA $4bca ; (uii_status + 1)
00:97c1 : c9 30 __ CMP #$30
00:97c3 : f0 43 __ BEQ $9808 ; (CheckStatus.s3 + 0)
.s6:
00:97c5 : a9 14 __ LDA #$14
00:97c7 : a0 05 __ LDY #$05
00:97c9 : 91 23 __ STA (SP + 0),y 
00:97cb : a9 1e __ LDA #$1e
00:97cd : c8 __ __ INY
00:97ce : 91 23 __ STA (SP + 0),y 
00:97d0 : ad fe 7f LDA $7ffe ; (sstack + 6)
00:97d3 : c8 __ __ INY
00:97d4 : 91 23 __ STA (SP + 0),y 
00:97d6 : ad ff 7f LDA $7fff ; (sstack + 7)
00:97d9 : c8 __ __ INY
00:97da : 91 23 __ STA (SP + 0),y 
00:97dc : 20 79 13 JSR $1379 
00:97df : a9 c9 __ LDA #$c9
00:97e1 : a0 07 __ LDY #$07
00:97e3 : 91 23 __ STA (SP + 0),y 
00:97e5 : a9 4b __ LDA #$4b
00:97e7 : c8 __ __ INY
00:97e8 : 91 23 __ STA (SP + 0),y 
00:97ea : a9 27 __ LDA #$27
00:97ec : a0 05 __ LDY #$05
00:97ee : 91 23 __ STA (SP + 0),y 
00:97f0 : a9 1e __ LDA #$1e
00:97f2 : c8 __ __ INY
00:97f3 : 91 23 __ STA (SP + 0),y 
00:97f5 : 20 79 13 JSR $1379 
00:97f8 : 20 40 11 JSR $1140 
00:97fb : a9 34 __ LDA #$34
00:97fd : 8d fc 7f STA $7ffc ; (sstack + 4)
00:9800 : a9 1e __ LDA #$1e
00:9802 : 8d fd 7f STA $7ffd ; (sstack + 5)
00:9805 : 20 30 1a JSR $1a30 
.s3:
00:9808 : 18 __ __ CLC
00:9809 : a5 23 __ LDA SP + 0 
00:980b : 69 09 __ ADC #$09
00:980d : 85 23 __ STA SP + 0 
00:980f : 90 02 __ BCC $9813 ; (CheckStatus.s3 + 11)
00:9811 : e6 24 __ INC SP + 1 
00:9813 : 60 __ __ RTS
--------------------------------------------------------------------
00:9814 : __ __ __ BYT 0a 69 2f 6f 20 45 52 52 4f 52 20 49 4e 20 25 53 : .i/o ERROR IN %S
00:9824 : __ __ __ BYT 2e 0a 00                                        : ...
--------------------------------------------------------------------
00:9827 : __ __ __ BYT 0a 73 54 41 54 55 53 3a 20 25 53 0a 00          : .sTATUS: %S..
--------------------------------------------------------------------
00:9834 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
00:9835 : __ __ __ BYT 57 52 49 54 49 4e 47 20 43 4f 4e 46 49 47 00    : WRITING CONFIG.
--------------------------------------------------------------------
00:9844 : __ __ __ BYT 52 45 41 44 49 4e 47 20 43 4f 4e 46 49 47 00    : READING CONFIG.
--------------------------------------------------------------------
00:9853 : __ __ __ BYT 0a 6f 4c 44 20 43 4f 4e 46 49 47 55 52 41 54 49 : .oLD CONFIGURATI
00:9863 : __ __ __ BYT 4f 4e 20 46 49 4c 45 20 46 4f 52 4d 41 54 2e 00 : ON FILE FORMAT..
--------------------------------------------------------------------
00:9873 : __ __ __ BYT 0a 72 55 4e 20 55 50 47 52 41 44 45 20 54 4f 4f : .rUN UPGRADE TOO
00:9883 : __ __ __ BYT 4c 20 46 49 52 53 54 2e 00                      : L FIRST..
--------------------------------------------------------------------
read_slotsfile: ; read_slotsfile(u8)->void
.s1:
00:988c : a2 06 __ LDX #$06
00:988e : b5 53 __ LDA T1 + 0,x 
00:9890 : 9d f0 7c STA $7cf0,x ; (read_slotsfile@stack + 0)
00:9893 : ca __ __ DEX
00:9894 : 10 f8 __ BPL $988e ; (read_slotsfile.s1 + 2)
00:9896 : 38 __ __ SEC
00:9897 : a5 23 __ LDA SP + 0 
00:9899 : e9 0b __ SBC #$0b
00:989b : 85 23 __ STA SP + 0 
00:989d : b0 02 __ BCS $98a1 ; (read_slotsfile.s4 + 0)
00:989f : c6 24 __ DEC SP + 1 
.s4:
00:98a1 : 20 a1 10 JSR $10a1 
00:98a4 : a9 01 __ LDA #$01
00:98a6 : 85 11 __ STA P4 
00:98a8 : 20 48 2a JSR $2a48 
00:98ab : 20 d4 1b JSR $1bd4 
00:98ae : aa __ __ TAX
00:98af : f0 03 __ BEQ $98b4 ; (read_slotsfile.s5 + 0)
00:98b1 : 4c ab 1f JMP $1fab 
.s5:
00:98b4 : a9 f0 __ LDA #$f0
00:98b6 : 85 11 __ STA P4 
00:98b8 : a9 5d __ LDA #$5d
00:98ba : 85 12 __ STA P5 
00:98bc : 20 79 0f JSR $0f79 
00:98bf : a9 00 __ LDA #$00
00:98c1 : 85 53 __ STA T1 + 0 
00:98c3 : 85 54 __ STA T1 + 1 
00:98c5 : 85 55 __ STA T1 + 2 
.l6:
00:98c7 : 85 56 __ STA T1 + 3 
00:98c9 : ad 1c df LDA $df1c 
00:98cc : 29 80 __ AND #$80
00:98ce : c9 80 __ CMP #$80
00:98d0 : f0 4c __ BEQ $991e ; (read_slotsfile.s9 + 0)
.s7:
00:98d2 : 20 72 1c JSR $1c72 
00:98d5 : 20 bb 23 JSR $23bb 
00:98d8 : ad 9c 4d LDA $4d9c ; (Slot + 0)
00:98db : c9 02 __ CMP #$02
00:98dd : b0 29 __ BCS $9908 ; (read_slotsfile.s3 + 0)
.s8:
00:98df : a9 53 __ LDA #$53
00:98e1 : a0 05 __ LDY #$05
00:98e3 : 91 23 __ STA (SP + 0),y 
00:98e5 : a9 1e __ LDA #$1e
00:98e7 : c8 __ __ INY
00:98e8 : 91 23 __ STA (SP + 0),y 
00:98ea : 20 79 13 JSR $1379 
00:98ed : a9 73 __ LDA #$73
00:98ef : a0 05 __ LDY #$05
00:98f1 : 91 23 __ STA (SP + 0),y 
00:98f3 : a9 1e __ LDA #$1e
00:98f5 : c8 __ __ INY
00:98f6 : 91 23 __ STA (SP + 0),y 
00:98f8 : 20 79 13 JSR $1379 
00:98fb : a9 34 __ LDA #$34
00:98fd : 8d fc 7f STA $7ffc ; (sstack + 4)
00:9900 : a9 1e __ LDA #$1e
00:9902 : 8d fd 7f STA $7ffd ; (sstack + 5)
00:9905 : 20 30 1a JSR $1a30 
.s3:
00:9908 : 18 __ __ CLC
00:9909 : a5 23 __ LDA SP + 0 
00:990b : 69 0b __ ADC #$0b
00:990d : 85 23 __ STA SP + 0 
00:990f : 90 02 __ BCC $9913 ; (read_slotsfile.s3 + 11)
00:9911 : e6 24 __ INC SP + 1 
00:9913 : a2 06 __ LDX #$06
00:9915 : bd f0 7c LDA $7cf0,x ; (read_slotsfile@stack + 0)
00:9918 : 95 53 __ STA T1 + 0,x 
00:991a : ca __ __ DEX
00:991b : 10 f8 __ BPL $9915 ; (read_slotsfile.s3 + 13)
00:991d : 60 __ __ RTS
.s9:
00:991e : a9 00 __ LDA #$00
00:9920 : 8d 5a 49 STA $495a ; (cw + 4)
00:9923 : a5 53 __ LDA T1 + 0 
00:9925 : a0 07 __ LDY #$07
00:9927 : 91 23 __ STA (SP + 0),y 
00:9929 : a5 54 __ LDA T1 + 1 
00:992b : c8 __ __ INY
00:992c : 8c 5b 49 STY $495b ; (cw + 5)
00:992f : 91 23 __ STA (SP + 0),y 
00:9931 : a5 55 __ LDA T1 + 2 
00:9933 : c8 __ __ INY
00:9934 : 91 23 __ STA (SP + 0),y 
00:9936 : a5 56 __ LDA T1 + 3 
00:9938 : c8 __ __ INY
00:9939 : 91 23 __ STA (SP + 0),y 
00:993b : a9 93 __ LDA #$93
00:993d : a0 05 __ LDY #$05
00:993f : 91 23 __ STA (SP + 0),y 
00:9941 : a9 23 __ LDA #$23
00:9943 : c8 __ __ INY
00:9944 : 91 23 __ STA (SP + 0),y 
00:9946 : 20 79 13 JSR $1379 
00:9949 : 20 27 10 JSR $1027 
00:994c : a5 1b __ LDA ACCU + 0 
00:994e : 85 57 __ STA T2 + 0 
00:9950 : a5 1c __ LDA ACCU + 1 
00:9952 : 85 58 __ STA T2 + 1 
00:9954 : 20 1e 11 JSR $111e 
00:9957 : a9 ad __ LDA #$ad
00:9959 : 8d fe 7f STA $7ffe ; (sstack + 6)
00:995c : a9 23 __ LDA #$23
00:995e : 8d ff 7f STA $7fff ; (sstack + 7)
00:9961 : 20 ac 1d JSR $1dac 
00:9964 : a9 c8 __ LDA #$c8
00:9966 : 8d 02 df STA $df02 
00:9969 : a9 49 __ LDA #$49
00:996b : 8d 03 df STA $df03 
00:996e : a5 53 __ LDA T1 + 0 
00:9970 : 8d 04 df STA $df04 
00:9973 : a5 54 __ LDA T1 + 1 
00:9975 : 8d 05 df STA $df05 
00:9978 : a5 55 __ LDA T1 + 2 
00:997a : 8d 06 df STA $df06 
00:997d : a5 57 __ LDA T2 + 0 
00:997f : 8d 07 df STA $df07 
00:9982 : a5 58 __ LDA T2 + 1 
00:9984 : 8d 08 df STA $df08 
00:9987 : a9 00 __ LDA #$00
00:9989 : 8d 0a df STA $df0a 
00:998c : a9 90 __ LDA #$90
00:998e : 8d 01 df STA $df01 
00:9991 : 18 __ __ CLC
00:9992 : a5 57 __ LDA T2 + 0 
00:9994 : 65 53 __ ADC T1 + 0 
00:9996 : 85 53 __ STA T1 + 0 
00:9998 : a5 58 __ LDA T2 + 1 
00:999a : 65 54 __ ADC T1 + 1 
00:999c : 85 54 __ STA T1 + 1 
00:999e : a9 00 __ LDA #$00
00:99a0 : 65 55 __ ADC T1 + 2 
00:99a2 : 85 55 __ STA T1 + 2 
00:99a4 : a9 00 __ LDA #$00
00:99a6 : 65 56 __ ADC T1 + 3 
00:99a8 : 4c c7 1e JMP $1ec7 
.s10:
00:99ab : a9 00 __ LDA #$00
00:99ad : 85 0f __ STA P2 
00:99af : 85 10 __ STA P3 
00:99b1 : a9 38 __ LDA #$38
00:99b3 : 85 11 __ STA P4 
00:99b5 : a9 4d __ LDA #$4d
00:99b7 : 85 0e __ STA P1 
00:99b9 : a9 05 __ LDA #$05
00:99bb : 85 12 __ STA P5 
00:99bd : a9 9c __ LDA #$9c
00:99bf : 85 0d __ STA P0 
00:99c1 : 20 7a 21 JSR $217a 
00:99c4 : a9 00 __ LDA #$00
00:99c6 : 85 59 __ STA T24 + 0 
00:99c8 : 85 52 __ STA T0 + 0 
00:99ca : a9 02 __ LDA #$02
00:99cc : 8d 9c 4d STA $4d9c ; (Slot + 0)
00:99cf : a9 01 __ LDA #$01
00:99d1 : 85 53 __ STA T1 + 0 
.l11:
00:99d3 : a9 9d __ LDA #$9d
00:99d5 : a0 02 __ LDY #$02
00:99d7 : 91 23 __ STA (SP + 0),y 
00:99d9 : a9 4d __ LDA #$4d
00:99db : c8 __ __ INY
00:99dc : 91 23 __ STA (SP + 0),y 
00:99de : a9 96 __ LDA #$96
00:99e0 : c8 __ __ INY
00:99e1 : 91 23 __ STA (SP + 0),y 
00:99e3 : a9 21 __ LDA #$21
00:99e5 : c8 __ __ INY
00:99e6 : 91 23 __ STA (SP + 0),y 
00:99e8 : a5 52 __ LDA T0 + 0 
00:99ea : c8 __ __ INY
00:99eb : 91 23 __ STA (SP + 0),y 
00:99ed : a9 00 __ LDA #$00
00:99ef : c8 __ __ INY
00:99f0 : 91 23 __ STA (SP + 0),y 
00:99f2 : 20 27 14 JSR $1427 
00:99f5 : a9 9d __ LDA #$9d
00:99f7 : a0 02 __ LDY #$02
00:99f9 : 91 23 __ STA (SP + 0),y 
00:99fb : a9 4e __ LDA #$4e
00:99fd : c8 __ __ INY
00:99fe : 91 23 __ STA (SP + 0),y 
00:9a00 : a9 9f __ LDA #$9f
00:9a02 : c8 __ __ INY
00:9a03 : 91 23 __ STA (SP + 0),y 
00:9a05 : a9 21 __ LDA #$21
00:9a07 : c8 __ __ INY
00:9a08 : 91 23 __ STA (SP + 0),y 
00:9a0a : a5 52 __ LDA T0 + 0 
00:9a0c : c8 __ __ INY
00:9a0d : 91 23 __ STA (SP + 0),y 
00:9a0f : a9 00 __ LDA #$00
00:9a11 : c8 __ __ INY
00:9a12 : 91 23 __ STA (SP + 0),y 
00:9a14 : 20 27 14 JSR $1427 
00:9a17 : a9 b2 __ LDA #$b2
00:9a19 : a0 02 __ LDY #$02
00:9a1b : 91 23 __ STA (SP + 0),y 
00:9a1d : a9 4e __ LDA #$4e
00:9a1f : c8 __ __ INY
00:9a20 : 91 23 __ STA (SP + 0),y 
00:9a22 : a9 a8 __ LDA #$a8
00:9a24 : c8 __ __ INY
00:9a25 : 91 23 __ STA (SP + 0),y 
00:9a27 : a9 21 __ LDA #$21
00:9a29 : c8 __ __ INY
00:9a2a : 91 23 __ STA (SP + 0),y 
00:9a2c : a5 52 __ LDA T0 + 0 
00:9a2e : c8 __ __ INY
00:9a2f : 91 23 __ STA (SP + 0),y 
00:9a31 : a9 00 __ LDA #$00
00:9a33 : c8 __ __ INY
00:9a34 : 91 23 __ STA (SP + 0),y 
00:9a36 : 20 27 14 JSR $1427 
00:9a39 : a9 e5 __ LDA #$e5
00:9a3b : a0 02 __ LDY #$02
00:9a3d : 91 23 __ STA (SP + 0),y 
00:9a3f : a9 4e __ LDA #$4e
00:9a41 : c8 __ __ INY
00:9a42 : 91 23 __ STA (SP + 0),y 
00:9a44 : a9 b1 __ LDA #$b1
00:9a46 : c8 __ __ INY
00:9a47 : 91 23 __ STA (SP + 0),y 
00:9a49 : a9 21 __ LDA #$21
00:9a4b : c8 __ __ INY
00:9a4c : 91 23 __ STA (SP + 0),y 
00:9a4e : a5 52 __ LDA T0 + 0 
00:9a50 : c8 __ __ INY
00:9a51 : 91 23 __ STA (SP + 0),y 
00:9a53 : a9 00 __ LDA #$00
00:9a55 : c8 __ __ INY
00:9a56 : 91 23 __ STA (SP + 0),y 
00:9a58 : 20 27 14 JSR $1427 
00:9a5b : a9 35 __ LDA #$35
00:9a5d : a0 02 __ LDY #$02
00:9a5f : 91 23 __ STA (SP + 0),y 
00:9a61 : a9 4f __ LDA #$4f
00:9a63 : c8 __ __ INY
00:9a64 : 91 23 __ STA (SP + 0),y 
00:9a66 : a9 b9 __ LDA #$b9
00:9a68 : c8 __ __ INY
00:9a69 : 91 23 __ STA (SP + 0),y 
00:9a6b : a9 21 __ LDA #$21
00:9a6d : c8 __ __ INY
00:9a6e : 91 23 __ STA (SP + 0),y 
00:9a70 : a5 52 __ LDA T0 + 0 
00:9a72 : c8 __ __ INY
00:9a73 : 91 23 __ STA (SP + 0),y 
00:9a75 : a9 00 __ LDA #$00
00:9a77 : c8 __ __ INY
00:9a78 : 91 23 __ STA (SP + 0),y 
00:9a7a : 20 27 14 JSR $1427 
00:9a7d : a9 68 __ LDA #$68
00:9a7f : a0 02 __ LDY #$02
00:9a81 : 91 23 __ STA (SP + 0),y 
00:9a83 : a9 4f __ LDA #$4f
00:9a85 : c8 __ __ INY
00:9a86 : 91 23 __ STA (SP + 0),y 
00:9a88 : a9 c1 __ LDA #$c1
00:9a8a : c8 __ __ INY
00:9a8b : 91 23 __ STA (SP + 0),y 
00:9a8d : a9 21 __ LDA #$21
00:9a8f : c8 __ __ INY
00:9a90 : 91 23 __ STA (SP + 0),y 
00:9a92 : a5 52 __ LDA T0 + 0 
00:9a94 : c8 __ __ INY
00:9a95 : 91 23 __ STA (SP + 0),y 
00:9a97 : a9 00 __ LDA #$00
00:9a99 : c8 __ __ INY
00:9a9a : 91 23 __ STA (SP + 0),y 
00:9a9c : 20 27 14 JSR $1427 
00:9a9f : a9 6c __ LDA #$6c
00:9aa1 : a0 02 __ LDY #$02
00:9aa3 : 91 23 __ STA (SP + 0),y 
00:9aa5 : a9 50 __ LDA #$50
00:9aa7 : c8 __ __ INY
00:9aa8 : 91 23 __ STA (SP + 0),y 
00:9aaa : a9 cd __ LDA #$cd
00:9aac : c8 __ __ INY
00:9aad : 91 23 __ STA (SP + 0),y 
00:9aaf : a9 21 __ LDA #$21
00:9ab1 : c8 __ __ INY
00:9ab2 : 91 23 __ STA (SP + 0),y 
00:9ab4 : a5 59 __ LDA T24 + 0 
00:9ab6 : 8d 68 50 STA $5068 ; (Slot + 716)
00:9ab9 : 8d 69 50 STA $5069 ; (Slot + 717)
00:9abc : 8d 6a 50 STA $506a ; (Slot + 718)
00:9abf : a5 52 __ LDA T0 + 0 
00:9ac1 : c8 __ __ INY
00:9ac2 : 91 23 __ STA (SP + 0),y 
00:9ac4 : a9 00 __ LDA #$00
00:9ac6 : 8d 6b 50 STA $506b ; (Slot + 719)
00:9ac9 : c8 __ __ INY
00:9aca : 91 23 __ STA (SP + 0),y 
00:9acc : 20 27 14 JSR $1427 
00:9acf : a9 6c __ LDA #$6c
00:9ad1 : a0 02 __ LDY #$02
00:9ad3 : 91 23 __ STA (SP + 0),y 
00:9ad5 : a9 51 __ LDA #$51
00:9ad7 : c8 __ __ INY
00:9ad8 : 91 23 __ STA (SP + 0),y 
00:9ada : a9 da __ LDA #$da
00:9adc : c8 __ __ INY
00:9add : 91 23 __ STA (SP + 0),y 
00:9adf : a9 21 __ LDA #$21
00:9ae1 : c8 __ __ INY
00:9ae2 : 91 23 __ STA (SP + 0),y 
00:9ae4 : a5 52 __ LDA T0 + 0 
00:9ae6 : c8 __ __ INY
00:9ae7 : 91 23 __ STA (SP + 0),y 
00:9ae9 : a9 00 __ LDA #$00
00:9aeb : c8 __ __ INY
00:9aec : 91 23 __ STA (SP + 0),y 
00:9aee : 20 27 14 JSR $1427 
00:9af1 : a9 a0 __ LDA #$a0
00:9af3 : a0 02 __ LDY #$02
00:9af5 : 91 23 __ STA (SP + 0),y 
00:9af7 : a9 51 __ LDA #$51
00:9af9 : c8 __ __ INY
00:9afa : 91 23 __ STA (SP + 0),y 
00:9afc : a9 e7 __ LDA #$e7
00:9afe : c8 __ __ INY
00:9aff : 91 23 __ STA (SP + 0),y 
00:9b01 : a9 21 __ LDA #$21
00:9b03 : c8 __ __ INY
00:9b04 : 91 23 __ STA (SP + 0),y 
00:9b06 : a5 59 __ LDA T24 + 0 
00:9b08 : 8d 9f 51 STA $519f ; (Slot + 1027)
00:9b0b : a5 52 __ LDA T0 + 0 
00:9b0d : c8 __ __ INY
00:9b0e : 91 23 __ STA (SP + 0),y 
00:9b10 : a9 00 __ LDA #$00
00:9b12 : c8 __ __ INY
00:9b13 : 91 23 __ STA (SP + 0),y 
00:9b15 : 20 27 14 JSR $1427 
00:9b18 : a9 a0 __ LDA #$a0
00:9b1a : a0 02 __ LDY #$02
00:9b1c : 91 23 __ STA (SP + 0),y 
00:9b1e : a9 52 __ LDA #$52
00:9b20 : c8 __ __ INY
00:9b21 : 91 23 __ STA (SP + 0),y 
00:9b23 : a9 00 __ LDA #$00
00:9b25 : c8 __ __ INY
00:9b26 : 91 23 __ STA (SP + 0),y 
00:9b28 : a9 22 __ LDA #$22
00:9b2a : c8 __ __ INY
00:9b2b : 91 23 __ STA (SP + 0),y 
00:9b2d : a5 52 __ LDA T0 + 0 
00:9b2f : c8 __ __ INY
00:9b30 : 91 23 __ STA (SP + 0),y 
00:9b32 : a9 00 __ LDA #$00
00:9b34 : c8 __ __ INY
00:9b35 : 91 23 __ STA (SP + 0),y 
00:9b37 : 20 27 14 JSR $1427 
00:9b3a : a9 0d __ LDA #$0d
00:9b3c : a0 05 __ LDY #$05
00:9b3e : 91 23 __ STA (SP + 0),y 
00:9b40 : a9 22 __ LDA #$22
00:9b42 : c8 __ __ INY
00:9b43 : 91 23 __ STA (SP + 0),y 
00:9b45 : a5 59 __ LDA T24 + 0 
00:9b47 : 8d d3 52 STA $52d3 ; (Slot + 1335)
00:9b4a : a5 53 __ LDA T1 + 0 
00:9b4c : c8 __ __ INY
00:9b4d : 91 23 __ STA (SP + 0),y 
00:9b4f : a9 00 __ LDA #$00
00:9b51 : 8d 5a 49 STA $495a ; (cw + 4)
00:9b54 : c8 __ __ INY
00:9b55 : 8c 5b 49 STY $495b ; (cw + 5)
00:9b58 : 91 23 __ STA (SP + 0),y 
00:9b5a : 20 79 13 JSR $1379 
00:9b5d : a5 59 __ LDA T24 + 0 
00:9b5f : 20 1f 22 JSR $221f 
00:9b62 : e6 52 __ INC T0 + 0 
00:9b64 : e6 53 __ INC T1 + 0 
00:9b66 : e6 59 __ INC T24 + 0 
00:9b68 : a5 59 __ LDA T24 + 0 
00:9b6a : c9 12 __ CMP #$12
00:9b6c : b0 03 __ BCS $9b71 ; (read_slotsfile.s12 + 0)
00:9b6e : 4c d3 1f JMP $1fd3 
.s12:
00:9b71 : 20 5c 22 JSR $225c 
00:9b74 : 20 72 1c JSR $1c72 
00:9b77 : 4c 08 1f JMP $1f08 
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
.s4:
00:9b7a : a5 0f __ LDA P2 
00:9b7c : a6 12 __ LDX P5 
00:9b7e : f0 0c __ BEQ $9b8c ; (memset.s4 + 18)
00:9b80 : a0 00 __ LDY #$00
00:9b82 : 91 0d __ STA (P0),y 
00:9b84 : c8 __ __ INY
00:9b85 : d0 fb __ BNE $9b82 ; (memset.s4 + 8)
00:9b87 : e6 0e __ INC P1 
00:9b89 : ca __ __ DEX
00:9b8a : d0 f6 __ BNE $9b82 ; (memset.s4 + 8)
00:9b8c : a4 11 __ LDY P4 
00:9b8e : f0 05 __ BEQ $9b95 ; (memset.s3 + 0)
00:9b90 : 88 __ __ DEY
00:9b91 : 91 0d __ STA (P0),y 
00:9b93 : d0 fb __ BNE $9b90 ; (memset.s4 + 22)
.s3:
00:9b95 : 60 __ __ RTS
--------------------------------------------------------------------
00:9b96 : __ __ __ BYT 70 41 54 48 20 25 32 55 00                      : pATH %2U.
--------------------------------------------------------------------
00:9b9f : __ __ __ BYT 6d 45 4e 55 20 25 32 55 00                      : mENU %2U.
--------------------------------------------------------------------
00:9ba8 : __ __ __ BYT 66 49 4c 45 20 25 32 55 00                      : fILE %2U.
--------------------------------------------------------------------
00:9bb1 : __ __ __ BYT 63 4d 44 20 25 32 55 00                         : cMD %2U.
--------------------------------------------------------------------
00:9bb9 : __ __ __ BYT 72 65 75 20 25 32 55 00                         : reu %2U.
--------------------------------------------------------------------
00:9bc1 : __ __ __ BYT 72 65 75 70 41 54 48 20 25 32 55 00             : reupATH %2U.
--------------------------------------------------------------------
00:9bcd : __ __ __ BYT 69 4d 47 61 70 41 54 48 20 25 32 55 00          : iMGapATH %2U.
--------------------------------------------------------------------
00:9bda : __ __ __ BYT 69 4d 47 61 66 49 4c 45 20 25 32 55 00          : iMGafILE %2U.
--------------------------------------------------------------------
00:9be7 : __ __ __ BYT 69 4d 47 62 70 41 54 48 20 25 32 55 00          : iMGbpATH %2U.
--------------------------------------------------------------------
00:9bf4 : __ __ __ BYT 6f 4e 00                                        : oN.
--------------------------------------------------------------------
00:9bf7 : __ __ __ BYT 6f 46 46 00                                     : oFF.
--------------------------------------------------------------------
00:9bfb : __ __ __ BYT 31 35 34 31 00                                  : 1541.
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
00:9c35 : 20 97 26 JSR $2697 
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
00:9c67 : 20 a1 10 JSR $10a1 
00:9c6a : a9 bd __ LDA #$bd
00:9c6c : 85 11 __ STA P4 
00:9c6e : a9 2a __ LDA #$2a
00:9c70 : 85 12 __ STA P5 
00:9c72 : 20 9b 1c JSR $1c9b 
00:9c75 : a9 06 __ LDA #$06
00:9c77 : 85 11 __ STA P4 
00:9c79 : 20 48 2a JSR $2a48 
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
00:9cb1 : 20 79 13 JSR $1379 
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
00:9d1c : 20 2b 1d JSR $1d2b 
00:9d1f : a9 85 __ LDA #$85
00:9d21 : 8d fe 7f STA $7ffe ; (sstack + 6)
00:9d24 : a9 23 __ LDA #$23
00:9d26 : 8d ff 7f STA $7fff ; (sstack + 7)
00:9d29 : 20 ac 1d JSR $1dac 
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
00:9d5c : 20 72 1c JSR $1c72 
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
00:9d93 : __ __ __ BYT 72 45 41 44 49 4e 47 20 53 4c 4f 54 20 44 41 54 : rEADING SLOT DAT
00:9da3 : __ __ __ BYT 41 20 54 4f 20 25 4c 55 2e 00                   : A TO %LU..
--------------------------------------------------------------------
00:9dad : __ __ __ BYT 52 45 41 44 49 4e 47 20 53 4c 4f 54 53 00       : READING SLOTS.
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
00:9dee : 8d fe 24 STA $24fe 
00:9df1 : a9 02 __ LDA #$02
00:9df3 : 85 0f __ STA P2 
00:9df5 : a9 29 __ LDA #$29
00:9df7 : 8d f7 7f STA $7ff7 ; (cmd + 1)
00:9dfa : a9 f6 __ LDA #$f6
00:9dfc : 85 0d __ STA P0 
00:9dfe : a9 7f __ LDA #$7f
00:9e00 : 85 0e __ STA P1 
00:9e02 : 20 a6 0f JSR $0fa6 
00:9e05 : 20 27 10 JSR $1027 
00:9e08 : 20 6c 10 JSR $106c 
00:9e0b : 20 1e 11 JSR $111e 
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
00:9eed : __ __ __ BYT 31 35 37 31 00                                  : 1571.
--------------------------------------------------------------------
00:9ef2 : __ __ __ BYT 31 35 38 31 00                                  : 1581.
--------------------------------------------------------------------
00:9ef7 : __ __ __ BYT 79 45 53 00                                     : yES.
--------------------------------------------------------------------
00:9efb : __ __ __ BYT 6e 4f 00                                        : nO.
--------------------------------------------------------------------
uii_target:
00:9efe : __ __ __ BYT 01                                              : .
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
00:9faf : 20 30 1a JSR $1a30 
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
00:a061 : __ __ __ BYT 61 43 54 49 56 45 20 69 65 63 20 69 64 53 3a 20 : aCTIVE iec idS: 
00:a071 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
00:a072 : __ __ __ BYT 25 30 32 44 20 00                               : %02D .
--------------------------------------------------------------------
00:a078 : __ __ __ BYT 62 41 43 4b 20 49 4e 20 4d 41 49 4e 20 72 61 6d : bACK IN MAIN ram
00:a088 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
00:a089 : __ __ __ BYT 67 4f 49 4e 47 20 54 4f 20 45 58 49 54 00       : gOING TO EXIT.
--------------------------------------------------------------------
mul16by8: ; mul16by8
00:a097 : 4a __ __ LSR
00:a098 : f0 2e __ BEQ $a0c8 ; (mul16by8 + 49)
00:a09a : a2 00 __ LDX #$00
00:a09c : a0 00 __ LDY #$00
00:a09e : 90 13 __ BCC $a0b3 ; (mul16by8 + 28)
00:a0a0 : a4 1b __ LDY ACCU + 0 
00:a0a2 : a6 1c __ LDX ACCU + 1 
00:a0a4 : b0 0d __ BCS $a0b3 ; (mul16by8 + 28)
00:a0a6 : 85 02 __ STA $02 
00:a0a8 : 18 __ __ CLC
00:a0a9 : 98 __ __ TYA
00:a0aa : 65 1b __ ADC ACCU + 0 
00:a0ac : a8 __ __ TAY
00:a0ad : 8a __ __ TXA
00:a0ae : 65 1c __ ADC ACCU + 1 
00:a0b0 : aa __ __ TAX
00:a0b1 : a5 02 __ LDA $02 
00:a0b3 : 06 1b __ ASL ACCU + 0 
00:a0b5 : 26 1c __ ROL ACCU + 1 
00:a0b7 : 4a __ __ LSR
00:a0b8 : 90 f9 __ BCC $a0b3 ; (mul16by8 + 28)
00:a0ba : d0 ea __ BNE $a0a6 ; (mul16by8 + 15)
00:a0bc : 18 __ __ CLC
00:a0bd : 98 __ __ TYA
00:a0be : 65 1b __ ADC ACCU + 0 
00:a0c0 : 85 1b __ STA ACCU + 0 
00:a0c2 : 8a __ __ TXA
00:a0c3 : 65 1c __ ADC ACCU + 1 
00:a0c5 : 85 1c __ STA ACCU + 1 
00:a0c7 : 60 __ __ RTS
00:a0c8 : b0 04 __ BCS $a0ce ; (mul16by8 + 55)
00:a0ca : 85 1b __ STA ACCU + 0 
00:a0cc : 85 1c __ STA ACCU + 1 
00:a0ce : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
00:a0cf : a5 1c __ LDA ACCU + 1 
00:a0d1 : d0 31 __ BNE $a104 ; (divmod + 53)
00:a0d3 : a5 04 __ LDA WORK + 1 
00:a0d5 : d0 1e __ BNE $a0f5 ; (divmod + 38)
00:a0d7 : 85 06 __ STA WORK + 3 
00:a0d9 : a2 04 __ LDX #$04
00:a0db : 06 1b __ ASL ACCU + 0 
00:a0dd : 2a __ __ ROL
00:a0de : c5 03 __ CMP WORK + 0 
00:a0e0 : 90 02 __ BCC $a0e4 ; (divmod + 21)
00:a0e2 : e5 03 __ SBC WORK + 0 
00:a0e4 : 26 1b __ ROL ACCU + 0 
00:a0e6 : 2a __ __ ROL
00:a0e7 : c5 03 __ CMP WORK + 0 
00:a0e9 : 90 02 __ BCC $a0ed ; (divmod + 30)
00:a0eb : e5 03 __ SBC WORK + 0 
00:a0ed : 26 1b __ ROL ACCU + 0 
00:a0ef : ca __ __ DEX
00:a0f0 : d0 eb __ BNE $a0dd ; (divmod + 14)
00:a0f2 : 85 05 __ STA WORK + 2 
00:a0f4 : 60 __ __ RTS
00:a0f5 : a5 1b __ LDA ACCU + 0 
00:a0f7 : 85 05 __ STA WORK + 2 
00:a0f9 : a5 1c __ LDA ACCU + 1 
00:a0fb : 85 06 __ STA WORK + 3 
00:a0fd : a9 00 __ LDA #$00
00:a0ff : 85 1b __ STA ACCU + 0 
00:a101 : 85 1c __ STA ACCU + 1 
00:a103 : 60 __ __ RTS
00:a104 : a5 04 __ LDA WORK + 1 
00:a106 : d0 1f __ BNE $a127 ; (divmod + 88)
00:a108 : a5 03 __ LDA WORK + 0 
00:a10a : 30 1b __ BMI $a127 ; (divmod + 88)
00:a10c : a9 00 __ LDA #$00
00:a10e : 85 06 __ STA WORK + 3 
00:a110 : a2 10 __ LDX #$10
00:a112 : 06 1b __ ASL ACCU + 0 
00:a114 : 26 1c __ ROL ACCU + 1 
00:a116 : 2a __ __ ROL
00:a117 : c5 03 __ CMP WORK + 0 
00:a119 : 90 02 __ BCC $a11d ; (divmod + 78)
00:a11b : e5 03 __ SBC WORK + 0 
00:a11d : 26 1b __ ROL ACCU + 0 
00:a11f : 26 1c __ ROL ACCU + 1 
00:a121 : ca __ __ DEX
00:a122 : d0 f2 __ BNE $a116 ; (divmod + 71)
00:a124 : 85 05 __ STA WORK + 2 
00:a126 : 60 __ __ RTS
00:a127 : a9 00 __ LDA #$00
00:a129 : 85 05 __ STA WORK + 2 
00:a12b : 85 06 __ STA WORK + 3 
00:a12d : 84 02 __ STY $02 
00:a12f : a0 10 __ LDY #$10
00:a131 : 18 __ __ CLC
00:a132 : 26 1b __ ROL ACCU + 0 
00:a134 : 26 1c __ ROL ACCU + 1 
00:a136 : 26 05 __ ROL WORK + 2 
00:a138 : 26 06 __ ROL WORK + 3 
00:a13a : 38 __ __ SEC
00:a13b : a5 05 __ LDA WORK + 2 
00:a13d : e5 03 __ SBC WORK + 0 
00:a13f : aa __ __ TAX
00:a140 : a5 06 __ LDA WORK + 3 
00:a142 : e5 04 __ SBC WORK + 1 
00:a144 : 90 04 __ BCC $a14a ; (divmod + 123)
00:a146 : 86 05 __ STX WORK + 2 
00:a148 : 85 06 __ STA WORK + 3 
00:a14a : 88 __ __ DEY
00:a14b : d0 e5 __ BNE $a132 ; (divmod + 99)
00:a14d : 26 1b __ ROL ACCU + 0 
00:a14f : 26 1c __ ROL ACCU + 1 
00:a151 : a4 02 __ LDY $02 
00:a153 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
00:a172 : 84 02 __ STY $02 
00:a174 : a0 20 __ LDY #$20
00:a176 : a9 00 __ LDA #$00
00:a178 : 85 07 __ STA WORK + 4 
00:a17a : 85 08 __ STA WORK + 5 
00:a17c : 85 09 __ STA WORK + 6 
00:a17e : 85 0a __ STA WORK + 7 
00:a180 : a5 05 __ LDA WORK + 2 
00:a182 : 05 06 __ ORA WORK + 3 
00:a184 : d0 78 __ BNE $a1fe ; (divmod32 + 140)
00:a186 : a5 04 __ LDA WORK + 1 
00:a188 : d0 27 __ BNE $a1b1 ; (divmod32 + 63)
00:a18a : 18 __ __ CLC
00:a18b : 26 1b __ ROL ACCU + 0 
00:a18d : 26 1c __ ROL ACCU + 1 
00:a18f : 26 1d __ ROL ACCU + 2 
00:a191 : 26 1e __ ROL ACCU + 3 
00:a193 : 2a __ __ ROL
00:a194 : 90 05 __ BCC $a19b ; (divmod32 + 41)
00:a196 : e5 03 __ SBC WORK + 0 
00:a198 : 38 __ __ SEC
00:a199 : b0 06 __ BCS $a1a1 ; (divmod32 + 47)
00:a19b : c5 03 __ CMP WORK + 0 
00:a19d : 90 02 __ BCC $a1a1 ; (divmod32 + 47)
00:a19f : e5 03 __ SBC WORK + 0 
00:a1a1 : 88 __ __ DEY
00:a1a2 : d0 e7 __ BNE $a18b ; (divmod32 + 25)
00:a1a4 : 85 07 __ STA WORK + 4 
00:a1a6 : 26 1b __ ROL ACCU + 0 
00:a1a8 : 26 1c __ ROL ACCU + 1 
00:a1aa : 26 1d __ ROL ACCU + 2 
00:a1ac : 26 1e __ ROL ACCU + 3 
00:a1ae : a4 02 __ LDY $02 
00:a1b0 : 60 __ __ RTS
00:a1b1 : a5 1e __ LDA ACCU + 3 
00:a1b3 : d0 10 __ BNE $a1c5 ; (divmod32 + 83)
00:a1b5 : a6 1d __ LDX ACCU + 2 
00:a1b7 : 86 1e __ STX ACCU + 3 
00:a1b9 : a6 1c __ LDX ACCU + 1 
00:a1bb : 86 1d __ STX ACCU + 2 
00:a1bd : a6 1b __ LDX ACCU + 0 
00:a1bf : 86 1c __ STX ACCU + 1 
00:a1c1 : 85 1b __ STA ACCU + 0 
00:a1c3 : a0 18 __ LDY #$18
00:a1c5 : 18 __ __ CLC
00:a1c6 : 26 1b __ ROL ACCU + 0 
00:a1c8 : 26 1c __ ROL ACCU + 1 
00:a1ca : 26 1d __ ROL ACCU + 2 
00:a1cc : 26 1e __ ROL ACCU + 3 
00:a1ce : 26 07 __ ROL WORK + 4 
00:a1d0 : 26 08 __ ROL WORK + 5 
00:a1d2 : 90 0c __ BCC $a1e0 ; (divmod32 + 110)
00:a1d4 : a5 07 __ LDA WORK + 4 
00:a1d6 : e5 03 __ SBC WORK + 0 
00:a1d8 : aa __ __ TAX
00:a1d9 : a5 08 __ LDA WORK + 5 
00:a1db : e5 04 __ SBC WORK + 1 
00:a1dd : 38 __ __ SEC
00:a1de : b0 0c __ BCS $a1ec ; (divmod32 + 122)
00:a1e0 : 38 __ __ SEC
00:a1e1 : a5 07 __ LDA WORK + 4 
00:a1e3 : e5 03 __ SBC WORK + 0 
00:a1e5 : aa __ __ TAX
00:a1e6 : a5 08 __ LDA WORK + 5 
00:a1e8 : e5 04 __ SBC WORK + 1 
00:a1ea : 90 04 __ BCC $a1f0 ; (divmod32 + 126)
00:a1ec : 86 07 __ STX WORK + 4 
00:a1ee : 85 08 __ STA WORK + 5 
00:a1f0 : 88 __ __ DEY
00:a1f1 : d0 d3 __ BNE $a1c6 ; (divmod32 + 84)
00:a1f3 : 26 1b __ ROL ACCU + 0 
00:a1f5 : 26 1c __ ROL ACCU + 1 
00:a1f7 : 26 1d __ ROL ACCU + 2 
00:a1f9 : 26 1e __ ROL ACCU + 3 
00:a1fb : a4 02 __ LDY $02 
00:a1fd : 60 __ __ RTS
00:a1fe : a0 10 __ LDY #$10
00:a200 : a5 1e __ LDA ACCU + 3 
00:a202 : 85 08 __ STA WORK + 5 
00:a204 : a5 1d __ LDA ACCU + 2 
00:a206 : 85 07 __ STA WORK + 4 
00:a208 : a9 00 __ LDA #$00
00:a20a : 85 1d __ STA ACCU + 2 
00:a20c : 85 1e __ STA ACCU + 3 
00:a20e : 18 __ __ CLC
00:a20f : 26 1b __ ROL ACCU + 0 
00:a211 : 26 1c __ ROL ACCU + 1 
00:a213 : 26 07 __ ROL WORK + 4 
00:a215 : 26 08 __ ROL WORK + 5 
00:a217 : 26 09 __ ROL WORK + 6 
00:a219 : 26 0a __ ROL WORK + 7 
00:a21b : a5 07 __ LDA WORK + 4 
00:a21d : c5 03 __ CMP WORK + 0 
00:a21f : a5 08 __ LDA WORK + 5 
00:a221 : e5 04 __ SBC WORK + 1 
00:a223 : a5 09 __ LDA WORK + 6 
00:a225 : e5 05 __ SBC WORK + 2 
00:a227 : aa __ __ TAX
00:a228 : a5 0a __ LDA WORK + 7 
00:a22a : e5 06 __ SBC WORK + 3 
00:a22c : 90 11 __ BCC $a23f ; (divmod32 + 205)
00:a22e : 86 09 __ STX WORK + 6 
00:a230 : 85 0a __ STA WORK + 7 
00:a232 : a5 07 __ LDA WORK + 4 
00:a234 : e5 03 __ SBC WORK + 0 
00:a236 : 85 07 __ STA WORK + 4 
00:a238 : a5 08 __ LDA WORK + 5 
00:a23a : e5 04 __ SBC WORK + 1 
00:a23c : 85 08 __ STA WORK + 5 
00:a23e : 38 __ __ SEC
00:a23f : 88 __ __ DEY
00:a240 : d0 cd __ BNE $a20f ; (divmod32 + 157)
00:a242 : 26 1b __ ROL ACCU + 0 
00:a244 : 26 1c __ ROL ACCU + 1 
00:a246 : a4 02 __ LDY $02 
00:a248 : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
00:a249 : 18 __ __ CLC
00:a24a : a5 1b __ LDA ACCU + 0 
00:a24c : 69 0d __ ADC #$0d
00:a24e : 29 fc __ AND #$fc
00:a250 : 85 03 __ STA WORK + 0 
00:a252 : a5 1c __ LDA ACCU + 1 
00:a254 : 69 00 __ ADC #$00
00:a256 : 85 04 __ STA WORK + 1 
00:a258 : ad fd 52 LDA $52fd ; (HeapNode + 2)
00:a25b : d0 26 __ BNE $a283 ; (crt_malloc + 58)
00:a25d : a9 00 __ LDA #$00
00:a25f : 8d 02 53 STA $5302 
00:a262 : 8d 03 53 STA $5303 
00:a265 : ee fd 52 INC $52fd ; (HeapNode + 2)
00:a268 : a9 00 __ LDA #$00
00:a26a : 09 02 __ ORA #$02
00:a26c : 8d fb 52 STA $52fb ; (HeapNode + 0)
00:a26f : a9 53 __ LDA #$53
00:a271 : 8d fc 52 STA $52fc ; (HeapNode + 1)
00:a274 : 38 __ __ SEC
00:a275 : a9 00 __ LDA #$00
00:a277 : e9 02 __ SBC #$02
00:a279 : 8d 04 53 STA $5304 
00:a27c : a9 70 __ LDA #$70
00:a27e : e9 00 __ SBC #$00
00:a280 : 8d 05 53 STA $5305 
00:a283 : a9 fb __ LDA #$fb
00:a285 : a2 52 __ LDX #$52
00:a287 : 85 1d __ STA ACCU + 2 
00:a289 : 86 1e __ STX ACCU + 3 
00:a28b : 18 __ __ CLC
00:a28c : a0 00 __ LDY #$00
00:a28e : b1 1d __ LDA (ACCU + 2),y 
00:a290 : 85 1b __ STA ACCU + 0 
00:a292 : 65 03 __ ADC WORK + 0 
00:a294 : 85 05 __ STA WORK + 2 
00:a296 : c8 __ __ INY
00:a297 : b1 1d __ LDA (ACCU + 2),y 
00:a299 : 85 1c __ STA ACCU + 1 
00:a29b : f0 20 __ BEQ $a2bd ; (crt_malloc + 116)
00:a29d : 65 04 __ ADC WORK + 1 
00:a29f : 85 06 __ STA WORK + 3 
00:a2a1 : b0 14 __ BCS $a2b7 ; (crt_malloc + 110)
00:a2a3 : a0 02 __ LDY #$02
00:a2a5 : b1 1b __ LDA (ACCU + 0),y 
00:a2a7 : c5 05 __ CMP WORK + 2 
00:a2a9 : c8 __ __ INY
00:a2aa : b1 1b __ LDA (ACCU + 0),y 
00:a2ac : e5 06 __ SBC WORK + 3 
00:a2ae : b0 0f __ BCS $a2bf ; (crt_malloc + 118)
00:a2b0 : a5 1b __ LDA ACCU + 0 
00:a2b2 : a6 1c __ LDX ACCU + 1 
00:a2b4 : 4c 87 28 JMP $2887 
00:a2b7 : a9 00 __ LDA #$00
00:a2b9 : 85 1b __ STA ACCU + 0 
00:a2bb : 85 1c __ STA ACCU + 1 
00:a2bd : 02 __ __ INV
00:a2be : 60 __ __ RTS
00:a2bf : a5 05 __ LDA WORK + 2 
00:a2c1 : 85 07 __ STA WORK + 4 
00:a2c3 : a5 06 __ LDA WORK + 3 
00:a2c5 : 85 08 __ STA WORK + 5 
00:a2c7 : a0 02 __ LDY #$02
00:a2c9 : a5 07 __ LDA WORK + 4 
00:a2cb : d1 1b __ CMP (ACCU + 0),y 
00:a2cd : d0 15 __ BNE $a2e4 ; (crt_malloc + 155)
00:a2cf : c8 __ __ INY
00:a2d0 : a5 08 __ LDA WORK + 5 
00:a2d2 : d1 1b __ CMP (ACCU + 0),y 
00:a2d4 : d0 0e __ BNE $a2e4 ; (crt_malloc + 155)
00:a2d6 : a0 00 __ LDY #$00
00:a2d8 : b1 1b __ LDA (ACCU + 0),y 
00:a2da : 91 1d __ STA (ACCU + 2),y 
00:a2dc : c8 __ __ INY
00:a2dd : b1 1b __ LDA (ACCU + 0),y 
00:a2df : 91 1d __ STA (ACCU + 2),y 
00:a2e1 : 4c 01 29 JMP $2901 
00:a2e4 : a0 00 __ LDY #$00
00:a2e6 : b1 1b __ LDA (ACCU + 0),y 
00:a2e8 : 91 07 __ STA (WORK + 4),y 
00:a2ea : a5 07 __ LDA WORK + 4 
00:a2ec : 91 1d __ STA (ACCU + 2),y 
00:a2ee : c8 __ __ INY
00:a2ef : b1 1b __ LDA (ACCU + 0),y 
00:a2f1 : 91 07 __ STA (WORK + 4),y 
00:a2f3 : a5 08 __ LDA WORK + 5 
00:a2f5 : 91 1d __ STA (ACCU + 2),y 
00:a2f7 : c8 __ __ INY
00:a2f8 : b1 1b __ LDA (ACCU + 0),y 
00:a2fa : 91 07 __ STA (WORK + 4),y 
00:a2fc : c8 __ __ INY
00:a2fd : b1 1b __ LDA (ACCU + 0),y 
00:a2ff : 91 07 __ STA (WORK + 4),y 
00:a301 : a0 00 __ LDY #$00
00:a303 : a5 05 __ LDA WORK + 2 
00:a305 : 91 1b __ STA (ACCU + 0),y 
00:a307 : c8 __ __ INY
00:a308 : a5 06 __ LDA WORK + 3 
00:a30a : 91 1b __ STA (ACCU + 0),y 
00:a30c : a0 02 __ LDY #$02
00:a30e : a9 bd __ LDA #$bd
00:a310 : 91 1b __ STA (ACCU + 0),y 
00:a312 : c8 __ __ INY
00:a313 : 91 1b __ STA (ACCU + 0),y 
00:a315 : c8 __ __ INY
00:a316 : 91 1b __ STA (ACCU + 0),y 
00:a318 : c8 __ __ INY
00:a319 : 91 1b __ STA (ACCU + 0),y 
00:a31b : 38 __ __ SEC
00:a31c : a5 05 __ LDA WORK + 2 
00:a31e : e9 04 __ SBC #$04
00:a320 : 85 05 __ STA WORK + 2 
00:a322 : b0 02 __ BCS $a326 ; (crt_malloc + 221)
00:a324 : c6 06 __ DEC WORK + 3 
00:a326 : a9 be __ LDA #$be
00:a328 : a0 00 __ LDY #$00
00:a32a : 91 05 __ STA (WORK + 2),y 
00:a32c : c8 __ __ INY
00:a32d : 91 05 __ STA (WORK + 2),y 
00:a32f : c8 __ __ INY
00:a330 : 91 05 __ STA (WORK + 2),y 
00:a332 : c8 __ __ INY
00:a333 : 91 05 __ STA (WORK + 2),y 
00:a335 : 18 __ __ CLC
00:a336 : a5 1b __ LDA ACCU + 0 
00:a338 : 69 06 __ ADC #$06
00:a33a : 85 1b __ STA ACCU + 0 
00:a33c : 90 02 __ BCC $a340 ; (crt_malloc + 247)
00:a33e : e6 1c __ INC ACCU + 1 
00:a340 : 60 __ __ RTS
--------------------------------------------------------------------
crt_free@proxy: ; crt_free@proxy
00:a341 : a5 0d __ LDA P0 
00:a343 : 85 1b __ STA ACCU + 0 
00:a345 : a5 0e __ LDA P1 
00:a347 : 85 1c __ STA ACCU + 1 
--------------------------------------------------------------------
crt_free: ; crt_free
00:a349 : a5 1b __ LDA ACCU + 0 
00:a34b : 05 1c __ ORA ACCU + 1 
00:a34d : d0 01 __ BNE $a350 ; (crt_free + 7)
00:a34f : 60 __ __ RTS
00:a350 : 38 __ __ SEC
00:a351 : a5 1b __ LDA ACCU + 0 
00:a353 : 29 03 __ AND #$03
00:a355 : d0 56 __ BNE $a3ad ; (crt_free + 100)
00:a357 : a5 1b __ LDA ACCU + 0 
00:a359 : e9 06 __ SBC #$06
00:a35b : 85 1b __ STA ACCU + 0 
00:a35d : b0 02 __ BCS $a361 ; (crt_free + 24)
00:a35f : c6 1c __ DEC ACCU + 1 
00:a361 : a0 02 __ LDY #$02
00:a363 : a9 bd __ LDA #$bd
00:a365 : d1 1b __ CMP (ACCU + 0),y 
00:a367 : d0 44 __ BNE $a3ad ; (crt_free + 100)
00:a369 : c8 __ __ INY
00:a36a : d1 1b __ CMP (ACCU + 0),y 
00:a36c : d0 3f __ BNE $a3ad ; (crt_free + 100)
00:a36e : c8 __ __ INY
00:a36f : d1 1b __ CMP (ACCU + 0),y 
00:a371 : d0 3a __ BNE $a3ad ; (crt_free + 100)
00:a373 : c8 __ __ INY
00:a374 : d1 1b __ CMP (ACCU + 0),y 
00:a376 : d0 35 __ BNE $a3ad ; (crt_free + 100)
00:a378 : a0 00 __ LDY #$00
00:a37a : 38 __ __ SEC
00:a37b : b1 1b __ LDA (ACCU + 0),y 
00:a37d : e9 04 __ SBC #$04
00:a37f : 85 03 __ STA WORK + 0 
00:a381 : c8 __ __ INY
00:a382 : b1 1b __ LDA (ACCU + 0),y 
00:a384 : e9 00 __ SBC #$00
00:a386 : 85 04 __ STA WORK + 1 
00:a388 : a0 00 __ LDY #$00
00:a38a : a9 be __ LDA #$be
00:a38c : d1 03 __ CMP (WORK + 0),y 
00:a38e : d0 1d __ BNE $a3ad ; (crt_free + 100)
00:a390 : c8 __ __ INY
00:a391 : d1 03 __ CMP (WORK + 0),y 
00:a393 : d0 18 __ BNE $a3ad ; (crt_free + 100)
00:a395 : c8 __ __ INY
00:a396 : d1 03 __ CMP (WORK + 0),y 
00:a398 : d0 13 __ BNE $a3ad ; (crt_free + 100)
00:a39a : c8 __ __ INY
00:a39b : d1 03 __ CMP (WORK + 0),y 
00:a39d : d0 0e __ BNE $a3ad ; (crt_free + 100)
00:a39f : a5 1c __ LDA ACCU + 1 
00:a3a1 : a6 1b __ LDX ACCU + 0 
00:a3a3 : c9 53 __ CMP #$53
00:a3a5 : 90 06 __ BCC $a3ad ; (crt_free + 100)
00:a3a7 : d0 05 __ BNE $a3ae ; (crt_free + 101)
00:a3a9 : e0 00 __ CPX #$00
00:a3ab : b0 01 __ BCS $a3ae ; (crt_free + 101)
00:a3ad : 02 __ __ INV
00:a3ae : c9 70 __ CMP #$70
00:a3b0 : 90 06 __ BCC $a3b8 ; (crt_free + 111)
00:a3b2 : d0 f9 __ BNE $a3ad ; (crt_free + 100)
00:a3b4 : e0 00 __ CPX #$00
00:a3b6 : b0 f5 __ BCS $a3ad ; (crt_free + 100)
00:a3b8 : a0 02 __ LDY #$02
00:a3ba : a9 bf __ LDA #$bf
00:a3bc : 91 1b __ STA (ACCU + 0),y 
00:a3be : c8 __ __ INY
00:a3bf : 91 1b __ STA (ACCU + 0),y 
00:a3c1 : a0 00 __ LDY #$00
00:a3c3 : b1 1b __ LDA (ACCU + 0),y 
00:a3c5 : 85 1d __ STA ACCU + 2 
00:a3c7 : c8 __ __ INY
00:a3c8 : b1 1b __ LDA (ACCU + 0),y 
00:a3ca : 85 1e __ STA ACCU + 3 
00:a3cc : a9 fb __ LDA #$fb
00:a3ce : a2 52 __ LDX #$52
00:a3d0 : 85 05 __ STA WORK + 2 
00:a3d2 : 86 06 __ STX WORK + 3 
00:a3d4 : a0 01 __ LDY #$01
00:a3d6 : b1 05 __ LDA (WORK + 2),y 
00:a3d8 : f0 28 __ BEQ $a402 ; (crt_free + 185)
00:a3da : aa __ __ TAX
00:a3db : 88 __ __ DEY
00:a3dc : b1 05 __ LDA (WORK + 2),y 
00:a3de : e4 1e __ CPX ACCU + 3 
00:a3e0 : 90 ee __ BCC $a3d0 ; (crt_free + 135)
00:a3e2 : d0 1e __ BNE $a402 ; (crt_free + 185)
00:a3e4 : c5 1d __ CMP ACCU + 2 
00:a3e6 : 90 e8 __ BCC $a3d0 ; (crt_free + 135)
00:a3e8 : d0 18 __ BNE $a402 ; (crt_free + 185)
00:a3ea : a0 00 __ LDY #$00
00:a3ec : b1 1d __ LDA (ACCU + 2),y 
00:a3ee : 91 1b __ STA (ACCU + 0),y 
00:a3f0 : c8 __ __ INY
00:a3f1 : b1 1d __ LDA (ACCU + 2),y 
00:a3f3 : 91 1b __ STA (ACCU + 0),y 
00:a3f5 : c8 __ __ INY
00:a3f6 : b1 1d __ LDA (ACCU + 2),y 
00:a3f8 : 91 1b __ STA (ACCU + 0),y 
00:a3fa : c8 __ __ INY
00:a3fb : b1 1d __ LDA (ACCU + 2),y 
00:a3fd : 91 1b __ STA (ACCU + 0),y 
00:a3ff : 4c 17 2a JMP $2a17 
00:a402 : a0 00 __ LDY #$00
00:a404 : b1 05 __ LDA (WORK + 2),y 
00:a406 : 91 1b __ STA (ACCU + 0),y 
00:a408 : c8 __ __ INY
00:a409 : b1 05 __ LDA (WORK + 2),y 
00:a40b : 91 1b __ STA (ACCU + 0),y 
00:a40d : c8 __ __ INY
00:a40e : a5 1d __ LDA ACCU + 2 
00:a410 : 91 1b __ STA (ACCU + 0),y 
00:a412 : c8 __ __ INY
00:a413 : a5 1e __ LDA ACCU + 3 
00:a415 : 91 1b __ STA (ACCU + 0),y 
00:a417 : a0 02 __ LDY #$02
00:a419 : b1 05 __ LDA (WORK + 2),y 
00:a41b : c5 1b __ CMP ACCU + 0 
00:a41d : d0 1d __ BNE $a43c ; (crt_free + 243)
00:a41f : c8 __ __ INY
00:a420 : b1 05 __ LDA (WORK + 2),y 
00:a422 : c5 1c __ CMP ACCU + 1 
00:a424 : d0 16 __ BNE $a43c ; (crt_free + 243)
00:a426 : a0 00 __ LDY #$00
00:a428 : b1 1b __ LDA (ACCU + 0),y 
00:a42a : 91 05 __ STA (WORK + 2),y 
00:a42c : c8 __ __ INY
00:a42d : b1 1b __ LDA (ACCU + 0),y 
00:a42f : 91 05 __ STA (WORK + 2),y 
00:a431 : c8 __ __ INY
00:a432 : b1 1b __ LDA (ACCU + 0),y 
00:a434 : 91 05 __ STA (WORK + 2),y 
00:a436 : c8 __ __ INY
00:a437 : b1 1b __ LDA (ACCU + 0),y 
00:a439 : 91 05 __ STA (WORK + 2),y 
00:a43b : 60 __ __ RTS
00:a43c : a0 00 __ LDY #$00
00:a43e : a5 1b __ LDA ACCU + 0 
00:a440 : 91 05 __ STA (WORK + 2),y 
00:a442 : c8 __ __ INY
00:a443 : a5 1c __ LDA ACCU + 1 
00:a445 : 91 05 __ STA (WORK + 2),y 
00:a447 : 60 __ __ RTS
--------------------------------------------------------------------
uii_open_file@proxy: ; uii_open_file@proxy
00:a448 : a9 bd __ LDA #$bd
00:a44a : 85 12 __ STA P5 
00:a44c : a9 2a __ LDA #$2a
00:a44e : 85 13 __ STA P6 
00:a450 : 4c 38 1b JMP $1b38 
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
00:a453 : a5 12 __ LDA P5 
00:a455 : 85 0e __ STA P1 
00:a457 : 4c 27 0f JMP $0f27 
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
00:a45a : a5 13 __ LDA P6 
00:a45c : 85 0e __ STA P1 
00:a45e : 4c 27 0f JMP $0f27 
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
00:a461 : a9 2a __ LDA #$2a
00:a463 : 85 0e __ STA P1 
00:a465 : 4c 27 0f JMP $0f27 
--------------------------------------------------------------------
mul40:
00:a468 : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
00:a478 : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
00:a488 : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
00:a498 : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
p2smap:
00:a49a : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
p2smap:
00:a4a2 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
configpath:
00:a4aa : __ __ __ BYT 2f 55 53 42 2a 2f 00 00                         : /USB*/..
--------------------------------------------------------------------
configfilename:
00:a4b2 : __ __ __ BYT 44 4d 42 43 46 47 2e 43 46 47 00                : DMBCFG.CFG.
--------------------------------------------------------------------
slotfilename:
00:a4bd : __ __ __ BYT 44 4d 42 53 4c 54 2e 43 46 47 00                : DMBSLT.CFG.
--------------------------------------------------------------------
print1: ; print1()->void
.s4:
01:8000 : a9 0e __ LDA #$0e
01:8002 : 85 0d __ STA P0 
01:8004 : a9 80 __ LDA #$80
01:8006 : 85 0e __ STA P1 
01:8008 : 20 49 11 JSR $1149 
01:800b : 4c d0 11 JMP $11d0 
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
02:8008 : 20 49 11 JSR $1149 
02:800b : 4c d0 11 JMP $11d0 
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
03:8008 : 20 49 11 JSR $1149 
03:800b : 4c d0 11 JMP $11d0 
--------------------------------------------------------------------
03:800e : __ __ __ BYT 74 48 49 53 20 49 53 20 54 48 49 52 44 20 42 41 : tHIS IS THIRD BA
03:801e : __ __ __ BYT 4e 4b 00                                        : NK.
