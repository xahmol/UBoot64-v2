; Compiled with 1.32.263
--------------------------------------------------------------------
startup: ; startup
0800 : 09 80 __ ORA #$80
0802 : bc fe c3 LDY $c3fe,x 
0805 : c2 __ __ INV
0806 : cd 38 30 CMP $3038 
0809 : a2 00 __ LDX #$00
080b : bd 00 80 LDA $8000,x 
080e : 9d 00 08 STA $0800,x ; (startup + 0)
0811 : e8 __ __ INX
0812 : d0 f7 __ BNE $080b ; (startup + 11)
0814 : a9 00 __ LDA #$00
0816 : 85 19 __ STA IP + 0 
0818 : a9 81 __ LDA #$81
081a : 85 1a __ STA IP + 1 
081c : a9 00 __ LDA #$00
081e : 85 23 __ STA SP + 0 
0820 : a9 09 __ LDA #$09
0822 : 85 24 __ STA SP + 1 
0824 : a0 00 __ LDY #$00
0826 : b1 19 __ LDA (IP + 0),y 
0828 : 85 1b __ STA ACCU + 0 
082a : 30 3b __ BMI $0867 ; (startup + 103)
082c : 18 __ __ CLC
082d : a5 19 __ LDA IP + 0 
082f : 69 01 __ ADC #$01
0831 : 85 1f __ STA ADDR + 0 
0833 : a5 1a __ LDA IP + 1 
0835 : 69 00 __ ADC #$00
0837 : 85 20 __ STA ADDR + 1 
0839 : 18 __ __ CLC
083a : a5 1f __ LDA ADDR + 0 
083c : 65 1b __ ADC ACCU + 0 
083e : 85 19 __ STA IP + 0 
0840 : a5 20 __ LDA ADDR + 1 
0842 : 69 00 __ ADC #$00
0844 : 85 1a __ STA IP + 1 
0846 : a0 00 __ LDY #$00
0848 : b1 1f __ LDA (ADDR + 0),y 
084a : 91 23 __ STA (SP + 0),y 
084c : c8 __ __ INY
084d : c4 1b __ CPY ACCU + 0 
084f : d0 f7 __ BNE $0848 ; (startup + 72)
0851 : 18 __ __ CLC
0852 : a5 23 __ LDA SP + 0 
0854 : 65 1b __ ADC ACCU + 0 
0856 : 85 23 __ STA SP + 0 
0858 : a5 24 __ LDA SP + 1 
085a : 69 00 __ ADC #$00
085c : 85 24 __ STA SP + 1 
085e : a0 00 __ LDY #$00
0860 : b1 19 __ LDA (IP + 0),y 
0862 : d0 c4 __ BNE $0828 ; (startup + 40)
0864 : 4c 8c 08 JMP $088c ; (startup + 140)
0867 : a5 23 __ LDA SP + 0 
0869 : 38 __ __ SEC
086a : a0 01 __ LDY #$01
086c : f1 19 __ SBC (IP + 0),y 
086e : 85 1f __ STA ADDR + 0 
0870 : a5 24 __ LDA SP + 1 
0872 : e9 00 __ SBC #$00
0874 : 85 20 __ STA ADDR + 1 
0876 : 18 __ __ CLC
0877 : a5 19 __ LDA IP + 0 
0879 : 69 02 __ ADC #$02
087b : 85 19 __ STA IP + 0 
087d : a5 1a __ LDA IP + 1 
087f : 69 00 __ ADC #$00
0881 : 85 1a __ STA IP + 1 
0883 : a5 1b __ LDA ACCU + 0 
0885 : 29 7f __ AND #$7f
0887 : 85 1b __ STA ACCU + 0 
0889 : 4c 46 08 JMP $0846 ; (startup + 70)
088c : a9 2f __ LDA #$2f
088e : 85 00 __ STA $00 
0890 : a9 36 __ LDA #$36
0892 : 85 01 __ STA $01 
0894 : a2 0a __ LDX #$0a
0896 : a0 b9 __ LDY #$b9
0898 : a9 00 __ LDA #$00
089a : 85 19 __ STA IP + 0 
089c : 86 1a __ STX IP + 1 
089e : e0 0a __ CPX #$0a
08a0 : f0 0b __ BEQ $08ad ; (startup + 173)
08a2 : 91 19 __ STA (IP + 0),y 
08a4 : c8 __ __ INY
08a5 : d0 fb __ BNE $08a2 ; (startup + 162)
08a7 : e8 __ __ INX
08a8 : d0 f2 __ BNE $089c ; (startup + 156)
08aa : 91 19 __ STA (IP + 0),y 
08ac : c8 __ __ INY
08ad : c0 c5 __ CPY #$c5
08af : d0 f9 __ BNE $08aa ; (startup + 170)
08b1 : a9 00 __ LDA #$00
08b3 : a2 f7 __ LDX #$f7
08b5 : d0 03 __ BNE $08ba ; (startup + 186)
08b7 : 95 00 __ STA $00,x 
08b9 : e8 __ __ INX
08ba : e0 f7 __ CPX #$f7
08bc : d0 f9 __ BNE $08b7 ; (startup + 183)
08be : a9 fe __ LDA #$fe
08c0 : 85 23 __ STA SP + 0 
08c2 : a9 7f __ LDA #$7f
08c4 : 85 24 __ STA SP + 1 
08c6 : 20 00 09 JSR $0900 ; (main.s4 + 0)
08c9 : a9 4c __ LDA #$4c
08cb : 85 54 __ STA $54 
08cd : a9 00 __ LDA #$00
08cf : 85 13 __ STA P6 
08d1 : a9 19 __ LDA #$19
08d3 : 85 16 __ STA P9 
08d5 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
.s4:
0900 : a9 37 __ LDA #$37
0902 : 85 01 __ STA $01 
0904 : a9 7f __ LDA #$7f
0906 : 8d 0d dc STA $dc0d 
0909 : 8d 0d dd STA $dd0d 
090c : 8d 00 dc STA $dc00 
090f : a9 08 __ LDA #$08
0911 : 8d 0e dc STA $dc0e 
0914 : 8d 0f dc STA $dc0f 
0917 : 8d 0e dd STA $dd0e 
091a : 8d 0f dd STA $dd0f 
091d : a9 00 __ LDA #$00
091f : 8d 03 dc STA $dc03 
0922 : 8d 03 dd STA $dd03 
0925 : 8d b9 0a STA $0ab9 ; (cw + 0)
0928 : 8d ba 0a STA $0aba ; (cw + 1)
092b : 8d bd 0a STA $0abd ; (cw + 4)
092e : 8d be 0a STA $0abe ; (cw + 5)
0931 : a9 ff __ LDA #$ff
0933 : 8d 02 dc STA $dc02 
0936 : a9 07 __ LDA #$07
0938 : 8d 00 dd STA $dd00 
093b : a9 3f __ LDA #$3f
093d : 8d 02 dd STA $dd02 
0940 : a9 19 __ LDA #$19
0942 : 8d bc 0a STA $0abc ; (cw + 3)
0945 : a9 7f __ LDA #$7f
0947 : a9 1b __ LDA #$1b
0949 : 8d 11 d0 STA $d011 
094c : a9 08 __ LDA #$08
094e : 8d 16 d0 STA $d016 
0951 : ad 0d dd LDA $dd0d 
0954 : a9 07 __ LDA #$07
0956 : 8d 00 dd STA $dd00 
0959 : a9 16 __ LDA #$16
095b : 8d 18 d0 STA $d018 
095e : a9 00 __ LDA #$00
0960 : 85 43 __ STA T0 + 0 
0962 : 8d c1 0a STA $0ac1 ; (cw + 8)
0965 : 8d c3 0a STA $0ac3 ; (cw + 10)
0968 : a9 04 __ LDA #$04
096a : 8d c2 0a STA $0ac2 ; (cw + 9)
096d : 85 44 __ STA T0 + 1 
096f : a9 d8 __ LDA #$d8
0971 : 8d c4 0a STA $0ac4 ; (cw + 11)
0974 : 85 46 __ STA T1 + 1 
0976 : a2 00 __ LDX #$00
0978 : 86 45 __ STX T1 + 0 
097a : a9 28 __ LDA #$28
097c : 8d bb 0a STA $0abb ; (cw + 2)
.l9:
097f : 85 4c __ STA T5 + 0 
0981 : a0 00 __ LDY #$00
.l10:
0983 : a9 20 __ LDA #$20
0985 : 91 43 __ STA (T0 + 0),y 
0987 : a9 01 __ LDA #$01
0989 : 91 45 __ STA (T1 + 0),y 
098b : c8 __ __ INY
098c : c4 4c __ CPY T5 + 0 
098e : 90 f3 __ BCC $0983 ; (main.l10 + 0)
.l6:
0990 : e8 __ __ INX
0991 : ec bc 0a CPX $0abc ; (cw + 3)
0994 : 90 54 __ BCC $09ea ; (main.s5 + 0)
.s7:
0996 : a9 01 __ LDA #$01
0998 : 8d 00 de STA $de00 
099b : a9 00 __ LDA #$00
099d : 85 0d __ STA P0 
099f : a9 80 __ LDA #$80
09a1 : 85 0e __ STA P1 
09a3 : 20 07 0a JSR $0a07 ; (cwin_put_string.s4 + 0)
09a6 : 20 67 0a JSR $0a67 ; (cwin_cursor_newline.s4 + 0)
09a9 : a9 02 __ LDA #$02
09ab : 8d 00 de STA $de00 
09ae : a9 00 __ LDA #$00
09b0 : 85 0d __ STA P0 
09b2 : a9 80 __ LDA #$80
09b4 : 85 0e __ STA P1 
09b6 : 20 07 0a JSR $0a07 ; (cwin_put_string.s4 + 0)
09b9 : 20 67 0a JSR $0a67 ; (cwin_cursor_newline.s4 + 0)
09bc : a9 03 __ LDA #$03
09be : 8d 00 de STA $de00 
09c1 : a9 00 __ LDA #$00
09c3 : 85 0d __ STA P0 
09c5 : a9 80 __ LDA #$80
09c7 : 85 0e __ STA P1 
09c9 : 20 07 0a JSR $0a07 ; (cwin_put_string.s4 + 0)
09cc : 20 67 0a JSR $0a67 ; (cwin_cursor_newline.s4 + 0)
09cf : a9 04 __ LDA #$04
09d1 : 8d 00 de STA $de00 
09d4 : 20 00 80 JSR $8000 
09d7 : a9 05 __ LDA #$05
09d9 : 8d 00 de STA $de00 
09dc : 20 00 80 JSR $8000 
09df : a9 06 __ LDA #$06
09e1 : 8d 00 de STA $de00 
09e4 : 20 00 80 JSR $8000 
.l8:
09e7 : 4c e7 09 JMP $09e7 ; (main.l8 + 0)
.s5:
09ea : a5 43 __ LDA T0 + 0 
09ec : 69 28 __ ADC #$28
09ee : 85 43 __ STA T0 + 0 
09f0 : 90 03 __ BCC $09f5 ; (main.s12 + 0)
.s11:
09f2 : e6 44 __ INC T0 + 1 
09f4 : 18 __ __ CLC
.s12:
09f5 : a5 45 __ LDA T1 + 0 
09f7 : 69 28 __ ADC #$28
09f9 : 85 45 __ STA T1 + 0 
09fb : 90 02 __ BCC $09ff ; (main.s14 + 0)
.s13:
09fd : e6 46 __ INC T1 + 1 
.s14:
09ff : ad bb 0a LDA $0abb ; (cw + 2)
0a02 : f0 8c __ BEQ $0990 ; (main.l6 + 0)
0a04 : 4c 7f 09 JMP $097f ; (main.l9 + 0)
--------------------------------------------------------------------
cwin_put_string: ; cwin_put_string(struct CharWin*,const u8*,u8)->void
.s4:
0a07 : ad be 0a LDA $0abe ; (cw + 5)
0a0a : 0a __ __ ASL
0a0b : aa __ __ TAX
0a0c : bd 7f 0a LDA $0a7f,x ; (mul40 + 0)
0a0f : 6d bd 0a ADC $0abd ; (cw + 4)
0a12 : 85 1b __ STA ACCU + 0 
0a14 : bd 80 0a LDA $0a80,x ; (mul40 + 1)
0a17 : 69 00 __ ADC #$00
0a19 : 85 1c __ STA ACCU + 1 
0a1b : ad c1 0a LDA $0ac1 ; (cw + 8)
0a1e : 65 1b __ ADC ACCU + 0 
0a20 : 85 43 __ STA T1 + 0 
0a22 : ad c2 0a LDA $0ac2 ; (cw + 9)
0a25 : 65 1c __ ADC ACCU + 1 
0a27 : 85 44 __ STA T1 + 1 
0a29 : ad c3 0a LDA $0ac3 ; (cw + 10)
0a2c : 18 __ __ CLC
0a2d : 65 1b __ ADC ACCU + 0 
0a2f : 85 1b __ STA ACCU + 0 
0a31 : ad c4 0a LDA $0ac4 ; (cw + 11)
0a34 : 65 1c __ ADC ACCU + 1 
0a36 : 85 1c __ STA ACCU + 1 
0a38 : a0 00 __ LDY #$00
0a3a : b1 0d __ LDA (P0),y ; (str + 0)
0a3c : f0 16 __ BEQ $0a54 ; (cwin_put_string.s5 + 0)
.l7:
0a3e : 4a __ __ LSR
0a3f : 4a __ __ LSR
0a40 : 4a __ __ LSR
0a41 : 4a __ __ LSR
0a42 : 4a __ __ LSR
0a43 : aa __ __ TAX
0a44 : bd b1 0a LDA $0ab1,x ; (p2smap + 0)
0a47 : 51 0d __ EOR (P0),y ; (str + 0)
0a49 : 91 43 __ STA (T1 + 0),y 
0a4b : a9 07 __ LDA #$07
0a4d : 91 1b __ STA (ACCU + 0),y 
0a4f : c8 __ __ INY
0a50 : b1 0d __ LDA (P0),y ; (str + 0)
0a52 : d0 ea __ BNE $0a3e ; (cwin_put_string.l7 + 0)
.s5:
0a54 : 98 __ __ TYA
0a55 : 18 __ __ CLC
0a56 : 6d bd 0a ADC $0abd ; (cw + 4)
0a59 : cd bb 0a CMP $0abb ; (cw + 2)
0a5c : 90 05 __ BCC $0a63 ; (cwin_put_string.s3 + 0)
.s6:
0a5e : a9 00 __ LDA #$00
0a60 : ee be 0a INC $0abe ; (cw + 5)
.s3:
0a63 : 8d bd 0a STA $0abd ; (cw + 4)
0a66 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_cursor_newline: ; cwin_cursor_newline(struct CharWin*)->void
.s4:
0a67 : ad be 0a LDA $0abe ; (cw + 5)
0a6a : 18 __ __ CLC
0a6b : 69 01 __ ADC #$01
0a6d : a8 __ __ TAY
0a6e : a9 00 __ LDA #$00
0a70 : 8d bd 0a STA $0abd ; (cw + 4)
0a73 : 2a __ __ ROL
0a74 : d0 08 __ BNE $0a7e ; (cwin_cursor_newline.s3 + 0)
.s6:
0a76 : cc bc 0a CPY $0abc ; (cw + 3)
0a79 : b0 03 __ BCS $0a7e ; (cwin_cursor_newline.s3 + 0)
.s5:
0a7b : ee be 0a INC $0abe ; (cw + 5)
.s3:
0a7e : 60 __ __ RTS
--------------------------------------------------------------------
mul40:
0a7f : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
0a8f : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
0a9f : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
0aaf : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
p2smap:
0ab1 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
cw:
0ab9 : __ __ __ BSS	12
--------------------------------------------------------------------
01:8000 : __ __ __ BYT d4 48 49 53 20 49 53 20 46 49 52 53 54 20 42 41 : .HIS IS FIRST BA
01:8010 : __ __ __ BYT 4e 4b 00                                        : NK.
--------------------------------------------------------------------
02:8000 : __ __ __ BYT d4 48 49 53 20 49 53 20 53 45 43 4f 4e 44 20 42 : .HIS IS SECOND B
02:8010 : __ __ __ BYT 41 4e 4b 00                                     : ANK.
--------------------------------------------------------------------
03:8000 : __ __ __ BYT d4 48 49 53 20 49 53 20 54 48 49 52 44 20 42 41 : .HIS IS THIRD BA
03:8010 : __ __ __ BYT 4e 4b 00                                        : NK.
--------------------------------------------------------------------
print4: ; print4()->void
.s4:
04:8000 : a9 0e __ LDA #$0e
04:8002 : 85 0d __ STA P0 
04:8004 : a9 80 __ LDA #$80
04:8006 : 85 0e __ STA P1 
04:8008 : 20 07 0a JSR $0a07 ; (cwin_put_string.s4 + 0)
04:800b : 4c 67 0a JMP $0a67 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
04:800e : __ __ __ BYT d4 48 49 53 20 49 53 20 46 4f 55 52 54 48 20 42 : .HIS IS FOURTH B
04:801e : __ __ __ BYT 41 4e 4b 00                                     : ANK.
--------------------------------------------------------------------
print5: ; print5()->void
.s4:
05:8000 : a9 0e __ LDA #$0e
05:8002 : 85 0d __ STA P0 
05:8004 : a9 80 __ LDA #$80
05:8006 : 85 0e __ STA P1 
05:8008 : 20 07 0a JSR $0a07 ; (cwin_put_string.s4 + 0)
05:800b : 4c 67 0a JMP $0a67 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
05:800e : __ __ __ BYT d4 48 49 53 20 49 53 20 46 49 46 54 48 20 42 41 : .HIS IS FIFTH BA
05:801e : __ __ __ BYT 4e 4b 00                                        : NK.
--------------------------------------------------------------------
print6: ; print6()->void
.s4:
06:8000 : a9 0e __ LDA #$0e
06:8002 : 85 0d __ STA P0 
06:8004 : a9 80 __ LDA #$80
06:8006 : 85 0e __ STA P1 
06:8008 : 20 07 0a JSR $0a07 ; (cwin_put_string.s4 + 0)
06:800b : 4c 67 0a JMP $0a67 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
06:800e : __ __ __ BYT d4 48 49 53 20 49 53 20 53 49 58 54 48 20 42 41 : .HIS IS SIXTH BA
06:801e : __ __ __ BYT 4e 4b 00                                        : NK.
