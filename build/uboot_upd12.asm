; Compiled with 1.32.263
--------------------------------------------------------------------
startup: ; startup
0801 : 0b __ __ INV
0802 : 08 __ __ PHP
0803 : 0a __ __ ASL
0804 : 00 __ __ BRK
0805 : 9e __ __ INV
0806 : 32 __ __ INV
0807 : 30 36 __ BMI $083f ; (startup + 62)
0809 : 31 00 __ AND ($00),y 
080b : 00 __ __ BRK
080c : 00 __ __ BRK
080d : ba __ __ TSX
080e : 8e ff 0c STX $0cff ; (spentry + 0)
0811 : a2 25 __ LDX #$25
0813 : a0 88 __ LDY #$88
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 30 __ CPX #$30
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 9e __ CPY #$9e
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 20 __ LDA #$20
083d : 85 23 __ STA SP + 0 
083f : a9 9d __ LDA #$9d
0841 : 85 24 __ STA SP + 1 
0843 : 20 80 08 JSR $0880 ; (main.s1 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
.s1:
0880 : 38 __ __ SEC
0881 : a5 23 __ LDA SP + 0 
0883 : e9 09 __ SBC #$09
0885 : 85 23 __ STA SP + 0 
0887 : b0 02 __ BCS $088b ; (main.s4 + 0)
0889 : c6 24 __ DEC SP + 1 
.s4:
088b : a9 02 __ LDA #$02
088d : 8d 88 25 STA $2588 ; (cfg + 0)
0890 : 8d e9 25 STA $25e9 ; (cfg + 97)
0893 : a9 01 __ LDA #$01
0895 : 8d 89 25 STA $2589 ; (cfg + 1)
0898 : 8d df 25 STA $25df ; (cfg + 87)
089b : 8d e5 25 STA $25e5 ; (cfg + 93)
089e : 8d e7 25 STA $25e7 ; (cfg + 95)
08a1 : a9 00 __ LDA #$00
08a3 : 8d dd 25 STA $25dd ; (cfg + 85)
08a6 : 8d de 25 STA $25de ; (cfg + 86)
08a9 : 8d e0 25 STA $25e0 ; (cfg + 88)
08ac : 8d e1 25 STA $25e1 ; (cfg + 89)
08af : a9 20 __ LDA #$20
08b1 : 8d db 25 STA $25db ; (cfg + 83)
08b4 : a9 1c __ LDA #$1c
08b6 : 8d dc 25 STA $25dc ; (cfg + 84)
08b9 : a9 05 __ LDA #$05
08bb : 8d e2 25 STA $25e2 ; (cfg + 90)
08be : 8d ea 25 STA $25ea ; (cfg + 98)
08c1 : a9 03 __ LDA #$03
08c3 : 8d e6 25 STA $25e6 ; (cfg + 94)
08c6 : 8d e8 25 STA $25e8 ; (cfg + 96)
08c9 : a9 0d __ LDA #$0d
08cb : 8d e3 25 STA $25e3 ; (cfg + 91)
08ce : a9 07 __ LDA #$07
08d0 : 8d e4 25 STA $25e4 ; (cfg + 92)
08d3 : a2 ff __ LDX #$ff
.l5:
08d5 : e8 __ __ INX
08d6 : bd 65 0a LDA $0a65,x 
08d9 : 9d 8a 25 STA $258a,x ; (cfg + 2)
08dc : d0 f7 __ BNE $08d5 ; (main.l5 + 0)
.s6:
08de : 20 72 0a JSR $0a72 ; (vic_setmode.s4 + 0)
08e1 : a9 00 __ LDA #$00
08e3 : 8d 20 d0 STA $d020 
08e6 : 8d 21 d0 STA $d021 
08e9 : 20 8c 0a JSR $0a8c ; (cwin_init.s4 + 0)
08ec : 20 b5 0a JSR $0ab5 ; (cwin_clear.s4 + 0)
08ef : 20 09 0b JSR $0b09 ; (headertext.s4 + 0)
08f2 : a9 00 __ LDA #$00
08f4 : 8d ef 25 STA $25ef ; (cw + 4)
08f7 : a9 03 __ LDA #$03
08f9 : 8d f0 25 STA $25f0 ; (cw + 5)
08fc : ad 1d df LDA $df1d 
08ff : c9 c9 __ CMP #$c9
0901 : f0 10 __ BEQ $0913 ; (main.s16 + 0)
.s7:
0903 : a9 65 __ LDA #$65
0905 : 8d fc 9f STA $9ffc ; (sstack + 4)
0908 : a9 15 __ LDA #$15
090a : 8d fd 9f STA $9ffd ; (sstack + 5)
090d : 20 cc 0e JSR $0ecc ; (error.s1 + 0)
0910 : 4c 66 09 JMP $0966 ; (main.s8 + 0)
.s16:
0913 : 20 f5 0c JSR $0cf5 ; (uii_abort.s4 + 0)
0916 : a9 00 __ LDA #$00
0918 : 85 0d __ STA P0 
091a : a9 16 __ LDA #$16
091c : 85 0e __ STA P1 
091e : 20 8c 15 JSR $158c ; (cwin_put_string.s4 + 0)
0921 : a9 02 __ LDA #$02
0923 : 85 0f __ STA P2 
0925 : a9 00 __ LDA #$00
0927 : 85 10 __ STA P3 
0929 : 20 25 16 JSR $1625 ; (cwin_cursor_newline.s4 + 0)
092c : a9 01 __ LDA #$01
092e : 8d fc 19 STA $19fc ; (uii_target + 0)
0931 : 8d 23 9d STA $9d23 ; (cmd + 1)
0934 : a9 00 __ LDA #$00
0936 : 8d 22 9d STA $9d22 ; (cmd + 0)
0939 : a9 22 __ LDA #$22
093b : 85 0d __ STA P0 
093d : a9 9d __ LDA #$9d
093f : 85 0e __ STA P1 
0941 : 20 3f 0d JSR $0d3f ; (uii_sendcommand.s4 + 0)
0944 : 20 bb 0d JSR $0dbb ; (uii_readdata.s4 + 0)
0947 : 20 f9 0d JSR $0df9 ; (uii_readstatus.s4 + 0)
094a : 20 a7 0e JSR $0ea7 ; (uii_accept.s4 + 0)
094d : a9 ec __ LDA #$ec
094f : 85 0d __ STA P0 
0951 : a9 15 __ LDA #$15
0953 : 85 0e __ STA P1 
0955 : 20 8c 15 JSR $158c ; (cwin_put_string.s4 + 0)
0958 : a9 64 __ LDA #$64
095a : 85 0d __ STA P0 
095c : a9 26 __ LDA #$26
095e : 85 0e __ STA P1 
0960 : 20 8c 15 JSR $158c ; (cwin_put_string.s4 + 0)
0963 : 20 25 16 JSR $1625 ; (cwin_cursor_newline.s4 + 0)
.s8:
0966 : 20 3d 16 JSR $163d ; (reu_count_pages.s4 + 0)
0969 : a5 1c __ LDA ACCU + 1 
096b : 05 1b __ ORA ACCU + 0 
096d : d0 10 __ BNE $097f ; (main.s15 + 0)
.s9:
096f : a9 a4 __ LDA #$a4
0971 : 8d fc 9f STA $9ffc ; (sstack + 4)
0974 : a9 17 __ LDA #$17
0976 : 8d fd 9f STA $9ffd ; (sstack + 5)
0979 : 20 cc 0e JSR $0ecc ; (error.s1 + 0)
097c : 4c a4 09 JMP $09a4 ; (main.s10 + 0)
.s15:
097f : a9 88 __ LDA #$88
0981 : a0 05 __ LDY #$05
0983 : 91 23 __ STA (SP + 0),y 
0985 : a9 17 __ LDA #$17
0987 : c8 __ __ INY
0988 : 91 23 __ STA (SP + 0),y 
098a : a5 1b __ LDA ACCU + 0 
098c : 85 44 __ STA T0 + 1 
098e : a5 1c __ LDA ACCU + 1 
0990 : 4a __ __ LSR
0991 : 66 44 __ ROR T0 + 1 
0993 : 6a __ __ ROR
0994 : 66 44 __ ROR T0 + 1 
0996 : 29 80 __ AND #$80
0998 : 6a __ __ ROR
0999 : c8 __ __ INY
099a : 91 23 __ STA (SP + 0),y 
099c : a5 44 __ LDA T0 + 1 
099e : c8 __ __ INY
099f : 91 23 __ STA (SP + 0),y 
09a1 : 20 0b 0f JSR $0f0b ; (cwin_console_printf.s4 + 0)
.s10:
09a4 : a9 00 __ LDA #$00
09a6 : 8d 09 dc STA $dc09 
09a9 : 8d 08 dc STA $dc08 
.l11:
09ac : 20 2a 0e JSR $0e2a ; (uii_change_dir.s4 + 0)
09af : ad 65 28 LDA $2865 ; (uii_status + 0)
09b2 : c9 30 __ CMP #$30
09b4 : d0 f6 __ BNE $09ac ; (main.l11 + 0)
.s12:
09b6 : ad 66 28 LDA $2866 ; (uii_status + 1)
09b9 : c9 30 __ CMP #$30
09bb : d0 ef __ BNE $09ac ; (main.l11 + 0)
.s13:
09bd : ad 09 dc LDA $dc09 
09c0 : c9 05 __ CMP #$05
09c2 : b0 e8 __ BCS $09ac ; (main.l11 + 0)
.s14:
09c4 : a9 b5 __ LDA #$b5
09c6 : a0 05 __ LDY #$05
09c8 : 91 23 __ STA (SP + 0),y 
09ca : a9 17 __ LDA #$17
09cc : c8 __ __ INY
09cd : 91 23 __ STA (SP + 0),y 
09cf : 20 0b 0f JSR $0f0b ; (cwin_console_printf.s4 + 0)
09d2 : 20 d1 17 JSR $17d1 ; (read_old_configfile.s4 + 0)
09d5 : a9 0f __ LDA #$0f
09d7 : a0 05 __ LDY #$05
09d9 : 91 23 __ STA (SP + 0),y 
09db : a9 1a __ LDA #$1a
09dd : c8 __ __ INY
09de : 91 23 __ STA (SP + 0),y 
09e0 : 20 0b 0f JSR $0f0b ; (cwin_console_printf.s4 + 0)
09e3 : 20 2b 1a JSR $1a2b ; (writeconfigfile.s4 + 0)
09e6 : a9 80 __ LDA #$80
09e8 : a0 05 __ LDY #$05
09ea : 91 23 __ STA (SP + 0),y 
09ec : a9 1b __ LDA #$1b
09ee : c8 __ __ INY
09ef : 91 23 __ STA (SP + 0),y 
09f1 : 20 0b 0f JSR $0f0b ; (cwin_console_printf.s4 + 0)
09f4 : 20 9b 1b JSR $1b9b ; (read_old_slotsfile.s1 + 0)
09f7 : ee f0 25 INC $25f0 ; (cw + 5)
09fa : a9 00 __ LDA #$00
09fc : 8d ef 25 STA $25ef ; (cw + 4)
09ff : a9 52 __ LDA #$52
0a01 : a0 05 __ LDY #$05
0a03 : 91 23 __ STA (SP + 0),y 
0a05 : a9 1d __ LDA #$1d
0a07 : c8 __ __ INY
0a08 : 91 23 __ STA (SP + 0),y 
0a0a : 20 0b 0f JSR $0f0b ; (cwin_console_printf.s4 + 0)
0a0d : 20 6b 1d JSR $1d6b ; (convert_slot_data.s1 + 0)
0a10 : ee f0 25 INC $25f0 ; (cw + 5)
0a13 : a9 00 __ LDA #$00
0a15 : 8d ef 25 STA $25ef ; (cw + 4)
0a18 : a9 00 __ LDA #$00
0a1a : a0 05 __ LDY #$05
0a1c : 91 23 __ STA (SP + 0),y 
0a1e : a9 20 __ LDA #$20
0a20 : c8 __ __ INY
0a21 : 91 23 __ STA (SP + 0),y 
0a23 : 20 0b 0f JSR $0f0b ; (cwin_console_printf.s4 + 0)
0a26 : 20 1b 20 JSR $201b ; (write_slotsfile.s1 + 0)
0a29 : ee f0 25 INC $25f0 ; (cw + 5)
0a2c : a9 00 __ LDA #$00
0a2e : 8d ef 25 STA $25ef ; (cw + 4)
0a31 : a9 4b __ LDA #$4b
0a33 : a0 05 __ LDY #$05
0a35 : 91 23 __ STA (SP + 0),y 
0a37 : a9 21 __ LDA #$21
0a39 : c8 __ __ INY
0a3a : 91 23 __ STA (SP + 0),y 
0a3c : 20 0b 0f JSR $0f0b ; (cwin_console_printf.s4 + 0)
0a3f : a9 60 __ LDA #$60
0a41 : a0 05 __ LDY #$05
0a43 : 91 23 __ STA (SP + 0),y 
0a45 : a9 21 __ LDA #$21
0a47 : c8 __ __ INY
0a48 : 91 23 __ STA (SP + 0),y 
0a4a : 20 0b 0f JSR $0f0b ; (cwin_console_printf.s4 + 0)
0a4d : 20 3a 15 JSR $153a ; (cwin_getch.s4 + 0)
0a50 : 20 b5 0a JSR $0ab5 ; (cwin_clear.s4 + 0)
0a53 : a9 00 __ LDA #$00
0a55 : 85 1b __ STA ACCU + 0 
0a57 : 85 1c __ STA ACCU + 1 
.s3:
0a59 : 18 __ __ CLC
0a5a : a5 23 __ LDA SP + 0 
0a5c : 69 09 __ ADC #$09
0a5e : 85 23 __ STA SP + 0 
0a60 : 90 02 __ BCC $0a64 ; (main.s3 + 11)
0a62 : e6 24 __ INC SP + 1 
0a64 : 60 __ __ RTS
--------------------------------------------------------------------
0a65 : __ __ __ BYT 50 4f 4f 4c 2e 4e 54 50 2e 4f 52 47 00          : POOL.NTP.ORG.
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
.s4:
0a72 : a9 1b __ LDA #$1b
0a74 : 8d 11 d0 STA $d011 
0a77 : a9 08 __ LDA #$08
0a79 : 8d 16 d0 STA $d016 
0a7c : ad 00 dd LDA $dd00 
0a7f : 29 fc __ AND #$fc
0a81 : 09 03 __ ORA #$03
0a83 : 8d 00 dd STA $dd00 
0a86 : a9 16 __ LDA #$16
0a88 : 8d 18 d0 STA $d018 
.s3:
0a8b : 60 __ __ RTS
--------------------------------------------------------------------
cwin_init: ; cwin_init(struct CharWin*,u8*,u8,u8,u8,u8)->void
.s4:
0a8c : a9 00 __ LDA #$00
0a8e : 8d eb 25 STA $25eb ; (cw + 0)
0a91 : 8d ec 25 STA $25ec ; (cw + 1)
0a94 : 8d ef 25 STA $25ef ; (cw + 4)
0a97 : 8d f0 25 STA $25f0 ; (cw + 5)
0a9a : 8d f3 25 STA $25f3 ; (cw + 8)
0a9d : 8d f5 25 STA $25f5 ; (cw + 10)
0aa0 : a9 28 __ LDA #$28
0aa2 : 8d ed 25 STA $25ed ; (cw + 2)
0aa5 : a9 19 __ LDA #$19
0aa7 : 8d ee 25 STA $25ee ; (cw + 3)
0aaa : a9 04 __ LDA #$04
0aac : 8d f4 25 STA $25f4 ; (cw + 9)
0aaf : a9 d8 __ LDA #$d8
0ab1 : 8d f6 25 STA $25f6 ; (cw + 11)
.s3:
0ab4 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_clear: ; cwin_clear(struct CharWin*)->void
.s4:
0ab5 : ad ee 25 LDA $25ee ; (cw + 3)
0ab8 : f0 32 __ BEQ $0aec ; (cwin_clear.s3 + 0)
.s5:
0aba : ad f3 25 LDA $25f3 ; (cw + 8)
0abd : 85 1b __ STA ACCU + 0 
0abf : ad f4 25 LDA $25f4 ; (cw + 9)
0ac2 : 85 1c __ STA ACCU + 1 
0ac4 : ad f5 25 LDA $25f5 ; (cw + 10)
0ac7 : 85 43 __ STA T1 + 0 
0ac9 : ad f6 25 LDA $25f6 ; (cw + 11)
0acc : 85 44 __ STA T1 + 1 
0ace : a2 00 __ LDX #$00
0ad0 : ad ed 25 LDA $25ed ; (cw + 2)
0ad3 : f0 11 __ BEQ $0ae6 ; (cwin_clear.l7 + 0)
.l8:
0ad5 : 85 1d __ STA ACCU + 2 
0ad7 : a0 00 __ LDY #$00
.l9:
0ad9 : a9 20 __ LDA #$20
0adb : 91 1b __ STA (ACCU + 0),y 
0add : a9 01 __ LDA #$01
0adf : 91 43 __ STA (T1 + 0),y 
0ae1 : c8 __ __ INY
0ae2 : c4 1d __ CPY ACCU + 2 
0ae4 : 90 f3 __ BCC $0ad9 ; (cwin_clear.l9 + 0)
.l7:
0ae6 : e8 __ __ INX
0ae7 : ec ee 25 CPX $25ee ; (cw + 3)
0aea : 90 01 __ BCC $0aed ; (cwin_clear.s6 + 0)
.s3:
0aec : 60 __ __ RTS
.s6:
0aed : a5 1b __ LDA ACCU + 0 
0aef : 69 28 __ ADC #$28
0af1 : 85 1b __ STA ACCU + 0 
0af3 : 90 03 __ BCC $0af8 ; (cwin_clear.s11 + 0)
.s10:
0af5 : e6 1c __ INC ACCU + 1 
0af7 : 18 __ __ CLC
.s11:
0af8 : a5 43 __ LDA T1 + 0 
0afa : 69 28 __ ADC #$28
0afc : 85 43 __ STA T1 + 0 
0afe : 90 02 __ BCC $0b02 ; (cwin_clear.s13 + 0)
.s12:
0b00 : e6 44 __ INC T1 + 1 
.s13:
0b02 : ad ed 25 LDA $25ed ; (cw + 2)
0b05 : f0 df __ BEQ $0ae6 ; (cwin_clear.l7 + 0)
0b07 : d0 cc __ BNE $0ad5 ; (cwin_clear.l8 + 0)
--------------------------------------------------------------------
headertext: ; headertext(const u8*,u8)->void
.s4:
0b09 : ad e2 25 LDA $25e2 ; (cfg + 90)
0b0c : 85 10 __ STA P3 
0b0e : a9 00 __ LDA #$00
0b10 : 85 0d __ STA P0 
0b12 : a9 28 __ LDA #$28
0b14 : 85 0e __ STA P1 
0b16 : a9 a0 __ LDA #$a0
0b18 : 85 0f __ STA P2 
0b1a : 20 6e 0c JSR $0c6e ; (cwin_fill_rect_raw.s4 + 0)
0b1d : e6 0d __ INC P0 
0b1f : ad e3 25 LDA $25e3 ; (cfg + 91)
0b22 : 85 10 __ STA P3 
0b24 : 20 6e 0c JSR $0c6e ; (cwin_fill_rect_raw.s4 + 0)
0b27 : a9 00 __ LDA #$00
0b29 : 85 0f __ STA P2 
0b2b : 85 10 __ STA P3 
0b2d : ad e2 25 LDA $25e2 ; (cfg + 90)
0b30 : 85 13 __ STA P6 
0b32 : a9 cc __ LDA #$cc
0b34 : 85 11 __ STA P4 
0b36 : a9 0c __ LDA #$0c
0b38 : 85 12 __ STA P5 
0b3a : 20 69 0b JSR $0b69 ; (cwin_putat_string_reverse.s4 + 0)
0b3d : e6 10 __ INC P3 
0b3f : a9 00 __ LDA #$00
0b41 : 85 11 __ STA P4 
0b43 : a9 0d __ LDA #$0d
0b45 : 85 12 __ STA P5 
0b47 : 20 64 0b JSR $0b64 ; (cwin_putat_string_reverse@proxy + 0)
0b4a : a9 b7 __ LDA #$b7
0b4c : 85 0d __ STA P0 
0b4e : a9 0e __ LDA #$0e
0b50 : 85 0e __ STA P1 
0b52 : 20 b0 0c JSR $0cb0 ; (strlen.s4 + 0)
0b55 : 38 __ __ SEC
0b56 : a9 28 __ LDA #$28
0b58 : e5 1b __ SBC ACCU + 0 
0b5a : 85 0f __ STA P2 
0b5c : a9 b7 __ LDA #$b7
0b5e : 85 11 __ STA P4 
0b60 : a9 0e __ LDA #$0e
0b62 : 85 12 __ STA P5 
--------------------------------------------------------------------
cwin_putat_string_reverse@proxy: ; cwin_putat_string_reverse@proxy
0b64 : ad e3 25 LDA $25e3 ; (cfg + 91)
0b67 : 85 13 __ STA P6 
--------------------------------------------------------------------
cwin_putat_string_reverse: ; cwin_putat_string_reverse(struct CharWin*,u8,u8,const u8*,u8)->void
.s4:
0b69 : 20 a8 0c JSR $0ca8 ; (strlen@proxy + 0)
0b6c : a9 63 __ LDA #$63
0b6e : c5 1b __ CMP ACCU + 0 
0b70 : b0 06 __ BCS $0b78 ; (cwin_putat_string_reverse.s5 + 0)
.s10:
0b72 : 85 1b __ STA ACCU + 0 
.s9:
0b74 : a0 00 __ LDY #$00
0b76 : f0 4b __ BEQ $0bc3 ; (cwin_putat_string_reverse.l11 + 0)
.s5:
0b78 : a5 1b __ LDA ACCU + 0 
0b7a : d0 f8 __ BNE $0b74 ; (cwin_putat_string_reverse.s9 + 0)
.s6:
0b7c : a9 00 __ LDA #$00
0b7e : a6 1b __ LDX ACCU + 0 
0b80 : 9d 00 26 STA $2600,x ; (linebuffer + 0)
0b83 : a5 10 __ LDA P3 ; (y + 0)
0b85 : 0a __ __ ASL
0b86 : aa __ __ TAX
0b87 : bd 28 25 LDA $2528,x ; (mul40 + 0)
0b8a : 65 0f __ ADC P2 ; (x + 0)
0b8c : 85 1b __ STA ACCU + 0 
0b8e : bd 29 25 LDA $2529,x ; (mul40 + 1)
0b91 : 69 00 __ ADC #$00
0b93 : 85 1c __ STA ACCU + 1 
0b95 : ad f3 25 LDA $25f3 ; (cw + 8)
0b98 : 65 1b __ ADC ACCU + 0 
0b9a : 85 43 __ STA T1 + 0 
0b9c : ad f4 25 LDA $25f4 ; (cw + 9)
0b9f : 65 1c __ ADC ACCU + 1 
0ba1 : 85 44 __ STA T1 + 1 
0ba3 : ad f5 25 LDA $25f5 ; (cw + 10)
0ba6 : 18 __ __ CLC
0ba7 : 65 1b __ ADC ACCU + 0 
0ba9 : 85 1b __ STA ACCU + 0 
0bab : ad f6 25 LDA $25f6 ; (cw + 11)
0bae : 65 1c __ ADC ACCU + 1 
0bb0 : 85 1c __ STA ACCU + 1 
0bb2 : a0 00 __ LDY #$00
0bb4 : f0 07 __ BEQ $0bbd ; (cwin_putat_string_reverse.l7 + 0)
.s8:
0bb6 : 91 43 __ STA (T1 + 0),y 
0bb8 : a5 13 __ LDA P6 ; (color + 0)
0bba : 91 1b __ STA (ACCU + 0),y 
0bbc : c8 __ __ INY
.l7:
0bbd : b9 00 26 LDA $2600,y ; (linebuffer + 0)
0bc0 : d0 f4 __ BNE $0bb6 ; (cwin_putat_string_reverse.s8 + 0)
.s3:
0bc2 : 60 __ __ RTS
.l11:
0bc3 : b1 11 __ LDA (P4),y ; (str + 0)
0bc5 : 4a __ __ LSR
0bc6 : 4a __ __ LSR
0bc7 : 4a __ __ LSR
0bc8 : 4a __ __ LSR
0bc9 : 4a __ __ LSR
0bca : aa __ __ TAX
0bcb : bd 5a 25 LDA $255a,x ; (p2smap + 0)
0bce : 51 11 __ EOR (P4),y ; (str + 0)
0bd0 : 09 80 __ ORA #$80
0bd2 : 99 00 26 STA $2600,y ; (linebuffer + 0)
0bd5 : c8 __ __ INY
0bd6 : c4 1b __ CPY ACCU + 0 
0bd8 : 90 e9 __ BCC $0bc3 ; (cwin_putat_string_reverse.l11 + 0)
0bda : b0 a0 __ BCS $0b7c ; (cwin_putat_string_reverse.s6 + 0)
--------------------------------------------------------------------
cwin_console_newline: ; cwin_console_newline(struct CharWin*)->void
.s4:
0bdc : a9 00 __ LDA #$00
0bde : 8d ef 25 STA $25ef ; (cw + 4)
0be1 : ad f0 25 LDA $25f0 ; (cw + 5)
0be4 : aa __ __ TAX
0be5 : 18 __ __ CLC
0be6 : 69 01 __ ADC #$01
0be8 : 8d f0 25 STA $25f0 ; (cw + 5)
0beb : cd ee 25 CMP $25ee ; (cw + 3)
0bee : f0 01 __ BEQ $0bf1 ; (cwin_console_newline.s5 + 0)
.s3:
0bf0 : 60 __ __ RTS
.s5:
0bf1 : 8e f0 25 STX $25f0 ; (cw + 5)
0bf4 : ce f2 25 DEC $25f2 ; (cw + 7)
0bf7 : ad ed 25 LDA $25ed ; (cw + 2)
0bfa : 85 49 __ STA T7 + 0 
0bfc : ad f3 25 LDA $25f3 ; (cw + 8)
0bff : 85 43 __ STA T0 + 0 
0c01 : ad f4 25 LDA $25f4 ; (cw + 9)
0c04 : 85 44 __ STA T0 + 1 
0c06 : ad f5 25 LDA $25f5 ; (cw + 10)
0c09 : 85 1b __ STA ACCU + 0 
0c0b : ad f6 25 LDA $25f6 ; (cw + 11)
0c0e : a2 00 __ LDX #$00
0c10 : f0 0f __ BEQ $0c21 ; (cwin_console_newline.l6 + 0)
.s9:
0c12 : a5 47 __ LDA T3 + 0 
0c14 : 85 43 __ STA T0 + 0 
0c16 : a5 48 __ LDA T3 + 1 
0c18 : 85 44 __ STA T0 + 1 
0c1a : a5 45 __ LDA T2 + 0 
0c1c : 85 1b __ STA ACCU + 0 
0c1e : a5 46 __ LDA T2 + 1 
0c20 : e8 __ __ INX
.l6:
0c21 : 85 1c __ STA ACCU + 1 
0c23 : ad ee 25 LDA $25ee ; (cw + 3)
0c26 : 38 __ __ SEC
0c27 : e9 01 __ SBC #$01
0c29 : 90 06 __ BCC $0c31 ; (cwin_console_newline.s8 + 0)
.s11:
0c2b : 85 0d __ STA P0 
0c2d : e4 0d __ CPX P0 
0c2f : b0 2e __ BCS $0c5f ; (cwin_console_newline.s7 + 0)
.s8:
0c31 : a5 1b __ LDA ACCU + 0 
0c33 : 69 28 __ ADC #$28
0c35 : 85 45 __ STA T2 + 0 
0c37 : a5 1c __ LDA ACCU + 1 
0c39 : 69 00 __ ADC #$00
0c3b : 85 46 __ STA T2 + 1 
0c3d : 18 __ __ CLC
0c3e : a5 43 __ LDA T0 + 0 
0c40 : 69 28 __ ADC #$28
0c42 : 85 47 __ STA T3 + 0 
0c44 : a5 44 __ LDA T0 + 1 
0c46 : 69 00 __ ADC #$00
0c48 : 85 48 __ STA T3 + 1 
0c4a : a5 49 __ LDA T7 + 0 
0c4c : f0 c4 __ BEQ $0c12 ; (cwin_console_newline.s9 + 0)
.s10:
0c4e : a0 00 __ LDY #$00
.l12:
0c50 : b1 47 __ LDA (T3 + 0),y 
0c52 : 91 43 __ STA (T0 + 0),y 
0c54 : b1 45 __ LDA (T2 + 0),y 
0c56 : 91 1b __ STA (ACCU + 0),y 
0c58 : c8 __ __ INY
0c59 : c4 49 __ CPY T7 + 0 
0c5b : 90 f3 __ BCC $0c50 ; (cwin_console_newline.l12 + 0)
0c5d : b0 b3 __ BCS $0c12 ; (cwin_console_newline.s9 + 0)
.s7:
0c5f : a5 49 __ LDA T7 + 0 
0c61 : 85 0e __ STA P1 
0c63 : ad 63 25 LDA $2563 ; (p2smap + 1)
0c66 : 49 20 __ EOR #$20
0c68 : 85 0f __ STA P2 
0c6a : a9 01 __ LDA #$01
0c6c : 85 10 __ STA P3 
--------------------------------------------------------------------
cwin_fill_rect_raw: ; cwin_fill_rect_raw(struct CharWin*,u8,u8,u8,u8,u8,u8)->void
.s4:
0c6e : a5 0e __ LDA P1 ; (w + 0)
0c70 : f0 35 __ BEQ $0ca7 ; (cwin_fill_rect_raw.s3 + 0)
.s5:
0c72 : a5 0d __ LDA P0 ; (y + 0)
0c74 : 0a __ __ ASL
0c75 : aa __ __ TAX
0c76 : ad f3 25 LDA $25f3 ; (cw + 8)
0c79 : 7d 28 25 ADC $2528,x ; (mul40 + 0)
0c7c : 85 1b __ STA ACCU + 0 
0c7e : ad f4 25 LDA $25f4 ; (cw + 9)
0c81 : 7d 29 25 ADC $2529,x ; (mul40 + 1)
0c84 : 85 1c __ STA ACCU + 1 
0c86 : ad f5 25 LDA $25f5 ; (cw + 10)
0c89 : 18 __ __ CLC
0c8a : 7d 28 25 ADC $2528,x ; (mul40 + 0)
0c8d : 85 43 __ STA T2 + 0 
0c8f : ad f6 25 LDA $25f6 ; (cw + 11)
0c92 : 7d 29 25 ADC $2529,x ; (mul40 + 1)
0c95 : 85 44 __ STA T2 + 1 
0c97 : a0 00 __ LDY #$00
0c99 : a6 0f __ LDX P2 ; (ch + 0)
.l6:
0c9b : 8a __ __ TXA
0c9c : 91 1b __ STA (ACCU + 0),y 
0c9e : a5 10 __ LDA P3 ; (color + 0)
0ca0 : 91 43 __ STA (T2 + 0),y 
0ca2 : c8 __ __ INY
0ca3 : c4 0e __ CPY P1 ; (w + 0)
0ca5 : 90 f4 __ BCC $0c9b ; (cwin_fill_rect_raw.l6 + 0)
.s3:
0ca7 : 60 __ __ RTS
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
0ca8 : a5 11 __ LDA P4 
0caa : 85 0d __ STA P0 
0cac : a5 12 __ LDA P5 
0cae : 85 0e __ STA P1 
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
.s4:
0cb0 : a9 00 __ LDA #$00
0cb2 : 85 1b __ STA ACCU + 0 
0cb4 : 85 1c __ STA ACCU + 1 
0cb6 : a8 __ __ TAY
0cb7 : b1 0d __ LDA (P0),y ; (str + 0)
0cb9 : f0 10 __ BEQ $0ccb ; (strlen.s3 + 0)
.s6:
0cbb : a2 00 __ LDX #$00
.l7:
0cbd : c8 __ __ INY
0cbe : d0 03 __ BNE $0cc3 ; (strlen.s9 + 0)
.s8:
0cc0 : e6 0e __ INC P1 ; (str + 1)
0cc2 : e8 __ __ INX
.s9:
0cc3 : b1 0d __ LDA (P0),y ; (str + 0)
0cc5 : d0 f6 __ BNE $0cbd ; (strlen.l7 + 0)
.s5:
0cc7 : 86 1c __ STX ACCU + 1 
0cc9 : 84 1b __ STY ACCU + 0 
.s3:
0ccb : 60 __ __ RTS
--------------------------------------------------------------------
0ccc : __ __ __ BYT 75 62 4f 4f 54 36 34 3a 20 20 62 4f 4f 54 20 6d : ubOOT64:  bOOT m
0cdc : __ __ __ BYT 45 4e 55 20 46 4f 52 20 75 4c 54 49 4d 41 54 45 : ENU FOR uLTIMATE
0cec : __ __ __ BYT 20 44 45 56 49 43 45 53 00                      :  DEVICES.
--------------------------------------------------------------------
uii_abort: ; uii_abort()->void
.s4:
0cf5 : ad 1c df LDA $df1c 
0cf8 : 09 04 __ ORA #$04
0cfa : 8d 1c df STA $df1c 
.s3:
0cfd : 60 __ __ RTS
--------------------------------------------------------------------
0cfe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
spentry:
0cff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
0d00 : __ __ __ BYT 75 50 44 41 54 45 20 43 4f 4e 46 49 47 20 31 2d : uPDATE CONFIG 1-
0d10 : __ __ __ BYT 32 00                                           : 2.
--------------------------------------------------------------------
uii_read_file: ; uii_read_file(u16)->void
.s4:
0d12 : a9 00 __ LDA #$00
0d14 : 85 10 __ STA P3 
0d16 : 8d f4 9f STA $9ff4 ; (cmd + 0)
0d19 : 8d f6 9f STA $9ff6 ; (cmd + 2)
0d1c : 8d f7 9f STA $9ff7 ; (cmd + 3)
0d1f : a9 01 __ LDA #$01
0d21 : 8d fc 19 STA $19fc ; (uii_target + 0)
0d24 : a9 02 __ LDA #$02
0d26 : 85 0f __ STA P2 
0d28 : a9 04 __ LDA #$04
0d2a : 8d f5 9f STA $9ff5 ; (cmd + 1)
0d2d : a5 11 __ LDA P4 ; (length + 0)
0d2f : 8d f6 9f STA $9ff6 ; (cmd + 2)
0d32 : a5 12 __ LDA P5 ; (length + 1)
0d34 : 8d f7 9f STA $9ff7 ; (cmd + 3)
0d37 : a9 f4 __ LDA #$f4
0d39 : 85 0d __ STA P0 
0d3b : a9 9f __ LDA #$9f
0d3d : 85 0e __ STA P1 
--------------------------------------------------------------------
uii_sendcommand: ; uii_sendcommand(u8*,u16)->void
.s4:
0d3f : ad fc 19 LDA $19fc ; (uii_target + 0)
0d42 : a0 00 __ LDY #$00
0d44 : 84 1b __ STY ACCU + 0 
0d46 : 84 1c __ STY ACCU + 1 
0d48 : 91 0d __ STA (P0),y ; (bytes + 0)
.l5:
0d4a : ad 1c df LDA $df1c 
0d4d : 29 20 __ AND #$20
0d4f : d0 f9 __ BNE $0d4a ; (uii_sendcommand.l5 + 0)
.s6:
0d51 : ad 1c df LDA $df1c 
0d54 : 29 10 __ AND #$10
0d56 : d0 f2 __ BNE $0d4a ; (uii_sendcommand.l5 + 0)
.s7:
0d58 : a5 1c __ LDA ACCU + 1 
0d5a : c5 10 __ CMP P3 ; (count + 1)
0d5c : d0 04 __ BNE $0d62 ; (uii_sendcommand.s16 + 0)
.s15:
0d5e : a5 1b __ LDA ACCU + 0 
0d60 : c5 0f __ CMP P2 ; (count + 0)
.s16:
0d62 : b0 2f __ BCS $0d93 ; (uii_sendcommand.s8 + 0)
.s12:
0d64 : 18 __ __ CLC
0d65 : a5 0d __ LDA P0 ; (bytes + 0)
0d67 : 65 1b __ ADC ACCU + 0 
0d69 : 85 43 __ STA T3 + 0 
0d6b : a5 0e __ LDA P1 ; (bytes + 1)
0d6d : 65 1c __ ADC ACCU + 1 
0d6f : 85 44 __ STA T3 + 1 
0d71 : a6 1b __ LDX ACCU + 0 
.l13:
0d73 : a0 00 __ LDY #$00
0d75 : b1 43 __ LDA (T3 + 0),y 
0d77 : 8d 1d df STA $df1d 
0d7a : e6 43 __ INC T3 + 0 
0d7c : d0 02 __ BNE $0d80 ; (uii_sendcommand.s19 + 0)
.s18:
0d7e : e6 44 __ INC T3 + 1 
.s19:
0d80 : e8 __ __ INX
0d81 : d0 02 __ BNE $0d85 ; (uii_sendcommand.s21 + 0)
.s20:
0d83 : e6 1c __ INC ACCU + 1 
.s21:
0d85 : a5 1c __ LDA ACCU + 1 
0d87 : c5 10 __ CMP P3 ; (count + 1)
0d89 : 90 e8 __ BCC $0d73 ; (uii_sendcommand.l13 + 0)
.s22:
0d8b : d0 04 __ BNE $0d91 ; (uii_sendcommand.s17 + 0)
.s14:
0d8d : e4 0f __ CPX P2 ; (count + 0)
0d8f : 90 e2 __ BCC $0d73 ; (uii_sendcommand.l13 + 0)
.s17:
0d91 : 86 1b __ STX ACCU + 0 
.s8:
0d93 : ad 1c df LDA $df1c 
0d96 : 09 01 __ ORA #$01
0d98 : 8d 1c df STA $df1c 
0d9b : ad 1c df LDA $df1c 
0d9e : 29 04 __ AND #$04
0da0 : f0 0a __ BEQ $0dac ; (uii_sendcommand.l9 + 0)
.s11:
0da2 : ad 1c df LDA $df1c 
0da5 : 09 08 __ ORA #$08
0da7 : 8d 1c df STA $df1c 
0daa : b0 9e __ BCS $0d4a ; (uii_sendcommand.l5 + 0)
.l9:
0dac : ad 1c df LDA $df1c 
0daf : 29 20 __ AND #$20
0db1 : d0 07 __ BNE $0dba ; (uii_sendcommand.s3 + 0)
.s10:
0db3 : ad 1c df LDA $df1c 
0db6 : 29 10 __ AND #$10
0db8 : d0 f2 __ BNE $0dac ; (uii_sendcommand.l9 + 0)
.s3:
0dba : 60 __ __ RTS
--------------------------------------------------------------------
uii_readdata: ; uii_readdata()->u16
.s4:
0dbb : a9 00 __ LDA #$00
0dbd : 8d 64 26 STA $2664 ; (uii_data + 0)
0dc0 : a8 __ __ TAY
0dc1 : f0 16 __ BEQ $0dd9 ; (uii_readdata.l5 + 0)
.s8:
0dc3 : a9 64 __ LDA #$64
0dc5 : 85 43 __ STA T1 + 0 
0dc7 : 8a __ __ TXA
0dc8 : 18 __ __ CLC
0dc9 : 69 26 __ ADC #$26
0dcb : 85 44 __ STA T1 + 1 
0dcd : ad 1e df LDA $df1e 
0dd0 : 91 43 __ STA (T1 + 0),y 
0dd2 : 98 __ __ TYA
0dd3 : 69 01 __ ADC #$01
0dd5 : a8 __ __ TAY
0dd6 : 8a __ __ TXA
0dd7 : 69 00 __ ADC #$00
.l5:
0dd9 : aa __ __ TAX
0dda : 2c 1c df BIT $df1c 
0ddd : 10 07 __ BPL $0de6 ; (uii_readdata.s6 + 0)
.s7:
0ddf : e0 02 __ CPX #$02
0de1 : d0 e0 __ BNE $0dc3 ; (uii_readdata.s8 + 0)
.s9:
0de3 : 98 __ __ TYA
0de4 : d0 dd __ BNE $0dc3 ; (uii_readdata.s8 + 0)
.s6:
0de6 : 86 1c __ STX ACCU + 1 
0de8 : 84 1b __ STY ACCU + 0 
0dea : a9 64 __ LDA #$64
0dec : 85 43 __ STA T1 + 0 
0dee : 8a __ __ TXA
0def : 18 __ __ CLC
0df0 : 69 26 __ ADC #$26
0df2 : 85 44 __ STA T1 + 1 
0df4 : a9 00 __ LDA #$00
0df6 : 91 43 __ STA (T1 + 0),y 
.s3:
0df8 : 60 __ __ RTS
--------------------------------------------------------------------
uii_readstatus: ; uii_readstatus()->void
.s4:
0df9 : a9 00 __ LDA #$00
0dfb : 8d 65 28 STA $2865 ; (uii_status + 0)
0dfe : a8 __ __ TAY
0dff : f0 0d __ BEQ $0e0e ; (uii_readstatus.l5 + 0)
.s8:
0e01 : ad 1f df LDA $df1f 
0e04 : 91 1b __ STA (ACCU + 0),y 
0e06 : 98 __ __ TYA
0e07 : 18 __ __ CLC
0e08 : 69 01 __ ADC #$01
0e0a : a8 __ __ TAY
0e0b : 8a __ __ TXA
0e0c : 69 00 __ ADC #$00
.l5:
0e0e : aa __ __ TAX
0e0f : a9 65 __ LDA #$65
0e11 : 85 1b __ STA ACCU + 0 
0e13 : 8a __ __ TXA
0e14 : 18 __ __ CLC
0e15 : 69 28 __ ADC #$28
0e17 : 85 1c __ STA ACCU + 1 
0e19 : ad 1c df LDA $df1c 
0e1c : 29 40 __ AND #$40
0e1e : f0 07 __ BEQ $0e27 ; (uii_readstatus.s6 + 0)
.s7:
0e20 : e0 01 __ CPX #$01
0e22 : d0 dd __ BNE $0e01 ; (uii_readstatus.s8 + 0)
.s9:
0e24 : 98 __ __ TYA
0e25 : d0 da __ BNE $0e01 ; (uii_readstatus.s8 + 0)
.s6:
0e27 : 91 1b __ STA (ACCU + 0),y 
.s3:
0e29 : 60 __ __ RTS
--------------------------------------------------------------------
uii_change_dir: ; uii_change_dir(u8*)->void
.s4:
0e2a : a9 6a __ LDA #$6a
0e2c : 85 0d __ STA P0 
0e2e : 20 21 25 JSR $2521 ; (strlen@proxy + 0)
0e31 : a9 25 __ LDA #$25
0e33 : 85 0e __ STA P1 
0e35 : 18 __ __ CLC
0e36 : a5 1b __ LDA ACCU + 0 
0e38 : 69 02 __ ADC #$02
0e3a : 85 1b __ STA ACCU + 0 
0e3c : 90 02 __ BCC $0e40 ; (uii_change_dir.s10 + 0)
.s9:
0e3e : e6 1c __ INC ACCU + 1 
.s10:
0e40 : 20 f7 22 JSR $22f7 ; (crt_malloc + 0)
0e43 : a5 1b __ LDA ACCU + 0 
0e45 : 85 45 __ STA T1 + 0 
0e47 : a5 1c __ LDA ACCU + 1 
0e49 : 85 46 __ STA T1 + 1 
0e4b : a9 00 __ LDA #$00
0e4d : a8 __ __ TAY
0e4e : 91 1b __ STA (ACCU + 0),y 
0e50 : a9 11 __ LDA #$11
0e52 : c8 __ __ INY
0e53 : 91 1b __ STA (ACCU + 0),y 
0e55 : 20 b0 0c JSR $0cb0 ; (strlen.s4 + 0)
0e58 : a5 1b __ LDA ACCU + 0 
0e5a : 05 1c __ ORA ACCU + 1 
0e5c : f0 23 __ BEQ $0e81 ; (uii_change_dir.s5 + 0)
.s6:
0e5e : a9 00 __ LDA #$00
0e60 : 85 47 __ STA T2 + 0 
.l8:
0e62 : a9 25 __ LDA #$25
0e64 : 85 0e __ STA P1 
0e66 : a6 47 __ LDX T2 + 0 
0e68 : 8a __ __ TXA
0e69 : 18 __ __ CLC
0e6a : 69 02 __ ADC #$02
0e6c : a8 __ __ TAY
0e6d : bd 6a 25 LDA $256a,x ; (configpath + 0)
0e70 : 91 45 __ STA (T1 + 0),y 
0e72 : 20 b0 0c JSR $0cb0 ; (strlen.s4 + 0)
0e75 : e6 47 __ INC T2 + 0 
0e77 : a5 1c __ LDA ACCU + 1 
0e79 : d0 e7 __ BNE $0e62 ; (uii_change_dir.l8 + 0)
.s7:
0e7b : a5 47 __ LDA T2 + 0 
0e7d : c5 1b __ CMP ACCU + 0 
0e7f : 90 e1 __ BCC $0e62 ; (uii_change_dir.l8 + 0)
.s5:
0e81 : a9 01 __ LDA #$01
0e83 : 8d fc 19 STA $19fc ; (uii_target + 0)
0e86 : 20 21 25 JSR $2521 ; (strlen@proxy + 0)
0e89 : a5 45 __ LDA T1 + 0 
0e8b : 85 0d __ STA P0 
0e8d : a5 46 __ LDA T1 + 1 
0e8f : 85 0e __ STA P1 
0e91 : 18 __ __ CLC
0e92 : a5 1b __ LDA ACCU + 0 
0e94 : 69 02 __ ADC #$02
0e96 : 85 0f __ STA P2 
0e98 : a5 1c __ LDA ACCU + 1 
0e9a : 69 00 __ ADC #$00
0e9c : 85 10 __ STA P3 
0e9e : 20 3f 0d JSR $0d3f ; (uii_sendcommand.s4 + 0)
0ea1 : 20 ef 23 JSR $23ef ; (crt_free@proxy + 0)
0ea4 : 20 f9 0d JSR $0df9 ; (uii_readstatus.s4 + 0)
--------------------------------------------------------------------
uii_accept: ; uii_accept()->void
.s4:
0ea7 : ad 1c df LDA $df1c 
0eaa : 09 02 __ ORA #$02
0eac : 8d 1c df STA $df1c 
.l5:
0eaf : ad 1c df LDA $df1c 
0eb2 : 29 02 __ AND #$02
0eb4 : d0 f9 __ BNE $0eaf ; (uii_accept.l5 + 0)
.s3:
0eb6 : 60 __ __ RTS
--------------------------------------------------------------------
0eb7 : __ __ __ BYT 56 32 2e 30 2e 30 2d 32 30 32 35 31 30 31 38 2d : V2.0.0-20251018-
0ec7 : __ __ __ BYT 31 37 32 35 00                                  : 1725.
--------------------------------------------------------------------
error: ; error(const u8*)->void
.s1:
0ecc : 38 __ __ SEC
0ecd : a5 23 __ LDA SP + 0 
0ecf : e9 09 __ SBC #$09
0ed1 : 85 23 __ STA SP + 0 
0ed3 : b0 02 __ BCS $0ed7 ; (error.s4 + 0)
0ed5 : c6 24 __ DEC SP + 1 
.s4:
0ed7 : a9 19 __ LDA #$19
0ed9 : a0 05 __ LDY #$05
0edb : 91 23 __ STA (SP + 0),y 
0edd : a9 15 __ LDA #$15
0edf : c8 __ __ INY
0ee0 : 91 23 __ STA (SP + 0),y 
0ee2 : ad fc 9f LDA $9ffc ; (sstack + 4)
0ee5 : c8 __ __ INY
0ee6 : 91 23 __ STA (SP + 0),y 
0ee8 : ad fd 9f LDA $9ffd ; (sstack + 5)
0eeb : c8 __ __ INY
0eec : 91 23 __ STA (SP + 0),y 
0eee : 20 0b 0f JSR $0f0b ; (cwin_console_printf.s4 + 0)
0ef1 : a9 01 __ LDA #$01
0ef3 : 85 0d __ STA P0 
0ef5 : a9 00 __ LDA #$00
0ef7 : 85 0e __ STA P1 
0ef9 : 20 3a 15 JSR $153a ; (cwin_getch.s4 + 0)
0efc : 20 50 15 JSR $1550 ; (exit.s4 + 0)
.s3:
0eff : 18 __ __ CLC
0f00 : a5 23 __ LDA SP + 0 
0f02 : 69 09 __ ADC #$09
0f04 : 85 23 __ STA SP + 0 
0f06 : 90 02 __ BCC $0f0a ; (error.s3 + 11)
0f08 : e6 24 __ INC SP + 1 
0f0a : 60 __ __ RTS
--------------------------------------------------------------------
cwin_console_printf: ; cwin_console_printf(struct CharWin*,u8,const u8*)->void
.s4:
0f0b : a9 18 __ LDA #$18
0f0d : 85 16 __ STA P9 
0f0f : a9 9f __ LDA #$9f
0f11 : 85 17 __ STA P10 
0f13 : a0 05 __ LDY #$05
0f15 : b1 23 __ LDA (SP + 0),y 
0f17 : 8d f8 9f STA $9ff8 ; (sstack + 0)
0f1a : c8 __ __ INY
0f1b : b1 23 __ LDA (SP + 0),y 
0f1d : 8d f9 9f STA $9ff9 ; (sstack + 1)
0f20 : 18 __ __ CLC
0f21 : a5 23 __ LDA SP + 0 
0f23 : 69 07 __ ADC #$07
0f25 : 8d fa 9f STA $9ffa ; (sstack + 2)
0f28 : a5 24 __ LDA SP + 1 
0f2a : 69 00 __ ADC #$00
0f2c : 8d fb 9f STA $9ffb ; (sstack + 3)
0f2f : 20 b9 0f JSR $0fb9 ; (sformat.s4 + 0)
0f32 : a9 18 __ LDA #$18
0f34 : 85 11 __ STA P4 ; (fmt + 1)
0f36 : a9 9f __ LDA #$9f
0f38 : 85 12 __ STA P5 ; (fmt + 2)
--------------------------------------------------------------------
cwin_console_write_string: ; cwin_console_write_string(struct CharWin*,const u8*,u8)->void
.s4:
0f3a : ad ef 25 LDA $25ef ; (cw + 4)
0f3d : 8d f1 25 STA $25f1 ; (cw + 6)
0f40 : ad f0 25 LDA $25f0 ; (cw + 5)
0f43 : 8d f2 25 STA $25f2 ; (cw + 7)
0f46 : a9 00 __ LDA #$00
0f48 : 85 4a __ STA T4 + 0 
0f4a : f0 02 __ BEQ $0f4e ; (cwin_console_write_string.l5 + 0)
.s9:
0f4c : e6 4a __ INC T4 + 0 
.l5:
0f4e : a4 4a __ LDY T4 + 0 
0f50 : b1 11 __ LDA (P4),y ; (chars + 0)
0f52 : d0 01 __ BNE $0f55 ; (cwin_console_write_string.s6 + 0)
.s3:
0f54 : 60 __ __ RTS
.s6:
0f55 : c9 0a __ CMP #$0a
0f57 : d0 06 __ BNE $0f5f ; (cwin_console_write_string.s7 + 0)
.s11:
0f59 : 20 dc 0b JSR $0bdc ; (cwin_console_newline.s4 + 0)
0f5c : 4c 4c 0f JMP $0f4c ; (cwin_console_write_string.s9 + 0)
.s7:
0f5f : 85 4b __ STA T5 + 0 
0f61 : ad ef 25 LDA $25ef ; (cw + 4)
0f64 : cd ed 25 CMP $25ed ; (cw + 2)
0f67 : d0 03 __ BNE $0f6c ; (cwin_console_write_string.s8 + 0)
.s10:
0f69 : 20 dc 0b JSR $0bdc ; (cwin_console_newline.s4 + 0)
.s8:
0f6c : ad f0 25 LDA $25f0 ; (cw + 5)
0f6f : 0a __ __ ASL
0f70 : aa __ __ TAX
0f71 : bd 28 25 LDA $2528,x ; (mul40 + 0)
0f74 : 6d ef 25 ADC $25ef ; (cw + 4)
0f77 : 85 43 __ STA T0 + 0 
0f79 : bd 29 25 LDA $2529,x ; (mul40 + 1)
0f7c : 69 00 __ ADC #$00
0f7e : 85 44 __ STA T0 + 1 
0f80 : a5 4b __ LDA T5 + 0 
0f82 : 4a __ __ LSR
0f83 : 4a __ __ LSR
0f84 : 4a __ __ LSR
0f85 : 4a __ __ LSR
0f86 : 4a __ __ LSR
0f87 : aa __ __ TAX
0f88 : ad f3 25 LDA $25f3 ; (cw + 8)
0f8b : 18 __ __ CLC
0f8c : 65 43 __ ADC T0 + 0 
0f8e : 85 45 __ STA T1 + 0 
0f90 : ad f4 25 LDA $25f4 ; (cw + 9)
0f93 : 65 44 __ ADC T0 + 1 
0f95 : 85 46 __ STA T1 + 1 
0f97 : bd 62 25 LDA $2562,x ; (p2smap + 0)
0f9a : 45 4b __ EOR T5 + 0 
0f9c : a0 00 __ LDY #$00
0f9e : 91 45 __ STA (T1 + 0),y 
0fa0 : ad f5 25 LDA $25f5 ; (cw + 10)
0fa3 : 18 __ __ CLC
0fa4 : 65 43 __ ADC T0 + 0 
0fa6 : 85 45 __ STA T1 + 0 
0fa8 : ad f6 25 LDA $25f6 ; (cw + 11)
0fab : 65 44 __ ADC T0 + 1 
0fad : 85 46 __ STA T1 + 1 
0faf : a9 07 __ LDA #$07
0fb1 : 91 45 __ STA (T1 + 0),y 
0fb3 : ee ef 25 INC $25ef ; (cw + 4)
0fb6 : 4c 4c 0f JMP $0f4c ; (cwin_console_write_string.s9 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->void
.s4:
0fb9 : ad f8 9f LDA $9ff8 ; (sstack + 0)
0fbc : 85 48 __ STA T2 + 0 
0fbe : a9 00 __ LDA #$00
0fc0 : 85 45 __ STA T4 + 0 
0fc2 : ad f9 9f LDA $9ff9 ; (sstack + 1)
0fc5 : 85 49 __ STA T2 + 1 
.l5:
0fc7 : a0 00 __ LDY #$00
0fc9 : b1 48 __ LDA (T2 + 0),y 
0fcb : d0 05 __ BNE $0fd2 ; (sformat.s7 + 0)
.s6:
0fcd : a4 45 __ LDY T4 + 0 
0fcf : 91 16 __ STA (P9),y ; (buff + 0)
.s3:
0fd1 : 60 __ __ RTS
.s7:
0fd2 : c9 25 __ CMP #$25
0fd4 : f0 22 __ BEQ $0ff8 ; (sformat.s10 + 0)
.s8:
0fd6 : a4 45 __ LDY T4 + 0 
0fd8 : 91 16 __ STA (P9),y ; (buff + 0)
0fda : e6 48 __ INC T2 + 0 
0fdc : d0 02 __ BNE $0fe0 ; (sformat.s98 + 0)
.s97:
0fde : e6 49 __ INC T2 + 1 
.s98:
0fe0 : c8 __ __ INY
0fe1 : 84 45 __ STY T4 + 0 
0fe3 : 98 __ __ TYA
0fe4 : c0 28 __ CPY #$28
0fe6 : 90 df __ BCC $0fc7 ; (sformat.l5 + 0)
.s9:
0fe8 : 18 __ __ CLC
0fe9 : 65 16 __ ADC P9 ; (buff + 0)
0feb : 85 16 __ STA P9 ; (buff + 0)
0fed : 90 02 __ BCC $0ff1 ; (sformat.s100 + 0)
.s99:
0fef : e6 17 __ INC P10 ; (buff + 1)
.s100:
0ff1 : a9 00 __ LDA #$00
.s76:
0ff3 : 85 45 __ STA T4 + 0 
0ff5 : 4c c7 0f JMP $0fc7 ; (sformat.l5 + 0)
.s10:
0ff8 : 8c e7 9f STY $9fe7 ; (si + 7)
0ffb : a5 45 __ LDA T4 + 0 
0ffd : f0 0c __ BEQ $100b ; (sformat.s11 + 0)
.s74:
0fff : 84 45 __ STY T4 + 0 
1001 : 18 __ __ CLC
1002 : 65 16 __ ADC P9 ; (buff + 0)
1004 : 85 16 __ STA P9 ; (buff + 0)
1006 : 90 02 __ BCC $100a ; (sformat.s85 + 0)
.s84:
1008 : e6 17 __ INC P10 ; (buff + 1)
.s85:
100a : 98 __ __ TYA
.s11:
100b : 8d e5 9f STA $9fe5 ; (si + 5)
100e : 8d e6 9f STA $9fe6 ; (si + 6)
1011 : a0 01 __ LDY #$01
1013 : b1 48 __ LDA (T2 + 0),y 
1015 : a2 20 __ LDX #$20
1017 : 8e e0 9f STX $9fe0 ; (si + 0)
101a : a2 00 __ LDX #$00
101c : 8e e1 9f STX $9fe1 ; (si + 1)
101f : ca __ __ DEX
1020 : 8e e2 9f STX $9fe2 ; (si + 2)
1023 : a2 0a __ LDX #$0a
1025 : 8e e4 9f STX $9fe4 ; (si + 4)
1028 : aa __ __ TAX
1029 : a9 02 __ LDA #$02
102b : d0 07 __ BNE $1034 ; (sformat.l12 + 0)
.s70:
102d : a0 00 __ LDY #$00
102f : b1 48 __ LDA (T2 + 0),y 
1031 : aa __ __ TAX
1032 : a9 01 __ LDA #$01
.l12:
1034 : 18 __ __ CLC
1035 : 65 48 __ ADC T2 + 0 
1037 : 85 48 __ STA T2 + 0 
1039 : 90 02 __ BCC $103d ; (sformat.s87 + 0)
.s86:
103b : e6 49 __ INC T2 + 1 
.s87:
103d : 8a __ __ TXA
103e : e0 2b __ CPX #$2b
1040 : d0 07 __ BNE $1049 ; (sformat.s13 + 0)
.s73:
1042 : a9 01 __ LDA #$01
1044 : 8d e5 9f STA $9fe5 ; (si + 5)
1047 : d0 e4 __ BNE $102d ; (sformat.s70 + 0)
.s13:
1049 : c9 30 __ CMP #$30
104b : d0 06 __ BNE $1053 ; (sformat.s14 + 0)
.s72:
104d : 8d e0 9f STA $9fe0 ; (si + 0)
1050 : 4c 2d 10 JMP $102d ; (sformat.s70 + 0)
.s14:
1053 : c9 23 __ CMP #$23
1055 : d0 07 __ BNE $105e ; (sformat.s15 + 0)
.s71:
1057 : a9 01 __ LDA #$01
1059 : 8d e7 9f STA $9fe7 ; (si + 7)
105c : d0 cf __ BNE $102d ; (sformat.s70 + 0)
.s15:
105e : c9 2d __ CMP #$2d
1060 : d0 07 __ BNE $1069 ; (sformat.s16 + 0)
.s69:
1062 : a9 01 __ LDA #$01
1064 : 8d e6 9f STA $9fe6 ; (si + 6)
1067 : d0 c4 __ BNE $102d ; (sformat.s70 + 0)
.s16:
1069 : 85 1b __ STA ACCU + 0 ; (fps + 0)
106b : c9 30 __ CMP #$30
106d : 90 31 __ BCC $10a0 ; (sformat.s17 + 0)
.s64:
106f : c9 3a __ CMP #$3a
1071 : b0 5e __ BCS $10d1 ; (sformat.s18 + 0)
.s65:
1073 : a9 00 __ LDA #$00
1075 : 85 43 __ STA T1 + 0 
.l66:
1077 : a5 43 __ LDA T1 + 0 
1079 : 0a __ __ ASL
107a : 0a __ __ ASL
107b : 18 __ __ CLC
107c : 65 43 __ ADC T1 + 0 
107e : 0a __ __ ASL
107f : 18 __ __ CLC
1080 : 65 1b __ ADC ACCU + 0 ; (fps + 0)
1082 : 38 __ __ SEC
1083 : e9 30 __ SBC #$30
1085 : 85 43 __ STA T1 + 0 
1087 : a0 00 __ LDY #$00
1089 : b1 48 __ LDA (T2 + 0),y 
108b : 85 1b __ STA ACCU + 0 ; (fps + 0)
108d : e6 48 __ INC T2 + 0 
108f : d0 02 __ BNE $1093 ; (sformat.s96 + 0)
.s95:
1091 : e6 49 __ INC T2 + 1 
.s96:
1093 : c9 30 __ CMP #$30
1095 : 90 04 __ BCC $109b ; (sformat.s67 + 0)
.s68:
1097 : c9 3a __ CMP #$3a
1099 : 90 dc __ BCC $1077 ; (sformat.l66 + 0)
.s67:
109b : a6 43 __ LDX T1 + 0 
109d : 8e e1 9f STX $9fe1 ; (si + 1)
.s17:
10a0 : c9 2e __ CMP #$2e
10a2 : d0 2d __ BNE $10d1 ; (sformat.s18 + 0)
.s59:
10a4 : a9 00 __ LDA #$00
10a6 : f0 0e __ BEQ $10b6 ; (sformat.l60 + 0)
.s63:
10a8 : a5 46 __ LDA T0 + 0 
10aa : 0a __ __ ASL
10ab : 0a __ __ ASL
10ac : 18 __ __ CLC
10ad : 65 46 __ ADC T0 + 0 
10af : 0a __ __ ASL
10b0 : 18 __ __ CLC
10b1 : 65 1b __ ADC ACCU + 0 ; (fps + 0)
10b3 : 38 __ __ SEC
10b4 : e9 30 __ SBC #$30
.l60:
10b6 : 85 46 __ STA T0 + 0 
10b8 : a0 00 __ LDY #$00
10ba : b1 48 __ LDA (T2 + 0),y 
10bc : 85 1b __ STA ACCU + 0 ; (fps + 0)
10be : e6 48 __ INC T2 + 0 
10c0 : d0 02 __ BNE $10c4 ; (sformat.s89 + 0)
.s88:
10c2 : e6 49 __ INC T2 + 1 
.s89:
10c4 : c9 30 __ CMP #$30
10c6 : 90 04 __ BCC $10cc ; (sformat.s61 + 0)
.s62:
10c8 : c9 3a __ CMP #$3a
10ca : 90 dc __ BCC $10a8 ; (sformat.s63 + 0)
.s61:
10cc : a6 46 __ LDX T0 + 0 
10ce : 8e e2 9f STX $9fe2 ; (si + 2)
.s18:
10d1 : c9 64 __ CMP #$64
10d3 : f0 0c __ BEQ $10e1 ; (sformat.s58 + 0)
.s19:
10d5 : c9 44 __ CMP #$44
10d7 : f0 08 __ BEQ $10e1 ; (sformat.s58 + 0)
.s20:
10d9 : c9 69 __ CMP #$69
10db : f0 04 __ BEQ $10e1 ; (sformat.s58 + 0)
.s21:
10dd : c9 49 __ CMP #$49
10df : d0 05 __ BNE $10e6 ; (sformat.s22 + 0)
.s58:
10e1 : a9 01 __ LDA #$01
10e3 : 4c 73 12 JMP $1273 ; (sformat.s57 + 0)
.s22:
10e6 : c9 75 __ CMP #$75
10e8 : d0 03 __ BNE $10ed ; (sformat.s23 + 0)
10ea : 4c 71 12 JMP $1271 ; (sformat.s101 + 0)
.s23:
10ed : c9 55 __ CMP #$55
10ef : f0 f9 __ BEQ $10ea ; (sformat.s22 + 4)
.s24:
10f1 : c9 78 __ CMP #$78
10f3 : f0 04 __ BEQ $10f9 ; (sformat.s56 + 0)
.s25:
10f5 : c9 58 __ CMP #$58
10f7 : d0 11 __ BNE $110a ; (sformat.s26 + 0)
.s56:
10f9 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
10fb : 29 e0 __ AND #$e0
10fd : 09 01 __ ORA #$01
10ff : 8d e3 9f STA $9fe3 ; (si + 3)
1102 : a9 10 __ LDA #$10
1104 : 8d e4 9f STA $9fe4 ; (si + 4)
1107 : 4c 71 12 JMP $1271 ; (sformat.s101 + 0)
.s26:
110a : c9 6c __ CMP #$6c
110c : d0 03 __ BNE $1111 ; (sformat.s27 + 0)
110e : 4c e9 11 JMP $11e9 ; (sformat.s44 + 0)
.s27:
1111 : c9 4c __ CMP #$4c
1113 : f0 f9 __ BEQ $110e ; (sformat.s26 + 4)
.s28:
1115 : c9 73 __ CMP #$73
1117 : f0 3c __ BEQ $1155 ; (sformat.s36 + 0)
.s29:
1119 : c9 53 __ CMP #$53
111b : f0 38 __ BEQ $1155 ; (sformat.s36 + 0)
.s30:
111d : c9 63 __ CMP #$63
111f : f0 13 __ BEQ $1134 ; (sformat.s35 + 0)
.s31:
1121 : c9 43 __ CMP #$43
1123 : f0 0f __ BEQ $1134 ; (sformat.s35 + 0)
.s32:
1125 : aa __ __ TAX
1126 : d0 03 __ BNE $112b ; (sformat.s33 + 0)
1128 : 4c c7 0f JMP $0fc7 ; (sformat.l5 + 0)
.s33:
112b : a0 00 __ LDY #$00
112d : 91 16 __ STA (P9),y ; (buff + 0)
.s34:
112f : a9 01 __ LDA #$01
1131 : 4c f3 0f JMP $0ff3 ; (sformat.s76 + 0)
.s35:
1134 : ad fa 9f LDA $9ffa ; (sstack + 2)
1137 : 85 46 __ STA T0 + 0 
1139 : ad fb 9f LDA $9ffb ; (sstack + 3)
113c : 85 47 __ STA T0 + 1 
113e : a0 00 __ LDY #$00
1140 : b1 46 __ LDA (T0 + 0),y 
1142 : 91 16 __ STA (P9),y ; (buff + 0)
1144 : a5 46 __ LDA T0 + 0 
1146 : 69 01 __ ADC #$01
1148 : 8d fa 9f STA $9ffa ; (sstack + 2)
114b : a5 47 __ LDA T0 + 1 
114d : 69 00 __ ADC #$00
114f : 8d fb 9f STA $9ffb ; (sstack + 3)
1152 : 4c 2f 11 JMP $112f ; (sformat.s34 + 0)
.s36:
1155 : ad fa 9f LDA $9ffa ; (sstack + 2)
1158 : 85 46 __ STA T0 + 0 
115a : 69 01 __ ADC #$01
115c : 8d fa 9f STA $9ffa ; (sstack + 2)
115f : ad fb 9f LDA $9ffb ; (sstack + 3)
1162 : 85 47 __ STA T0 + 1 
1164 : 69 00 __ ADC #$00
1166 : 8d fb 9f STA $9ffb ; (sstack + 3)
1169 : a0 00 __ LDY #$00
116b : 84 1b __ STY ACCU + 0 ; (fps + 0)
116d : b1 46 __ LDA (T0 + 0),y 
116f : aa __ __ TAX
1170 : c8 __ __ INY
1171 : b1 46 __ LDA (T0 + 0),y 
1173 : 86 46 __ STX T0 + 0 
1175 : 85 47 __ STA T0 + 1 
1177 : ad e1 9f LDA $9fe1 ; (si + 1)
117a : f0 0c __ BEQ $1188 ; (sformat.s37 + 0)
.s81:
117c : 88 __ __ DEY
117d : b1 46 __ LDA (T0 + 0),y 
117f : f0 05 __ BEQ $1186 ; (sformat.s82 + 0)
.l43:
1181 : c8 __ __ INY
1182 : b1 46 __ LDA (T0 + 0),y 
1184 : d0 fb __ BNE $1181 ; (sformat.l43 + 0)
.s82:
1186 : 84 1b __ STY ACCU + 0 ; (fps + 0)
.s37:
1188 : ad e6 9f LDA $9fe6 ; (si + 6)
118b : 85 1c __ STA ACCU + 1 ; (fps + 1)
118d : d0 19 __ BNE $11a8 ; (sformat.s38 + 0)
.s79:
118f : a6 1b __ LDX ACCU + 0 ; (fps + 0)
1191 : ec e1 9f CPX $9fe1 ; (si + 1)
1194 : a0 00 __ LDY #$00
1196 : b0 0c __ BCS $11a4 ; (sformat.s80 + 0)
.l42:
1198 : ad e0 9f LDA $9fe0 ; (si + 0)
119b : 91 16 __ STA (P9),y ; (buff + 0)
119d : c8 __ __ INY
119e : e8 __ __ INX
119f : ec e1 9f CPX $9fe1 ; (si + 1)
11a2 : 90 f4 __ BCC $1198 ; (sformat.l42 + 0)
.s80:
11a4 : 86 1b __ STX ACCU + 0 ; (fps + 0)
11a6 : 84 45 __ STY T4 + 0 
.s38:
11a8 : a0 00 __ LDY #$00
11aa : b1 46 __ LDA (T0 + 0),y 
11ac : f0 1a __ BEQ $11c8 ; (sformat.s39 + 0)
.s41:
11ae : e6 46 __ INC T0 + 0 
11b0 : d0 02 __ BNE $11b4 ; (sformat.l75 + 0)
.s92:
11b2 : e6 47 __ INC T0 + 1 
.l75:
11b4 : a4 45 __ LDY T4 + 0 
11b6 : 91 16 __ STA (P9),y ; (buff + 0)
11b8 : e6 45 __ INC T4 + 0 
11ba : a0 00 __ LDY #$00
11bc : b1 46 __ LDA (T0 + 0),y 
11be : a8 __ __ TAY
11bf : e6 46 __ INC T0 + 0 
11c1 : d0 02 __ BNE $11c5 ; (sformat.s94 + 0)
.s93:
11c3 : e6 47 __ INC T0 + 1 
.s94:
11c5 : 98 __ __ TYA
11c6 : d0 ec __ BNE $11b4 ; (sformat.l75 + 0)
.s39:
11c8 : a5 1c __ LDA ACCU + 1 ; (fps + 1)
11ca : d0 03 __ BNE $11cf ; (sformat.s78 + 0)
11cc : 4c c7 0f JMP $0fc7 ; (sformat.l5 + 0)
.s78:
11cf : a6 1b __ LDX ACCU + 0 ; (fps + 0)
11d1 : ec e1 9f CPX $9fe1 ; (si + 1)
11d4 : a4 45 __ LDY T4 + 0 
11d6 : b0 0c __ BCS $11e4 ; (sformat.s83 + 0)
.l40:
11d8 : ad e0 9f LDA $9fe0 ; (si + 0)
11db : 91 16 __ STA (P9),y ; (buff + 0)
11dd : c8 __ __ INY
11de : e8 __ __ INX
11df : ec e1 9f CPX $9fe1 ; (si + 1)
11e2 : 90 f4 __ BCC $11d8 ; (sformat.l40 + 0)
.s83:
11e4 : 84 45 __ STY T4 + 0 
11e6 : 4c c7 0f JMP $0fc7 ; (sformat.l5 + 0)
.s44:
11e9 : ad fa 9f LDA $9ffa ; (sstack + 2)
11ec : 85 46 __ STA T0 + 0 
11ee : 69 03 __ ADC #$03
11f0 : 8d fa 9f STA $9ffa ; (sstack + 2)
11f3 : ad fb 9f LDA $9ffb ; (sstack + 3)
11f6 : 85 47 __ STA T0 + 1 
11f8 : 69 00 __ ADC #$00
11fa : 8d fb 9f STA $9ffb ; (sstack + 3)
11fd : a0 00 __ LDY #$00
11ff : b1 48 __ LDA (T2 + 0),y 
1201 : aa __ __ TAX
1202 : e6 48 __ INC T2 + 0 
1204 : d0 02 __ BNE $1208 ; (sformat.s91 + 0)
.s90:
1206 : e6 49 __ INC T2 + 1 
.s91:
1208 : b1 46 __ LDA (T0 + 0),y 
120a : 85 11 __ STA P4 
120c : a0 01 __ LDY #$01
120e : b1 46 __ LDA (T0 + 0),y 
1210 : 85 12 __ STA P5 
1212 : c8 __ __ INY
1213 : b1 46 __ LDA (T0 + 0),y 
1215 : 85 13 __ STA P6 
1217 : c8 __ __ INY
1218 : b1 46 __ LDA (T0 + 0),y 
121a : 85 14 __ STA P7 
121c : 8a __ __ TXA
121d : e0 64 __ CPX #$64
121f : f0 0c __ BEQ $122d ; (sformat.s55 + 0)
.s45:
1221 : c9 44 __ CMP #$44
1223 : f0 08 __ BEQ $122d ; (sformat.s55 + 0)
.s46:
1225 : c9 69 __ CMP #$69
1227 : f0 04 __ BEQ $122d ; (sformat.s55 + 0)
.s47:
1229 : c9 49 __ CMP #$49
122b : d0 1c __ BNE $1249 ; (sformat.s48 + 0)
.s55:
122d : a9 01 __ LDA #$01
.s77:
122f : 85 15 __ STA P8 
.s53:
1231 : a5 16 __ LDA P9 ; (buff + 0)
1233 : 85 0f __ STA P2 
1235 : a5 17 __ LDA P10 ; (buff + 1)
1237 : 85 10 __ STA P3 
1239 : a9 e0 __ LDA #$e0
123b : 85 0d __ STA P0 
123d : a9 9f __ LDA #$9f
123f : 85 0e __ STA P1 
1241 : 20 cc 13 JSR $13cc ; (nforml.s4 + 0)
1244 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
1246 : 4c f3 0f JMP $0ff3 ; (sformat.s76 + 0)
.s48:
1249 : c9 75 __ CMP #$75
124b : f0 04 __ BEQ $1251 ; (sformat.s54 + 0)
.s49:
124d : c9 55 __ CMP #$55
124f : d0 04 __ BNE $1255 ; (sformat.s50 + 0)
.s54:
1251 : a9 00 __ LDA #$00
1253 : f0 da __ BEQ $122f ; (sformat.s77 + 0)
.s50:
1255 : c9 78 __ CMP #$78
1257 : f0 04 __ BEQ $125d ; (sformat.s52 + 0)
.s51:
1259 : c9 58 __ CMP #$58
125b : d0 89 __ BNE $11e6 ; (sformat.s83 + 2)
.s52:
125d : a9 10 __ LDA #$10
125f : 8d e4 9f STA $9fe4 ; (si + 4)
1262 : a9 00 __ LDA #$00
1264 : 85 15 __ STA P8 
1266 : 8a __ __ TXA
1267 : 29 e0 __ AND #$e0
1269 : 09 01 __ ORA #$01
126b : 8d e3 9f STA $9fe3 ; (si + 3)
126e : 4c 31 12 JMP $1231 ; (sformat.s53 + 0)
.s101:
1271 : a9 00 __ LDA #$00
.s57:
1273 : 85 13 __ STA P6 
1275 : a5 16 __ LDA P9 ; (buff + 0)
1277 : 85 0f __ STA P2 
1279 : a5 17 __ LDA P10 ; (buff + 1)
127b : 85 10 __ STA P3 
127d : ad fa 9f LDA $9ffa ; (sstack + 2)
1280 : 85 46 __ STA T0 + 0 
1282 : ad fb 9f LDA $9ffb ; (sstack + 3)
1285 : 85 47 __ STA T0 + 1 
1287 : a0 00 __ LDY #$00
1289 : b1 46 __ LDA (T0 + 0),y 
128b : 85 11 __ STA P4 
128d : c8 __ __ INY
128e : b1 46 __ LDA (T0 + 0),y 
1290 : 85 12 __ STA P5 
1292 : 18 __ __ CLC
1293 : a5 46 __ LDA T0 + 0 
1295 : 69 02 __ ADC #$02
1297 : 8d fa 9f STA $9ffa ; (sstack + 2)
129a : a5 47 __ LDA T0 + 1 
129c : 69 00 __ ADC #$00
129e : 8d fb 9f STA $9ffb ; (sstack + 3)
12a1 : a9 e0 __ LDA #$e0
12a3 : 85 0d __ STA P0 
12a5 : a9 9f __ LDA #$9f
12a7 : 85 0e __ STA P1 
12a9 : 20 af 12 JSR $12af ; (nformi.s4 + 0)
12ac : 4c f3 0f JMP $0ff3 ; (sformat.s76 + 0)
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
.s4:
12af : a9 00 __ LDA #$00
12b1 : 85 43 __ STA T5 + 0 
12b3 : a0 04 __ LDY #$04
12b5 : b1 0d __ LDA (P0),y ; (si + 0)
12b7 : 85 44 __ STA T6 + 0 
12b9 : a5 13 __ LDA P6 ; (s + 0)
12bb : f0 13 __ BEQ $12d0 ; (nformi.s5 + 0)
.s33:
12bd : 24 12 __ BIT P5 ; (v + 1)
12bf : 10 0f __ BPL $12d0 ; (nformi.s5 + 0)
.s34:
12c1 : 38 __ __ SEC
12c2 : a9 00 __ LDA #$00
12c4 : e5 11 __ SBC P4 ; (v + 0)
12c6 : 85 11 __ STA P4 ; (v + 0)
12c8 : a9 00 __ LDA #$00
12ca : e5 12 __ SBC P5 ; (v + 1)
12cc : 85 12 __ STA P5 ; (v + 1)
12ce : e6 43 __ INC T5 + 0 
.s5:
12d0 : a9 10 __ LDA #$10
12d2 : 85 45 __ STA T7 + 0 
12d4 : a5 11 __ LDA P4 ; (v + 0)
12d6 : 05 12 __ ORA P5 ; (v + 1)
12d8 : f0 33 __ BEQ $130d ; (nformi.s6 + 0)
.s28:
12da : a5 11 __ LDA P4 ; (v + 0)
12dc : 85 1b __ STA ACCU + 0 
12de : a5 12 __ LDA P5 ; (v + 1)
12e0 : 85 1c __ STA ACCU + 1 
.l29:
12e2 : a5 44 __ LDA T6 + 0 
12e4 : 85 03 __ STA WORK + 0 
12e6 : a9 00 __ LDA #$00
12e8 : 85 04 __ STA WORK + 1 
12ea : 20 7d 21 JSR $217d ; (divmod + 0)
12ed : a5 05 __ LDA WORK + 2 
12ef : c9 0a __ CMP #$0a
12f1 : b0 04 __ BCS $12f7 ; (nformi.s32 + 0)
.s30:
12f3 : a9 30 __ LDA #$30
12f5 : 90 06 __ BCC $12fd ; (nformi.s31 + 0)
.s32:
12f7 : a0 03 __ LDY #$03
12f9 : b1 0d __ LDA (P0),y ; (si + 0)
12fb : e9 0a __ SBC #$0a
.s31:
12fd : 18 __ __ CLC
12fe : 65 05 __ ADC WORK + 2 
1300 : a6 45 __ LDX T7 + 0 
1302 : 9d e7 9f STA $9fe7,x ; (si + 7)
1305 : c6 45 __ DEC T7 + 0 
1307 : a5 1b __ LDA ACCU + 0 
1309 : 05 1c __ ORA ACCU + 1 
130b : d0 d5 __ BNE $12e2 ; (nformi.l29 + 0)
.s6:
130d : a0 02 __ LDY #$02
130f : b1 0d __ LDA (P0),y ; (si + 0)
1311 : c9 ff __ CMP #$ff
1313 : d0 04 __ BNE $1319 ; (nformi.s27 + 0)
.s7:
1315 : a9 0f __ LDA #$0f
1317 : d0 05 __ BNE $131e ; (nformi.s39 + 0)
.s27:
1319 : 38 __ __ SEC
131a : a9 10 __ LDA #$10
131c : f1 0d __ SBC (P0),y ; (si + 0)
.s39:
131e : a8 __ __ TAY
131f : c4 45 __ CPY T7 + 0 
1321 : b0 0d __ BCS $1330 ; (nformi.s8 + 0)
.s26:
1323 : a9 30 __ LDA #$30
.l40:
1325 : a6 45 __ LDX T7 + 0 
1327 : 9d e7 9f STA $9fe7,x ; (si + 7)
132a : c6 45 __ DEC T7 + 0 
132c : c4 45 __ CPY T7 + 0 
132e : 90 f5 __ BCC $1325 ; (nformi.l40 + 0)
.s8:
1330 : a0 07 __ LDY #$07
1332 : b1 0d __ LDA (P0),y ; (si + 0)
1334 : f0 1e __ BEQ $1354 ; (nformi.s9 + 0)
.s24:
1336 : a5 44 __ LDA T6 + 0 
1338 : c9 10 __ CMP #$10
133a : d0 18 __ BNE $1354 ; (nformi.s9 + 0)
.s25:
133c : a0 03 __ LDY #$03
133e : b1 0d __ LDA (P0),y ; (si + 0)
1340 : a8 __ __ TAY
1341 : a9 30 __ LDA #$30
1343 : a6 45 __ LDX T7 + 0 
1345 : 9d e6 9f STA $9fe6,x ; (si + 6)
1348 : 98 __ __ TYA
1349 : 69 16 __ ADC #$16
134b : 9d e7 9f STA $9fe7,x ; (si + 7)
134e : 8a __ __ TXA
134f : 18 __ __ CLC
1350 : 69 fe __ ADC #$fe
1352 : 85 45 __ STA T7 + 0 
.s9:
1354 : a9 00 __ LDA #$00
1356 : 85 1b __ STA ACCU + 0 
1358 : a5 43 __ LDA T5 + 0 
135a : f0 0c __ BEQ $1368 ; (nformi.s10 + 0)
.s23:
135c : a9 2d __ LDA #$2d
.s22:
135e : a6 45 __ LDX T7 + 0 
1360 : 9d e7 9f STA $9fe7,x ; (si + 7)
1363 : c6 45 __ DEC T7 + 0 
1365 : 4c 72 13 JMP $1372 ; (nformi.s11 + 0)
.s10:
1368 : a0 05 __ LDY #$05
136a : b1 0d __ LDA (P0),y ; (si + 0)
136c : f0 04 __ BEQ $1372 ; (nformi.s11 + 0)
.s21:
136e : a9 2b __ LDA #$2b
1370 : d0 ec __ BNE $135e ; (nformi.s22 + 0)
.s11:
1372 : a0 06 __ LDY #$06
1374 : a6 45 __ LDX T7 + 0 
1376 : b1 0d __ LDA (P0),y ; (si + 0)
1378 : d0 2b __ BNE $13a5 ; (nformi.s17 + 0)
.l12:
137a : 8a __ __ TXA
137b : 18 __ __ CLC
137c : a0 01 __ LDY #$01
137e : 71 0d __ ADC (P0),y ; (si + 0)
1380 : b0 04 __ BCS $1386 ; (nformi.s15 + 0)
.s16:
1382 : c9 11 __ CMP #$11
1384 : 90 0a __ BCC $1390 ; (nformi.s13 + 0)
.s15:
1386 : a0 00 __ LDY #$00
1388 : b1 0d __ LDA (P0),y ; (si + 0)
138a : 9d e7 9f STA $9fe7,x ; (si + 7)
138d : ca __ __ DEX
138e : b0 ea __ BCS $137a ; (nformi.l12 + 0)
.s13:
1390 : e0 10 __ CPX #$10
1392 : b0 0e __ BCS $13a2 ; (nformi.s41 + 0)
.s14:
1394 : 88 __ __ DEY
.l37:
1395 : bd e8 9f LDA $9fe8,x ; (buffer + 0)
1398 : 91 0f __ STA (P2),y ; (str + 0)
139a : c8 __ __ INY
139b : e8 __ __ INX
139c : e0 10 __ CPX #$10
139e : 90 f5 __ BCC $1395 ; (nformi.l37 + 0)
.s38:
13a0 : 84 1b __ STY ACCU + 0 
.s41:
13a2 : a5 1b __ LDA ACCU + 0 
.s3:
13a4 : 60 __ __ RTS
.s17:
13a5 : e0 10 __ CPX #$10
13a7 : b0 1a __ BCS $13c3 ; (nformi.l18 + 0)
.s20:
13a9 : a0 00 __ LDY #$00
.l35:
13ab : bd e8 9f LDA $9fe8,x ; (buffer + 0)
13ae : 91 0f __ STA (P2),y ; (str + 0)
13b0 : c8 __ __ INY
13b1 : e8 __ __ INX
13b2 : e0 10 __ CPX #$10
13b4 : 90 f5 __ BCC $13ab ; (nformi.l35 + 0)
.s36:
13b6 : 84 1b __ STY ACCU + 0 
13b8 : b0 09 __ BCS $13c3 ; (nformi.l18 + 0)
.s19:
13ba : 88 __ __ DEY
13bb : b1 0d __ LDA (P0),y ; (si + 0)
13bd : a4 1b __ LDY ACCU + 0 
13bf : 91 0f __ STA (P2),y ; (str + 0)
13c1 : e6 1b __ INC ACCU + 0 
.l18:
13c3 : a5 1b __ LDA ACCU + 0 
13c5 : a0 01 __ LDY #$01
13c7 : d1 0d __ CMP (P0),y ; (si + 0)
13c9 : 90 ef __ BCC $13ba ; (nformi.s19 + 0)
13cb : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
.s4:
13cc : a9 00 __ LDA #$00
13ce : 85 43 __ STA T4 + 0 
13d0 : a5 15 __ LDA P8 ; (s + 0)
13d2 : f0 1f __ BEQ $13f3 ; (nforml.s5 + 0)
.s36:
13d4 : 24 14 __ BIT P7 ; (v + 3)
13d6 : 10 1b __ BPL $13f3 ; (nforml.s5 + 0)
.s37:
13d8 : 38 __ __ SEC
13d9 : a9 00 __ LDA #$00
13db : e5 11 __ SBC P4 ; (v + 0)
13dd : 85 11 __ STA P4 ; (v + 0)
13df : a9 00 __ LDA #$00
13e1 : e5 12 __ SBC P5 ; (v + 1)
13e3 : 85 12 __ STA P5 ; (v + 1)
13e5 : a9 00 __ LDA #$00
13e7 : e5 13 __ SBC P6 ; (v + 2)
13e9 : 85 13 __ STA P6 ; (v + 2)
13eb : a9 00 __ LDA #$00
13ed : e5 14 __ SBC P7 ; (v + 3)
13ef : 85 14 __ STA P7 ; (v + 3)
13f1 : e6 43 __ INC T4 + 0 
.s5:
13f3 : a9 10 __ LDA #$10
13f5 : 85 44 __ STA T5 + 0 
13f7 : a5 14 __ LDA P7 ; (v + 3)
13f9 : f0 03 __ BEQ $13fe ; (nforml.s32 + 0)
13fb : 4c c8 14 JMP $14c8 ; (nforml.l29 + 0)
.s32:
13fe : a5 13 __ LDA P6 ; (v + 2)
1400 : d0 f9 __ BNE $13fb ; (nforml.s5 + 8)
.s33:
1402 : a5 12 __ LDA P5 ; (v + 1)
1404 : d0 f5 __ BNE $13fb ; (nforml.s5 + 8)
.s34:
1406 : c5 11 __ CMP P4 ; (v + 0)
1408 : 90 f1 __ BCC $13fb ; (nforml.s5 + 8)
.s6:
140a : a0 02 __ LDY #$02
140c : b1 0d __ LDA (P0),y ; (si + 0)
140e : c9 ff __ CMP #$ff
1410 : d0 04 __ BNE $1416 ; (nforml.s28 + 0)
.s7:
1412 : a9 0f __ LDA #$0f
1414 : d0 05 __ BNE $141b ; (nforml.s42 + 0)
.s28:
1416 : 38 __ __ SEC
1417 : a9 10 __ LDA #$10
1419 : f1 0d __ SBC (P0),y ; (si + 0)
.s42:
141b : a8 __ __ TAY
141c : c4 44 __ CPY T5 + 0 
141e : b0 0d __ BCS $142d ; (nforml.s8 + 0)
.s27:
1420 : a9 30 __ LDA #$30
.l43:
1422 : a6 44 __ LDX T5 + 0 
1424 : 9d e7 9f STA $9fe7,x ; (si + 7)
1427 : c6 44 __ DEC T5 + 0 
1429 : c4 44 __ CPY T5 + 0 
142b : 90 f5 __ BCC $1422 ; (nforml.l43 + 0)
.s8:
142d : a0 07 __ LDY #$07
142f : b1 0d __ LDA (P0),y ; (si + 0)
1431 : f0 1f __ BEQ $1452 ; (nforml.s9 + 0)
.s25:
1433 : a0 04 __ LDY #$04
1435 : b1 0d __ LDA (P0),y ; (si + 0)
1437 : c9 10 __ CMP #$10
1439 : d0 17 __ BNE $1452 ; (nforml.s9 + 0)
.s26:
143b : 88 __ __ DEY
143c : b1 0d __ LDA (P0),y ; (si + 0)
143e : a8 __ __ TAY
143f : a9 30 __ LDA #$30
1441 : a6 44 __ LDX T5 + 0 
1443 : 9d e6 9f STA $9fe6,x ; (si + 6)
1446 : 98 __ __ TYA
1447 : 69 16 __ ADC #$16
1449 : 9d e7 9f STA $9fe7,x ; (si + 7)
144c : 8a __ __ TXA
144d : 18 __ __ CLC
144e : 69 fe __ ADC #$fe
1450 : 85 44 __ STA T5 + 0 
.s9:
1452 : a9 00 __ LDA #$00
1454 : 85 1b __ STA ACCU + 0 
1456 : a5 43 __ LDA T4 + 0 
1458 : f0 0c __ BEQ $1466 ; (nforml.s10 + 0)
.s24:
145a : a9 2d __ LDA #$2d
.s23:
145c : a6 44 __ LDX T5 + 0 
145e : 9d e7 9f STA $9fe7,x ; (si + 7)
1461 : c6 44 __ DEC T5 + 0 
1463 : 4c 70 14 JMP $1470 ; (nforml.s11 + 0)
.s10:
1466 : a0 05 __ LDY #$05
1468 : b1 0d __ LDA (P0),y ; (si + 0)
146a : f0 04 __ BEQ $1470 ; (nforml.s11 + 0)
.s22:
146c : a9 2b __ LDA #$2b
146e : d0 ec __ BNE $145c ; (nforml.s23 + 0)
.s11:
1470 : a6 44 __ LDX T5 + 0 
1472 : a0 06 __ LDY #$06
1474 : b1 0d __ LDA (P0),y ; (si + 0)
1476 : d0 29 __ BNE $14a1 ; (nforml.s18 + 0)
.l12:
1478 : 8a __ __ TXA
1479 : 18 __ __ CLC
147a : a0 01 __ LDY #$01
147c : 71 0d __ ADC (P0),y ; (si + 0)
147e : b0 04 __ BCS $1484 ; (nforml.s16 + 0)
.s17:
1480 : c9 11 __ CMP #$11
1482 : 90 0a __ BCC $148e ; (nforml.s13 + 0)
.s16:
1484 : a0 00 __ LDY #$00
1486 : b1 0d __ LDA (P0),y ; (si + 0)
1488 : 9d e7 9f STA $9fe7,x ; (si + 7)
148b : ca __ __ DEX
148c : b0 ea __ BCS $1478 ; (nforml.l12 + 0)
.s13:
148e : e0 10 __ CPX #$10
1490 : b0 0e __ BCS $14a0 ; (nforml.s3 + 0)
.s15:
1492 : 88 __ __ DEY
.l40:
1493 : bd e8 9f LDA $9fe8,x ; (buffer + 0)
1496 : 91 0f __ STA (P2),y ; (str + 0)
1498 : c8 __ __ INY
1499 : e8 __ __ INX
149a : e0 10 __ CPX #$10
149c : 90 f5 __ BCC $1493 ; (nforml.l40 + 0)
.s41:
149e : 84 1b __ STY ACCU + 0 
.s3:
14a0 : 60 __ __ RTS
.s18:
14a1 : e0 10 __ CPX #$10
14a3 : b0 1a __ BCS $14bf ; (nforml.l19 + 0)
.s21:
14a5 : a0 00 __ LDY #$00
.l38:
14a7 : bd e8 9f LDA $9fe8,x ; (buffer + 0)
14aa : 91 0f __ STA (P2),y ; (str + 0)
14ac : c8 __ __ INY
14ad : e8 __ __ INX
14ae : e0 10 __ CPX #$10
14b0 : 90 f5 __ BCC $14a7 ; (nforml.l38 + 0)
.s39:
14b2 : 84 1b __ STY ACCU + 0 
14b4 : b0 09 __ BCS $14bf ; (nforml.l19 + 0)
.s20:
14b6 : 88 __ __ DEY
14b7 : b1 0d __ LDA (P0),y ; (si + 0)
14b9 : a4 1b __ LDY ACCU + 0 
14bb : 91 0f __ STA (P2),y ; (str + 0)
14bd : e6 1b __ INC ACCU + 0 
.l19:
14bf : a5 1b __ LDA ACCU + 0 
14c1 : a0 01 __ LDY #$01
14c3 : d1 0d __ CMP (P0),y ; (si + 0)
14c5 : 90 ef __ BCC $14b6 ; (nforml.s20 + 0)
14c7 : 60 __ __ RTS
.l29:
14c8 : a0 04 __ LDY #$04
14ca : b1 0d __ LDA (P0),y ; (si + 0)
14cc : 85 03 __ STA WORK + 0 
14ce : a5 11 __ LDA P4 ; (v + 0)
14d0 : 85 1b __ STA ACCU + 0 
14d2 : a5 12 __ LDA P5 ; (v + 1)
14d4 : 85 1c __ STA ACCU + 1 
14d6 : a5 13 __ LDA P6 ; (v + 2)
14d8 : 85 1d __ STA ACCU + 2 
14da : a5 14 __ LDA P7 ; (v + 3)
14dc : 85 1e __ STA ACCU + 3 
14de : a9 00 __ LDA #$00
14e0 : 85 04 __ STA WORK + 1 
14e2 : 85 05 __ STA WORK + 2 
14e4 : 85 06 __ STA WORK + 3 
14e6 : 20 20 22 JSR $2220 ; (divmod32 + 0)
14e9 : a5 07 __ LDA WORK + 4 
14eb : c9 0a __ CMP #$0a
14ed : b0 04 __ BCS $14f3 ; (nforml.s35 + 0)
.s30:
14ef : a9 30 __ LDA #$30
14f1 : 90 06 __ BCC $14f9 ; (nforml.s31 + 0)
.s35:
14f3 : a0 03 __ LDY #$03
14f5 : b1 0d __ LDA (P0),y ; (si + 0)
14f7 : e9 0a __ SBC #$0a
.s31:
14f9 : 18 __ __ CLC
14fa : 65 07 __ ADC WORK + 4 
14fc : a6 44 __ LDX T5 + 0 
14fe : 9d e7 9f STA $9fe7,x ; (si + 7)
1501 : a5 1b __ LDA ACCU + 0 
1503 : 85 11 __ STA P4 ; (v + 0)
1505 : a5 1c __ LDA ACCU + 1 
1507 : 85 12 __ STA P5 ; (v + 1)
1509 : a5 1d __ LDA ACCU + 2 
150b : 85 13 __ STA P6 ; (v + 2)
150d : a5 1e __ LDA ACCU + 3 
150f : 85 14 __ STA P7 ; (v + 3)
1511 : c6 44 __ DEC T5 + 0 
1513 : aa __ __ TAX
1514 : d0 b2 __ BNE $14c8 ; (nforml.l29 + 0)
1516 : 4c fe 13 JMP $13fe ; (nforml.s32 + 0)
--------------------------------------------------------------------
1519 : __ __ __ BYT 0a 25 53 0a 70 52 45 53 53 20 4b 45 59 20 54 4f : .%S.pRESS KEY TO
1529 : __ __ __ BYT 20 45 58 49 54 20 54 4f 20 62 61 73 69 63 2e 0a :  EXIT TO basic..
1539 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
cwin_getch: ; cwin_getch()->void
.s4:
153a : 20 e4 ff JSR $ffe4 
153d : c9 00 __ CMP #$00
153f : f0 f9 __ BEQ $153a ; (cwin_getch.s4 + 0)
1541 : 85 1b __ STA ACCU + 0 
1543 : a9 00 __ LDA #$00
1545 : 85 1c __ STA ACCU + 1 
.s3:
1547 : 60 __ __ RTS
--------------------------------------------------------------------
exit@proxy: ; exit@proxy
1548 : a9 01 __ LDA #$01
154a : 85 0d __ STA P0 
154c : a9 00 __ LDA #$00
154e : 85 0e __ STA P1 
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s4:
1550 : a5 0d __ LDA P0 
1552 : 85 1b __ STA ACCU + 0 
1554 : a5 0e __ LDA P1 
1556 : 85 1c __ STA ACCU + 1 
1558 : ae ff 0c LDX $0cff ; (spentry + 0)
155b : 9a __ __ TXS
155c : a9 4c __ LDA #$4c
155e : 85 54 __ STA $54 
1560 : a9 00 __ LDA #$00
1562 : 85 13 __ STA P6 
.s3:
1564 : 60 __ __ RTS
--------------------------------------------------------------------
1565 : __ __ __ BYT 6e 4f 20 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d : nO uLTIMATE cOMM
1575 : __ __ __ BYT 41 4e 44 20 69 4e 54 45 52 46 41 43 45 20 45 4e : AND iNTERFACE EN
1585 : __ __ __ BYT 41 42 4c 45 44 2e 00                            : ABLED..
--------------------------------------------------------------------
cwin_put_string: ; cwin_put_string(struct CharWin*,const u8*,u8)->void
.s4:
158c : ad f0 25 LDA $25f0 ; (cw + 5)
158f : 0a __ __ ASL
1590 : aa __ __ TAX
1591 : bd 28 25 LDA $2528,x ; (mul40 + 0)
1594 : 6d ef 25 ADC $25ef ; (cw + 4)
1597 : 85 1b __ STA ACCU + 0 
1599 : bd 29 25 LDA $2529,x ; (mul40 + 1)
159c : 69 00 __ ADC #$00
159e : 85 1c __ STA ACCU + 1 
15a0 : ad f3 25 LDA $25f3 ; (cw + 8)
15a3 : 65 1b __ ADC ACCU + 0 
15a5 : 85 43 __ STA T1 + 0 
15a7 : ad f4 25 LDA $25f4 ; (cw + 9)
15aa : 65 1c __ ADC ACCU + 1 
15ac : 85 44 __ STA T1 + 1 
15ae : ad f5 25 LDA $25f5 ; (cw + 10)
15b1 : 18 __ __ CLC
15b2 : 65 1b __ ADC ACCU + 0 
15b4 : 85 1b __ STA ACCU + 0 
15b6 : ad f6 25 LDA $25f6 ; (cw + 11)
15b9 : 65 1c __ ADC ACCU + 1 
15bb : 85 1c __ STA ACCU + 1 
15bd : a0 00 __ LDY #$00
15bf : b1 0d __ LDA (P0),y ; (str + 0)
15c1 : f0 16 __ BEQ $15d9 ; (cwin_put_string.s5 + 0)
.l7:
15c3 : 4a __ __ LSR
15c4 : 4a __ __ LSR
15c5 : 4a __ __ LSR
15c6 : 4a __ __ LSR
15c7 : 4a __ __ LSR
15c8 : aa __ __ TAX
15c9 : bd 62 25 LDA $2562,x ; (p2smap + 0)
15cc : 51 0d __ EOR (P0),y ; (str + 0)
15ce : 91 43 __ STA (T1 + 0),y 
15d0 : a9 07 __ LDA #$07
15d2 : 91 1b __ STA (ACCU + 0),y 
15d4 : c8 __ __ INY
15d5 : b1 0d __ LDA (P0),y ; (str + 0)
15d7 : d0 ea __ BNE $15c3 ; (cwin_put_string.l7 + 0)
.s5:
15d9 : 98 __ __ TYA
15da : 18 __ __ CLC
15db : 6d ef 25 ADC $25ef ; (cw + 4)
15de : cd ed 25 CMP $25ed ; (cw + 2)
15e1 : 90 05 __ BCC $15e8 ; (cwin_put_string.s3 + 0)
.s6:
15e3 : a9 00 __ LDA #$00
15e5 : ee f0 25 INC $25f0 ; (cw + 5)
.s3:
15e8 : 8d ef 25 STA $25ef ; (cw + 4)
15eb : 60 __ __ RTS
--------------------------------------------------------------------
15ec : __ __ __ BYT 64 6f 73 20 56 45 52 53 49 4f 4e 3a 20 00       : dos VERSION: .
--------------------------------------------------------------------
15fa : __ __ __ BYT 30 30 2c 4f 4b 00                               : 00,OK.
--------------------------------------------------------------------
1600 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d 41 4e 44 : uLTIMATE cOMMAND
1610 : __ __ __ BYT 20 69 4e 54 45 52 46 41 43 45 20 44 45 54 45 43 :  iNTERFACE DETEC
1620 : __ __ __ BYT 54 45 44 2e 00                                  : TED..
--------------------------------------------------------------------
cwin_cursor_newline: ; cwin_cursor_newline(struct CharWin*)->void
.s4:
1625 : ad f0 25 LDA $25f0 ; (cw + 5)
1628 : 18 __ __ CLC
1629 : 69 01 __ ADC #$01
162b : a8 __ __ TAY
162c : a9 00 __ LDA #$00
162e : 8d ef 25 STA $25ef ; (cw + 4)
1631 : 2a __ __ ROL
1632 : d0 08 __ BNE $163c ; (cwin_cursor_newline.s3 + 0)
.s6:
1634 : cc ee 25 CPY $25ee ; (cw + 3)
1637 : b0 03 __ BCS $163c ; (cwin_cursor_newline.s3 + 0)
.s5:
1639 : ee f0 25 INC $25f0 ; (cw + 5)
.s3:
163c : 60 __ __ RTS
--------------------------------------------------------------------
reu_count_pages: ; reu_count_pages()->i16
.s4:
163d : a9 00 __ LDA #$00
163f : 8d f7 9f STA $9ff7 ; (c + 0)
1642 : a9 f7 __ LDA #$f7
1644 : 8d 02 df STA $df02 
1647 : a9 9f __ LDA #$9f
1649 : 8d 03 df STA $df03 
164c : a9 00 __ LDA #$00
164e : 8d 04 df STA $df04 
1651 : 8d 05 df STA $df05 
1654 : 8d 06 df STA $df06 
1657 : a2 01 __ LDX #$01
1659 : 8e 07 df STX $df07 
165c : 8d 08 df STA $df08 
165f : 8d 0a df STA $df0a 
1662 : a2 90 __ LDX #$90
1664 : 8e 01 df STX $df01 
1667 : a2 f6 __ LDX #$f6
1669 : 8e 02 df STX $df02 
166c : a2 9f __ LDX #$9f
166e : 8e 03 df STX $df03 
1671 : 8d 04 df STA $df04 
1674 : 8d 05 df STA $df05 
1677 : 8d 06 df STA $df06 
167a : a2 01 __ LDX #$01
167c : 8e 07 df STX $df07 
167f : 8d 08 df STA $df08 
1682 : 8d 0a df STA $df0a 
1685 : a9 91 __ LDA #$91
1687 : 8d 01 df STA $df01 
168a : ad f6 9f LDA $9ff6 ; (d + 0)
168d : d0 52 __ BNE $16e1 ; (reu_count_pages.s6 + 0)
.s5:
168f : a2 47 __ LDX #$47
1691 : 8e f7 9f STX $9ff7 ; (c + 0)
1694 : a2 f7 __ LDX #$f7
1696 : 8e 02 df STX $df02 
1699 : a2 9f __ LDX #$9f
169b : 8e 03 df STX $df03 
169e : 8d 04 df STA $df04 
16a1 : 8d 05 df STA $df05 
16a4 : 8d 06 df STA $df06 
16a7 : a2 01 __ LDX #$01
16a9 : 8e 07 df STX $df07 
16ac : 8d 08 df STA $df08 
16af : 8d 0a df STA $df0a 
16b2 : a2 90 __ LDX #$90
16b4 : 8e 01 df STX $df01 
16b7 : a2 f6 __ LDX #$f6
16b9 : 8e 02 df STX $df02 
16bc : a2 9f __ LDX #$9f
16be : 8e 03 df STX $df03 
16c1 : 8d 04 df STA $df04 
16c4 : 8d 05 df STA $df05 
16c7 : 8d 06 df STA $df06 
16ca : a2 01 __ LDX #$01
16cc : 8e 07 df STX $df07 
16cf : 8d 08 df STA $df08 
16d2 : 8d 0a df STA $df0a 
16d5 : a9 91 __ LDA #$91
16d7 : 8d 01 df STA $df01 
16da : ad f6 9f LDA $9ff6 ; (d + 0)
16dd : c9 47 __ CMP #$47
16df : f0 07 __ BEQ $16e8 ; (reu_count_pages.s7 + 0)
.s6:
16e1 : a9 00 __ LDA #$00
16e3 : 85 1b __ STA ACCU + 0 
.s3:
16e5 : 85 1c __ STA ACCU + 1 
16e7 : 60 __ __ RTS
.s7:
16e8 : a0 01 __ LDY #$01
16ea : ca __ __ DEX
.l8:
16eb : a9 47 __ LDA #$47
16ed : 8d f7 9f STA $9ff7 ; (c + 0)
16f0 : a9 f7 __ LDA #$f7
16f2 : 8d 02 df STA $df02 
16f5 : a9 9f __ LDA #$9f
16f7 : 8d 03 df STA $df03 
16fa : a9 00 __ LDA #$00
16fc : 8d 04 df STA $df04 
16ff : 8d 05 df STA $df05 
1702 : 8c 06 df STY $df06 
1705 : a9 01 __ LDA #$01
1707 : 8d 07 df STA $df07 
170a : a9 00 __ LDA #$00
170c : 8d 08 df STA $df08 
170f : 8d 0a df STA $df0a 
1712 : a9 90 __ LDA #$90
1714 : 8d 01 df STA $df01 
1717 : a9 00 __ LDA #$00
1719 : 8d f7 9f STA $9ff7 ; (c + 0)
171c : a9 f7 __ LDA #$f7
171e : 8d 02 df STA $df02 
1721 : a9 9f __ LDA #$9f
1723 : 8d 03 df STA $df03 
1726 : a9 00 __ LDA #$00
1728 : 8d 04 df STA $df04 
172b : 8d 05 df STA $df05 
172e : 8d 06 df STA $df06 
1731 : a9 01 __ LDA #$01
1733 : 8d 07 df STA $df07 
1736 : a9 00 __ LDA #$00
1738 : 8d 08 df STA $df08 
173b : 8d 0a df STA $df0a 
173e : a9 90 __ LDA #$90
1740 : 8d 01 df STA $df01 
1743 : a9 f6 __ LDA #$f6
1745 : 8d 02 df STA $df02 
1748 : a9 9f __ LDA #$9f
174a : 8d 03 df STA $df03 
174d : a9 00 __ LDA #$00
174f : 8d 04 df STA $df04 
1752 : 8d 05 df STA $df05 
1755 : 8c 06 df STY $df06 
1758 : a9 01 __ LDA #$01
175a : 8d 07 df STA $df07 
175d : a9 00 __ LDA #$00
175f : 8d 08 df STA $df08 
1762 : 8d 0a df STA $df0a 
1765 : a9 91 __ LDA #$91
1767 : 8d 01 df STA $df01 
176a : ad f6 9f LDA $9ff6 ; (d + 0)
176d : c9 47 __ CMP #$47
176f : f0 06 __ BEQ $1777 ; (reu_count_pages.s9 + 0)
.s11:
1771 : 84 1b __ STY ACCU + 0 
1773 : 8a __ __ TXA
1774 : 4c e5 16 JMP $16e5 ; (reu_count_pages.s3 + 0)
.s9:
1777 : c8 __ __ INY
1778 : d0 01 __ BNE $177b ; (reu_count_pages.s13 + 0)
.s12:
177a : e8 __ __ INX
.s13:
177b : 98 __ __ TYA
177c : f0 03 __ BEQ $1781 ; (reu_count_pages.s10 + 0)
177e : 4c eb 16 JMP $16eb ; (reu_count_pages.l8 + 0)
.s10:
1781 : 85 1b __ STA ACCU + 0 
1783 : a9 01 __ LDA #$01
1785 : 4c e5 16 JMP $16e5 ; (reu_count_pages.s3 + 0)
--------------------------------------------------------------------
1788 : __ __ __ BYT 0a 72 65 75 20 44 45 54 45 43 54 45 44 2c 20 53 : .reu DETECTED, S
1798 : __ __ __ BYT 49 5a 45 3a 20 25 44 20 6b 62 0a 00             : IZE: %D kb..
--------------------------------------------------------------------
17a4 : __ __ __ BYT 6e 4f 20 72 65 75 20 44 45 54 45 43 54 45 44 2e : nO reu DETECTED.
17b4 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
17b5 : __ __ __ BYT 0a 72 45 41 44 49 4e 47 20 4f 4c 44 20 43 4f 4e : .rEADING OLD CON
17c5 : __ __ __ BYT 46 49 47 20 46 49 4c 45 2e 2e 2e 00             : FIG FILE....
--------------------------------------------------------------------
read_old_configfile: ; read_old_configfile()->void
.s4:
17d1 : a9 01 __ LDA #$01
17d3 : 85 11 __ STA P4 
17d5 : 20 7c 18 JSR $187c ; (uii_open_file@proxy + 0)
17d8 : 20 20 19 JSR $1920 ; (strcmp@proxy + 0)
17db : aa __ __ TAX
17dc : f0 10 __ BEQ $17ee ; (read_old_configfile.s5 + 0)
.s8:
17de : a9 5d __ LDA #$5d
17e0 : 8d fc 9f STA $9ffc ; (sstack + 4)
17e3 : a9 19 __ LDA #$19
17e5 : 8d fd 9f STA $9ffd ; (sstack + 5)
17e8 : 20 cc 0e JSR $0ecc ; (error.s1 + 0)
17eb : 20 48 15 JSR $1548 ; (exit@proxy + 0)
.s5:
17ee : a9 56 __ LDA #$56
17f0 : 85 11 __ STA P4 
17f2 : a9 00 __ LDA #$00
17f4 : 85 12 __ STA P5 
17f6 : 20 12 0d JSR $0d12 ; (uii_read_file.s4 + 0)
17f9 : a9 00 __ LDA #$00
17fb : 8d fe 9f STA $9ffe ; (sstack + 6)
17fe : a9 1a __ LDA #$1a
1800 : 8d ff 9f STA $9fff ; (sstack + 7)
1803 : 20 74 19 JSR $1974 ; (CheckStatus.s1 + 0)
1806 : 20 bb 0d JSR $0dbb ; (uii_readdata.s4 + 0)
1809 : 20 a7 0e JSR $0ea7 ; (uii_accept.s4 + 0)
180c : ad 65 26 LDA $2665 ; (uii_data + 1)
180f : 8d 89 25 STA $2589 ; (cfg + 1)
1812 : ad 68 26 LDA $2668 ; (uii_data + 4)
1815 : 8d dc 25 STA $25dc ; (cfg + 84)
1818 : ad 69 26 LDA $2669 ; (uii_data + 5)
181b : 8d db 25 STA $25db ; (cfg + 83)
181e : ad 67 26 LDA $2667 ; (uii_data + 3)
1821 : 8d dd 25 STA $25dd ; (cfg + 85)
1824 : ad 66 26 LDA $2666 ; (uii_data + 2)
1827 : 8d de 25 STA $25de ; (cfg + 86)
182a : a2 00 __ LDX #$00
.l9:
182c : bd 6a 26 LDA $266a,x ; (uii_data + 6)
182f : 9d 8a 25 STA $258a,x ; (cfg + 2)
1832 : e8 __ __ INX
1833 : e0 50 __ CPX #$50
1835 : 90 f5 __ BCC $182c ; (read_old_configfile.l9 + 0)
.s10:
1837 : a9 8a __ LDA #$8a
1839 : 85 0d __ STA P0 
183b : a9 25 __ LDA #$25
183d : 85 0e __ STA P1 
183f : 20 b0 0c JSR $0cb0 ; (strlen.s4 + 0)
1842 : a5 1b __ LDA ACCU + 0 
1844 : 05 1c __ ORA ACCU + 1 
1846 : d0 0b __ BNE $1853 ; (uii_close_file.s4 + 0)
.s6:
1848 : a2 ff __ LDX #$ff
.l7:
184a : e8 __ __ INX
184b : bd 65 0a LDA $0a65,x 
184e : 9d 8a 25 STA $258a,x ; (cfg + 2)
1851 : d0 f7 __ BNE $184a ; (read_old_configfile.l7 + 0)
--------------------------------------------------------------------
uii_close_file: ; uii_close_file()->void
.s4:
1853 : a9 00 __ LDA #$00
1855 : 85 10 __ STA P3 
1857 : 8d f6 9f STA $9ff6 ; (cmd + 0)
185a : a9 01 __ LDA #$01
185c : 8d fc 19 STA $19fc ; (uii_target + 0)
185f : a9 02 __ LDA #$02
1861 : 85 0f __ STA P2 
1863 : a9 03 __ LDA #$03
1865 : 8d f7 9f STA $9ff7 ; (cmd + 1)
1868 : a9 f6 __ LDA #$f6
186a : 85 0d __ STA P0 
186c : a9 9f __ LDA #$9f
186e : 85 0e __ STA P1 
1870 : 20 3f 0d JSR $0d3f ; (uii_sendcommand.s4 + 0)
1873 : 20 bb 0d JSR $0dbb ; (uii_readdata.s4 + 0)
1876 : 20 f9 0d JSR $0df9 ; (uii_readstatus.s4 + 0)
1879 : 4c a7 0e JMP $0ea7 ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
uii_open_file@proxy: ; uii_open_file@proxy
187c : a9 72 __ LDA #$72
187e : 85 12 __ STA P5 
1880 : a9 25 __ LDA #$25
1882 : 85 13 __ STA P6 
--------------------------------------------------------------------
uii_open_file: ; uii_open_file(u8,u8*)->void
.s4:
1884 : a5 12 __ LDA P5 ; (filename + 0)
1886 : 85 0d __ STA P0 
1888 : 20 1a 25 JSR $251a ; (strlen@proxy + 0)
188b : 18 __ __ CLC
188c : a5 1b __ LDA ACCU + 0 
188e : 69 03 __ ADC #$03
1890 : 85 1b __ STA ACCU + 0 
1892 : 90 02 __ BCC $1896 ; (uii_open_file.s10 + 0)
.s9:
1894 : e6 1c __ INC ACCU + 1 
.s10:
1896 : 20 f7 22 JSR $22f7 ; (crt_malloc + 0)
1899 : a5 1b __ LDA ACCU + 0 
189b : 85 45 __ STA T2 + 0 
189d : a5 1c __ LDA ACCU + 1 
189f : 85 46 __ STA T2 + 1 
18a1 : a9 00 __ LDA #$00
18a3 : a8 __ __ TAY
18a4 : 91 1b __ STA (ACCU + 0),y 
18a6 : a9 02 __ LDA #$02
18a8 : c8 __ __ INY
18a9 : 91 1b __ STA (ACCU + 0),y 
18ab : a5 11 __ LDA P4 ; (attrib + 0)
18ad : c8 __ __ INY
18ae : 91 1b __ STA (ACCU + 0),y 
18b0 : a9 00 __ LDA #$00
18b2 : 85 47 __ STA T3 + 0 
18b4 : 85 48 __ STA T3 + 1 
.l11:
18b6 : 20 1a 25 JSR $251a ; (strlen@proxy + 0)
18b9 : a5 48 __ LDA T3 + 1 
18bb : c5 1c __ CMP ACCU + 1 
18bd : d0 5b __ BNE $191a ; (uii_open_file.s8 + 0)
.s7:
18bf : a5 47 __ LDA T3 + 0 
18c1 : c5 1b __ CMP ACCU + 0 
18c3 : 90 2c __ BCC $18f1 ; (uii_open_file.s6 + 0)
.s5:
18c5 : a9 01 __ LDA #$01
18c7 : 8d fc 19 STA $19fc ; (uii_target + 0)
18ca : 20 1a 25 JSR $251a ; (strlen@proxy + 0)
18cd : a5 45 __ LDA T2 + 0 
18cf : 85 0d __ STA P0 
18d1 : a5 46 __ LDA T2 + 1 
18d3 : 85 0e __ STA P1 
18d5 : 18 __ __ CLC
18d6 : a5 1b __ LDA ACCU + 0 
18d8 : 69 03 __ ADC #$03
18da : 85 0f __ STA P2 
18dc : a5 1c __ LDA ACCU + 1 
18de : 69 00 __ ADC #$00
18e0 : 85 10 __ STA P3 
18e2 : 20 3f 0d JSR $0d3f ; (uii_sendcommand.s4 + 0)
18e5 : 20 ef 23 JSR $23ef ; (crt_free@proxy + 0)
18e8 : 20 bb 0d JSR $0dbb ; (uii_readdata.s4 + 0)
18eb : 20 f9 0d JSR $0df9 ; (uii_readstatus.s4 + 0)
18ee : 4c a7 0e JMP $0ea7 ; (uii_accept.s4 + 0)
.s6:
18f1 : 85 43 __ STA T0 + 0 
18f3 : 18 __ __ CLC
18f4 : a5 13 __ LDA P6 ; (filename + 1)
18f6 : 65 48 __ ADC T3 + 1 
18f8 : 85 44 __ STA T0 + 1 
18fa : a4 12 __ LDY P5 ; (filename + 0)
18fc : b1 43 __ LDA (T0 + 0),y 
18fe : aa __ __ TAX
18ff : 18 __ __ CLC
1900 : a5 45 __ LDA T2 + 0 
1902 : 65 47 __ ADC T3 + 0 
1904 : 85 43 __ STA T0 + 0 
1906 : a5 46 __ LDA T2 + 1 
1908 : 65 48 __ ADC T3 + 1 
190a : 85 44 __ STA T0 + 1 
190c : 8a __ __ TXA
190d : a0 03 __ LDY #$03
190f : 91 43 __ STA (T0 + 0),y 
1911 : e6 47 __ INC T3 + 0 
1913 : d0 a1 __ BNE $18b6 ; (uii_open_file.l11 + 0)
.s12:
1915 : e6 48 __ INC T3 + 1 
1917 : 4c b6 18 JMP $18b6 ; (uii_open_file.l11 + 0)
.s8:
191a : b0 a9 __ BCS $18c5 ; (uii_open_file.s5 + 0)
.s13:
191c : a5 47 __ LDA T3 + 0 
191e : 90 d1 __ BCC $18f1 ; (uii_open_file.s6 + 0)
--------------------------------------------------------------------
strcmp@proxy: ; strcmp@proxy
1920 : a9 65 __ LDA #$65
1922 : 85 0d __ STA P0 
1924 : a9 28 __ LDA #$28
1926 : 85 0e __ STA P1 
1928 : a9 fa __ LDA #$fa
192a : 85 0f __ STA P2 
192c : a9 15 __ LDA #$15
192e : 85 10 __ STA P3 
--------------------------------------------------------------------
strcmp: ; strcmp(const u8*,const u8*)->i8
.s4:
1930 : a0 00 __ LDY #$00
1932 : b1 0d __ LDA (P0),y 
1934 : f0 16 __ BEQ $194c ; (strcmp.s4 + 28)
1936 : d1 0f __ CMP (P2),y 
1938 : d0 16 __ BNE $1950 ; (strcmp.s4 + 32)
193a : c8 __ __ INY
193b : b1 0d __ LDA (P0),y 
193d : f0 0d __ BEQ $194c ; (strcmp.s4 + 28)
193f : d1 0f __ CMP (P2),y 
1941 : d0 0d __ BNE $1950 ; (strcmp.s4 + 32)
1943 : c8 __ __ INY
1944 : d0 ec __ BNE $1932 ; (strcmp.s4 + 2)
1946 : e6 0e __ INC P1 
1948 : e6 10 __ INC P3 
194a : d0 e6 __ BNE $1932 ; (strcmp.s4 + 2)
194c : d1 0f __ CMP (P2),y 
194e : f0 08 __ BEQ $1958 ; (strcmp.s4 + 40)
1950 : b0 04 __ BCS $1956 ; (strcmp.s4 + 38)
1952 : a9 ff __ LDA #$ff
1954 : 30 02 __ BMI $1958 ; (strcmp.s4 + 40)
1956 : a9 01 __ LDA #$01
1958 : 85 1b __ STA ACCU + 0 
.s3:
195a : a5 1b __ LDA ACCU + 0 
195c : 60 __ __ RTS
--------------------------------------------------------------------
195d : __ __ __ BYT 0a 6e 4f 20 43 4f 4e 46 49 47 20 46 49 4c 45 20 : .nO CONFIG FILE 
196d : __ __ __ BYT 46 4f 55 4e 44 2e 00                            : FOUND..
--------------------------------------------------------------------
CheckStatus: ; CheckStatus(const u8*)->void
.s1:
1974 : 38 __ __ SEC
1975 : a5 23 __ LDA SP + 0 
1977 : e9 09 __ SBC #$09
1979 : 85 23 __ STA SP + 0 
197b : b0 02 __ BCS $197f ; (CheckStatus.s4 + 0)
197d : c6 24 __ DEC SP + 1 
.s4:
197f : ad 65 28 LDA $2865 ; (uii_status + 0)
1982 : c9 30 __ CMP #$30
1984 : d0 07 __ BNE $198d ; (CheckStatus.s6 + 0)
.s5:
1986 : ad 66 28 LDA $2866 ; (uii_status + 1)
1989 : c9 30 __ CMP #$30
198b : f0 43 __ BEQ $19d0 ; (CheckStatus.s3 + 0)
.s6:
198d : a9 dc __ LDA #$dc
198f : a0 05 __ LDY #$05
1991 : 91 23 __ STA (SP + 0),y 
1993 : a9 19 __ LDA #$19
1995 : c8 __ __ INY
1996 : 91 23 __ STA (SP + 0),y 
1998 : ad fe 9f LDA $9ffe ; (sstack + 6)
199b : c8 __ __ INY
199c : 91 23 __ STA (SP + 0),y 
199e : ad ff 9f LDA $9fff ; (sstack + 7)
19a1 : c8 __ __ INY
19a2 : 91 23 __ STA (SP + 0),y 
19a4 : 20 0b 0f JSR $0f0b ; (cwin_console_printf.s4 + 0)
19a7 : a9 65 __ LDA #$65
19a9 : a0 07 __ LDY #$07
19ab : 91 23 __ STA (SP + 0),y 
19ad : a9 28 __ LDA #$28
19af : c8 __ __ INY
19b0 : 91 23 __ STA (SP + 0),y 
19b2 : a9 ef __ LDA #$ef
19b4 : a0 05 __ LDY #$05
19b6 : 91 23 __ STA (SP + 0),y 
19b8 : a9 19 __ LDA #$19
19ba : c8 __ __ INY
19bb : 91 23 __ STA (SP + 0),y 
19bd : 20 0b 0f JSR $0f0b ; (cwin_console_printf.s4 + 0)
19c0 : 20 f5 0c JSR $0cf5 ; (uii_abort.s4 + 0)
19c3 : a9 fe __ LDA #$fe
19c5 : 8d fc 9f STA $9ffc ; (sstack + 4)
19c8 : a9 0c __ LDA #$0c
19ca : 8d fd 9f STA $9ffd ; (sstack + 5)
19cd : 20 cc 0e JSR $0ecc ; (error.s1 + 0)
.s3:
19d0 : 18 __ __ CLC
19d1 : a5 23 __ LDA SP + 0 
19d3 : 69 09 __ ADC #$09
19d5 : 85 23 __ STA SP + 0 
19d7 : 90 02 __ BCC $19db ; (CheckStatus.s3 + 11)
19d9 : e6 24 __ INC SP + 1 
19db : 60 __ __ RTS
--------------------------------------------------------------------
19dc : __ __ __ BYT 0a 69 2f 6f 20 45 52 52 4f 52 20 49 4e 20 25 53 : .i/o ERROR IN %S
19ec : __ __ __ BYT 2e 0a 00                                        : ...
--------------------------------------------------------------------
19ef : __ __ __ BYT 0a 73 54 41 54 55 53 3a 20 25 53 0a 00          : .sTATUS: %S..
--------------------------------------------------------------------
uii_target:
19fc : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
1a00 : __ __ __ BYT 52 45 41 44 49 4e 47 20 43 4f 4e 46 49 47 00    : READING CONFIG.
--------------------------------------------------------------------
1a0f : __ __ __ BYT 0a 77 52 49 54 49 4e 47 20 4e 45 57 20 43 4f 4e : .wRITING NEW CON
1a1f : __ __ __ BYT 46 49 47 20 46 49 4c 45 2e 2e 2e 00             : FIG FILE....
--------------------------------------------------------------------
writeconfigfile: ; writeconfigfile()->void
.s4:
1a2b : a9 72 __ LDA #$72
1a2d : 85 11 __ STA P4 
1a2f : a9 25 __ LDA #$25
1a31 : 85 12 __ STA P5 
1a33 : 20 60 1a JSR $1a60 ; (uii_delete_file.s4 + 0)
1a36 : a9 06 __ LDA #$06
1a38 : 85 11 __ STA P4 
1a3a : 20 7c 18 JSR $187c ; (uii_open_file@proxy + 0)
1a3d : a9 63 __ LDA #$63
1a3f : 85 13 __ STA P6 
1a41 : a9 25 __ LDA #$25
1a43 : 85 12 __ STA P5 
1a45 : a9 00 __ LDA #$00
1a47 : 85 14 __ STA P7 
1a49 : a9 88 __ LDA #$88
1a4b : 85 11 __ STA P4 
1a4d : 20 f0 1a JSR $1af0 ; (uii_write_file.s4 + 0)
1a50 : a9 71 __ LDA #$71
1a52 : 8d fe 9f STA $9ffe ; (sstack + 6)
1a55 : a9 1b __ LDA #$1b
1a57 : 8d ff 9f STA $9fff ; (sstack + 7)
1a5a : 20 74 19 JSR $1974 ; (CheckStatus.s1 + 0)
1a5d : 4c 53 18 JMP $1853 ; (uii_close_file.s4 + 0)
--------------------------------------------------------------------
uii_delete_file: ; uii_delete_file(u8*)->void
.s4:
1a60 : 20 a8 0c JSR $0ca8 ; (strlen@proxy + 0)
1a63 : 18 __ __ CLC
1a64 : a5 1b __ LDA ACCU + 0 
1a66 : 69 02 __ ADC #$02
1a68 : 85 1b __ STA ACCU + 0 
1a6a : 90 02 __ BCC $1a6e ; (uii_delete_file.s10 + 0)
.s9:
1a6c : e6 1c __ INC ACCU + 1 
.s10:
1a6e : 20 f7 22 JSR $22f7 ; (crt_malloc + 0)
1a71 : a5 1b __ LDA ACCU + 0 
1a73 : 85 45 __ STA T2 + 0 
1a75 : a5 1c __ LDA ACCU + 1 
1a77 : 85 46 __ STA T2 + 1 
1a79 : a9 00 __ LDA #$00
1a7b : a8 __ __ TAY
1a7c : 91 1b __ STA (ACCU + 0),y 
1a7e : a9 09 __ LDA #$09
1a80 : c8 __ __ INY
1a81 : 91 1b __ STA (ACCU + 0),y 
1a83 : a9 00 __ LDA #$00
1a85 : 85 47 __ STA T3 + 0 
1a87 : 85 48 __ STA T3 + 1 
.l11:
1a89 : 20 13 25 JSR $2513 ; (strlen@proxy + 0)
1a8c : a5 48 __ LDA T3 + 1 
1a8e : c5 1c __ CMP ACCU + 1 
1a90 : d0 58 __ BNE $1aea ; (uii_delete_file.s8 + 0)
.s7:
1a92 : a5 47 __ LDA T3 + 0 
1a94 : c5 1b __ CMP ACCU + 0 
1a96 : 90 29 __ BCC $1ac1 ; (uii_delete_file.s6 + 0)
.s5:
1a98 : a9 01 __ LDA #$01
1a9a : 8d fc 19 STA $19fc ; (uii_target + 0)
1a9d : 20 13 25 JSR $2513 ; (strlen@proxy + 0)
1aa0 : a5 45 __ LDA T2 + 0 
1aa2 : 85 0d __ STA P0 
1aa4 : a5 46 __ LDA T2 + 1 
1aa6 : 85 0e __ STA P1 
1aa8 : 18 __ __ CLC
1aa9 : a5 1b __ LDA ACCU + 0 
1aab : 69 02 __ ADC #$02
1aad : 85 0f __ STA P2 
1aaf : a5 1c __ LDA ACCU + 1 
1ab1 : 69 00 __ ADC #$00
1ab3 : 85 10 __ STA P3 
1ab5 : 20 3f 0d JSR $0d3f ; (uii_sendcommand.s4 + 0)
1ab8 : 20 ef 23 JSR $23ef ; (crt_free@proxy + 0)
1abb : 20 f9 0d JSR $0df9 ; (uii_readstatus.s4 + 0)
1abe : 4c a7 0e JMP $0ea7 ; (uii_accept.s4 + 0)
.s6:
1ac1 : 85 43 __ STA T0 + 0 
1ac3 : 18 __ __ CLC
1ac4 : a5 12 __ LDA P5 ; (filename + 1)
1ac6 : 65 48 __ ADC T3 + 1 
1ac8 : 85 44 __ STA T0 + 1 
1aca : a4 11 __ LDY P4 ; (filename + 0)
1acc : b1 43 __ LDA (T0 + 0),y 
1ace : aa __ __ TAX
1acf : 18 __ __ CLC
1ad0 : a5 45 __ LDA T2 + 0 
1ad2 : 65 47 __ ADC T3 + 0 
1ad4 : 85 43 __ STA T0 + 0 
1ad6 : a5 46 __ LDA T2 + 1 
1ad8 : 65 48 __ ADC T3 + 1 
1ada : 85 44 __ STA T0 + 1 
1adc : 8a __ __ TXA
1add : a0 02 __ LDY #$02
1adf : 91 43 __ STA (T0 + 0),y 
1ae1 : e6 47 __ INC T3 + 0 
1ae3 : d0 a4 __ BNE $1a89 ; (uii_delete_file.l11 + 0)
.s12:
1ae5 : e6 48 __ INC T3 + 1 
1ae7 : 4c 89 1a JMP $1a89 ; (uii_delete_file.l11 + 0)
.s8:
1aea : b0 ac __ BCS $1a98 ; (uii_delete_file.s5 + 0)
.s13:
1aec : a5 47 __ LDA T3 + 0 
1aee : 90 d1 __ BCC $1ac1 ; (uii_delete_file.s6 + 0)
--------------------------------------------------------------------
uii_write_file: ; uii_write_file(u8*,u16)->void
.s4:
1af0 : 18 __ __ CLC
1af1 : a5 13 __ LDA P6 ; (length + 0)
1af3 : 69 04 __ ADC #$04
1af5 : 85 45 __ STA T1 + 0 
1af7 : 85 1b __ STA ACCU + 0 
1af9 : a5 14 __ LDA P7 ; (length + 1)
1afb : 69 00 __ ADC #$00
1afd : 85 46 __ STA T1 + 1 
1aff : 85 1c __ STA ACCU + 1 
1b01 : 20 f7 22 JSR $22f7 ; (crt_malloc + 0)
1b04 : a9 00 __ LDA #$00
1b06 : a8 __ __ TAY
1b07 : 91 1b __ STA (ACCU + 0),y 
1b09 : a9 05 __ LDA #$05
1b0b : c8 __ __ INY
1b0c : 91 1b __ STA (ACCU + 0),y 
1b0e : a9 00 __ LDA #$00
1b10 : c8 __ __ INY
1b11 : 91 1b __ STA (ACCU + 0),y 
1b13 : c8 __ __ INY
1b14 : 91 1b __ STA (ACCU + 0),y 
1b16 : a5 13 __ LDA P6 ; (length + 0)
1b18 : 05 14 __ ORA P7 ; (length + 1)
1b1a : f0 31 __ BEQ $1b4d ; (uii_write_file.s5 + 0)
.s6:
1b1c : a5 13 __ LDA P6 ; (length + 0)
1b1e : 85 43 __ STA T0 + 0 
1b20 : a5 1b __ LDA ACCU + 0 
1b22 : 85 47 __ STA T2 + 0 
1b24 : a5 1c __ LDA ACCU + 1 
1b26 : 85 48 __ STA T2 + 1 
1b28 : a6 14 __ LDX P7 ; (length + 1)
.l7:
1b2a : a0 00 __ LDY #$00
1b2c : b1 11 __ LDA (P4),y ; (data + 0)
1b2e : a0 04 __ LDY #$04
1b30 : 91 47 __ STA (T2 + 0),y 
1b32 : e6 47 __ INC T2 + 0 
1b34 : d0 02 __ BNE $1b38 ; (uii_write_file.s9 + 0)
.s8:
1b36 : e6 48 __ INC T2 + 1 
.s9:
1b38 : e6 11 __ INC P4 ; (data + 0)
1b3a : d0 02 __ BNE $1b3e ; (uii_write_file.s11 + 0)
.s10:
1b3c : e6 12 __ INC P5 ; (data + 1)
.s11:
1b3e : 38 __ __ SEC
1b3f : a5 43 __ LDA T0 + 0 
1b41 : e9 01 __ SBC #$01
1b43 : 85 43 __ STA T0 + 0 
1b45 : b0 01 __ BCS $1b48 ; (uii_write_file.s13 + 0)
.s12:
1b47 : ca __ __ DEX
.s13:
1b48 : 8a __ __ TXA
1b49 : 05 43 __ ORA T0 + 0 
1b4b : d0 dd __ BNE $1b2a ; (uii_write_file.l7 + 0)
.s5:
1b4d : a9 01 __ LDA #$01
1b4f : 8d fc 19 STA $19fc ; (uii_target + 0)
1b52 : a5 1b __ LDA ACCU + 0 
1b54 : 85 0d __ STA P0 
1b56 : a5 1c __ LDA ACCU + 1 
1b58 : 85 0e __ STA P1 
1b5a : a5 45 __ LDA T1 + 0 
1b5c : 85 0f __ STA P2 
1b5e : a5 46 __ LDA T1 + 1 
1b60 : 85 10 __ STA P3 
1b62 : 20 3f 0d JSR $0d3f ; (uii_sendcommand.s4 + 0)
1b65 : 20 ef 23 JSR $23ef ; (crt_free@proxy + 0)
1b68 : 20 bb 0d JSR $0dbb ; (uii_readdata.s4 + 0)
1b6b : 20 f9 0d JSR $0df9 ; (uii_readstatus.s4 + 0)
1b6e : 4c a7 0e JMP $0ea7 ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
1b71 : __ __ __ BYT 57 52 49 54 49 4e 47 20 43 4f 4e 46 49 47 00    : WRITING CONFIG.
--------------------------------------------------------------------
1b80 : __ __ __ BYT 0a 72 45 41 44 49 4e 47 20 4f 4c 44 20 53 4c 4f : .rEADING OLD SLO
1b90 : __ __ __ BYT 54 53 20 46 49 4c 45 2e 2e 2e 00                : TS FILE....
--------------------------------------------------------------------
read_old_slotsfile: ; read_old_slotsfile()->void
.s1:
1b9b : a5 53 __ LDA T3 + 0 
1b9d : 8d 12 9f STA $9f12 ; (read_old_slotsfile@stack + 0)
1ba0 : a5 54 __ LDA T3 + 1 
1ba2 : 8d 13 9f STA $9f13 ; (read_old_slotsfile@stack + 1)
1ba5 : 38 __ __ SEC
1ba6 : a5 23 __ LDA SP + 0 
1ba8 : e9 0f __ SBC #$0f
1baa : 85 23 __ STA SP + 0 
1bac : b0 02 __ BCS $1bb0 ; (read_old_slotsfile.s4 + 0)
1bae : c6 24 __ DEC SP + 1 
.s4:
1bb0 : 20 2a 0e JSR $0e2a ; (uii_change_dir.s4 + 0)
1bb3 : a9 01 __ LDA #$01
1bb5 : 85 11 __ STA P4 
1bb7 : 20 08 25 JSR $2508 ; (uii_open_file@proxy + 0)
1bba : 20 20 19 JSR $1920 ; (strcmp@proxy + 0)
1bbd : aa __ __ TAX
1bbe : a9 00 __ LDA #$00
1bc0 : 85 4e __ STA T1 + 2 
1bc2 : 85 4f __ STA T1 + 3 
1bc4 : a9 a0 __ LDA #$a0
1bc6 : 85 4c __ STA T1 + 0 
1bc8 : a9 5f __ LDA #$5f
1bca : 85 4d __ STA T1 + 1 
1bcc : 8a __ __ TXA
1bcd : f0 10 __ BEQ $1bdf ; (read_old_slotsfile.s5 + 0)
.s14:
1bcf : a9 00 __ LDA #$00
1bd1 : 8d fc 9f STA $9ffc ; (sstack + 4)
1bd4 : a9 1d __ LDA #$1d
1bd6 : 8d fd 9f STA $9ffd ; (sstack + 5)
1bd9 : 20 cc 0e JSR $0ecc ; (error.s1 + 0)
1bdc : 20 48 15 JSR $1548 ; (exit@proxy + 0)
.s5:
1bdf : a9 16 __ LDA #$16
1be1 : a0 05 __ LDY #$05
1be3 : 91 23 __ STA (SP + 0),y 
1be5 : a9 1d __ LDA #$1d
1be7 : c8 __ __ INY
1be8 : 91 23 __ STA (SP + 0),y 
1bea : a9 a0 __ LDA #$a0
1bec : c8 __ __ INY
1bed : 91 23 __ STA (SP + 0),y 
1bef : a9 5f __ LDA #$5f
1bf1 : c8 __ __ INY
1bf2 : 91 23 __ STA (SP + 0),y 
1bf4 : a9 00 __ LDA #$00
1bf6 : a0 0a __ LDY #$0a
1bf8 : 91 23 __ STA (SP + 0),y 
1bfa : a9 f0 __ LDA #$f0
1bfc : c8 __ __ INY
1bfd : 91 23 __ STA (SP + 0),y 
1bff : a9 81 __ LDA #$81
1c01 : c8 __ __ INY
1c02 : 91 23 __ STA (SP + 0),y 
1c04 : a9 00 __ LDA #$00
1c06 : a0 0e __ LDY #$0e
1c08 : 91 23 __ STA (SP + 0),y 
1c0a : a0 09 __ LDY #$09
1c0c : 91 23 __ STA (SP + 0),y 
1c0e : a0 0d __ LDY #$0d
1c10 : 91 23 __ STA (SP + 0),y 
1c12 : ae f0 25 LDX $25f0 ; (cw + 5)
1c15 : e8 __ __ INX
1c16 : 86 50 __ STX T2 + 0 
1c18 : 20 0b 0f JSR $0f0b ; (cwin_console_printf.s4 + 0)
.l6:
1c1b : a9 50 __ LDA #$50
1c1d : 85 11 __ STA P4 
1c1f : a9 22 __ LDA #$22
1c21 : 85 12 __ STA P5 
1c23 : 20 12 0d JSR $0d12 ; (uii_read_file.s4 + 0)
1c26 : 2c 1c df BIT $df1c 
1c29 : 30 0c __ BMI $1c37 ; (read_old_slotsfile.l13 + 0)
.s7:
1c2b : ad 1c df LDA $df1c 
1c2e : 29 30 __ AND #$30
1c30 : c9 30 __ CMP #$30
1c32 : f0 03 __ BEQ $1c37 ; (read_old_slotsfile.l13 + 0)
1c34 : 4c c5 1c JMP $1cc5 ; (read_old_slotsfile.s8 + 0)
.l13:
1c37 : 20 bb 0d JSR $0dbb ; (uii_readdata.s4 + 0)
1c3a : a5 1b __ LDA ACCU + 0 
1c3c : 85 53 __ STA T3 + 0 
1c3e : a5 1c __ LDA ACCU + 1 
1c40 : 85 54 __ STA T3 + 1 
1c42 : 20 a7 0e JSR $0ea7 ; (uii_accept.s4 + 0)
1c45 : a9 2a __ LDA #$2a
1c47 : 8d fe 9f STA $9ffe ; (sstack + 6)
1c4a : a9 1d __ LDA #$1d
1c4c : 8d ff 9f STA $9fff ; (sstack + 7)
1c4f : 20 74 19 JSR $1974 ; (CheckStatus.s1 + 0)
1c52 : a5 50 __ LDA T2 + 0 
1c54 : 8d f0 25 STA $25f0 ; (cw + 5)
1c57 : a9 64 __ LDA #$64
1c59 : 8d 02 df STA $df02 
1c5c : a9 26 __ LDA #$26
1c5e : 8d 03 df STA $df03 
1c61 : a5 4c __ LDA T1 + 0 
1c63 : 8d 04 df STA $df04 
1c66 : a5 4d __ LDA T1 + 1 
1c68 : 8d 05 df STA $df05 
1c6b : a5 4e __ LDA T1 + 2 
1c6d : 8d 06 df STA $df06 
1c70 : a5 53 __ LDA T3 + 0 
1c72 : 8d 07 df STA $df07 
1c75 : a5 54 __ LDA T3 + 1 
1c77 : 8d 08 df STA $df08 
1c7a : a9 00 __ LDA #$00
1c7c : 8d ef 25 STA $25ef ; (cw + 4)
1c7f : 8d 0a df STA $df0a 
1c82 : a9 90 __ LDA #$90
1c84 : 8d 01 df STA $df01 
1c87 : a9 38 __ LDA #$38
1c89 : a0 05 __ LDY #$05
1c8b : 91 23 __ STA (SP + 0),y 
1c8d : a9 1d __ LDA #$1d
1c8f : c8 __ __ INY
1c90 : 91 23 __ STA (SP + 0),y 
1c92 : 18 __ __ CLC
1c93 : a5 53 __ LDA T3 + 0 
1c95 : 65 4c __ ADC T1 + 0 
1c97 : 85 4c __ STA T1 + 0 
1c99 : c8 __ __ INY
1c9a : 91 23 __ STA (SP + 0),y 
1c9c : a5 54 __ LDA T3 + 1 
1c9e : 65 4d __ ADC T1 + 1 
1ca0 : 85 4d __ STA T1 + 1 
1ca2 : c8 __ __ INY
1ca3 : 91 23 __ STA (SP + 0),y 
1ca5 : a5 4e __ LDA T1 + 2 
1ca7 : 69 00 __ ADC #$00
1ca9 : 85 4e __ STA T1 + 2 
1cab : c8 __ __ INY
1cac : 91 23 __ STA (SP + 0),y 
1cae : a5 4f __ LDA T1 + 3 
1cb0 : 69 00 __ ADC #$00
1cb2 : 85 4f __ STA T1 + 3 
1cb4 : c8 __ __ INY
1cb5 : 91 23 __ STA (SP + 0),y 
1cb7 : 20 0b 0f JSR $0f0b ; (cwin_console_printf.s4 + 0)
1cba : 2c 1c df BIT $df1c 
1cbd : 10 03 __ BPL $1cc2 ; (read_old_slotsfile.l13 + 139)
1cbf : 4c 37 1c JMP $1c37 ; (read_old_slotsfile.l13 + 0)
1cc2 : 4c 2b 1c JMP $1c2b ; (read_old_slotsfile.s7 + 0)
.s8:
1cc5 : a5 4f __ LDA T1 + 3 
1cc7 : f0 21 __ BEQ $1cea ; (read_old_slotsfile.s10 + 0)
.s15:
1cc9 : 10 03 __ BPL $1cce ; (read_old_slotsfile.s9 + 0)
1ccb : 4c 1b 1c JMP $1c1b ; (read_old_slotsfile.l6 + 0)
.s9:
1cce : 20 53 18 JSR $1853 ; (uii_close_file.s4 + 0)
1cd1 : 20 25 16 JSR $1625 ; (cwin_cursor_newline.s4 + 0)
.s3:
1cd4 : 18 __ __ CLC
1cd5 : a5 23 __ LDA SP + 0 
1cd7 : 69 0f __ ADC #$0f
1cd9 : 85 23 __ STA SP + 0 
1cdb : 90 02 __ BCC $1cdf ; (read_old_slotsfile.s3 + 11)
1cdd : e6 24 __ INC SP + 1 
1cdf : ad 12 9f LDA $9f12 ; (read_old_slotsfile@stack + 0)
1ce2 : 85 53 __ STA T3 + 0 
1ce4 : ad 13 9f LDA $9f13 ; (read_old_slotsfile@stack + 1)
1ce7 : 85 54 __ STA T3 + 1 
1ce9 : 60 __ __ RTS
.s10:
1cea : a5 4e __ LDA T1 + 2 
1cec : d0 e0 __ BNE $1cce ; (read_old_slotsfile.s9 + 0)
.s11:
1cee : a5 4d __ LDA T1 + 1 
1cf0 : c9 81 __ CMP #$81
1cf2 : 90 d7 __ BCC $1ccb ; (read_old_slotsfile.s15 + 2)
.s16:
1cf4 : d0 d8 __ BNE $1cce ; (read_old_slotsfile.s9 + 0)
.s12:
1cf6 : a5 4c __ LDA T1 + 0 
1cf8 : c9 f0 __ CMP #$f0
1cfa : b0 d2 __ BCS $1cce ; (read_old_slotsfile.s9 + 0)
1cfc : 4c 1b 1c JMP $1c1b ; (read_old_slotsfile.l6 + 0)
--------------------------------------------------------------------
1d00 : __ __ __ BYT 0a 6e 4f 20 53 4c 4f 54 53 20 46 49 4c 45 20 46 : .nO SLOTS FILE F
1d10 : __ __ __ BYT 4f 55 4e 44 2e 00                               : OUND..
--------------------------------------------------------------------
1d16 : __ __ __ BYT 0a 72 45 41 44 49 4e 47 20 25 4c 55 20 54 4f 20 : .rEADING %LU TO 
1d26 : __ __ __ BYT 25 4c 55 00                                     : %LU.
--------------------------------------------------------------------
1d2a : __ __ __ BYT 52 45 41 44 49 4e 47 20 53 4c 4f 54 53 00       : READING SLOTS.
--------------------------------------------------------------------
1d38 : __ __ __ BYT 72 45 41 44 49 4e 47 20 53 4c 4f 54 20 44 41 54 : rEADING SLOT DAT
1d48 : __ __ __ BYT 41 20 54 4f 20 25 4c 55 2e 00                   : A TO %LU..
--------------------------------------------------------------------
1d52 : __ __ __ BYT 0a 63 4f 4e 56 45 52 54 49 4e 47 20 53 4c 4f 54 : .cONVERTING SLOT
1d62 : __ __ __ BYT 20 44 41 54 41 2e 2e 2e 00                      :  DATA....
--------------------------------------------------------------------
convert_slot_data: ; convert_slot_data()->void
.s1:
1d6b : 38 __ __ SEC
1d6c : a5 23 __ LDA SP + 0 
1d6e : e9 09 __ SBC #$09
1d70 : 85 23 __ STA SP + 0 
1d72 : b0 02 __ BCS $1d76 ; (convert_slot_data.s4 + 0)
1d74 : c6 24 __ DEC SP + 1 
.s4:
1d76 : ae f0 25 LDX $25f0 ; (cw + 5)
1d79 : e8 __ __ INX
1d7a : 86 50 __ STX T6 + 0 
1d7c : a9 00 __ LDA #$00
1d7e : 85 51 __ STA T7 + 0 
1d80 : 85 4c __ STA T0 + 0 
1d82 : 85 4d __ STA T0 + 1 
1d84 : a9 a0 __ LDA #$a0
1d86 : 85 4e __ STA T1 + 0 
1d88 : a9 5f __ LDA #$5f
1d8a : 85 4f __ STA T1 + 1 
.l5:
1d8c : a9 49 __ LDA #$49
1d8e : a0 05 __ LDY #$05
1d90 : 91 23 __ STA (SP + 0),y 
1d92 : a9 1f __ LDA #$1f
1d94 : c8 __ __ INY
1d95 : 91 23 __ STA (SP + 0),y 
1d97 : a5 50 __ LDA T6 + 0 
1d99 : 8d f0 25 STA $25f0 ; (cw + 5)
1d9c : a5 51 __ LDA T7 + 0 
1d9e : c8 __ __ INY
1d9f : 91 23 __ STA (SP + 0),y 
1da1 : a9 00 __ LDA #$00
1da3 : 8d ef 25 STA $25ef ; (cw + 4)
1da6 : c8 __ __ INY
1da7 : 91 23 __ STA (SP + 0),y 
1da9 : 20 0b 0f JSR $0f0b ; (cwin_console_printf.s4 + 0)
1dac : a9 4e __ LDA #$4e
1dae : 85 0d __ STA P0 
1db0 : a9 2b __ LDA #$2b
1db2 : 85 0e __ STA P1 
1db4 : a9 66 __ LDA #$66
1db6 : 8d 02 df STA $df02 
1db9 : a9 29 __ LDA #$29
1dbb : 8d 03 df STA $df03 
1dbe : a5 4e __ LDA T1 + 0 
1dc0 : 8d 04 df STA $df04 
1dc3 : a5 4f __ LDA T1 + 1 
1dc5 : 8d 05 df STA $df05 
1dc8 : a9 00 __ LDA #$00
1dca : 85 0f __ STA P2 
1dcc : 85 10 __ STA P3 
1dce : 8d 06 df STA $df06 
1dd1 : a9 e8 __ LDA #$e8
1dd3 : 8d 07 df STA $df07 
1dd6 : a9 01 __ LDA #$01
1dd8 : 8d 08 df STA $df08 
1ddb : a9 00 __ LDA #$00
1ddd : 8d 0a df STA $df0a 
1de0 : a9 91 __ LDA #$91
1de2 : 8d 01 df STA $df01 
1de5 : a9 50 __ LDA #$50
1de7 : 85 11 __ STA P4 
1de9 : a9 05 __ LDA #$05
1deb : 85 12 __ STA P5 
1ded : 20 5c 1f JSR $1f5c ; (memset.s4 + 0)
1df0 : a9 4f __ LDA #$4f
1df2 : 85 0d __ STA P0 
1df4 : a9 02 __ LDA #$02
1df6 : 8d 4e 2b STA $2b4e ; (Slot + 0)
1df9 : a9 2b __ LDA #$2b
1dfb : 85 0e __ STA P1 
1dfd : a9 66 __ LDA #$66
1dff : 85 0f __ STA P2 
1e01 : a9 29 __ LDA #$29
1e03 : 85 10 __ STA P3 
1e05 : 20 78 1f JSR $1f78 ; (strncpy@proxy + 0)
1e08 : a9 4f __ LDA #$4f
1e0a : 85 0d __ STA P0 
1e0c : a9 2c __ LDA #$2c
1e0e : 85 0e __ STA P1 
1e10 : a9 ca __ LDA #$ca
1e12 : 85 0f __ STA P2 
1e14 : a9 29 __ LDA #$29
1e16 : 85 10 __ STA P3 
1e18 : a9 1e __ LDA #$1e
1e1a : 85 11 __ STA P4 
1e1c : 20 f6 24 JSR $24f6 ; (strncpy@proxy + 0)
1e1f : a9 6e __ LDA #$6e
1e21 : 85 0d __ STA P0 
1e23 : a9 2c __ LDA #$2c
1e25 : 85 0e __ STA P1 
1e27 : a9 df __ LDA #$df
1e29 : 85 0f __ STA P2 
1e2b : a9 29 __ LDA #$29
1e2d : 85 10 __ STA P3 
1e2f : 20 fd 24 JSR $24fd ; (strncpy@proxy + 0)
1e32 : a9 a1 __ LDA #$a1
1e34 : 85 0d __ STA P0 
1e36 : a9 2c __ LDA #$2c
1e38 : 85 0e __ STA P1 
1e3a : a9 f3 __ LDA #$f3
1e3c : 85 0f __ STA P2 
1e3e : a9 29 __ LDA #$29
1e40 : 85 10 __ STA P3 
1e42 : a9 50 __ LDA #$50
1e44 : 85 11 __ STA P4 
1e46 : 20 f6 24 JSR $24f6 ; (strncpy@proxy + 0)
1e49 : a9 f2 __ LDA #$f2
1e4b : 85 0d __ STA P0 
1e4d : a9 2c __ LDA #$2c
1e4f : 85 0e __ STA P1 
1e51 : a9 43 __ LDA #$43
1e53 : 85 0f __ STA P2 
1e55 : a9 2a __ LDA #$2a
1e57 : 85 10 __ STA P3 
1e59 : 20 fd 24 JSR $24fd ; (strncpy@proxy + 0)
1e5c : ad 57 2a LDA $2a57 ; (OldSlot + 241)
1e5f : 8d 25 2e STA $2e25 ; (Slot + 727)
1e62 : a9 29 __ LDA #$29
1e64 : 85 0d __ STA P0 
1e66 : a9 2e __ LDA #$2e
1e68 : 85 0e __ STA P1 
1e6a : a9 5c __ LDA #$5c
1e6c : 85 0f __ STA P2 
1e6e : a9 2a __ LDA #$2a
1e70 : 85 10 __ STA P3 
1e72 : a9 ff __ LDA #$ff
1e74 : 85 11 __ STA P4 
1e76 : a9 00 __ LDA #$00
1e78 : 85 12 __ STA P5 
1e7a : ad 58 2a LDA $2a58 ; (OldSlot + 242)
1e7d : 8d 26 2e STA $2e26 ; (Slot + 728)
1e80 : ad 59 2a LDA $2a59 ; (OldSlot + 243)
1e83 : 8d 27 2e STA $2e27 ; (Slot + 729)
1e86 : ad 5a 2a LDA $2a5a ; (OldSlot + 244)
1e89 : 8d 28 2e STA $2e28 ; (Slot + 730)
1e8c : 20 80 1f JSR $1f80 ; (strncpy.s4 + 0)
1e8f : a9 29 __ LDA #$29
1e91 : 85 0d __ STA P0 
1e93 : a9 2f __ LDA #$2f
1e95 : 85 0e __ STA P1 
1e97 : a9 c0 __ LDA #$c0
1e99 : 85 0f __ STA P2 
1e9b : a9 2a __ LDA #$2a
1e9d : 85 10 __ STA P3 
1e9f : 20 fd 24 JSR $24fd ; (strncpy@proxy + 0)
1ea2 : ad d4 2a LDA $2ad4 ; (OldSlot + 366)
1ea5 : 8d 5c 2f STA $2f5c ; (Slot + 1038)
1ea8 : a9 5d __ LDA #$5d
1eaa : 85 0d __ STA P0 
1eac : a9 2f __ LDA #$2f
1eae : 85 0e __ STA P1 
1eb0 : a9 d5 __ LDA #$d5
1eb2 : 85 0f __ STA P2 
1eb4 : a9 2a __ LDA #$2a
1eb6 : 85 10 __ STA P3 
1eb8 : 20 78 1f JSR $1f78 ; (strncpy@proxy + 0)
1ebb : a9 5d __ LDA #$5d
1ebd : 85 0d __ STA P0 
1ebf : a9 30 __ LDA #$30
1ec1 : 85 0e __ STA P1 
1ec3 : a9 39 __ LDA #$39
1ec5 : 85 0f __ STA P2 
1ec7 : a9 2b __ LDA #$2b
1ec9 : 85 10 __ STA P3 
1ecb : 20 fd 24 JSR $24fd ; (strncpy@proxy + 0)
1ece : ad 4d 2b LDA $2b4d ; (OldSlot + 487)
1ed1 : 8d 90 30 STA $3090 ; (Slot + 1346)
1ed4 : a9 91 __ LDA #$91
1ed6 : 85 0d __ STA P0 
1ed8 : a9 30 __ LDA #$30
1eda : 85 0e __ STA P1 
1edc : a9 e3 __ LDA #$e3
1ede : 85 0f __ STA P2 
1ee0 : a9 1f __ LDA #$1f
1ee2 : 85 10 __ STA P3 
1ee4 : a9 0d __ LDA #$0d
1ee6 : 85 11 __ STA P4 
1ee8 : 20 f6 24 JSR $24f6 ; (strncpy@proxy + 0)
1eeb : a9 4e __ LDA #$4e
1eed : 8d 02 df STA $df02 
1ef0 : a9 2b __ LDA #$2b
1ef2 : 8d 03 df STA $df03 
1ef5 : a5 4c __ LDA T0 + 0 
1ef7 : 8d 04 df STA $df04 
1efa : a5 4d __ LDA T0 + 1 
1efc : 8d 05 df STA $df05 
1eff : a9 00 __ LDA #$00
1f01 : 8d 06 df STA $df06 
1f04 : a9 50 __ LDA #$50
1f06 : 8d 07 df STA $df07 
1f09 : a9 05 __ LDA #$05
1f0b : 8d 08 df STA $df08 
1f0e : a9 00 __ LDA #$00
1f10 : 8d 0a df STA $df0a 
1f13 : a9 90 __ LDA #$90
1f15 : 8d 01 df STA $df01 
1f18 : 18 __ __ CLC
1f19 : a5 4e __ LDA T1 + 0 
1f1b : 69 e8 __ ADC #$e8
1f1d : 85 4e __ STA T1 + 0 
1f1f : a5 4f __ LDA T1 + 1 
1f21 : 69 01 __ ADC #$01
1f23 : 85 4f __ STA T1 + 1 
1f25 : 18 __ __ CLC
1f26 : a5 4c __ LDA T0 + 0 
1f28 : 69 50 __ ADC #$50
1f2a : 85 4c __ STA T0 + 0 
1f2c : a5 4d __ LDA T0 + 1 
1f2e : 69 05 __ ADC #$05
1f30 : 85 4d __ STA T0 + 1 
1f32 : e6 51 __ INC T7 + 0 
1f34 : a5 51 __ LDA T7 + 0 
1f36 : c9 12 __ CMP #$12
1f38 : f0 03 __ BEQ $1f3d ; (convert_slot_data.s3 + 0)
1f3a : 4c 8c 1d JMP $1d8c ; (convert_slot_data.l5 + 0)
.s3:
1f3d : 18 __ __ CLC
1f3e : a5 23 __ LDA SP + 0 
1f40 : 69 09 __ ADC #$09
1f42 : 85 23 __ STA SP + 0 
1f44 : 90 02 __ BCC $1f48 ; (convert_slot_data.s3 + 11)
1f46 : e6 24 __ INC SP + 1 
1f48 : 60 __ __ RTS
--------------------------------------------------------------------
1f49 : __ __ __ BYT 63 4f 4e 56 45 52 54 49 4e 47 20 53 4c 4f 54 20 : cONVERTING SLOT 
1f59 : __ __ __ BYT 25 55 00                                        : %U.
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
.s4:
1f5c : a5 0f __ LDA P2 
1f5e : a6 12 __ LDX P5 
1f60 : f0 0c __ BEQ $1f6e ; (memset.s4 + 18)
1f62 : a0 00 __ LDY #$00
1f64 : 91 0d __ STA (P0),y 
1f66 : c8 __ __ INY
1f67 : d0 fb __ BNE $1f64 ; (memset.s4 + 8)
1f69 : e6 0e __ INC P1 
1f6b : ca __ __ DEX
1f6c : d0 f6 __ BNE $1f64 ; (memset.s4 + 8)
1f6e : a4 11 __ LDY P4 
1f70 : f0 05 __ BEQ $1f77 ; (memset.s3 + 0)
1f72 : 88 __ __ DEY
1f73 : 91 0d __ STA (P0),y 
1f75 : d0 fb __ BNE $1f72 ; (memset.s4 + 22)
.s3:
1f77 : 60 __ __ RTS
--------------------------------------------------------------------
strncpy@proxy: ; strncpy@proxy
1f78 : a9 ff __ LDA #$ff
1f7a : 85 11 __ STA P4 
1f7c : a9 00 __ LDA #$00
1f7e : 85 12 __ STA P5 
--------------------------------------------------------------------
strncpy: ; strncpy(u8*,const u8*,i16)->void
.s4:
1f80 : a5 11 __ LDA P4 ; (n + 0)
1f82 : aa __ __ TAX
1f83 : 18 __ __ CLC
1f84 : 69 ff __ ADC #$ff
1f86 : 85 11 __ STA P4 ; (n + 0)
1f88 : a5 12 __ LDA P5 ; (n + 1)
1f8a : 85 1c __ STA ACCU + 1 
1f8c : 69 ff __ ADC #$ff
1f8e : 85 12 __ STA P5 ; (n + 1)
.l5:
1f90 : 8a __ __ TXA
1f91 : 05 1c __ ORA ACCU + 1 
1f93 : f0 29 __ BEQ $1fbe ; (strncpy.s6 + 0)
.s9:
1f95 : a0 00 __ LDY #$00
1f97 : b1 0f __ LDA (P2),y ; (src + 0)
1f99 : 91 0d __ STA (P0),y ; (dst + 0)
1f9b : aa __ __ TAX
1f9c : e6 0d __ INC P0 ; (dst + 0)
1f9e : d0 02 __ BNE $1fa2 ; (strncpy.s16 + 0)
.s15:
1fa0 : e6 0e __ INC P1 ; (dst + 1)
.s16:
1fa2 : 8a __ __ TXA
1fa3 : f0 19 __ BEQ $1fbe ; (strncpy.s6 + 0)
.s10:
1fa5 : a5 11 __ LDA P4 ; (n + 0)
1fa7 : aa __ __ TAX
1fa8 : 18 __ __ CLC
1fa9 : 69 ff __ ADC #$ff
1fab : 85 11 __ STA P4 ; (n + 0)
1fad : a5 12 __ LDA P5 ; (n + 1)
1faf : 85 1c __ STA ACCU + 1 
1fb1 : 69 ff __ ADC #$ff
1fb3 : 85 12 __ STA P5 ; (n + 1)
1fb5 : e6 0f __ INC P2 ; (src + 0)
1fb7 : d0 d7 __ BNE $1f90 ; (strncpy.l5 + 0)
.s17:
1fb9 : e6 10 __ INC P3 ; (src + 1)
1fbb : 4c 90 1f JMP $1f90 ; (strncpy.l5 + 0)
.s6:
1fbe : a5 12 __ LDA P5 ; (n + 1)
1fc0 : 30 20 __ BMI $1fe2 ; (strncpy.s3 + 0)
.s8:
1fc2 : 05 11 __ ORA P4 ; (n + 0)
1fc4 : f0 1c __ BEQ $1fe2 ; (strncpy.s3 + 0)
.s7:
1fc6 : a0 00 __ LDY #$00
1fc8 : a5 11 __ LDA P4 ; (n + 0)
1fca : f0 02 __ BEQ $1fce ; (strncpy.l11 + 0)
.s12:
1fcc : e6 12 __ INC P5 ; (n + 1)
.l11:
1fce : a6 11 __ LDX P4 ; (n + 0)
.l13:
1fd0 : a9 00 __ LDA #$00
1fd2 : 91 0d __ STA (P0),y ; (dst + 0)
1fd4 : c8 __ __ INY
1fd5 : d0 02 __ BNE $1fd9 ; (strncpy.s19 + 0)
.s18:
1fd7 : e6 0e __ INC P1 ; (dst + 1)
.s19:
1fd9 : ca __ __ DEX
1fda : d0 f4 __ BNE $1fd0 ; (strncpy.l13 + 0)
.s14:
1fdc : 85 11 __ STA P4 ; (n + 0)
1fde : c6 12 __ DEC P5 ; (n + 1)
1fe0 : d0 ec __ BNE $1fce ; (strncpy.l11 + 0)
.s3:
1fe2 : 60 __ __ RTS
--------------------------------------------------------------------
1fe3 : __ __ __ BYT 55 42 4f 4f 54 36 34 20 58 20 4d 4f 4c 00       : UBOOT64 X MOL.
--------------------------------------------------------------------
1ff1 : __ __ __ BYT 57 52 49 54 49 4e 47 20 53 4c 4f 54 53 00       : WRITING SLOTS.
--------------------------------------------------------------------
2000 : __ __ __ BYT 0a 77 52 49 54 49 4e 47 20 4e 45 57 20 53 4c 4f : .wRITING NEW SLO
2010 : __ __ __ BYT 54 53 20 46 49 4c 45 2e 2e 2e 00                : TS FILE....
--------------------------------------------------------------------
write_slotsfile: ; write_slotsfile()->void
.s1:
201b : 38 __ __ SEC
201c : a5 23 __ LDA SP + 0 
201e : e9 0b __ SBC #$0b
2020 : 85 23 __ STA SP + 0 
2022 : b0 02 __ BCS $2026 ; (write_slotsfile.s4 + 0)
2024 : c6 24 __ DEC SP + 1 
.s4:
2026 : ad f0 25 LDA $25f0 ; (cw + 5)
2029 : 85 52 __ STA T5 + 0 
202b : 20 2a 0e JSR $0e2a ; (uii_change_dir.s4 + 0)
202e : a9 7d __ LDA #$7d
2030 : 85 11 __ STA P4 
2032 : a9 25 __ LDA #$25
2034 : 85 12 __ STA P5 
2036 : 20 60 1a JSR $1a60 ; (uii_delete_file.s4 + 0)
2039 : a9 06 __ LDA #$06
203b : 85 11 __ STA P4 
203d : 20 08 25 JSR $2508 ; (uii_open_file@proxy + 0)
2040 : a9 00 __ LDA #$00
2042 : 85 4c __ STA T1 + 0 
2044 : 85 4d __ STA T1 + 1 
2046 : 85 4e __ STA T1 + 2 
2048 : 85 4f __ STA T1 + 3 
204a : a9 f4 __ LDA #$f4
204c : 85 50 __ STA T2 + 0 
204e : a9 01 __ LDA #$01
2050 : 85 51 __ STA T2 + 1 
.l5:
2052 : a5 52 __ LDA T5 + 0 
2054 : 8d f0 25 STA $25f0 ; (cw + 5)
2057 : a9 31 __ LDA #$31
2059 : a0 05 __ LDY #$05
205b : 91 23 __ STA (SP + 0),y 
205d : a9 21 __ LDA #$21
205f : c8 __ __ INY
2060 : 91 23 __ STA (SP + 0),y 
2062 : a5 4c __ LDA T1 + 0 
2064 : c8 __ __ INY
2065 : 91 23 __ STA (SP + 0),y 
2067 : a5 4d __ LDA T1 + 1 
2069 : c8 __ __ INY
206a : 91 23 __ STA (SP + 0),y 
206c : a9 00 __ LDA #$00
206e : c8 __ __ INY
206f : 91 23 __ STA (SP + 0),y 
2071 : 8d ef 25 STA $25ef ; (cw + 4)
2074 : c8 __ __ INY
2075 : 91 23 __ STA (SP + 0),y 
2077 : 20 0b 0f JSR $0f0b ; (cwin_console_printf.s4 + 0)
207a : a9 00 __ LDA #$00
207c : a2 fa __ LDX #$fa
.l7:
207e : ca __ __ DEX
207f : 9d 24 9d STA $9d24,x ; (save_buffer + 0)
2082 : 9d 1e 9e STA $9e1e,x ; (save_buffer + 250)
2085 : d0 f7 __ BNE $207e ; (write_slotsfile.l7 + 0)
.s6:
2087 : 38 __ __ SEC
2088 : a9 a0 __ LDA #$a0
208a : e5 4c __ SBC T1 + 0 
208c : aa __ __ TAX
208d : a9 5f __ LDA #$5f
208f : e5 4d __ SBC T1 + 1 
2091 : a8 __ __ TAY
2092 : a9 00 __ LDA #$00
2094 : e5 4e __ SBC T1 + 2 
2096 : 85 1d __ STA ACCU + 2 
2098 : a9 00 __ LDA #$00
209a : e5 4f __ SBC T1 + 3 
209c : 38 __ __ SEC
209d : d0 0a __ BNE $20a9 ; (write_slotsfile.s17 + 0)
.s14:
209f : a5 1d __ LDA ACCU + 2 
20a1 : d0 06 __ BNE $20a9 ; (write_slotsfile.s17 + 0)
.s15:
20a3 : c0 01 __ CPY #$01
20a5 : d0 02 __ BNE $20a9 ; (write_slotsfile.s17 + 0)
.s16:
20a7 : e0 f4 __ CPX #$f4
.s17:
20a9 : b0 04 __ BCS $20af ; (write_slotsfile.s8 + 0)
.s13:
20ab : 86 50 __ STX T2 + 0 
20ad : 84 51 __ STY T2 + 1 
.s8:
20af : a5 50 __ LDA T2 + 0 
20b1 : 85 13 __ STA P6 
20b3 : 8d 07 df STA $df07 
20b6 : a5 51 __ LDA T2 + 1 
20b8 : 85 14 __ STA P7 
20ba : 8d 08 df STA $df08 
20bd : a9 24 __ LDA #$24
20bf : 85 11 __ STA P4 
20c1 : 8d 02 df STA $df02 
20c4 : a9 9d __ LDA #$9d
20c6 : 85 12 __ STA P5 
20c8 : 8d 03 df STA $df03 
20cb : a5 4c __ LDA T1 + 0 
20cd : 8d 04 df STA $df04 
20d0 : a5 4d __ LDA T1 + 1 
20d2 : 8d 05 df STA $df05 
20d5 : a9 00 __ LDA #$00
20d7 : 8d 06 df STA $df06 
20da : 8d 0a df STA $df0a 
20dd : a9 91 __ LDA #$91
20df : 8d 01 df STA $df01 
20e2 : 20 f0 1a JSR $1af0 ; (uii_write_file.s4 + 0)
20e5 : a9 f1 __ LDA #$f1
20e7 : 8d fe 9f STA $9ffe ; (sstack + 6)
20ea : a9 1f __ LDA #$1f
20ec : 8d ff 9f STA $9fff ; (sstack + 7)
20ef : 20 74 19 JSR $1974 ; (CheckStatus.s1 + 0)
20f2 : 18 __ __ CLC
20f3 : a5 4c __ LDA T1 + 0 
20f5 : 69 f4 __ ADC #$f4
20f7 : 85 4c __ STA T1 + 0 
20f9 : a5 4d __ LDA T1 + 1 
20fb : 69 01 __ ADC #$01
20fd : 85 4d __ STA T1 + 1 
20ff : a5 4e __ LDA T1 + 2 
2101 : 69 00 __ ADC #$00
2103 : 85 4e __ STA T1 + 2 
2105 : a5 4f __ LDA T1 + 3 
2107 : 69 00 __ ADC #$00
2109 : d0 17 __ BNE $2122 ; (write_slotsfile.s9 + 0)
.s10:
210b : 85 4f __ STA T1 + 3 
210d : a5 4e __ LDA T1 + 2 
210f : d0 11 __ BNE $2122 ; (write_slotsfile.s9 + 0)
.s11:
2111 : a5 4d __ LDA T1 + 1 
2113 : c9 5f __ CMP #$5f
2115 : b0 03 __ BCS $211a ; (write_slotsfile.s18 + 0)
2117 : 4c 52 20 JMP $2052 ; (write_slotsfile.l5 + 0)
.s18:
211a : d0 06 __ BNE $2122 ; (write_slotsfile.s9 + 0)
.s12:
211c : a5 4c __ LDA T1 + 0 
211e : c9 a0 __ CMP #$a0
2120 : 90 f5 __ BCC $2117 ; (write_slotsfile.s11 + 6)
.s9:
2122 : 20 53 18 JSR $1853 ; (uii_close_file.s4 + 0)
.s3:
2125 : 18 __ __ CLC
2126 : a5 23 __ LDA SP + 0 
2128 : 69 0b __ ADC #$0b
212a : 85 23 __ STA SP + 0 
212c : 90 02 __ BCC $2130 ; (write_slotsfile.s3 + 11)
212e : e6 24 __ INC SP + 1 
2130 : 60 __ __ RTS
--------------------------------------------------------------------
2131 : __ __ __ BYT 77 52 49 54 49 4e 47 20 53 4c 4f 54 20 44 41 54 : wRITING SLOT DAT
2141 : __ __ __ BYT 41 20 41 54 20 25 4c 55 2e 00                   : A AT %LU..
--------------------------------------------------------------------
214b : __ __ __ BYT 0a 0a 75 50 44 41 54 45 20 43 4f 4d 50 4c 45 54 : ..uPDATE COMPLET
215b : __ __ __ BYT 45 44 2e 0a 00                                  : ED...
--------------------------------------------------------------------
2160 : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 20 54 4f 20 45 58 49 : pRESS KEY TO EXI
2170 : __ __ __ BYT 54 20 54 4f 20 62 61 73 69 63 2e 0a 00          : T TO basic...
--------------------------------------------------------------------
divmod: ; divmod
217d : a5 1c __ LDA ACCU + 1 
217f : d0 31 __ BNE $21b2 ; (divmod + 53)
2181 : a5 04 __ LDA WORK + 1 
2183 : d0 1e __ BNE $21a3 ; (divmod + 38)
2185 : 85 06 __ STA WORK + 3 
2187 : a2 04 __ LDX #$04
2189 : 06 1b __ ASL ACCU + 0 
218b : 2a __ __ ROL
218c : c5 03 __ CMP WORK + 0 
218e : 90 02 __ BCC $2192 ; (divmod + 21)
2190 : e5 03 __ SBC WORK + 0 
2192 : 26 1b __ ROL ACCU + 0 
2194 : 2a __ __ ROL
2195 : c5 03 __ CMP WORK + 0 
2197 : 90 02 __ BCC $219b ; (divmod + 30)
2199 : e5 03 __ SBC WORK + 0 
219b : 26 1b __ ROL ACCU + 0 
219d : ca __ __ DEX
219e : d0 eb __ BNE $218b ; (divmod + 14)
21a0 : 85 05 __ STA WORK + 2 
21a2 : 60 __ __ RTS
21a3 : a5 1b __ LDA ACCU + 0 
21a5 : 85 05 __ STA WORK + 2 
21a7 : a5 1c __ LDA ACCU + 1 
21a9 : 85 06 __ STA WORK + 3 
21ab : a9 00 __ LDA #$00
21ad : 85 1b __ STA ACCU + 0 
21af : 85 1c __ STA ACCU + 1 
21b1 : 60 __ __ RTS
21b2 : a5 04 __ LDA WORK + 1 
21b4 : d0 1f __ BNE $21d5 ; (divmod + 88)
21b6 : a5 03 __ LDA WORK + 0 
21b8 : 30 1b __ BMI $21d5 ; (divmod + 88)
21ba : a9 00 __ LDA #$00
21bc : 85 06 __ STA WORK + 3 
21be : a2 10 __ LDX #$10
21c0 : 06 1b __ ASL ACCU + 0 
21c2 : 26 1c __ ROL ACCU + 1 
21c4 : 2a __ __ ROL
21c5 : c5 03 __ CMP WORK + 0 
21c7 : 90 02 __ BCC $21cb ; (divmod + 78)
21c9 : e5 03 __ SBC WORK + 0 
21cb : 26 1b __ ROL ACCU + 0 
21cd : 26 1c __ ROL ACCU + 1 
21cf : ca __ __ DEX
21d0 : d0 f2 __ BNE $21c4 ; (divmod + 71)
21d2 : 85 05 __ STA WORK + 2 
21d4 : 60 __ __ RTS
21d5 : a9 00 __ LDA #$00
21d7 : 85 05 __ STA WORK + 2 
21d9 : 85 06 __ STA WORK + 3 
21db : 84 02 __ STY $02 
21dd : a0 10 __ LDY #$10
21df : 18 __ __ CLC
21e0 : 26 1b __ ROL ACCU + 0 
21e2 : 26 1c __ ROL ACCU + 1 
21e4 : 26 05 __ ROL WORK + 2 
21e6 : 26 06 __ ROL WORK + 3 
21e8 : 38 __ __ SEC
21e9 : a5 05 __ LDA WORK + 2 
21eb : e5 03 __ SBC WORK + 0 
21ed : aa __ __ TAX
21ee : a5 06 __ LDA WORK + 3 
21f0 : e5 04 __ SBC WORK + 1 
21f2 : 90 04 __ BCC $21f8 ; (divmod + 123)
21f4 : 86 05 __ STX WORK + 2 
21f6 : 85 06 __ STA WORK + 3 
21f8 : 88 __ __ DEY
21f9 : d0 e5 __ BNE $21e0 ; (divmod + 99)
21fb : 26 1b __ ROL ACCU + 0 
21fd : 26 1c __ ROL ACCU + 1 
21ff : a4 02 __ LDY $02 
2201 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
2220 : 84 02 __ STY $02 
2222 : a0 20 __ LDY #$20
2224 : a9 00 __ LDA #$00
2226 : 85 07 __ STA WORK + 4 
2228 : 85 08 __ STA WORK + 5 
222a : 85 09 __ STA WORK + 6 
222c : 85 0a __ STA WORK + 7 
222e : a5 05 __ LDA WORK + 2 
2230 : 05 06 __ ORA WORK + 3 
2232 : d0 78 __ BNE $22ac ; (divmod32 + 140)
2234 : a5 04 __ LDA WORK + 1 
2236 : d0 27 __ BNE $225f ; (divmod32 + 63)
2238 : 18 __ __ CLC
2239 : 26 1b __ ROL ACCU + 0 
223b : 26 1c __ ROL ACCU + 1 
223d : 26 1d __ ROL ACCU + 2 
223f : 26 1e __ ROL ACCU + 3 
2241 : 2a __ __ ROL
2242 : 90 05 __ BCC $2249 ; (divmod32 + 41)
2244 : e5 03 __ SBC WORK + 0 
2246 : 38 __ __ SEC
2247 : b0 06 __ BCS $224f ; (divmod32 + 47)
2249 : c5 03 __ CMP WORK + 0 
224b : 90 02 __ BCC $224f ; (divmod32 + 47)
224d : e5 03 __ SBC WORK + 0 
224f : 88 __ __ DEY
2250 : d0 e7 __ BNE $2239 ; (divmod32 + 25)
2252 : 85 07 __ STA WORK + 4 
2254 : 26 1b __ ROL ACCU + 0 
2256 : 26 1c __ ROL ACCU + 1 
2258 : 26 1d __ ROL ACCU + 2 
225a : 26 1e __ ROL ACCU + 3 
225c : a4 02 __ LDY $02 
225e : 60 __ __ RTS
225f : a5 1e __ LDA ACCU + 3 
2261 : d0 10 __ BNE $2273 ; (divmod32 + 83)
2263 : a6 1d __ LDX ACCU + 2 
2265 : 86 1e __ STX ACCU + 3 
2267 : a6 1c __ LDX ACCU + 1 
2269 : 86 1d __ STX ACCU + 2 
226b : a6 1b __ LDX ACCU + 0 
226d : 86 1c __ STX ACCU + 1 
226f : 85 1b __ STA ACCU + 0 
2271 : a0 18 __ LDY #$18
2273 : 18 __ __ CLC
2274 : 26 1b __ ROL ACCU + 0 
2276 : 26 1c __ ROL ACCU + 1 
2278 : 26 1d __ ROL ACCU + 2 
227a : 26 1e __ ROL ACCU + 3 
227c : 26 07 __ ROL WORK + 4 
227e : 26 08 __ ROL WORK + 5 
2280 : 90 0c __ BCC $228e ; (divmod32 + 110)
2282 : a5 07 __ LDA WORK + 4 
2284 : e5 03 __ SBC WORK + 0 
2286 : aa __ __ TAX
2287 : a5 08 __ LDA WORK + 5 
2289 : e5 04 __ SBC WORK + 1 
228b : 38 __ __ SEC
228c : b0 0c __ BCS $229a ; (divmod32 + 122)
228e : 38 __ __ SEC
228f : a5 07 __ LDA WORK + 4 
2291 : e5 03 __ SBC WORK + 0 
2293 : aa __ __ TAX
2294 : a5 08 __ LDA WORK + 5 
2296 : e5 04 __ SBC WORK + 1 
2298 : 90 04 __ BCC $229e ; (divmod32 + 126)
229a : 86 07 __ STX WORK + 4 
229c : 85 08 __ STA WORK + 5 
229e : 88 __ __ DEY
229f : d0 d3 __ BNE $2274 ; (divmod32 + 84)
22a1 : 26 1b __ ROL ACCU + 0 
22a3 : 26 1c __ ROL ACCU + 1 
22a5 : 26 1d __ ROL ACCU + 2 
22a7 : 26 1e __ ROL ACCU + 3 
22a9 : a4 02 __ LDY $02 
22ab : 60 __ __ RTS
22ac : a0 10 __ LDY #$10
22ae : a5 1e __ LDA ACCU + 3 
22b0 : 85 08 __ STA WORK + 5 
22b2 : a5 1d __ LDA ACCU + 2 
22b4 : 85 07 __ STA WORK + 4 
22b6 : a9 00 __ LDA #$00
22b8 : 85 1d __ STA ACCU + 2 
22ba : 85 1e __ STA ACCU + 3 
22bc : 18 __ __ CLC
22bd : 26 1b __ ROL ACCU + 0 
22bf : 26 1c __ ROL ACCU + 1 
22c1 : 26 07 __ ROL WORK + 4 
22c3 : 26 08 __ ROL WORK + 5 
22c5 : 26 09 __ ROL WORK + 6 
22c7 : 26 0a __ ROL WORK + 7 
22c9 : a5 07 __ LDA WORK + 4 
22cb : c5 03 __ CMP WORK + 0 
22cd : a5 08 __ LDA WORK + 5 
22cf : e5 04 __ SBC WORK + 1 
22d1 : a5 09 __ LDA WORK + 6 
22d3 : e5 05 __ SBC WORK + 2 
22d5 : aa __ __ TAX
22d6 : a5 0a __ LDA WORK + 7 
22d8 : e5 06 __ SBC WORK + 3 
22da : 90 11 __ BCC $22ed ; (divmod32 + 205)
22dc : 86 09 __ STX WORK + 6 
22de : 85 0a __ STA WORK + 7 
22e0 : a5 07 __ LDA WORK + 4 
22e2 : e5 03 __ SBC WORK + 0 
22e4 : 85 07 __ STA WORK + 4 
22e6 : a5 08 __ LDA WORK + 5 
22e8 : e5 04 __ SBC WORK + 1 
22ea : 85 08 __ STA WORK + 5 
22ec : 38 __ __ SEC
22ed : 88 __ __ DEY
22ee : d0 cd __ BNE $22bd ; (divmod32 + 157)
22f0 : 26 1b __ ROL ACCU + 0 
22f2 : 26 1c __ ROL ACCU + 1 
22f4 : a4 02 __ LDY $02 
22f6 : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
22f7 : 18 __ __ CLC
22f8 : a5 1b __ LDA ACCU + 0 
22fa : 69 0d __ ADC #$0d
22fc : 29 fc __ AND #$fc
22fe : 85 03 __ STA WORK + 0 
2300 : a5 1c __ LDA ACCU + 1 
2302 : 69 00 __ ADC #$00
2304 : 85 04 __ STA WORK + 1 
2306 : ad f9 25 LDA $25f9 ; (HeapNode + 2)
2309 : d0 26 __ BNE $2331 ; (crt_malloc + 58)
230b : a9 00 __ LDA #$00
230d : 8d a2 30 STA $30a2 
2310 : 8d a3 30 STA $30a3 
2313 : ee f9 25 INC $25f9 ; (HeapNode + 2)
2316 : a9 a0 __ LDA #$a0
2318 : 09 02 __ ORA #$02
231a : 8d f7 25 STA $25f7 ; (HeapNode + 0)
231d : a9 30 __ LDA #$30
231f : 8d f8 25 STA $25f8 ; (HeapNode + 1)
2322 : 38 __ __ SEC
2323 : a9 00 __ LDA #$00
2325 : e9 02 __ SBC #$02
2327 : 8d a4 30 STA $30a4 
232a : a9 90 __ LDA #$90
232c : e9 00 __ SBC #$00
232e : 8d a5 30 STA $30a5 
2331 : a9 f7 __ LDA #$f7
2333 : a2 25 __ LDX #$25
2335 : 85 1d __ STA ACCU + 2 
2337 : 86 1e __ STX ACCU + 3 
2339 : 18 __ __ CLC
233a : a0 00 __ LDY #$00
233c : b1 1d __ LDA (ACCU + 2),y 
233e : 85 1b __ STA ACCU + 0 
2340 : 65 03 __ ADC WORK + 0 
2342 : 85 05 __ STA WORK + 2 
2344 : c8 __ __ INY
2345 : b1 1d __ LDA (ACCU + 2),y 
2347 : 85 1c __ STA ACCU + 1 
2349 : f0 20 __ BEQ $236b ; (crt_malloc + 116)
234b : 65 04 __ ADC WORK + 1 
234d : 85 06 __ STA WORK + 3 
234f : b0 14 __ BCS $2365 ; (crt_malloc + 110)
2351 : a0 02 __ LDY #$02
2353 : b1 1b __ LDA (ACCU + 0),y 
2355 : c5 05 __ CMP WORK + 2 
2357 : c8 __ __ INY
2358 : b1 1b __ LDA (ACCU + 0),y 
235a : e5 06 __ SBC WORK + 3 
235c : b0 0f __ BCS $236d ; (crt_malloc + 118)
235e : a5 1b __ LDA ACCU + 0 
2360 : a6 1c __ LDX ACCU + 1 
2362 : 4c 35 23 JMP $2335 ; (crt_malloc + 62)
2365 : a9 00 __ LDA #$00
2367 : 85 1b __ STA ACCU + 0 
2369 : 85 1c __ STA ACCU + 1 
236b : 02 __ __ INV
236c : 60 __ __ RTS
236d : a5 05 __ LDA WORK + 2 
236f : 85 07 __ STA WORK + 4 
2371 : a5 06 __ LDA WORK + 3 
2373 : 85 08 __ STA WORK + 5 
2375 : a0 02 __ LDY #$02
2377 : a5 07 __ LDA WORK + 4 
2379 : d1 1b __ CMP (ACCU + 0),y 
237b : d0 15 __ BNE $2392 ; (crt_malloc + 155)
237d : c8 __ __ INY
237e : a5 08 __ LDA WORK + 5 
2380 : d1 1b __ CMP (ACCU + 0),y 
2382 : d0 0e __ BNE $2392 ; (crt_malloc + 155)
2384 : a0 00 __ LDY #$00
2386 : b1 1b __ LDA (ACCU + 0),y 
2388 : 91 1d __ STA (ACCU + 2),y 
238a : c8 __ __ INY
238b : b1 1b __ LDA (ACCU + 0),y 
238d : 91 1d __ STA (ACCU + 2),y 
238f : 4c af 23 JMP $23af ; (crt_malloc + 184)
2392 : a0 00 __ LDY #$00
2394 : b1 1b __ LDA (ACCU + 0),y 
2396 : 91 07 __ STA (WORK + 4),y 
2398 : a5 07 __ LDA WORK + 4 
239a : 91 1d __ STA (ACCU + 2),y 
239c : c8 __ __ INY
239d : b1 1b __ LDA (ACCU + 0),y 
239f : 91 07 __ STA (WORK + 4),y 
23a1 : a5 08 __ LDA WORK + 5 
23a3 : 91 1d __ STA (ACCU + 2),y 
23a5 : c8 __ __ INY
23a6 : b1 1b __ LDA (ACCU + 0),y 
23a8 : 91 07 __ STA (WORK + 4),y 
23aa : c8 __ __ INY
23ab : b1 1b __ LDA (ACCU + 0),y 
23ad : 91 07 __ STA (WORK + 4),y 
23af : a0 00 __ LDY #$00
23b1 : a5 05 __ LDA WORK + 2 
23b3 : 91 1b __ STA (ACCU + 0),y 
23b5 : c8 __ __ INY
23b6 : a5 06 __ LDA WORK + 3 
23b8 : 91 1b __ STA (ACCU + 0),y 
23ba : a0 02 __ LDY #$02
23bc : a9 bd __ LDA #$bd
23be : 91 1b __ STA (ACCU + 0),y 
23c0 : c8 __ __ INY
23c1 : 91 1b __ STA (ACCU + 0),y 
23c3 : c8 __ __ INY
23c4 : 91 1b __ STA (ACCU + 0),y 
23c6 : c8 __ __ INY
23c7 : 91 1b __ STA (ACCU + 0),y 
23c9 : 38 __ __ SEC
23ca : a5 05 __ LDA WORK + 2 
23cc : e9 04 __ SBC #$04
23ce : 85 05 __ STA WORK + 2 
23d0 : b0 02 __ BCS $23d4 ; (crt_malloc + 221)
23d2 : c6 06 __ DEC WORK + 3 
23d4 : a9 be __ LDA #$be
23d6 : a0 00 __ LDY #$00
23d8 : 91 05 __ STA (WORK + 2),y 
23da : c8 __ __ INY
23db : 91 05 __ STA (WORK + 2),y 
23dd : c8 __ __ INY
23de : 91 05 __ STA (WORK + 2),y 
23e0 : c8 __ __ INY
23e1 : 91 05 __ STA (WORK + 2),y 
23e3 : 18 __ __ CLC
23e4 : a5 1b __ LDA ACCU + 0 
23e6 : 69 06 __ ADC #$06
23e8 : 85 1b __ STA ACCU + 0 
23ea : 90 02 __ BCC $23ee ; (crt_malloc + 247)
23ec : e6 1c __ INC ACCU + 1 
23ee : 60 __ __ RTS
--------------------------------------------------------------------
crt_free@proxy: ; crt_free@proxy
23ef : a5 0d __ LDA P0 
23f1 : 85 1b __ STA ACCU + 0 
23f3 : a5 0e __ LDA P1 
23f5 : 85 1c __ STA ACCU + 1 
--------------------------------------------------------------------
crt_free: ; crt_free
23f7 : a5 1b __ LDA ACCU + 0 
23f9 : 05 1c __ ORA ACCU + 1 
23fb : d0 01 __ BNE $23fe ; (crt_free + 7)
23fd : 60 __ __ RTS
23fe : 38 __ __ SEC
23ff : a5 1b __ LDA ACCU + 0 
2401 : 29 03 __ AND #$03
2403 : d0 56 __ BNE $245b ; (crt_free + 100)
2405 : a5 1b __ LDA ACCU + 0 
2407 : e9 06 __ SBC #$06
2409 : 85 1b __ STA ACCU + 0 
240b : b0 02 __ BCS $240f ; (crt_free + 24)
240d : c6 1c __ DEC ACCU + 1 
240f : a0 02 __ LDY #$02
2411 : a9 bd __ LDA #$bd
2413 : d1 1b __ CMP (ACCU + 0),y 
2415 : d0 44 __ BNE $245b ; (crt_free + 100)
2417 : c8 __ __ INY
2418 : d1 1b __ CMP (ACCU + 0),y 
241a : d0 3f __ BNE $245b ; (crt_free + 100)
241c : c8 __ __ INY
241d : d1 1b __ CMP (ACCU + 0),y 
241f : d0 3a __ BNE $245b ; (crt_free + 100)
2421 : c8 __ __ INY
2422 : d1 1b __ CMP (ACCU + 0),y 
2424 : d0 35 __ BNE $245b ; (crt_free + 100)
2426 : a0 00 __ LDY #$00
2428 : 38 __ __ SEC
2429 : b1 1b __ LDA (ACCU + 0),y 
242b : e9 04 __ SBC #$04
242d : 85 03 __ STA WORK + 0 
242f : c8 __ __ INY
2430 : b1 1b __ LDA (ACCU + 0),y 
2432 : e9 00 __ SBC #$00
2434 : 85 04 __ STA WORK + 1 
2436 : a0 00 __ LDY #$00
2438 : a9 be __ LDA #$be
243a : d1 03 __ CMP (WORK + 0),y 
243c : d0 1d __ BNE $245b ; (crt_free + 100)
243e : c8 __ __ INY
243f : d1 03 __ CMP (WORK + 0),y 
2441 : d0 18 __ BNE $245b ; (crt_free + 100)
2443 : c8 __ __ INY
2444 : d1 03 __ CMP (WORK + 0),y 
2446 : d0 13 __ BNE $245b ; (crt_free + 100)
2448 : c8 __ __ INY
2449 : d1 03 __ CMP (WORK + 0),y 
244b : d0 0e __ BNE $245b ; (crt_free + 100)
244d : a5 1c __ LDA ACCU + 1 
244f : a6 1b __ LDX ACCU + 0 
2451 : c9 30 __ CMP #$30
2453 : 90 06 __ BCC $245b ; (crt_free + 100)
2455 : d0 05 __ BNE $245c ; (crt_free + 101)
2457 : e0 a0 __ CPX #$a0
2459 : b0 01 __ BCS $245c ; (crt_free + 101)
245b : 02 __ __ INV
245c : c9 90 __ CMP #$90
245e : 90 06 __ BCC $2466 ; (crt_free + 111)
2460 : d0 f9 __ BNE $245b ; (crt_free + 100)
2462 : e0 00 __ CPX #$00
2464 : b0 f5 __ BCS $245b ; (crt_free + 100)
2466 : a0 02 __ LDY #$02
2468 : a9 bf __ LDA #$bf
246a : 91 1b __ STA (ACCU + 0),y 
246c : c8 __ __ INY
246d : 91 1b __ STA (ACCU + 0),y 
246f : a0 00 __ LDY #$00
2471 : b1 1b __ LDA (ACCU + 0),y 
2473 : 85 1d __ STA ACCU + 2 
2475 : c8 __ __ INY
2476 : b1 1b __ LDA (ACCU + 0),y 
2478 : 85 1e __ STA ACCU + 3 
247a : a9 f7 __ LDA #$f7
247c : a2 25 __ LDX #$25
247e : 85 05 __ STA WORK + 2 
2480 : 86 06 __ STX WORK + 3 
2482 : a0 01 __ LDY #$01
2484 : b1 05 __ LDA (WORK + 2),y 
2486 : f0 28 __ BEQ $24b0 ; (crt_free + 185)
2488 : aa __ __ TAX
2489 : 88 __ __ DEY
248a : b1 05 __ LDA (WORK + 2),y 
248c : e4 1e __ CPX ACCU + 3 
248e : 90 ee __ BCC $247e ; (crt_free + 135)
2490 : d0 1e __ BNE $24b0 ; (crt_free + 185)
2492 : c5 1d __ CMP ACCU + 2 
2494 : 90 e8 __ BCC $247e ; (crt_free + 135)
2496 : d0 18 __ BNE $24b0 ; (crt_free + 185)
2498 : a0 00 __ LDY #$00
249a : b1 1d __ LDA (ACCU + 2),y 
249c : 91 1b __ STA (ACCU + 0),y 
249e : c8 __ __ INY
249f : b1 1d __ LDA (ACCU + 2),y 
24a1 : 91 1b __ STA (ACCU + 0),y 
24a3 : c8 __ __ INY
24a4 : b1 1d __ LDA (ACCU + 2),y 
24a6 : 91 1b __ STA (ACCU + 0),y 
24a8 : c8 __ __ INY
24a9 : b1 1d __ LDA (ACCU + 2),y 
24ab : 91 1b __ STA (ACCU + 0),y 
24ad : 4c c5 24 JMP $24c5 ; (crt_free + 206)
24b0 : a0 00 __ LDY #$00
24b2 : b1 05 __ LDA (WORK + 2),y 
24b4 : 91 1b __ STA (ACCU + 0),y 
24b6 : c8 __ __ INY
24b7 : b1 05 __ LDA (WORK + 2),y 
24b9 : 91 1b __ STA (ACCU + 0),y 
24bb : c8 __ __ INY
24bc : a5 1d __ LDA ACCU + 2 
24be : 91 1b __ STA (ACCU + 0),y 
24c0 : c8 __ __ INY
24c1 : a5 1e __ LDA ACCU + 3 
24c3 : 91 1b __ STA (ACCU + 0),y 
24c5 : a0 02 __ LDY #$02
24c7 : b1 05 __ LDA (WORK + 2),y 
24c9 : c5 1b __ CMP ACCU + 0 
24cb : d0 1d __ BNE $24ea ; (crt_free + 243)
24cd : c8 __ __ INY
24ce : b1 05 __ LDA (WORK + 2),y 
24d0 : c5 1c __ CMP ACCU + 1 
24d2 : d0 16 __ BNE $24ea ; (crt_free + 243)
24d4 : a0 00 __ LDY #$00
24d6 : b1 1b __ LDA (ACCU + 0),y 
24d8 : 91 05 __ STA (WORK + 2),y 
24da : c8 __ __ INY
24db : b1 1b __ LDA (ACCU + 0),y 
24dd : 91 05 __ STA (WORK + 2),y 
24df : c8 __ __ INY
24e0 : b1 1b __ LDA (ACCU + 0),y 
24e2 : 91 05 __ STA (WORK + 2),y 
24e4 : c8 __ __ INY
24e5 : b1 1b __ LDA (ACCU + 0),y 
24e7 : 91 05 __ STA (WORK + 2),y 
24e9 : 60 __ __ RTS
24ea : a0 00 __ LDY #$00
24ec : a5 1b __ LDA ACCU + 0 
24ee : 91 05 __ STA (WORK + 2),y 
24f0 : c8 __ __ INY
24f1 : a5 1c __ LDA ACCU + 1 
24f3 : 91 05 __ STA (WORK + 2),y 
24f5 : 60 __ __ RTS
--------------------------------------------------------------------
strncpy@proxy: ; strncpy@proxy
24f6 : a9 00 __ LDA #$00
24f8 : 85 12 __ STA P5 
24fa : 4c 80 1f JMP $1f80 ; (strncpy.s4 + 0)
--------------------------------------------------------------------
strncpy@proxy: ; strncpy@proxy
24fd : a9 32 __ LDA #$32
24ff : 85 11 __ STA P4 
2501 : a9 00 __ LDA #$00
2503 : 85 12 __ STA P5 
2505 : 4c 80 1f JMP $1f80 ; (strncpy.s4 + 0)
--------------------------------------------------------------------
uii_open_file@proxy: ; uii_open_file@proxy
2508 : a9 7d __ LDA #$7d
250a : 85 12 __ STA P5 
250c : a9 25 __ LDA #$25
250e : 85 13 __ STA P6 
2510 : 4c 84 18 JMP $1884 ; (uii_open_file.s4 + 0)
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
2513 : a5 12 __ LDA P5 
2515 : 85 0e __ STA P1 
2517 : 4c b0 0c JMP $0cb0 ; (strlen.s4 + 0)
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
251a : a5 13 __ LDA P6 
251c : 85 0e __ STA P1 
251e : 4c b0 0c JMP $0cb0 ; (strlen.s4 + 0)
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
2521 : a9 25 __ LDA #$25
2523 : 85 0e __ STA P1 
2525 : 4c b0 0c JMP $0cb0 ; (strlen.s4 + 0)
--------------------------------------------------------------------
mul40:
2528 : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
2538 : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
2548 : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
2558 : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
p2smap:
255a : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
p2smap:
2562 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
configpath:
256a : __ __ __ BYT 2f 55 53 42 2a 2f 00 00                         : /USB*/..
--------------------------------------------------------------------
configfilename:
2572 : __ __ __ BYT 44 4d 42 43 46 47 2e 43 46 47 00                : DMBCFG.CFG.
--------------------------------------------------------------------
slotfilename:
257d : __ __ __ BYT 44 4d 42 53 4c 54 2e 43 46 47 00                : DMBSLT.CFG.
--------------------------------------------------------------------
cfg:
2588 : __ __ __ BSS	99
--------------------------------------------------------------------
cw:
25eb : __ __ __ BSS	12
--------------------------------------------------------------------
HeapNode:
25f7 : __ __ __ BSS	4
--------------------------------------------------------------------
linebuffer:
2600 : __ __ __ BSS	100
--------------------------------------------------------------------
uii_data:
2664 : __ __ __ BSS	513
--------------------------------------------------------------------
uii_status:
2865 : __ __ __ BSS	257
--------------------------------------------------------------------
OldSlot:
2966 : __ __ __ BSS	488
--------------------------------------------------------------------
Slot:
2b4e : __ __ __ BSS	1360
