; Compiled with 1.32.271
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
080e : 8e ff 14 STX $14ff ; (spentry + 0)
0811 : a2 24 __ LDX #$24
0813 : a0 ed __ LDY #$ed
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
082a : c0 01 __ CPY #$01
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 16 __ LDA #$16
083d : 85 23 __ STA SP + 0 
083f : a9 9d __ LDA #$9d
0841 : 85 24 __ STA SP + 1 
0843 : 20 80 08 JSR $0880 ; (main.s4 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
; 309, "/home/xahmol/git/UBoot64-v2/src/uboot_upd12.c"
.s4:
0880 : a9 02 __ LDA #$02
0882 : 8d 00 25 STA $2500 ; (cfg.version + 0)
0885 : 8d 61 25 STA $2561 ; (cfg.colors.error + 0)
0888 : a9 01 __ LDA #$01
088a : 8d 01 25 STA $2501 ; (cfg.timeon + 0)
088d : 8d 57 25 STA $2557 ; (cfg.verbose + 0)
0890 : 8d 5d 25 STA $255d ; (cfg.colors.text_input + 0)
0893 : 8d 5f 25 STA $255f ; (cfg.colors.diritem_normal + 0)
0896 : a9 00 __ LDA #$00
0898 : 8d 55 25 STA $2555 ; (cfg.secondsfromutc + 2)
089b : 8d 56 25 STA $2556 ; (cfg.secondsfromutc + 3)
089e : 8d 58 25 STA $2558 ; (cfg.colors.background + 0)
08a1 : 8d 59 25 STA $2559 ; (cfg.colors.border + 0)
08a4 : a9 20 __ LDA #$20
08a6 : 8d 53 25 STA $2553 ; (cfg.secondsfromutc + 0)
08a9 : a9 1c __ LDA #$1c
08ab : 8d 54 25 STA $2554 ; (cfg.secondsfromutc + 1)
08ae : a9 05 __ LDA #$05
08b0 : 8d 5a 25 STA $255a ; (cfg.colors.header1 + 0)
08b3 : 8d 62 25 STA $2562 ; (cfg.colors.ok + 0)
08b6 : a9 03 __ LDA #$03
08b8 : 8d 5e 25 STA $255e ; (cfg.colors.key + 0)
08bb : 8d 60 25 STA $2560 ; (cfg.colors.diritem_select + 0)
08be : a9 0d __ LDA #$0d
08c0 : 8d 5b 25 STA $255b ; (cfg.colors.header2 + 0)
08c3 : a9 07 __ LDA #$07
08c5 : 8d 5c 25 STA $255c ; (cfg.colors.text + 0)
08c8 : a2 ff __ LDX #$ff
.l5:
08ca : e8 __ __ INX
08cb : bd 47 0a LDA $0a47,x 
08ce : 9d 02 25 STA $2502,x ; (cfg.host[0] + 0)
08d1 : d0 f7 __ BNE $08ca ; (main.l5 + 0)
.s6:
08d3 : 20 54 0a JSR $0a54 ; (vic_setmode.s4 + 0)
08d6 : a9 00 __ LDA #$00
08d8 : 8d 20 d0 STA $d020 
08db : 8d 21 d0 STA $d021 
08de : 20 6e 0a JSR $0a6e ; (cwin_init.s4 + 0)
08e1 : 20 97 0a JSR $0a97 ; (cwin_clear.s4 + 0)
08e4 : 20 eb 0a JSR $0aeb ; (headertext.s4 + 0)
08e7 : a9 00 __ LDA #$00
08e9 : 8d f1 24 STA $24f1 ; (cw.cx + 0)
08ec : a9 03 __ LDA #$03
08ee : 8d f2 24 STA $24f2 ; (cw.cy + 0)
08f1 : ad 1d df LDA $df1d 
08f4 : c9 c9 __ CMP #$c9
08f6 : f0 10 __ BEQ $0908 ; (main.s16 + 0)
.s7:
08f8 : a9 21 __ LDA #$21
08fa : 8d fc 9f STA $9ffc ; (sstack + 14)
08fd : a9 15 __ LDA #$15
08ff : 8d fd 9f STA $9ffd ; (sstack + 15)
0902 : 20 b0 0e JSR $0eb0 ; (error.s4 + 0)
0905 : 4c 5b 09 JMP $095b ; (main.s8 + 0)
.s16:
0908 : 20 a7 0e JSR $0ea7 ; (uii_abort.s4 + 0)
090b : a9 a8 __ LDA #$a8
090d : 85 0d __ STA P0 
090f : a9 15 __ LDA #$15
0911 : 85 0e __ STA P1 
0913 : 20 48 15 JSR $1548 ; (cwin_put_string.s4 + 0)
0916 : a9 02 __ LDA #$02
0918 : 85 0f __ STA P2 
091a : a9 00 __ LDA #$00
091c : 85 10 __ STA P3 
091e : 20 cd 15 JSR $15cd ; (cwin_cursor_newline.s4 + 0)
0921 : a9 01 __ LDA #$01
0923 : 8d fe 1c STA $1cfe ; (uii_target + 0)
0926 : 8d 19 9d STA $9d19 ; (cmd[0] + 1)
0929 : a9 00 __ LDA #$00
092b : 8d 18 9d STA $9d18 ; (cmd[0] + 0)
092e : a9 18 __ LDA #$18
0930 : 85 0d __ STA P0 
0932 : a9 9d __ LDA #$9d
0934 : 85 0e __ STA P1 
0936 : 20 15 0d JSR $0d15 ; (uii_sendcommand.s4 + 0)
0939 : 20 90 0d JSR $0d90 ; (uii_readdata.s4 + 0)
093c : 20 ce 0d JSR $0dce ; (uii_readstatus.s4 + 0)
093f : 20 82 0e JSR $0e82 ; (uii_accept.s4 + 0)
0942 : a9 e5 __ LDA #$e5
0944 : 85 0d __ STA P0 
0946 : a9 15 __ LDA #$15
0948 : 85 0e __ STA P1 
094a : 20 48 15 JSR $1548 ; (cwin_put_string.s4 + 0)
094d : a9 c7 __ LDA #$c7
094f : 85 0d __ STA P0 
0951 : a9 25 __ LDA #$25
0953 : 85 0e __ STA P1 
0955 : 20 48 15 JSR $1548 ; (cwin_put_string.s4 + 0)
0958 : 20 cd 15 JSR $15cd ; (cwin_cursor_newline.s4 + 0)
.s8:
095b : 20 f3 15 JSR $15f3 ; (reu_count_pages.s4 + 0)
095e : a5 1c __ LDA ACCU + 1 
0960 : 05 1b __ ORA ACCU + 0 
0962 : d0 10 __ BNE $0974 ; (main.s15 + 0)
.s9:
0964 : a9 5a __ LDA #$5a
0966 : 8d fc 9f STA $9ffc ; (sstack + 14)
0969 : a9 17 __ LDA #$17
096b : 8d fd 9f STA $9ffd ; (sstack + 15)
096e : 20 b0 0e JSR $0eb0 ; (error.s4 + 0)
0971 : 4c 98 09 JMP $0998 ; (main.s10 + 0)
.s15:
0974 : a9 3e __ LDA #$3e
0976 : 8d f2 9f STA $9ff2 ; (sstack + 4)
0979 : a9 17 __ LDA #$17
097b : 8d f3 9f STA $9ff3 ; (sstack + 5)
097e : a5 1b __ LDA ACCU + 0 
0980 : 85 44 __ STA T0 + 1 
0982 : a5 1c __ LDA ACCU + 1 
0984 : 4a __ __ LSR
0985 : 66 44 __ ROR T0 + 1 
0987 : 6a __ __ ROR
0988 : 66 44 __ ROR T0 + 1 
098a : 29 80 __ AND #$80
098c : 6a __ __ ROR
098d : 8d f4 9f STA $9ff4 ; (sstack + 6)
0990 : a5 44 __ LDA T0 + 1 
0992 : 8d f5 9f STA $9ff5 ; (sstack + 7)
0995 : 20 e9 0e JSR $0ee9 ; (cwin_console_printf.s4 + 0)
.s10:
0998 : a9 00 __ LDA #$00
099a : 8d 09 dc STA $dc09 
099d : 8d 08 dc STA $dc08 
.l11:
09a0 : 20 fe 0d JSR $0dfe ; (uii_change_dir.s4 + 0)
09a3 : ad c8 27 LDA $27c8 ; (uii_status[0] + 0)
09a6 : c9 30 __ CMP #$30
09a8 : d0 f6 __ BNE $09a0 ; (main.l11 + 0)
.s12:
09aa : ad c9 27 LDA $27c9 ; (uii_status[0] + 1)
09ad : c9 30 __ CMP #$30
09af : d0 ef __ BNE $09a0 ; (main.l11 + 0)
.s13:
09b1 : ad 09 dc LDA $dc09 
09b4 : c9 05 __ CMP #$05
09b6 : b0 e8 __ BCS $09a0 ; (main.l11 + 0)
.s14:
09b8 : a9 6b __ LDA #$6b
09ba : 8d f2 9f STA $9ff2 ; (sstack + 4)
09bd : a9 17 __ LDA #$17
09bf : 8d f3 9f STA $9ff3 ; (sstack + 5)
09c2 : 20 e9 0e JSR $0ee9 ; (cwin_console_printf.s4 + 0)
09c5 : 20 87 17 JSR $1787 ; (read_old_configfile.s4 + 0)
09c8 : a9 b9 __ LDA #$b9
09ca : 8d f2 9f STA $9ff2 ; (sstack + 4)
09cd : a9 19 __ LDA #$19
09cf : 8d f3 9f STA $9ff3 ; (sstack + 5)
09d2 : 20 e9 0e JSR $0ee9 ; (cwin_console_printf.s4 + 0)
09d5 : 20 d5 19 JSR $19d5 ; (writeconfigfile.s4 + 0)
09d8 : a9 3d __ LDA #$3d
09da : 8d f2 9f STA $9ff2 ; (sstack + 4)
09dd : a9 1b __ LDA #$1b
09df : 8d f3 9f STA $9ff3 ; (sstack + 5)
09e2 : 20 e9 0e JSR $0ee9 ; (cwin_console_printf.s4 + 0)
09e5 : 20 58 1b JSR $1b58 ; (read_old_slotsfile.s1 + 0)
09e8 : ee f2 24 INC $24f2 ; (cw.cy + 0)
09eb : a9 00 __ LDA #$00
09ed : 8d f1 24 STA $24f1 ; (cw.cx + 0)
09f0 : a9 00 __ LDA #$00
09f2 : 8d f2 9f STA $9ff2 ; (sstack + 4)
09f5 : a9 1d __ LDA #$1d
09f7 : 8d f3 9f STA $9ff3 ; (sstack + 5)
09fa : 20 e9 0e JSR $0ee9 ; (cwin_console_printf.s4 + 0)
09fd : 20 19 1d JSR $1d19 ; (convert_slot_data.s4 + 0)
0a00 : ee f2 24 INC $24f2 ; (cw.cy + 0)
0a03 : a9 00 __ LDA #$00
0a05 : 8d f1 24 STA $24f1 ; (cw.cx + 0)
0a08 : a9 6b __ LDA #$6b
0a0a : 8d f2 9f STA $9ff2 ; (sstack + 4)
0a0d : a9 1f __ LDA #$1f
0a0f : 8d f3 9f STA $9ff3 ; (sstack + 5)
0a12 : 20 e9 0e JSR $0ee9 ; (cwin_console_printf.s4 + 0)
0a15 : 20 86 1f JSR $1f86 ; (write_slotsfile.s4 + 0)
0a18 : ee f2 24 INC $24f2 ; (cw.cy + 0)
0a1b : a9 00 __ LDA #$00
0a1d : 8d f1 24 STA $24f1 ; (cw.cx + 0)
0a20 : a9 ac __ LDA #$ac
0a22 : 8d f2 9f STA $9ff2 ; (sstack + 4)
0a25 : a9 20 __ LDA #$20
0a27 : 8d f3 9f STA $9ff3 ; (sstack + 5)
0a2a : 20 e9 0e JSR $0ee9 ; (cwin_console_printf.s4 + 0)
0a2d : a9 c1 __ LDA #$c1
0a2f : 8d f2 9f STA $9ff2 ; (sstack + 4)
0a32 : a9 20 __ LDA #$20
0a34 : 8d f3 9f STA $9ff3 ; (sstack + 5)
0a37 : 20 e9 0e JSR $0ee9 ; (cwin_console_printf.s4 + 0)
0a3a : 20 f0 14 JSR $14f0 ; (cwin_getch.s4 + 0)
0a3d : 20 97 0a JSR $0a97 ; (cwin_clear.s4 + 0)
0a40 : a9 00 __ LDA #$00
0a42 : 85 1b __ STA ACCU + 0 
0a44 : 85 1c __ STA ACCU + 1 
.s3:
0a46 : 60 __ __ RTS
--------------------------------------------------------------------
0a47 : __ __ __ BYT 50 4f 4f 4c 2e 4e 54 50 2e 4f 52 47 00          : POOL.NTP.ORG.
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  97, "/home/xahmol/oscar64/include/c64/vic.h"
.s4:
0a54 : a9 1b __ LDA #$1b
0a56 : 8d 11 d0 STA $d011 
0a59 : a9 08 __ LDA #$08
0a5b : 8d 16 d0 STA $d016 
0a5e : ad 00 dd LDA $dd00 
0a61 : 29 fc __ AND #$fc
0a63 : 09 03 __ ORA #$03
0a65 : 8d 00 dd STA $dd00 
0a68 : a9 16 __ LDA #$16
0a6a : 8d 18 d0 STA $d018 
.s3:
0a6d : 60 __ __ RTS
--------------------------------------------------------------------
cwin_init: ; cwin_init(struct CharWin*,u8*,u8,u8,u8,u8)->void
;  15, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
0a6e : a9 00 __ LDA #$00
0a70 : 8d ed 24 STA $24ed ; (cw.sx + 0)
0a73 : 8d ee 24 STA $24ee ; (cw.sy + 0)
0a76 : 8d f1 24 STA $24f1 ; (cw.cx + 0)
0a79 : 8d f2 24 STA $24f2 ; (cw.cy + 0)
0a7c : 8d f5 24 STA $24f5 ; (cw.sp + 0)
0a7f : 8d f7 24 STA $24f7 ; (cw.cp + 0)
0a82 : a9 28 __ LDA #$28
0a84 : 8d ef 24 STA $24ef ; (cw.wx + 0)
0a87 : a9 19 __ LDA #$19
0a89 : 8d f0 24 STA $24f0 ; (cw.wy + 0)
0a8c : a9 04 __ LDA #$04
0a8e : 8d f6 24 STA $24f6 ; (cw.sp + 1)
0a91 : a9 d8 __ LDA #$d8
0a93 : 8d f8 24 STA $24f8 ; (cw.cp + 1)
.s3:
0a96 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_clear: ; cwin_clear(struct CharWin*)->void
;  20, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
0a97 : ad f0 24 LDA $24f0 ; (cw.wy + 0)
0a9a : f0 32 __ BEQ $0ace ; (cwin_clear.s3 + 0)
.s5:
0a9c : ad f5 24 LDA $24f5 ; (cw.sp + 0)
0a9f : 85 1b __ STA ACCU + 0 
0aa1 : ad f6 24 LDA $24f6 ; (cw.sp + 1)
0aa4 : 85 1c __ STA ACCU + 1 
0aa6 : ad f7 24 LDA $24f7 ; (cw.cp + 0)
0aa9 : 85 43 __ STA T1 + 0 
0aab : ad f8 24 LDA $24f8 ; (cw.cp + 1)
0aae : 85 44 __ STA T1 + 1 
0ab0 : a2 00 __ LDX #$00
0ab2 : ad ef 24 LDA $24ef ; (cw.wx + 0)
0ab5 : f0 11 __ BEQ $0ac8 ; (cwin_clear.l7 + 0)
.l8:
0ab7 : 85 1d __ STA ACCU + 2 
0ab9 : a0 00 __ LDY #$00
.l9:
0abb : a9 20 __ LDA #$20
0abd : 91 1b __ STA (ACCU + 0),y 
0abf : a9 01 __ LDA #$01
0ac1 : 91 43 __ STA (T1 + 0),y 
0ac3 : c8 __ __ INY
0ac4 : c4 1d __ CPY ACCU + 2 
0ac6 : 90 f3 __ BCC $0abb ; (cwin_clear.l9 + 0)
.l7:
0ac8 : e8 __ __ INX
0ac9 : ec f0 24 CPX $24f0 ; (cw.wy + 0)
0acc : 90 01 __ BCC $0acf ; (cwin_clear.s6 + 0)
.s3:
0ace : 60 __ __ RTS
.s6:
0acf : a5 1b __ LDA ACCU + 0 
0ad1 : 69 28 __ ADC #$28
0ad3 : 85 1b __ STA ACCU + 0 
0ad5 : 90 03 __ BCC $0ada ; (cwin_clear.s11 + 0)
.s10:
0ad7 : e6 1c __ INC ACCU + 1 
0ad9 : 18 __ __ CLC
.s11:
0ada : a5 43 __ LDA T1 + 0 
0adc : 69 28 __ ADC #$28
0ade : 85 43 __ STA T1 + 0 
0ae0 : 90 02 __ BCC $0ae4 ; (cwin_clear.s13 + 0)
.s12:
0ae2 : e6 44 __ INC T1 + 1 
.s13:
0ae4 : ad ef 24 LDA $24ef ; (cw.wx + 0)
0ae7 : f0 df __ BEQ $0ac8 ; (cwin_clear.l7 + 0)
0ae9 : d0 cc __ BNE $0ab7 ; (cwin_clear.l8 + 0)
--------------------------------------------------------------------
headertext: ; headertext(const u8*,u8)->void
;  99, "/home/xahmol/git/UBoot64-v2/src/uboot_upd12.c"
.s4:
0aeb : ad 5a 25 LDA $255a ; (cfg.colors.header1 + 0)
0aee : 85 10 __ STA P3 
0af0 : a9 00 __ LDA #$00
0af2 : 85 0d __ STA P0 
0af4 : a9 28 __ LDA #$28
0af6 : 85 0e __ STA P1 
0af8 : a9 a0 __ LDA #$a0
0afa : 85 0f __ STA P2 
0afc : 20 51 0c JSR $0c51 ; (cwin_fill_rect_raw.s4 + 0)
0aff : e6 0d __ INC P0 
0b01 : ad 5b 25 LDA $255b ; (cfg.colors.header2 + 0)
0b04 : 85 10 __ STA P3 
0b06 : 20 51 0c JSR $0c51 ; (cwin_fill_rect_raw.s4 + 0)
0b09 : a9 00 __ LDA #$00
0b0b : 85 0f __ STA P2 
0b0d : 85 10 __ STA P3 
0b0f : ad 5a 25 LDA $255a ; (cfg.colors.header1 + 0)
0b12 : 85 13 __ STA P6 
0b14 : a9 af __ LDA #$af
0b16 : 85 11 __ STA P4 
0b18 : a9 0c __ LDA #$0c
0b1a : 85 12 __ STA P5 
0b1c : 20 4b 0b JSR $0b4b ; (cwin_putat_string_reverse.s4 + 0)
0b1f : e6 10 __ INC P3 
0b21 : a9 d8 __ LDA #$d8
0b23 : 85 11 __ STA P4 
0b25 : a9 0c __ LDA #$0c
0b27 : 85 12 __ STA P5 
0b29 : 20 46 0b JSR $0b46 ; (cwin_putat_string_reverse@proxy + 0)
0b2c : a9 92 __ LDA #$92
0b2e : 85 0d __ STA P0 
0b30 : a9 0e __ LDA #$0e
0b32 : 85 0e __ STA P1 
0b34 : 20 93 0c JSR $0c93 ; (strlen.s4 + 0)
0b37 : 38 __ __ SEC
0b38 : a9 28 __ LDA #$28
0b3a : e5 1b __ SBC ACCU + 0 
0b3c : 85 0f __ STA P2 
0b3e : a9 92 __ LDA #$92
0b40 : 85 11 __ STA P4 
0b42 : a9 0e __ LDA #$0e
0b44 : 85 12 __ STA P5 
--------------------------------------------------------------------
cwin_putat_string_reverse@proxy: ; cwin_putat_string_reverse@proxy
0b46 : ad 5b 25 LDA $255b ; (cfg.colors.header2 + 0)
0b49 : 85 13 __ STA P6 
--------------------------------------------------------------------
cwin_putat_string_reverse: ; cwin_putat_string_reverse(struct CharWin*,u8,u8,const u8*,u8)->void
;  80, "/home/xahmol/git/UBoot64-v2/src/uboot_upd12.c"
.s4:
0b4b : 20 8b 0c JSR $0c8b ; (strlen@proxy + 0)
0b4e : a9 63 __ LDA #$63
0b50 : c5 1b __ CMP ACCU + 0 
0b52 : b0 06 __ BCS $0b5a ; (cwin_putat_string_reverse.s5 + 0)
.s10:
0b54 : 85 1b __ STA ACCU + 0 
.s9:
0b56 : a0 00 __ LDY #$00
0b58 : f0 4c __ BEQ $0ba6 ; (cwin_putat_string_reverse.l11 + 0)
.s5:
0b5a : a5 1b __ LDA ACCU + 0 
0b5c : d0 f8 __ BNE $0b56 ; (cwin_putat_string_reverse.s9 + 0)
.s6:
0b5e : a9 00 __ LDA #$00
0b60 : a6 1b __ LDX ACCU + 0 
0b62 : 9d 63 25 STA $2563,x ; (linebuffer[0] + 0)
0b65 : a5 10 __ LDA P3 ; (y + 0)
0b67 : 0a __ __ ASL
0b68 : aa __ __ TAX
0b69 : bd 8d 24 LDA $248d,x ; (mul40[0] + 0)
0b6c : 18 __ __ CLC
0b6d : 65 0f __ ADC P2 ; (x + 0)
0b6f : 85 1b __ STA ACCU + 0 
0b71 : bd 8e 24 LDA $248e,x ; (mul40[0] + 1)
0b74 : 69 00 __ ADC #$00
0b76 : 85 1c __ STA ACCU + 1 
0b78 : ad f5 24 LDA $24f5 ; (cw.sp + 0)
0b7b : 65 1b __ ADC ACCU + 0 
0b7d : 85 43 __ STA T1 + 0 
0b7f : ad f6 24 LDA $24f6 ; (cw.sp + 1)
0b82 : 65 1c __ ADC ACCU + 1 
0b84 : 85 44 __ STA T1 + 1 
0b86 : ad f7 24 LDA $24f7 ; (cw.cp + 0)
0b89 : 18 __ __ CLC
0b8a : 65 1b __ ADC ACCU + 0 
0b8c : 85 1b __ STA ACCU + 0 
0b8e : ad f8 24 LDA $24f8 ; (cw.cp + 1)
0b91 : 65 1c __ ADC ACCU + 1 
0b93 : 85 1c __ STA ACCU + 1 
0b95 : a0 00 __ LDY #$00
0b97 : f0 07 __ BEQ $0ba0 ; (cwin_putat_string_reverse.l7 + 0)
.s8:
0b99 : 91 43 __ STA (T1 + 0),y 
0b9b : a5 13 __ LDA P6 ; (color + 0)
0b9d : 91 1b __ STA (ACCU + 0),y 
0b9f : c8 __ __ INY
.l7:
0ba0 : b9 63 25 LDA $2563,y ; (linebuffer[0] + 0)
0ba3 : d0 f4 __ BNE $0b99 ; (cwin_putat_string_reverse.s8 + 0)
.s3:
0ba5 : 60 __ __ RTS
.l11:
0ba6 : b1 11 __ LDA (P4),y ; (str + 0)
0ba8 : 4a __ __ LSR
0ba9 : 4a __ __ LSR
0baa : 4a __ __ LSR
0bab : 4a __ __ LSR
0bac : 4a __ __ LSR
0bad : aa __ __ TAX
0bae : bd bf 24 LDA $24bf,x ; (p2smap[0] + 0)
0bb1 : 51 11 __ EOR (P4),y ; (str + 0)
0bb3 : 09 80 __ ORA #$80
0bb5 : 99 63 25 STA $2563,y ; (linebuffer[0] + 0)
0bb8 : c8 __ __ INY
0bb9 : c4 1b __ CPY ACCU + 0 
0bbb : 90 e9 __ BCC $0ba6 ; (cwin_putat_string_reverse.l11 + 0)
0bbd : b0 9f __ BCS $0b5e ; (cwin_putat_string_reverse.s6 + 0)
--------------------------------------------------------------------
cwin_console_newline: ; cwin_console_newline(struct CharWin*)->void
; 177, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
0bbf : a9 00 __ LDA #$00
0bc1 : 8d f1 24 STA $24f1 ; (cw.cx + 0)
0bc4 : ad f2 24 LDA $24f2 ; (cw.cy + 0)
0bc7 : aa __ __ TAX
0bc8 : 18 __ __ CLC
0bc9 : 69 01 __ ADC #$01
0bcb : 8d f2 24 STA $24f2 ; (cw.cy + 0)
0bce : cd f0 24 CMP $24f0 ; (cw.wy + 0)
0bd1 : f0 01 __ BEQ $0bd4 ; (cwin_console_newline.s5 + 0)
.s3:
0bd3 : 60 __ __ RTS
.s5:
0bd4 : 8e f2 24 STX $24f2 ; (cw.cy + 0)
0bd7 : ce f4 24 DEC $24f4 ; (cw.ly + 0)
0bda : ad ef 24 LDA $24ef ; (cw.wx + 0)
0bdd : 85 49 __ STA T7 + 0 
0bdf : ad f5 24 LDA $24f5 ; (cw.sp + 0)
0be2 : 85 43 __ STA T0 + 0 
0be4 : ad f6 24 LDA $24f6 ; (cw.sp + 1)
0be7 : 85 44 __ STA T0 + 1 
0be9 : ad f7 24 LDA $24f7 ; (cw.cp + 0)
0bec : 85 1b __ STA ACCU + 0 
0bee : ad f8 24 LDA $24f8 ; (cw.cp + 1)
0bf1 : a2 00 __ LDX #$00
0bf3 : f0 0f __ BEQ $0c04 ; (cwin_console_newline.l6 + 0)
.s9:
0bf5 : a5 47 __ LDA T3 + 0 
0bf7 : 85 43 __ STA T0 + 0 
0bf9 : a5 48 __ LDA T3 + 1 
0bfb : 85 44 __ STA T0 + 1 
0bfd : a5 45 __ LDA T2 + 0 
0bff : 85 1b __ STA ACCU + 0 
0c01 : a5 46 __ LDA T2 + 1 
0c03 : e8 __ __ INX
.l6:
0c04 : 85 1c __ STA ACCU + 1 
0c06 : ad f0 24 LDA $24f0 ; (cw.wy + 0)
0c09 : 38 __ __ SEC
0c0a : e9 01 __ SBC #$01
0c0c : 90 06 __ BCC $0c14 ; (cwin_console_newline.s8 + 0)
.s11:
0c0e : 85 0d __ STA P0 
0c10 : e4 0d __ CPX P0 
0c12 : b0 2e __ BCS $0c42 ; (cwin_console_newline.s7 + 0)
.s8:
0c14 : a5 1b __ LDA ACCU + 0 
0c16 : 69 28 __ ADC #$28
0c18 : 85 45 __ STA T2 + 0 
0c1a : a5 1c __ LDA ACCU + 1 
0c1c : 69 00 __ ADC #$00
0c1e : 85 46 __ STA T2 + 1 
0c20 : 18 __ __ CLC
0c21 : a5 43 __ LDA T0 + 0 
0c23 : 69 28 __ ADC #$28
0c25 : 85 47 __ STA T3 + 0 
0c27 : a5 44 __ LDA T0 + 1 
0c29 : 69 00 __ ADC #$00
0c2b : 85 48 __ STA T3 + 1 
0c2d : a5 49 __ LDA T7 + 0 
0c2f : f0 c4 __ BEQ $0bf5 ; (cwin_console_newline.s9 + 0)
.s10:
0c31 : a0 00 __ LDY #$00
.l12:
0c33 : b1 47 __ LDA (T3 + 0),y 
0c35 : 91 43 __ STA (T0 + 0),y 
0c37 : b1 45 __ LDA (T2 + 0),y 
0c39 : 91 1b __ STA (ACCU + 0),y 
0c3b : c8 __ __ INY
0c3c : c4 49 __ CPY T7 + 0 
0c3e : 90 f3 __ BCC $0c33 ; (cwin_console_newline.l12 + 0)
0c40 : b0 b3 __ BCS $0bf5 ; (cwin_console_newline.s9 + 0)
.s7:
0c42 : a5 49 __ LDA T7 + 0 
0c44 : 85 0e __ STA P1 
0c46 : ad c8 24 LDA $24c8 ; (p2smap[0] + 1)
0c49 : 49 20 __ EOR #$20
0c4b : 85 0f __ STA P2 
0c4d : a9 01 __ LDA #$01
0c4f : 85 10 __ STA P3 
--------------------------------------------------------------------
cwin_fill_rect_raw: ; cwin_fill_rect_raw(struct CharWin*,u8,u8,u8,u8,u8,u8)->void
; 174, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
0c51 : a5 0e __ LDA P1 ; (w + 0)
0c53 : f0 35 __ BEQ $0c8a ; (cwin_fill_rect_raw.s3 + 0)
.s5:
0c55 : a5 0d __ LDA P0 ; (y + 0)
0c57 : 0a __ __ ASL
0c58 : aa __ __ TAX
0c59 : ad f5 24 LDA $24f5 ; (cw.sp + 0)
0c5c : 7d 8d 24 ADC $248d,x ; (mul40[0] + 0)
0c5f : 85 1b __ STA ACCU + 0 
0c61 : ad f6 24 LDA $24f6 ; (cw.sp + 1)
0c64 : 7d 8e 24 ADC $248e,x ; (mul40[0] + 1)
0c67 : 85 1c __ STA ACCU + 1 
0c69 : ad f7 24 LDA $24f7 ; (cw.cp + 0)
0c6c : 18 __ __ CLC
0c6d : 7d 8d 24 ADC $248d,x ; (mul40[0] + 0)
0c70 : 85 43 __ STA T2 + 0 
0c72 : ad f8 24 LDA $24f8 ; (cw.cp + 1)
0c75 : 7d 8e 24 ADC $248e,x ; (mul40[0] + 1)
0c78 : 85 44 __ STA T2 + 1 
0c7a : a6 0f __ LDX P2 ; (ch + 0)
0c7c : a0 00 __ LDY #$00
.l6:
0c7e : 8a __ __ TXA
0c7f : 91 1b __ STA (ACCU + 0),y 
0c81 : a5 10 __ LDA P3 ; (color + 0)
0c83 : 91 43 __ STA (T2 + 0),y 
0c85 : c8 __ __ INY
0c86 : c4 0e __ CPY P1 ; (w + 0)
0c88 : 90 f4 __ BCC $0c7e ; (cwin_fill_rect_raw.l6 + 0)
.s3:
0c8a : 60 __ __ RTS
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
0c8b : a5 11 __ LDA P4 
0c8d : 85 0d __ STA P0 
0c8f : a5 12 __ LDA P5 
0c91 : 85 0e __ STA P1 
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
;  12, "/home/xahmol/oscar64/include/string.h"
.s4:
0c93 : a9 00 __ LDA #$00
0c95 : 85 1b __ STA ACCU + 0 
0c97 : 85 1c __ STA ACCU + 1 
0c99 : a8 __ __ TAY
0c9a : b1 0d __ LDA (P0),y ; (str + 0)
0c9c : f0 10 __ BEQ $0cae ; (strlen.s3 + 0)
.s6:
0c9e : a2 00 __ LDX #$00
.l7:
0ca0 : c8 __ __ INY
0ca1 : d0 03 __ BNE $0ca6 ; (strlen.s9 + 0)
.s8:
0ca3 : e6 0e __ INC P1 ; (str + 1)
0ca5 : e8 __ __ INX
.s9:
0ca6 : b1 0d __ LDA (P0),y ; (str + 0)
0ca8 : d0 f6 __ BNE $0ca0 ; (strlen.l7 + 0)
.s5:
0caa : 86 1c __ STX ACCU + 1 
0cac : 84 1b __ STY ACCU + 0 
.s3:
0cae : 60 __ __ RTS
--------------------------------------------------------------------
0caf : __ __ __ BYT 75 62 4f 4f 54 36 34 3a 20 20 62 4f 4f 54 20 6d : ubOOT64:  bOOT m
0cbf : __ __ __ BYT 45 4e 55 20 46 4f 52 20 75 4c 54 49 4d 41 54 45 : ENU FOR uLTIMATE
0ccf : __ __ __ BYT 20 44 45 56 49 43 45 53 00                      :  DEVICES.
--------------------------------------------------------------------
0cd8 : __ __ __ BYT 75 50 44 41 54 45 20 43 4f 4e 46 49 47 20 31 2d : uPDATE CONFIG 1-
0ce8 : __ __ __ BYT 32 00                                           : 2.
--------------------------------------------------------------------
uii_read_file: ; uii_read_file(u16)->void
;  34, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
0cea : a9 00 __ LDA #$00
0cec : 85 10 __ STA P3 
0cee : 8d ea 9f STA $9fea ; (cmd[0] + 0)
0cf1 : 8d ec 9f STA $9fec ; (cmd[0] + 2)
0cf4 : 8d ed 9f STA $9fed ; (cmd[0] + 3)
0cf7 : a9 01 __ LDA #$01
0cf9 : 8d fe 1c STA $1cfe ; (uii_target + 0)
0cfc : a9 04 __ LDA #$04
0cfe : 85 0f __ STA P2 
0d00 : 8d eb 9f STA $9feb ; (cmd[0] + 1)
0d03 : a5 11 __ LDA P4 ; (length + 0)
0d05 : 8d ec 9f STA $9fec ; (cmd[0] + 2)
0d08 : a5 12 __ LDA P5 ; (length + 1)
0d0a : 8d ed 9f STA $9fed ; (cmd[0] + 3)
0d0d : a9 ea __ LDA #$ea
0d0f : 85 0d __ STA P0 
0d11 : a9 9f __ LDA #$9f
0d13 : 85 0e __ STA P1 
--------------------------------------------------------------------
uii_sendcommand: ; uii_sendcommand(u8*,u16)->void
; 173, "/home/xahmol/git/UBoot64-v2/include/ultimate_common_lib.h"
.s4:
0d15 : ad fe 1c LDA $1cfe ; (uii_target + 0)
0d18 : a0 00 __ LDY #$00
0d1a : 84 1b __ STY ACCU + 0 
0d1c : 84 1c __ STY ACCU + 1 
0d1e : 91 0d __ STA (P0),y ; (bytes + 0)
.l5:
0d20 : ad 1c df LDA $df1c 
0d23 : 29 20 __ AND #$20
0d25 : d0 f9 __ BNE $0d20 ; (uii_sendcommand.l5 + 0)
.s6:
0d27 : ad 1c df LDA $df1c 
0d2a : 29 10 __ AND #$10
0d2c : d0 f2 __ BNE $0d20 ; (uii_sendcommand.l5 + 0)
.s7:
0d2e : a5 1c __ LDA ACCU + 1 
0d30 : c5 10 __ CMP P3 ; (count + 1)
0d32 : d0 04 __ BNE $0d38 ; (uii_sendcommand.s16 + 0)
.s15:
0d34 : a5 1b __ LDA ACCU + 0 
0d36 : c5 0f __ CMP P2 ; (count + 0)
.s16:
0d38 : b0 2e __ BCS $0d68 ; (uii_sendcommand.s8 + 0)
.s12:
0d3a : a5 0d __ LDA P0 ; (bytes + 0)
0d3c : 65 1b __ ADC ACCU + 0 
0d3e : 85 43 __ STA T3 + 0 
0d40 : a5 0e __ LDA P1 ; (bytes + 1)
0d42 : 65 1c __ ADC ACCU + 1 
0d44 : 85 44 __ STA T3 + 1 
0d46 : a6 1b __ LDX ACCU + 0 
.l13:
0d48 : a0 00 __ LDY #$00
0d4a : b1 43 __ LDA (T3 + 0),y 
0d4c : 8d 1d df STA $df1d 
0d4f : e6 43 __ INC T3 + 0 
0d51 : d0 02 __ BNE $0d55 ; (uii_sendcommand.s19 + 0)
.s18:
0d53 : e6 44 __ INC T3 + 1 
.s19:
0d55 : e8 __ __ INX
0d56 : d0 02 __ BNE $0d5a ; (uii_sendcommand.s21 + 0)
.s20:
0d58 : e6 1c __ INC ACCU + 1 
.s21:
0d5a : a5 1c __ LDA ACCU + 1 
0d5c : c5 10 __ CMP P3 ; (count + 1)
0d5e : 90 e8 __ BCC $0d48 ; (uii_sendcommand.l13 + 0)
.s22:
0d60 : d0 04 __ BNE $0d66 ; (uii_sendcommand.s17 + 0)
.s14:
0d62 : e4 0f __ CPX P2 ; (count + 0)
0d64 : 90 e2 __ BCC $0d48 ; (uii_sendcommand.l13 + 0)
.s17:
0d66 : 86 1b __ STX ACCU + 0 
.s8:
0d68 : ad 1c df LDA $df1c 
0d6b : 09 01 __ ORA #$01
0d6d : 8d 1c df STA $df1c 
0d70 : ad 1c df LDA $df1c 
0d73 : 29 04 __ AND #$04
0d75 : f0 0a __ BEQ $0d81 ; (uii_sendcommand.l9 + 0)
.s11:
0d77 : ad 1c df LDA $df1c 
0d7a : 09 08 __ ORA #$08
0d7c : 8d 1c df STA $df1c 
0d7f : b0 9f __ BCS $0d20 ; (uii_sendcommand.l5 + 0)
.l9:
0d81 : ad 1c df LDA $df1c 
0d84 : 29 20 __ AND #$20
0d86 : d0 07 __ BNE $0d8f ; (uii_sendcommand.s3 + 0)
.s10:
0d88 : ad 1c df LDA $df1c 
0d8b : 29 10 __ AND #$10
0d8d : d0 f2 __ BNE $0d81 ; (uii_sendcommand.l9 + 0)
.s3:
0d8f : 60 __ __ RTS
--------------------------------------------------------------------
uii_readdata: ; uii_readdata()->u16
; 179, "/home/xahmol/git/UBoot64-v2/include/ultimate_common_lib.h"
.s4:
0d90 : a9 00 __ LDA #$00
0d92 : 8d c7 25 STA $25c7 ; (uii_data[0] + 0)
0d95 : a2 c7 __ LDX #$c7
0d97 : 86 43 __ STX T1 + 0 
0d99 : a8 __ __ TAY
0d9a : f0 12 __ BEQ $0dae ; (uii_readdata.l5 + 0)
.s8:
0d9c : 8a __ __ TXA
0d9d : 18 __ __ CLC
0d9e : 69 25 __ ADC #$25
0da0 : 85 44 __ STA T1 + 1 
0da2 : ad 1e df LDA $df1e 
0da5 : 91 43 __ STA (T1 + 0),y 
0da7 : 98 __ __ TYA
0da8 : 69 01 __ ADC #$01
0daa : a8 __ __ TAY
0dab : 8a __ __ TXA
0dac : 69 00 __ ADC #$00
.l5:
0dae : aa __ __ TAX
0daf : 2c 1c df BIT $df1c 
0db2 : 10 07 __ BPL $0dbb ; (uii_readdata.s6 + 0)
.s7:
0db4 : e0 02 __ CPX #$02
0db6 : d0 e4 __ BNE $0d9c ; (uii_readdata.s8 + 0)
.s9:
0db8 : 98 __ __ TYA
0db9 : d0 e1 __ BNE $0d9c ; (uii_readdata.s8 + 0)
.s6:
0dbb : 86 1c __ STX ACCU + 1 
0dbd : 84 1b __ STY ACCU + 0 
0dbf : a9 c7 __ LDA #$c7
0dc1 : 85 43 __ STA T1 + 0 
0dc3 : 8a __ __ TXA
0dc4 : 18 __ __ CLC
0dc5 : 69 25 __ ADC #$25
0dc7 : 85 44 __ STA T1 + 1 
0dc9 : a9 00 __ LDA #$00
0dcb : 91 43 __ STA (T1 + 0),y 
.s3:
0dcd : 60 __ __ RTS
--------------------------------------------------------------------
uii_readstatus: ; uii_readstatus()->void
; 180, "/home/xahmol/git/UBoot64-v2/include/ultimate_common_lib.h"
.s4:
0dce : a9 00 __ LDA #$00
0dd0 : 8d c8 27 STA $27c8 ; (uii_status[0] + 0)
0dd3 : a2 c8 __ LDX #$c8
0dd5 : 86 1b __ STX ACCU + 0 
0dd7 : a8 __ __ TAY
0dd8 : f0 0d __ BEQ $0de7 ; (uii_readstatus.l5 + 0)
.s8:
0dda : ad 1f df LDA $df1f 
0ddd : 91 1b __ STA (ACCU + 0),y 
0ddf : 98 __ __ TYA
0de0 : 18 __ __ CLC
0de1 : 69 01 __ ADC #$01
0de3 : a8 __ __ TAY
0de4 : 8a __ __ TXA
0de5 : 69 00 __ ADC #$00
.l5:
0de7 : aa __ __ TAX
0de8 : 18 __ __ CLC
0de9 : 69 27 __ ADC #$27
0deb : 85 1c __ STA ACCU + 1 
0ded : ad 1c df LDA $df1c 
0df0 : 29 40 __ AND #$40
0df2 : f0 07 __ BEQ $0dfb ; (uii_readstatus.s6 + 0)
.s7:
0df4 : e0 01 __ CPX #$01
0df6 : d0 e2 __ BNE $0dda ; (uii_readstatus.s8 + 0)
.s9:
0df8 : 98 __ __ TYA
0df9 : d0 df __ BNE $0dda ; (uii_readstatus.s8 + 0)
.s6:
0dfb : 91 1b __ STA (ACCU + 0),y 
.s3:
0dfd : 60 __ __ RTS
--------------------------------------------------------------------
uii_change_dir: ; uii_change_dir(u8*)->void
;  25, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
0dfe : a9 cf __ LDA #$cf
0e00 : 85 0d __ STA P0 
0e02 : 20 86 24 JSR $2486 ; (strlen@proxy + 0)
0e05 : 18 __ __ CLC
0e06 : a5 1b __ LDA ACCU + 0 
0e08 : 69 02 __ ADC #$02
0e0a : 85 1b __ STA ACCU + 0 
0e0c : 90 02 __ BCC $0e10 ; (uii_change_dir.s11 + 0)
.s10:
0e0e : e6 1c __ INC ACCU + 1 
.s11:
0e10 : 20 58 22 JSR $2258 ; (crt_malloc + 0)
0e13 : a5 1c __ LDA ACCU + 1 
0e15 : 05 1b __ ORA ACCU + 0 
0e17 : d0 01 __ BNE $0e1a ; (uii_change_dir.s5 + 0)
.s3:
0e19 : 60 __ __ RTS
.s5:
0e1a : a5 1c __ LDA ACCU + 1 
0e1c : 85 47 __ STA T2 + 1 
0e1e : a5 1b __ LDA ACCU + 0 
0e20 : 85 46 __ STA T2 + 0 
0e22 : a9 00 __ LDA #$00
0e24 : a8 __ __ TAY
0e25 : 91 1b __ STA (ACCU + 0),y 
0e27 : a9 24 __ LDA #$24
0e29 : 85 0e __ STA P1 
0e2b : a9 11 __ LDA #$11
0e2d : c8 __ __ INY
0e2e : 91 1b __ STA (ACCU + 0),y 
0e30 : 20 93 0c JSR $0c93 ; (strlen.s4 + 0)
0e33 : a5 1b __ LDA ACCU + 0 
0e35 : 05 1c __ ORA ACCU + 1 
0e37 : f0 23 __ BEQ $0e5c ; (uii_change_dir.s6 + 0)
.s7:
0e39 : a9 00 __ LDA #$00
0e3b : 85 45 __ STA T1 + 0 
.l9:
0e3d : a9 24 __ LDA #$24
0e3f : 85 0e __ STA P1 
0e41 : a6 45 __ LDX T1 + 0 
0e43 : 8a __ __ TXA
0e44 : 18 __ __ CLC
0e45 : 69 02 __ ADC #$02
0e47 : a8 __ __ TAY
0e48 : bd cf 24 LDA $24cf,x ; (configpath[0] + 0)
0e4b : 91 46 __ STA (T2 + 0),y 
0e4d : 20 93 0c JSR $0c93 ; (strlen.s4 + 0)
0e50 : e6 45 __ INC T1 + 0 
0e52 : a5 1c __ LDA ACCU + 1 
0e54 : d0 e7 __ BNE $0e3d ; (uii_change_dir.l9 + 0)
.s8:
0e56 : a5 45 __ LDA T1 + 0 
0e58 : c5 1b __ CMP ACCU + 0 
0e5a : 90 e1 __ BCC $0e3d ; (uii_change_dir.l9 + 0)
.s6:
0e5c : a9 01 __ LDA #$01
0e5e : 8d fe 1c STA $1cfe ; (uii_target + 0)
0e61 : 20 86 24 JSR $2486 ; (strlen@proxy + 0)
0e64 : a5 46 __ LDA T2 + 0 
0e66 : 85 0d __ STA P0 
0e68 : a5 47 __ LDA T2 + 1 
0e6a : 85 0e __ STA P1 
0e6c : 18 __ __ CLC
0e6d : a5 1b __ LDA ACCU + 0 
0e6f : 69 02 __ ADC #$02
0e71 : 85 0f __ STA P2 
0e73 : a5 1c __ LDA ACCU + 1 
0e75 : 69 00 __ ADC #$00
0e77 : 85 10 __ STA P3 
0e79 : 20 15 0d JSR $0d15 ; (uii_sendcommand.s4 + 0)
0e7c : 20 50 23 JSR $2350 ; (crt_free@proxy + 0)
0e7f : 20 ce 0d JSR $0dce ; (uii_readstatus.s4 + 0)
--------------------------------------------------------------------
uii_accept: ; uii_accept()->void
; 174, "/home/xahmol/git/UBoot64-v2/include/ultimate_common_lib.h"
.s4:
0e82 : ad 1c df LDA $df1c 
0e85 : 09 02 __ ORA #$02
0e87 : 8d 1c df STA $df1c 
.l5:
0e8a : ad 1c df LDA $df1c 
0e8d : 29 02 __ AND #$02
0e8f : d0 f9 __ BNE $0e8a ; (uii_accept.l5 + 0)
.s3:
0e91 : 60 __ __ RTS
--------------------------------------------------------------------
0e92 : __ __ __ BYT 56 32 2e 30 2e 30 2d 32 30 32 36 30 34 32 37 2d : V2.0.0-20260427-
0ea2 : __ __ __ BYT 31 38 31 31 00                                  : 1811.
--------------------------------------------------------------------
uii_abort: ; uii_abort()->void
; 178, "/home/xahmol/git/UBoot64-v2/include/ultimate_common_lib.h"
.s4:
0ea7 : ad 1c df LDA $df1c 
0eaa : 09 04 __ ORA #$04
0eac : 8d 1c df STA $df1c 
.s3:
0eaf : 60 __ __ RTS
--------------------------------------------------------------------
error: ; error(const u8*)->void
;  58, "/home/xahmol/git/UBoot64-v2/src/uboot_upd12.c"
.s4:
0eb0 : a9 00 __ LDA #$00
0eb2 : 8d f2 9f STA $9ff2 ; (sstack + 4)
0eb5 : a9 15 __ LDA #$15
0eb7 : 8d f3 9f STA $9ff3 ; (sstack + 5)
0eba : ad fc 9f LDA $9ffc ; (sstack + 14)
0ebd : 8d f4 9f STA $9ff4 ; (sstack + 6)
0ec0 : ad fd 9f LDA $9ffd ; (sstack + 15)
0ec3 : 8d f5 9f STA $9ff5 ; (sstack + 7)
0ec6 : 20 e9 0e JSR $0ee9 ; (cwin_console_printf.s4 + 0)
0ec9 : a9 01 __ LDA #$01
0ecb : 85 0d __ STA P0 
0ecd : a9 00 __ LDA #$00
0ecf : 85 0e __ STA P1 
0ed1 : 20 f0 14 JSR $14f0 ; (cwin_getch.s4 + 0)
--------------------------------------------------------------------
exit: ; exit(i16)->void
;  54, "/home/xahmol/oscar64/include/stdlib.h"
.s4:
0ed4 : a5 0d __ LDA P0 
0ed6 : 85 1b __ STA ACCU + 0 
0ed8 : a5 0e __ LDA P1 
0eda : 85 1c __ STA ACCU + 1 
0edc : ae ff 14 LDX $14ff ; (spentry + 0)
0edf : 9a __ __ TXS
0ee0 : a9 4c __ LDA #$4c
0ee2 : 85 54 __ STA $54 
0ee4 : a9 00 __ LDA #$00
0ee6 : 85 13 __ STA P6 
.s3:
0ee8 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_console_printf: ; cwin_console_printf(struct CharWin*,u8,const u8*)->void
; 206, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
0ee9 : ad f2 9f LDA $9ff2 ; (sstack + 4)
0eec : 8d ee 9f STA $9fee ; (sstack + 0)
0eef : a9 0e __ LDA #$0e
0ef1 : 85 16 __ STA P9 
0ef3 : a9 9f __ LDA #$9f
0ef5 : 85 17 __ STA P10 
0ef7 : ad f3 9f LDA $9ff3 ; (sstack + 5)
0efa : 8d ef 9f STA $9fef ; (sstack + 1)
0efd : a9 f4 __ LDA #$f4
0eff : 8d f0 9f STA $9ff0 ; (sstack + 2)
0f02 : a9 9f __ LDA #$9f
0f04 : 8d f1 9f STA $9ff1 ; (sstack + 3)
0f07 : 20 91 0f JSR $0f91 ; (sformat.s4 + 0)
0f0a : a9 0e __ LDA #$0e
0f0c : 85 11 __ STA P4 
0f0e : a9 9f __ LDA #$9f
0f10 : 85 12 __ STA P5 
--------------------------------------------------------------------
cwin_console_write_string: ; cwin_console_write_string(struct CharWin*,const u8*,u8)->void
; 183, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
0f12 : ad f1 24 LDA $24f1 ; (cw.cx + 0)
0f15 : 8d f3 24 STA $24f3 ; (cw.lx + 0)
0f18 : ad f2 24 LDA $24f2 ; (cw.cy + 0)
0f1b : 8d f4 24 STA $24f4 ; (cw.ly + 0)
0f1e : a9 00 __ LDA #$00
0f20 : 85 4a __ STA T4 + 0 
0f22 : f0 02 __ BEQ $0f26 ; (cwin_console_write_string.l5 + 0)
.s9:
0f24 : e6 4a __ INC T4 + 0 
.l5:
0f26 : a4 4a __ LDY T4 + 0 
0f28 : b1 11 __ LDA (P4),y ; (chars + 0)
0f2a : d0 01 __ BNE $0f2d ; (cwin_console_write_string.s6 + 0)
.s3:
0f2c : 60 __ __ RTS
.s6:
0f2d : c9 0a __ CMP #$0a
0f2f : d0 06 __ BNE $0f37 ; (cwin_console_write_string.s7 + 0)
.s11:
0f31 : 20 bf 0b JSR $0bbf ; (cwin_console_newline.s4 + 0)
0f34 : 4c 24 0f JMP $0f24 ; (cwin_console_write_string.s9 + 0)
.s7:
0f37 : 85 4b __ STA T5 + 0 
0f39 : ad f1 24 LDA $24f1 ; (cw.cx + 0)
0f3c : cd ef 24 CMP $24ef ; (cw.wx + 0)
0f3f : d0 03 __ BNE $0f44 ; (cwin_console_write_string.s8 + 0)
.s10:
0f41 : 20 bf 0b JSR $0bbf ; (cwin_console_newline.s4 + 0)
.s8:
0f44 : ad f2 24 LDA $24f2 ; (cw.cy + 0)
0f47 : 0a __ __ ASL
0f48 : aa __ __ TAX
0f49 : bd 8d 24 LDA $248d,x ; (mul40[0] + 0)
0f4c : 6d f1 24 ADC $24f1 ; (cw.cx + 0)
0f4f : 85 43 __ STA T0 + 0 
0f51 : bd 8e 24 LDA $248e,x ; (mul40[0] + 1)
0f54 : 69 00 __ ADC #$00
0f56 : 85 44 __ STA T0 + 1 
0f58 : a5 4b __ LDA T5 + 0 
0f5a : 4a __ __ LSR
0f5b : 4a __ __ LSR
0f5c : 4a __ __ LSR
0f5d : 4a __ __ LSR
0f5e : 4a __ __ LSR
0f5f : aa __ __ TAX
0f60 : ad f5 24 LDA $24f5 ; (cw.sp + 0)
0f63 : 18 __ __ CLC
0f64 : 65 43 __ ADC T0 + 0 
0f66 : 85 45 __ STA T1 + 0 
0f68 : ad f6 24 LDA $24f6 ; (cw.sp + 1)
0f6b : 65 44 __ ADC T0 + 1 
0f6d : 85 46 __ STA T1 + 1 
0f6f : bd c7 24 LDA $24c7,x ; (p2smap[0] + 0)
0f72 : 45 4b __ EOR T5 + 0 
0f74 : a0 00 __ LDY #$00
0f76 : 91 45 __ STA (T1 + 0),y 
0f78 : ad f7 24 LDA $24f7 ; (cw.cp + 0)
0f7b : 18 __ __ CLC
0f7c : 65 43 __ ADC T0 + 0 
0f7e : 85 45 __ STA T1 + 0 
0f80 : ad f8 24 LDA $24f8 ; (cw.cp + 1)
0f83 : 65 44 __ ADC T0 + 1 
0f85 : 85 46 __ STA T1 + 1 
0f87 : a9 07 __ LDA #$07
0f89 : 91 45 __ STA (T1 + 0),y 
0f8b : ee f1 24 INC $24f1 ; (cw.cx + 0)
0f8e : 4c 24 0f JMP $0f24 ; (cwin_console_write_string.s9 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->void
; 978, "/home/xahmol/oscar64/include/c64/charwin.c"
.s4:
0f91 : ad ee 9f LDA $9fee ; (sstack + 0)
0f94 : 85 48 __ STA T2 + 0 
0f96 : a9 00 __ LDA #$00
0f98 : 85 45 __ STA T4 + 0 
0f9a : ad ef 9f LDA $9fef ; (sstack + 1)
0f9d : 85 49 __ STA T2 + 1 
.l5:
0f9f : a0 00 __ LDY #$00
0fa1 : b1 48 __ LDA (T2 + 0),y 
0fa3 : d0 05 __ BNE $0faa ; (sformat.s7 + 0)
.s6:
0fa5 : a4 45 __ LDY T4 + 0 
0fa7 : 91 16 __ STA (P9),y ; (buff + 0)
.s3:
0fa9 : 60 __ __ RTS
.s7:
0faa : c9 25 __ CMP #$25
0fac : f0 22 __ BEQ $0fd0 ; (sformat.s10 + 0)
.s8:
0fae : a4 45 __ LDY T4 + 0 
0fb0 : 91 16 __ STA (P9),y ; (buff + 0)
0fb2 : e6 48 __ INC T2 + 0 
0fb4 : d0 02 __ BNE $0fb8 ; (sformat.s99 + 0)
.s98:
0fb6 : e6 49 __ INC T2 + 1 
.s99:
0fb8 : c8 __ __ INY
0fb9 : 84 45 __ STY T4 + 0 
0fbb : 98 __ __ TYA
0fbc : c0 28 __ CPY #$28
0fbe : 90 df __ BCC $0f9f ; (sformat.l5 + 0)
.s9:
0fc0 : 18 __ __ CLC
0fc1 : 65 16 __ ADC P9 ; (buff + 0)
0fc3 : 85 16 __ STA P9 ; (buff + 0)
0fc5 : 90 02 __ BCC $0fc9 ; (sformat.s101 + 0)
.s100:
0fc7 : e6 17 __ INC P10 ; (buff + 1)
.s101:
0fc9 : a9 00 __ LDA #$00
.s76:
0fcb : 85 45 __ STA T4 + 0 
0fcd : 4c 9f 0f JMP $0f9f ; (sformat.l5 + 0)
.s10:
0fd0 : 8c dd 9f STY $9fdd ; (si.prefix + 0)
0fd3 : a5 45 __ LDA T4 + 0 
0fd5 : f0 0c __ BEQ $0fe3 ; (sformat.s11 + 0)
.s74:
0fd7 : 84 45 __ STY T4 + 0 
0fd9 : 18 __ __ CLC
0fda : 65 16 __ ADC P9 ; (buff + 0)
0fdc : 85 16 __ STA P9 ; (buff + 0)
0fde : 90 02 __ BCC $0fe2 ; (sformat.s86 + 0)
.s85:
0fe0 : e6 17 __ INC P10 ; (buff + 1)
.s86:
0fe2 : 98 __ __ TYA
.s11:
0fe3 : 8d db 9f STA $9fdb ; (si.sign + 0)
0fe6 : 8d dc 9f STA $9fdc ; (si.left + 0)
0fe9 : a0 01 __ LDY #$01
0feb : b1 48 __ LDA (T2 + 0),y 
0fed : a2 20 __ LDX #$20
0fef : 8e d6 9f STX $9fd6 ; (si.fill + 0)
0ff2 : a2 00 __ LDX #$00
0ff4 : 8e d7 9f STX $9fd7 ; (si.width + 0)
0ff7 : ca __ __ DEX
0ff8 : 8e d8 9f STX $9fd8 ; (si.precision + 0)
0ffb : a2 0a __ LDX #$0a
0ffd : 8e da 9f STX $9fda ; (si.base + 0)
1000 : aa __ __ TAX
1001 : a9 02 __ LDA #$02
1003 : d0 07 __ BNE $100c ; (sformat.l12 + 0)
.s70:
1005 : a0 00 __ LDY #$00
1007 : b1 48 __ LDA (T2 + 0),y 
1009 : aa __ __ TAX
100a : a9 01 __ LDA #$01
.l12:
100c : 18 __ __ CLC
100d : 65 48 __ ADC T2 + 0 
100f : 85 48 __ STA T2 + 0 
1011 : 90 02 __ BCC $1015 ; (sformat.s88 + 0)
.s87:
1013 : e6 49 __ INC T2 + 1 
.s88:
1015 : 8a __ __ TXA
1016 : e0 2b __ CPX #$2b
1018 : d0 07 __ BNE $1021 ; (sformat.s13 + 0)
.s73:
101a : a9 01 __ LDA #$01
101c : 8d db 9f STA $9fdb ; (si.sign + 0)
101f : d0 e4 __ BNE $1005 ; (sformat.s70 + 0)
.s13:
1021 : c9 30 __ CMP #$30
1023 : d0 06 __ BNE $102b ; (sformat.s14 + 0)
.s72:
1025 : 8d d6 9f STA $9fd6 ; (si.fill + 0)
1028 : 4c 05 10 JMP $1005 ; (sformat.s70 + 0)
.s14:
102b : c9 23 __ CMP #$23
102d : d0 07 __ BNE $1036 ; (sformat.s15 + 0)
.s71:
102f : a9 01 __ LDA #$01
1031 : 8d dd 9f STA $9fdd ; (si.prefix + 0)
1034 : d0 cf __ BNE $1005 ; (sformat.s70 + 0)
.s15:
1036 : c9 2d __ CMP #$2d
1038 : d0 07 __ BNE $1041 ; (sformat.s16 + 0)
.s69:
103a : a9 01 __ LDA #$01
103c : 8d dc 9f STA $9fdc ; (si.left + 0)
103f : d0 c4 __ BNE $1005 ; (sformat.s70 + 0)
.s16:
1041 : 85 43 __ STA T1 + 0 
1043 : c9 30 __ CMP #$30
1045 : 90 33 __ BCC $107a ; (sformat.s17 + 0)
.s64:
1047 : c9 3a __ CMP #$3a
1049 : b0 60 __ BCS $10ab ; (sformat.s18 + 0)
.s65:
104b : a0 00 __ LDY #$00
104d : 84 46 __ STY T0 + 0 
104f : c9 3a __ CMP #$3a
1051 : b0 22 __ BCS $1075 ; (sformat.s67 + 0)
.l68:
1053 : a5 46 __ LDA T0 + 0 
1055 : 0a __ __ ASL
1056 : 0a __ __ ASL
1057 : 18 __ __ CLC
1058 : 65 46 __ ADC T0 + 0 
105a : 0a __ __ ASL
105b : 18 __ __ CLC
105c : 65 43 __ ADC T1 + 0 
105e : 38 __ __ SEC
105f : e9 30 __ SBC #$30
1061 : 85 46 __ STA T0 + 0 
1063 : b1 48 __ LDA (T2 + 0),y 
1065 : 85 43 __ STA T1 + 0 
1067 : e6 48 __ INC T2 + 0 
1069 : d0 02 __ BNE $106d ; (sformat.s97 + 0)
.s96:
106b : e6 49 __ INC T2 + 1 
.s97:
106d : c9 30 __ CMP #$30
106f : 90 04 __ BCC $1075 ; (sformat.s67 + 0)
.s66:
1071 : c9 3a __ CMP #$3a
1073 : 90 de __ BCC $1053 ; (sformat.l68 + 0)
.s67:
1075 : a6 46 __ LDX T0 + 0 
1077 : 8e d7 9f STX $9fd7 ; (si.width + 0)
.s17:
107a : c9 2e __ CMP #$2e
107c : d0 2d __ BNE $10ab ; (sformat.s18 + 0)
.s59:
107e : a9 00 __ LDA #$00
1080 : f0 0e __ BEQ $1090 ; (sformat.l60 + 0)
.s63:
1082 : a5 46 __ LDA T0 + 0 
1084 : 0a __ __ ASL
1085 : 0a __ __ ASL
1086 : 18 __ __ CLC
1087 : 65 46 __ ADC T0 + 0 
1089 : 0a __ __ ASL
108a : 18 __ __ CLC
108b : 65 43 __ ADC T1 + 0 
108d : 38 __ __ SEC
108e : e9 30 __ SBC #$30
.l60:
1090 : 85 46 __ STA T0 + 0 
1092 : a0 00 __ LDY #$00
1094 : b1 48 __ LDA (T2 + 0),y 
1096 : 85 43 __ STA T1 + 0 
1098 : e6 48 __ INC T2 + 0 
109a : d0 02 __ BNE $109e ; (sformat.s90 + 0)
.s89:
109c : e6 49 __ INC T2 + 1 
.s90:
109e : c9 30 __ CMP #$30
10a0 : 90 04 __ BCC $10a6 ; (sformat.s61 + 0)
.s62:
10a2 : c9 3a __ CMP #$3a
10a4 : 90 dc __ BCC $1082 ; (sformat.s63 + 0)
.s61:
10a6 : a6 46 __ LDX T0 + 0 
10a8 : 8e d8 9f STX $9fd8 ; (si.precision + 0)
.s18:
10ab : c9 64 __ CMP #$64
10ad : f0 0c __ BEQ $10bb ; (sformat.s58 + 0)
.s19:
10af : c9 44 __ CMP #$44
10b1 : f0 08 __ BEQ $10bb ; (sformat.s58 + 0)
.s20:
10b3 : c9 69 __ CMP #$69
10b5 : f0 04 __ BEQ $10bb ; (sformat.s58 + 0)
.s21:
10b7 : c9 49 __ CMP #$49
10b9 : d0 07 __ BNE $10c2 ; (sformat.s22 + 0)
.s58:
10bb : a9 01 __ LDA #$01
.s77:
10bd : 85 13 __ STA P6 
10bf : 4c 51 12 JMP $1251 ; (sformat.s56 + 0)
.s22:
10c2 : c9 75 __ CMP #$75
10c4 : f0 04 __ BEQ $10ca ; (sformat.s57 + 0)
.s23:
10c6 : c9 55 __ CMP #$55
10c8 : d0 04 __ BNE $10ce ; (sformat.s24 + 0)
.s57:
10ca : a9 00 __ LDA #$00
10cc : f0 ef __ BEQ $10bd ; (sformat.s77 + 0)
.s24:
10ce : c9 78 __ CMP #$78
10d0 : f0 04 __ BEQ $10d6 ; (sformat.s55 + 0)
.s25:
10d2 : c9 58 __ CMP #$58
10d4 : d0 13 __ BNE $10e9 ; (sformat.s26 + 0)
.s55:
10d6 : 29 e0 __ AND #$e0
10d8 : 09 01 __ ORA #$01
10da : 8d d9 9f STA $9fd9 ; (si.cha + 0)
10dd : a9 00 __ LDA #$00
10df : 85 13 __ STA P6 
10e1 : a9 10 __ LDA #$10
10e3 : 8d da 9f STA $9fda ; (si.base + 0)
10e6 : 4c 51 12 JMP $1251 ; (sformat.s56 + 0)
.s26:
10e9 : c9 6c __ CMP #$6c
10eb : d0 03 __ BNE $10f0 ; (sformat.s27 + 0)
10ed : 4c ca 11 JMP $11ca ; (sformat.s43 + 0)
.s27:
10f0 : c9 4c __ CMP #$4c
10f2 : f0 f9 __ BEQ $10ed ; (sformat.s26 + 4)
.s28:
10f4 : c9 73 __ CMP #$73
10f6 : f0 3e __ BEQ $1136 ; (sformat.s35 + 0)
.s29:
10f8 : c9 53 __ CMP #$53
10fa : f0 3a __ BEQ $1136 ; (sformat.s35 + 0)
.s30:
10fc : c9 63 __ CMP #$63
10fe : f0 15 __ BEQ $1115 ; (sformat.s34 + 0)
.s31:
1100 : c9 43 __ CMP #$43
1102 : f0 11 __ BEQ $1115 ; (sformat.s34 + 0)
.s32:
1104 : aa __ __ TAX
1105 : d0 03 __ BNE $110a ; (sformat.s102 + 0)
1107 : 4c 9f 0f JMP $0f9f ; (sformat.l5 + 0)
.s102:
110a : a0 00 __ LDY #$00
.s33:
110c : a5 43 __ LDA T1 + 0 
110e : 91 16 __ STA (P9),y ; (buff + 0)
1110 : a9 01 __ LDA #$01
1112 : 4c cb 0f JMP $0fcb ; (sformat.s76 + 0)
.s34:
1115 : ad f0 9f LDA $9ff0 ; (sstack + 2)
1118 : 85 46 __ STA T0 + 0 
111a : ad f1 9f LDA $9ff1 ; (sstack + 3)
111d : 85 47 __ STA T0 + 1 
111f : a0 00 __ LDY #$00
1121 : b1 46 __ LDA (T0 + 0),y 
1123 : 85 43 __ STA T1 + 0 
1125 : a5 46 __ LDA T0 + 0 
1127 : 69 01 __ ADC #$01
1129 : 8d f0 9f STA $9ff0 ; (sstack + 2)
112c : a5 47 __ LDA T0 + 1 
112e : 69 00 __ ADC #$00
1130 : 8d f1 9f STA $9ff1 ; (sstack + 3)
1133 : 4c 0c 11 JMP $110c ; (sformat.s33 + 0)
.s35:
1136 : ad f0 9f LDA $9ff0 ; (sstack + 2)
1139 : 85 46 __ STA T0 + 0 
113b : 69 01 __ ADC #$01
113d : 8d f0 9f STA $9ff0 ; (sstack + 2)
1140 : ad f1 9f LDA $9ff1 ; (sstack + 3)
1143 : 85 47 __ STA T0 + 1 
1145 : 69 00 __ ADC #$00
1147 : 8d f1 9f STA $9ff1 ; (sstack + 3)
114a : a0 00 __ LDY #$00
114c : 84 1b __ STY ACCU + 0 ; (fps + 0)
114e : b1 46 __ LDA (T0 + 0),y 
1150 : aa __ __ TAX
1151 : c8 __ __ INY
1152 : b1 46 __ LDA (T0 + 0),y 
1154 : 86 46 __ STX T0 + 0 
1156 : 85 47 __ STA T0 + 1 
1158 : ad d7 9f LDA $9fd7 ; (si.width + 0)
115b : f0 0c __ BEQ $1169 ; (sformat.s36 + 0)
.s82:
115d : 88 __ __ DEY
115e : b1 46 __ LDA (T0 + 0),y 
1160 : f0 05 __ BEQ $1167 ; (sformat.s83 + 0)
.l42:
1162 : c8 __ __ INY
1163 : b1 46 __ LDA (T0 + 0),y 
1165 : d0 fb __ BNE $1162 ; (sformat.l42 + 0)
.s83:
1167 : 84 1b __ STY ACCU + 0 ; (fps + 0)
.s36:
1169 : ad dc 9f LDA $9fdc ; (si.left + 0)
116c : 85 1c __ STA ACCU + 1 ; (fps + 1)
116e : d0 19 __ BNE $1189 ; (sformat.s37 + 0)
.s80:
1170 : a6 1b __ LDX ACCU + 0 ; (fps + 0)
1172 : ec d7 9f CPX $9fd7 ; (si.width + 0)
1175 : a0 00 __ LDY #$00
1177 : b0 0c __ BCS $1185 ; (sformat.s81 + 0)
.l41:
1179 : ad d6 9f LDA $9fd6 ; (si.fill + 0)
117c : 91 16 __ STA (P9),y ; (buff + 0)
117e : c8 __ __ INY
117f : e8 __ __ INX
1180 : ec d7 9f CPX $9fd7 ; (si.width + 0)
1183 : 90 f4 __ BCC $1179 ; (sformat.l41 + 0)
.s81:
1185 : 86 1b __ STX ACCU + 0 ; (fps + 0)
1187 : 84 45 __ STY T4 + 0 
.s37:
1189 : a0 00 __ LDY #$00
118b : b1 46 __ LDA (T0 + 0),y 
118d : f0 1a __ BEQ $11a9 ; (sformat.s38 + 0)
.s40:
118f : e6 46 __ INC T0 + 0 
1191 : d0 02 __ BNE $1195 ; (sformat.l75 + 0)
.s93:
1193 : e6 47 __ INC T0 + 1 
.l75:
1195 : a4 45 __ LDY T4 + 0 
1197 : 91 16 __ STA (P9),y ; (buff + 0)
1199 : e6 45 __ INC T4 + 0 
119b : a0 00 __ LDY #$00
119d : b1 46 __ LDA (T0 + 0),y 
119f : a8 __ __ TAY
11a0 : e6 46 __ INC T0 + 0 
11a2 : d0 02 __ BNE $11a6 ; (sformat.s95 + 0)
.s94:
11a4 : e6 47 __ INC T0 + 1 
.s95:
11a6 : 98 __ __ TYA
11a7 : d0 ec __ BNE $1195 ; (sformat.l75 + 0)
.s38:
11a9 : a5 1c __ LDA ACCU + 1 ; (fps + 1)
11ab : d0 03 __ BNE $11b0 ; (sformat.s79 + 0)
11ad : 4c 9f 0f JMP $0f9f ; (sformat.l5 + 0)
.s79:
11b0 : a6 1b __ LDX ACCU + 0 ; (fps + 0)
11b2 : ec d7 9f CPX $9fd7 ; (si.width + 0)
11b5 : a4 45 __ LDY T4 + 0 
11b7 : b0 0c __ BCS $11c5 ; (sformat.s84 + 0)
.l39:
11b9 : ad d6 9f LDA $9fd6 ; (si.fill + 0)
11bc : 91 16 __ STA (P9),y ; (buff + 0)
11be : c8 __ __ INY
11bf : e8 __ __ INX
11c0 : ec d7 9f CPX $9fd7 ; (si.width + 0)
11c3 : 90 f4 __ BCC $11b9 ; (sformat.l39 + 0)
.s84:
11c5 : 84 45 __ STY T4 + 0 
11c7 : 4c 9f 0f JMP $0f9f ; (sformat.l5 + 0)
.s43:
11ca : ad f0 9f LDA $9ff0 ; (sstack + 2)
11cd : 85 46 __ STA T0 + 0 
11cf : 69 03 __ ADC #$03
11d1 : 8d f0 9f STA $9ff0 ; (sstack + 2)
11d4 : ad f1 9f LDA $9ff1 ; (sstack + 3)
11d7 : 85 47 __ STA T0 + 1 
11d9 : 69 00 __ ADC #$00
11db : 8d f1 9f STA $9ff1 ; (sstack + 3)
11de : a0 00 __ LDY #$00
11e0 : b1 48 __ LDA (T2 + 0),y 
11e2 : aa __ __ TAX
11e3 : e6 48 __ INC T2 + 0 
11e5 : d0 02 __ BNE $11e9 ; (sformat.s92 + 0)
.s91:
11e7 : e6 49 __ INC T2 + 1 
.s92:
11e9 : b1 46 __ LDA (T0 + 0),y 
11eb : 85 11 __ STA P4 
11ed : a0 01 __ LDY #$01
11ef : b1 46 __ LDA (T0 + 0),y 
11f1 : 85 12 __ STA P5 
11f3 : c8 __ __ INY
11f4 : b1 46 __ LDA (T0 + 0),y 
11f6 : 85 13 __ STA P6 
11f8 : c8 __ __ INY
11f9 : b1 46 __ LDA (T0 + 0),y 
11fb : 85 14 __ STA P7 
11fd : e0 64 __ CPX #$64
11ff : f0 0c __ BEQ $120d ; (sformat.s54 + 0)
.s44:
1201 : e0 44 __ CPX #$44
1203 : f0 08 __ BEQ $120d ; (sformat.s54 + 0)
.s45:
1205 : e0 69 __ CPX #$69
1207 : f0 04 __ BEQ $120d ; (sformat.s54 + 0)
.s46:
1209 : e0 49 __ CPX #$49
120b : d0 1c __ BNE $1229 ; (sformat.s47 + 0)
.s54:
120d : a9 01 __ LDA #$01
.s78:
120f : 85 15 __ STA P8 
.s52:
1211 : a5 16 __ LDA P9 ; (buff + 0)
1213 : 85 0f __ STA P2 
1215 : a5 17 __ LDA P10 ; (buff + 1)
1217 : 85 10 __ STA P3 
1219 : a9 d6 __ LDA #$d6
121b : 85 0d __ STA P0 
121d : a9 9f __ LDA #$9f
121f : 85 0e __ STA P1 
1221 : 20 a6 13 JSR $13a6 ; (nforml.s4 + 0)
1224 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
1226 : 4c cb 0f JMP $0fcb ; (sformat.s76 + 0)
.s47:
1229 : e0 75 __ CPX #$75
122b : f0 04 __ BEQ $1231 ; (sformat.s53 + 0)
.s48:
122d : e0 55 __ CPX #$55
122f : d0 04 __ BNE $1235 ; (sformat.s49 + 0)
.s53:
1231 : a9 00 __ LDA #$00
1233 : f0 da __ BEQ $120f ; (sformat.s78 + 0)
.s49:
1235 : e0 78 __ CPX #$78
1237 : f0 04 __ BEQ $123d ; (sformat.s51 + 0)
.s50:
1239 : e0 58 __ CPX #$58
123b : d0 8a __ BNE $11c7 ; (sformat.s84 + 2)
.s51:
123d : a9 00 __ LDA #$00
123f : 85 15 __ STA P8 
1241 : a9 10 __ LDA #$10
1243 : 8d da 9f STA $9fda ; (si.base + 0)
1246 : 8a __ __ TXA
1247 : 29 e0 __ AND #$e0
1249 : 09 01 __ ORA #$01
124b : 8d d9 9f STA $9fd9 ; (si.cha + 0)
124e : 4c 11 12 JMP $1211 ; (sformat.s52 + 0)
.s56:
1251 : a5 16 __ LDA P9 ; (buff + 0)
1253 : 85 0f __ STA P2 
1255 : a5 17 __ LDA P10 ; (buff + 1)
1257 : 85 10 __ STA P3 
1259 : ad f0 9f LDA $9ff0 ; (sstack + 2)
125c : 85 46 __ STA T0 + 0 
125e : ad f1 9f LDA $9ff1 ; (sstack + 3)
1261 : 85 47 __ STA T0 + 1 
1263 : a0 00 __ LDY #$00
1265 : b1 46 __ LDA (T0 + 0),y 
1267 : 85 11 __ STA P4 
1269 : c8 __ __ INY
126a : b1 46 __ LDA (T0 + 0),y 
126c : 85 12 __ STA P5 
126e : 18 __ __ CLC
126f : a5 46 __ LDA T0 + 0 
1271 : 69 02 __ ADC #$02
1273 : 8d f0 9f STA $9ff0 ; (sstack + 2)
1276 : a5 47 __ LDA T0 + 1 
1278 : 69 00 __ ADC #$00
127a : 8d f1 9f STA $9ff1 ; (sstack + 3)
127d : a9 d6 __ LDA #$d6
127f : 85 0d __ STA P0 
1281 : a9 9f __ LDA #$9f
1283 : 85 0e __ STA P1 
1285 : 20 8b 12 JSR $128b ; (nformi.s4 + 0)
1288 : 4c cb 0f JMP $0fcb ; (sformat.s76 + 0)
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "/home/xahmol/oscar64/include/stdio.c"
.s4:
128b : a9 00 __ LDA #$00
128d : 85 43 __ STA T5 + 0 
128f : a0 04 __ LDY #$04
1291 : b1 0d __ LDA (P0),y ; (si + 0)
1293 : 85 44 __ STA T6 + 0 
1295 : a5 13 __ LDA P6 ; (s + 0)
1297 : f0 13 __ BEQ $12ac ; (nformi.s5 + 0)
.s33:
1299 : 24 12 __ BIT P5 ; (v + 1)
129b : 10 0f __ BPL $12ac ; (nformi.s5 + 0)
.s34:
129d : 38 __ __ SEC
129e : a9 00 __ LDA #$00
12a0 : e5 11 __ SBC P4 ; (v + 0)
12a2 : 85 11 __ STA P4 ; (v + 0)
12a4 : a9 00 __ LDA #$00
12a6 : e5 12 __ SBC P5 ; (v + 1)
12a8 : 85 12 __ STA P5 ; (v + 1)
12aa : e6 43 __ INC T5 + 0 
.s5:
12ac : a9 10 __ LDA #$10
12ae : 85 45 __ STA T7 + 0 
12b0 : a5 11 __ LDA P4 ; (v + 0)
12b2 : 05 12 __ ORA P5 ; (v + 1)
12b4 : f0 33 __ BEQ $12e9 ; (nformi.s6 + 0)
.s28:
12b6 : a5 11 __ LDA P4 ; (v + 0)
12b8 : 85 1b __ STA ACCU + 0 
12ba : a5 12 __ LDA P5 ; (v + 1)
12bc : 85 1c __ STA ACCU + 1 
.l29:
12be : a5 44 __ LDA T6 + 0 
12c0 : 85 03 __ STA WORK + 0 
12c2 : a9 00 __ LDA #$00
12c4 : 85 04 __ STA WORK + 1 
12c6 : 20 de 20 JSR $20de ; (divmod + 0)
12c9 : a5 05 __ LDA WORK + 2 
12cb : c9 0a __ CMP #$0a
12cd : b0 04 __ BCS $12d3 ; (nformi.s32 + 0)
.s30:
12cf : a9 30 __ LDA #$30
12d1 : 90 06 __ BCC $12d9 ; (nformi.s31 + 0)
.s32:
12d3 : a0 03 __ LDY #$03
12d5 : b1 0d __ LDA (P0),y ; (si + 0)
12d7 : e9 0a __ SBC #$0a
.s31:
12d9 : 18 __ __ CLC
12da : 65 05 __ ADC WORK + 2 
12dc : a6 45 __ LDX T7 + 0 
12de : 9d dd 9f STA $9fdd,x ; (si.prefix + 0)
12e1 : c6 45 __ DEC T7 + 0 
12e3 : a5 1b __ LDA ACCU + 0 
12e5 : 05 1c __ ORA ACCU + 1 
12e7 : d0 d5 __ BNE $12be ; (nformi.l29 + 0)
.s6:
12e9 : a0 02 __ LDY #$02
12eb : b1 0d __ LDA (P0),y ; (si + 0)
12ed : c9 ff __ CMP #$ff
12ef : d0 04 __ BNE $12f5 ; (nformi.s27 + 0)
.s7:
12f1 : a9 0f __ LDA #$0f
12f3 : d0 05 __ BNE $12fa ; (nformi.s39 + 0)
.s27:
12f5 : 38 __ __ SEC
12f6 : a9 10 __ LDA #$10
12f8 : f1 0d __ SBC (P0),y ; (si + 0)
.s39:
12fa : a8 __ __ TAY
12fb : c4 45 __ CPY T7 + 0 
12fd : b0 0d __ BCS $130c ; (nformi.s8 + 0)
.s26:
12ff : a9 30 __ LDA #$30
.l40:
1301 : a6 45 __ LDX T7 + 0 
1303 : 9d dd 9f STA $9fdd,x ; (si.prefix + 0)
1306 : c6 45 __ DEC T7 + 0 
1308 : c4 45 __ CPY T7 + 0 
130a : 90 f5 __ BCC $1301 ; (nformi.l40 + 0)
.s8:
130c : a0 07 __ LDY #$07
130e : b1 0d __ LDA (P0),y ; (si + 0)
1310 : f0 1c __ BEQ $132e ; (nformi.s9 + 0)
.s24:
1312 : a5 44 __ LDA T6 + 0 
1314 : c9 10 __ CMP #$10
1316 : d0 16 __ BNE $132e ; (nformi.s9 + 0)
.s25:
1318 : a0 03 __ LDY #$03
131a : b1 0d __ LDA (P0),y ; (si + 0)
131c : a8 __ __ TAY
131d : a9 30 __ LDA #$30
131f : a6 45 __ LDX T7 + 0 
1321 : 9d dc 9f STA $9fdc,x ; (si.left + 0)
1324 : 98 __ __ TYA
1325 : 69 16 __ ADC #$16
1327 : 9d dd 9f STA $9fdd,x ; (si.prefix + 0)
132a : ca __ __ DEX
132b : ca __ __ DEX
132c : 86 45 __ STX T7 + 0 
.s9:
132e : a9 00 __ LDA #$00
1330 : 85 1b __ STA ACCU + 0 
1332 : a5 43 __ LDA T5 + 0 
1334 : f0 0c __ BEQ $1342 ; (nformi.s10 + 0)
.s23:
1336 : a9 2d __ LDA #$2d
.s22:
1338 : a6 45 __ LDX T7 + 0 
133a : 9d dd 9f STA $9fdd,x ; (si.prefix + 0)
133d : c6 45 __ DEC T7 + 0 
133f : 4c 4c 13 JMP $134c ; (nformi.s11 + 0)
.s10:
1342 : a0 05 __ LDY #$05
1344 : b1 0d __ LDA (P0),y ; (si + 0)
1346 : f0 04 __ BEQ $134c ; (nformi.s11 + 0)
.s21:
1348 : a9 2b __ LDA #$2b
134a : d0 ec __ BNE $1338 ; (nformi.s22 + 0)
.s11:
134c : a6 45 __ LDX T7 + 0 
134e : a0 06 __ LDY #$06
1350 : b1 0d __ LDA (P0),y ; (si + 0)
1352 : d0 2b __ BNE $137f ; (nformi.s17 + 0)
.l12:
1354 : 8a __ __ TXA
1355 : 18 __ __ CLC
1356 : a0 01 __ LDY #$01
1358 : 71 0d __ ADC (P0),y ; (si + 0)
135a : b0 04 __ BCS $1360 ; (nformi.s15 + 0)
.s16:
135c : c9 11 __ CMP #$11
135e : 90 0a __ BCC $136a ; (nformi.s13 + 0)
.s15:
1360 : a0 00 __ LDY #$00
1362 : b1 0d __ LDA (P0),y ; (si + 0)
1364 : 9d dd 9f STA $9fdd,x ; (si.prefix + 0)
1367 : ca __ __ DEX
1368 : b0 ea __ BCS $1354 ; (nformi.l12 + 0)
.s13:
136a : e0 10 __ CPX #$10
136c : b0 0e __ BCS $137c ; (nformi.s41 + 0)
.s14:
136e : 88 __ __ DEY
.l37:
136f : bd de 9f LDA $9fde,x ; (buffer[0] + 0)
1372 : 91 0f __ STA (P2),y ; (str + 0)
1374 : c8 __ __ INY
1375 : e8 __ __ INX
1376 : e0 10 __ CPX #$10
1378 : 90 f5 __ BCC $136f ; (nformi.l37 + 0)
.s38:
137a : 84 1b __ STY ACCU + 0 
.s41:
137c : a5 1b __ LDA ACCU + 0 
.s3:
137e : 60 __ __ RTS
.s17:
137f : e0 10 __ CPX #$10
1381 : b0 1a __ BCS $139d ; (nformi.l18 + 0)
.s20:
1383 : a0 00 __ LDY #$00
.l35:
1385 : bd de 9f LDA $9fde,x ; (buffer[0] + 0)
1388 : 91 0f __ STA (P2),y ; (str + 0)
138a : c8 __ __ INY
138b : e8 __ __ INX
138c : e0 10 __ CPX #$10
138e : 90 f5 __ BCC $1385 ; (nformi.l35 + 0)
.s36:
1390 : 84 1b __ STY ACCU + 0 
1392 : b0 09 __ BCS $139d ; (nformi.l18 + 0)
.s19:
1394 : 88 __ __ DEY
1395 : b1 0d __ LDA (P0),y ; (si + 0)
1397 : a4 1b __ LDY ACCU + 0 
1399 : 91 0f __ STA (P2),y ; (str + 0)
139b : e6 1b __ INC ACCU + 0 
.l18:
139d : a5 1b __ LDA ACCU + 0 
139f : a0 01 __ LDY #$01
13a1 : d1 0d __ CMP (P0),y ; (si + 0)
13a3 : 90 ef __ BCC $1394 ; (nformi.s19 + 0)
13a5 : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "/home/xahmol/oscar64/include/stdio.c"
.s4:
13a6 : a9 00 __ LDA #$00
13a8 : 85 43 __ STA T4 + 0 
13aa : a5 15 __ LDA P8 ; (s + 0)
13ac : f0 1f __ BEQ $13cd ; (nforml.s5 + 0)
.s35:
13ae : 24 14 __ BIT P7 ; (v + 3)
13b0 : 10 1b __ BPL $13cd ; (nforml.s5 + 0)
.s36:
13b2 : 38 __ __ SEC
13b3 : a9 00 __ LDA #$00
13b5 : e5 11 __ SBC P4 ; (v + 0)
13b7 : 85 11 __ STA P4 ; (v + 0)
13b9 : a9 00 __ LDA #$00
13bb : e5 12 __ SBC P5 ; (v + 1)
13bd : 85 12 __ STA P5 ; (v + 1)
13bf : a9 00 __ LDA #$00
13c1 : e5 13 __ SBC P6 ; (v + 2)
13c3 : 85 13 __ STA P6 ; (v + 2)
13c5 : a9 00 __ LDA #$00
13c7 : e5 14 __ SBC P7 ; (v + 3)
13c9 : 85 14 __ STA P7 ; (v + 3)
13cb : e6 43 __ INC T4 + 0 
.s5:
13cd : a9 10 __ LDA #$10
13cf : 85 44 __ STA T5 + 0 
13d1 : a5 14 __ LDA P7 ; (v + 3)
13d3 : f0 03 __ BEQ $13d8 ; (nforml.s31 + 0)
13d5 : 4c a0 14 JMP $14a0 ; (nforml.l28 + 0)
.s31:
13d8 : a5 13 __ LDA P6 ; (v + 2)
13da : d0 f9 __ BNE $13d5 ; (nforml.s5 + 8)
.s32:
13dc : a5 12 __ LDA P5 ; (v + 1)
13de : d0 f5 __ BNE $13d5 ; (nforml.s5 + 8)
.s33:
13e0 : c5 11 __ CMP P4 ; (v + 0)
13e2 : 90 f1 __ BCC $13d5 ; (nforml.s5 + 8)
.s6:
13e4 : a0 02 __ LDY #$02
13e6 : b1 0d __ LDA (P0),y ; (si + 0)
13e8 : c9 ff __ CMP #$ff
13ea : d0 04 __ BNE $13f0 ; (nforml.s27 + 0)
.s7:
13ec : a9 0f __ LDA #$0f
13ee : d0 05 __ BNE $13f5 ; (nforml.s41 + 0)
.s27:
13f0 : 38 __ __ SEC
13f1 : a9 10 __ LDA #$10
13f3 : f1 0d __ SBC (P0),y ; (si + 0)
.s41:
13f5 : a8 __ __ TAY
13f6 : c4 44 __ CPY T5 + 0 
13f8 : b0 0d __ BCS $1407 ; (nforml.s8 + 0)
.s26:
13fa : a9 30 __ LDA #$30
.l42:
13fc : a6 44 __ LDX T5 + 0 
13fe : 9d dd 9f STA $9fdd,x ; (si.prefix + 0)
1401 : c6 44 __ DEC T5 + 0 
1403 : c4 44 __ CPY T5 + 0 
1405 : 90 f5 __ BCC $13fc ; (nforml.l42 + 0)
.s8:
1407 : a0 07 __ LDY #$07
1409 : b1 0d __ LDA (P0),y ; (si + 0)
140b : f0 1d __ BEQ $142a ; (nforml.s9 + 0)
.s24:
140d : a0 04 __ LDY #$04
140f : b1 0d __ LDA (P0),y ; (si + 0)
1411 : c9 10 __ CMP #$10
1413 : d0 15 __ BNE $142a ; (nforml.s9 + 0)
.s25:
1415 : 88 __ __ DEY
1416 : b1 0d __ LDA (P0),y ; (si + 0)
1418 : a8 __ __ TAY
1419 : a9 30 __ LDA #$30
141b : a6 44 __ LDX T5 + 0 
141d : 9d dc 9f STA $9fdc,x ; (si.left + 0)
1420 : 98 __ __ TYA
1421 : 69 16 __ ADC #$16
1423 : 9d dd 9f STA $9fdd,x ; (si.prefix + 0)
1426 : ca __ __ DEX
1427 : ca __ __ DEX
1428 : 86 44 __ STX T5 + 0 
.s9:
142a : a9 00 __ LDA #$00
142c : 85 1b __ STA ACCU + 0 
142e : a5 43 __ LDA T4 + 0 
1430 : f0 0c __ BEQ $143e ; (nforml.s10 + 0)
.s23:
1432 : a9 2d __ LDA #$2d
.s22:
1434 : a6 44 __ LDX T5 + 0 
1436 : 9d dd 9f STA $9fdd,x ; (si.prefix + 0)
1439 : c6 44 __ DEC T5 + 0 
143b : 4c 48 14 JMP $1448 ; (nforml.s11 + 0)
.s10:
143e : a0 05 __ LDY #$05
1440 : b1 0d __ LDA (P0),y ; (si + 0)
1442 : f0 04 __ BEQ $1448 ; (nforml.s11 + 0)
.s21:
1444 : a9 2b __ LDA #$2b
1446 : d0 ec __ BNE $1434 ; (nforml.s22 + 0)
.s11:
1448 : a0 06 __ LDY #$06
144a : a6 44 __ LDX T5 + 0 
144c : b1 0d __ LDA (P0),y ; (si + 0)
144e : d0 29 __ BNE $1479 ; (nforml.s17 + 0)
.l12:
1450 : 8a __ __ TXA
1451 : 18 __ __ CLC
1452 : a0 01 __ LDY #$01
1454 : 71 0d __ ADC (P0),y ; (si + 0)
1456 : b0 04 __ BCS $145c ; (nforml.s15 + 0)
.s16:
1458 : c9 11 __ CMP #$11
145a : 90 0a __ BCC $1466 ; (nforml.s13 + 0)
.s15:
145c : a0 00 __ LDY #$00
145e : b1 0d __ LDA (P0),y ; (si + 0)
1460 : 9d dd 9f STA $9fdd,x ; (si.prefix + 0)
1463 : ca __ __ DEX
1464 : b0 ea __ BCS $1450 ; (nforml.l12 + 0)
.s13:
1466 : e0 10 __ CPX #$10
1468 : b0 0e __ BCS $1478 ; (nforml.s3 + 0)
.s14:
146a : 88 __ __ DEY
.l39:
146b : bd de 9f LDA $9fde,x ; (buffer[0] + 0)
146e : 91 0f __ STA (P2),y ; (str + 0)
1470 : c8 __ __ INY
1471 : e8 __ __ INX
1472 : e0 10 __ CPX #$10
1474 : 90 f5 __ BCC $146b ; (nforml.l39 + 0)
.s40:
1476 : 84 1b __ STY ACCU + 0 
.s3:
1478 : 60 __ __ RTS
.s17:
1479 : e0 10 __ CPX #$10
147b : b0 1a __ BCS $1497 ; (nforml.l18 + 0)
.s20:
147d : a0 00 __ LDY #$00
.l37:
147f : bd de 9f LDA $9fde,x ; (buffer[0] + 0)
1482 : 91 0f __ STA (P2),y ; (str + 0)
1484 : c8 __ __ INY
1485 : e8 __ __ INX
1486 : e0 10 __ CPX #$10
1488 : 90 f5 __ BCC $147f ; (nforml.l37 + 0)
.s38:
148a : 84 1b __ STY ACCU + 0 
148c : b0 09 __ BCS $1497 ; (nforml.l18 + 0)
.s19:
148e : 88 __ __ DEY
148f : b1 0d __ LDA (P0),y ; (si + 0)
1491 : a4 1b __ LDY ACCU + 0 
1493 : 91 0f __ STA (P2),y ; (str + 0)
1495 : e6 1b __ INC ACCU + 0 
.l18:
1497 : a5 1b __ LDA ACCU + 0 
1499 : a0 01 __ LDY #$01
149b : d1 0d __ CMP (P0),y ; (si + 0)
149d : 90 ef __ BCC $148e ; (nforml.s19 + 0)
149f : 60 __ __ RTS
.l28:
14a0 : a0 04 __ LDY #$04
14a2 : b1 0d __ LDA (P0),y ; (si + 0)
14a4 : 85 03 __ STA WORK + 0 
14a6 : a5 11 __ LDA P4 ; (v + 0)
14a8 : 85 1b __ STA ACCU + 0 
14aa : a5 12 __ LDA P5 ; (v + 1)
14ac : 85 1c __ STA ACCU + 1 
14ae : a5 13 __ LDA P6 ; (v + 2)
14b0 : 85 1d __ STA ACCU + 2 
14b2 : a5 14 __ LDA P7 ; (v + 3)
14b4 : 85 1e __ STA ACCU + 3 
14b6 : a9 00 __ LDA #$00
14b8 : 85 04 __ STA WORK + 1 
14ba : 85 05 __ STA WORK + 2 
14bc : 85 06 __ STA WORK + 3 
14be : 20 81 21 JSR $2181 ; (divmod32 + 0)
14c1 : a5 07 __ LDA WORK + 4 
14c3 : c9 0a __ CMP #$0a
14c5 : b0 04 __ BCS $14cb ; (nforml.s34 + 0)
.s29:
14c7 : a9 30 __ LDA #$30
14c9 : 90 06 __ BCC $14d1 ; (nforml.s30 + 0)
.s34:
14cb : a0 03 __ LDY #$03
14cd : b1 0d __ LDA (P0),y ; (si + 0)
14cf : e9 0a __ SBC #$0a
.s30:
14d1 : 18 __ __ CLC
14d2 : 65 07 __ ADC WORK + 4 
14d4 : a6 44 __ LDX T5 + 0 
14d6 : 9d dd 9f STA $9fdd,x ; (si.prefix + 0)
14d9 : c6 44 __ DEC T5 + 0 
14db : a5 1b __ LDA ACCU + 0 
14dd : 85 11 __ STA P4 ; (v + 0)
14df : a5 1c __ LDA ACCU + 1 
14e1 : 85 12 __ STA P5 ; (v + 1)
14e3 : a5 1d __ LDA ACCU + 2 
14e5 : 85 13 __ STA P6 ; (v + 2)
14e7 : a5 1e __ LDA ACCU + 3 
14e9 : 85 14 __ STA P7 ; (v + 3)
14eb : d0 b3 __ BNE $14a0 ; (nforml.l28 + 0)
14ed : 4c d8 13 JMP $13d8 ; (nforml.s31 + 0)
--------------------------------------------------------------------
cwin_getch: ; cwin_getch()->void
; 147, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
14f0 : 20 e4 ff JSR $ffe4 
14f3 : c9 00 __ CMP #$00
14f5 : f0 f9 __ BEQ $14f0 ; (cwin_getch.s4 + 0)
14f7 : 85 1b __ STA ACCU + 0 
14f9 : a9 00 __ LDA #$00
14fb : 85 1c __ STA ACCU + 1 
.s3:
14fd : 60 __ __ RTS
--------------------------------------------------------------------
14fe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
spentry:
14ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1500 : __ __ __ BYT 0a 25 53 0a 70 52 45 53 53 20 4b 45 59 20 54 4f : .%S.pRESS KEY TO
1510 : __ __ __ BYT 20 45 58 49 54 20 54 4f 20 62 61 73 69 63 2e 0a :  EXIT TO basic..
1520 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1521 : __ __ __ BYT 6e 4f 20 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d : nO uLTIMATE cOMM
1531 : __ __ __ BYT 41 4e 44 20 69 4e 54 45 52 46 41 43 45 20 45 4e : AND iNTERFACE EN
1541 : __ __ __ BYT 41 42 4c 45 44 2e 00                            : ABLED..
--------------------------------------------------------------------
cwin_put_string: ; cwin_put_string(struct CharWin*,const u8*,u8)->void
;  64, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
1548 : ad f2 24 LDA $24f2 ; (cw.cy + 0)
154b : 0a __ __ ASL
154c : aa __ __ TAX
154d : bd 8d 24 LDA $248d,x ; (mul40[0] + 0)
1550 : 6d f1 24 ADC $24f1 ; (cw.cx + 0)
1553 : 85 1b __ STA ACCU + 0 
1555 : bd 8e 24 LDA $248e,x ; (mul40[0] + 1)
1558 : 69 00 __ ADC #$00
155a : 85 1c __ STA ACCU + 1 
155c : ad f5 24 LDA $24f5 ; (cw.sp + 0)
155f : 65 1b __ ADC ACCU + 0 
1561 : 85 43 __ STA T1 + 0 
1563 : ad f6 24 LDA $24f6 ; (cw.sp + 1)
1566 : 65 1c __ ADC ACCU + 1 
1568 : 85 44 __ STA T1 + 1 
156a : ad f7 24 LDA $24f7 ; (cw.cp + 0)
156d : 18 __ __ CLC
156e : 65 1b __ ADC ACCU + 0 
1570 : 85 1b __ STA ACCU + 0 
1572 : ad f8 24 LDA $24f8 ; (cw.cp + 1)
1575 : 65 1c __ ADC ACCU + 1 
1577 : 85 1c __ STA ACCU + 1 
1579 : a0 00 __ LDY #$00
157b : b1 0d __ LDA (P0),y ; (str + 0)
157d : f0 16 __ BEQ $1595 ; (cwin_put_string.s5 + 0)
.l7:
157f : 4a __ __ LSR
1580 : 4a __ __ LSR
1581 : 4a __ __ LSR
1582 : 4a __ __ LSR
1583 : 4a __ __ LSR
1584 : aa __ __ TAX
1585 : bd c7 24 LDA $24c7,x ; (p2smap[0] + 0)
1588 : 51 0d __ EOR (P0),y ; (str + 0)
158a : 91 43 __ STA (T1 + 0),y 
158c : a9 07 __ LDA #$07
158e : 91 1b __ STA (ACCU + 0),y 
1590 : c8 __ __ INY
1591 : b1 0d __ LDA (P0),y ; (str + 0)
1593 : d0 ea __ BNE $157f ; (cwin_put_string.l7 + 0)
.s5:
1595 : 98 __ __ TYA
1596 : 18 __ __ CLC
1597 : 6d f1 24 ADC $24f1 ; (cw.cx + 0)
159a : cd ef 24 CMP $24ef ; (cw.wx + 0)
159d : 90 05 __ BCC $15a4 ; (cwin_put_string.s3 + 0)
.s6:
159f : a9 00 __ LDA #$00
15a1 : ee f2 24 INC $24f2 ; (cw.cy + 0)
.s3:
15a4 : 8d f1 24 STA $24f1 ; (cw.cx + 0)
15a7 : 60 __ __ RTS
--------------------------------------------------------------------
15a8 : __ __ __ BYT 75 4c 54 49 4d 41 54 45 20 63 4f 4d 4d 41 4e 44 : uLTIMATE cOMMAND
15b8 : __ __ __ BYT 20 69 4e 54 45 52 46 41 43 45 20 44 45 54 45 43 :  iNTERFACE DETEC
15c8 : __ __ __ BYT 54 45 44 2e 00                                  : TED..
--------------------------------------------------------------------
cwin_cursor_newline: ; cwin_cursor_newline(struct CharWin*)->void
;  44, "/home/xahmol/oscar64/include/c64/charwin.h"
.s4:
15cd : ad f2 24 LDA $24f2 ; (cw.cy + 0)
15d0 : 18 __ __ CLC
15d1 : 69 01 __ ADC #$01
15d3 : a8 __ __ TAY
15d4 : a9 00 __ LDA #$00
15d6 : 8d f1 24 STA $24f1 ; (cw.cx + 0)
15d9 : 2a __ __ ROL
15da : d0 08 __ BNE $15e4 ; (cwin_cursor_newline.s3 + 0)
.s6:
15dc : cc f0 24 CPY $24f0 ; (cw.wy + 0)
15df : b0 03 __ BCS $15e4 ; (cwin_cursor_newline.s3 + 0)
.s5:
15e1 : ee f2 24 INC $24f2 ; (cw.cy + 0)
.s3:
15e4 : 60 __ __ RTS
--------------------------------------------------------------------
15e5 : __ __ __ BYT 64 6f 73 20 56 45 52 53 49 4f 4e 3a 20 00       : dos VERSION: .
--------------------------------------------------------------------
reu_count_pages: ; reu_count_pages()->i16
;  48, "/home/xahmol/oscar64/include/c64/reu.h"
.s4:
15f3 : a9 00 __ LDA #$00
15f5 : 8d ed 9f STA $9fed ; (c + 0)
15f8 : a9 ed __ LDA #$ed
15fa : 8d 02 df STA $df02 
15fd : a9 9f __ LDA #$9f
15ff : 8d 03 df STA $df03 
1602 : a9 00 __ LDA #$00
1604 : 8d 04 df STA $df04 
1607 : 8d 05 df STA $df05 
160a : 8d 06 df STA $df06 
160d : a2 01 __ LDX #$01
160f : 8e 07 df STX $df07 
1612 : 8d 08 df STA $df08 
1615 : 8d 0a df STA $df0a 
1618 : a2 90 __ LDX #$90
161a : 8e 01 df STX $df01 
161d : a2 ec __ LDX #$ec
161f : 8e 02 df STX $df02 
1622 : a2 9f __ LDX #$9f
1624 : 8e 03 df STX $df03 
1627 : 8d 04 df STA $df04 
162a : 8d 05 df STA $df05 
162d : 8d 06 df STA $df06 
1630 : a2 01 __ LDX #$01
1632 : 8e 07 df STX $df07 
1635 : 8d 08 df STA $df08 
1638 : 8d 0a df STA $df0a 
163b : a9 91 __ LDA #$91
163d : 8d 01 df STA $df01 
1640 : ad ec 9f LDA $9fec ; (d + 0)
1643 : d0 52 __ BNE $1697 ; (reu_count_pages.s6 + 0)
.s5:
1645 : a2 47 __ LDX #$47
1647 : 8e ed 9f STX $9fed ; (c + 0)
164a : a2 ed __ LDX #$ed
164c : 8e 02 df STX $df02 
164f : a2 9f __ LDX #$9f
1651 : 8e 03 df STX $df03 
1654 : 8d 04 df STA $df04 
1657 : 8d 05 df STA $df05 
165a : 8d 06 df STA $df06 
165d : a2 01 __ LDX #$01
165f : 8e 07 df STX $df07 
1662 : 8d 08 df STA $df08 
1665 : 8d 0a df STA $df0a 
1668 : a2 90 __ LDX #$90
166a : 8e 01 df STX $df01 
166d : a2 ec __ LDX #$ec
166f : 8e 02 df STX $df02 
1672 : a2 9f __ LDX #$9f
1674 : 8e 03 df STX $df03 
1677 : 8d 04 df STA $df04 
167a : 8d 05 df STA $df05 
167d : 8d 06 df STA $df06 
1680 : a2 01 __ LDX #$01
1682 : 8e 07 df STX $df07 
1685 : 8d 08 df STA $df08 
1688 : 8d 0a df STA $df0a 
168b : a9 91 __ LDA #$91
168d : 8d 01 df STA $df01 
1690 : ad ec 9f LDA $9fec ; (d + 0)
1693 : c9 47 __ CMP #$47
1695 : f0 07 __ BEQ $169e ; (reu_count_pages.s7 + 0)
.s6:
1697 : a9 00 __ LDA #$00
1699 : 85 1b __ STA ACCU + 0 
.s3:
169b : 85 1c __ STA ACCU + 1 
169d : 60 __ __ RTS
.s7:
169e : ca __ __ DEX
169f : a0 01 __ LDY #$01
.l8:
16a1 : a9 47 __ LDA #$47
16a3 : 8d ed 9f STA $9fed ; (c + 0)
16a6 : a9 ed __ LDA #$ed
16a8 : 8d 02 df STA $df02 
16ab : a9 9f __ LDA #$9f
16ad : 8d 03 df STA $df03 
16b0 : a9 00 __ LDA #$00
16b2 : 8d 04 df STA $df04 
16b5 : 8d 05 df STA $df05 
16b8 : 8c 06 df STY $df06 
16bb : a9 01 __ LDA #$01
16bd : 8d 07 df STA $df07 
16c0 : a9 00 __ LDA #$00
16c2 : 8d 08 df STA $df08 
16c5 : 8d 0a df STA $df0a 
16c8 : a9 90 __ LDA #$90
16ca : 8d 01 df STA $df01 
16cd : a9 00 __ LDA #$00
16cf : 8d ed 9f STA $9fed ; (c + 0)
16d2 : a9 ed __ LDA #$ed
16d4 : 8d 02 df STA $df02 
16d7 : a9 9f __ LDA #$9f
16d9 : 8d 03 df STA $df03 
16dc : a9 00 __ LDA #$00
16de : 8d 04 df STA $df04 
16e1 : 8d 05 df STA $df05 
16e4 : 8d 06 df STA $df06 
16e7 : a9 01 __ LDA #$01
16e9 : 8d 07 df STA $df07 
16ec : a9 00 __ LDA #$00
16ee : 8d 08 df STA $df08 
16f1 : 8d 0a df STA $df0a 
16f4 : a9 90 __ LDA #$90
16f6 : 8d 01 df STA $df01 
16f9 : a9 ec __ LDA #$ec
16fb : 8d 02 df STA $df02 
16fe : a9 9f __ LDA #$9f
1700 : 8d 03 df STA $df03 
1703 : a9 00 __ LDA #$00
1705 : 8d 04 df STA $df04 
1708 : 8d 05 df STA $df05 
170b : 8c 06 df STY $df06 
170e : a9 01 __ LDA #$01
1710 : 8d 07 df STA $df07 
1713 : a9 00 __ LDA #$00
1715 : 8d 08 df STA $df08 
1718 : 8d 0a df STA $df0a 
171b : a9 91 __ LDA #$91
171d : 8d 01 df STA $df01 
1720 : ad ec 9f LDA $9fec ; (d + 0)
1723 : c9 47 __ CMP #$47
1725 : f0 06 __ BEQ $172d ; (reu_count_pages.s9 + 0)
.s11:
1727 : 84 1b __ STY ACCU + 0 
1729 : 8a __ __ TXA
172a : 4c 9b 16 JMP $169b ; (reu_count_pages.s3 + 0)
.s9:
172d : c8 __ __ INY
172e : d0 01 __ BNE $1731 ; (reu_count_pages.s13 + 0)
.s12:
1730 : e8 __ __ INX
.s13:
1731 : 98 __ __ TYA
1732 : f0 03 __ BEQ $1737 ; (reu_count_pages.s10 + 0)
1734 : 4c a1 16 JMP $16a1 ; (reu_count_pages.l8 + 0)
.s10:
1737 : 85 1b __ STA ACCU + 0 
1739 : a9 01 __ LDA #$01
173b : 4c 9b 16 JMP $169b ; (reu_count_pages.s3 + 0)
--------------------------------------------------------------------
173e : __ __ __ BYT 0a 72 65 75 20 44 45 54 45 43 54 45 44 2c 20 53 : .reu DETECTED, S
174e : __ __ __ BYT 49 5a 45 3a 20 25 44 20 6b 62 0a 00             : IZE: %D kb..
--------------------------------------------------------------------
175a : __ __ __ BYT 6e 4f 20 72 65 75 20 44 45 54 45 43 54 45 44 2e : nO reu DETECTED.
176a : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
176b : __ __ __ BYT 0a 72 45 41 44 49 4e 47 20 4f 4c 44 20 43 4f 4e : .rEADING OLD CON
177b : __ __ __ BYT 46 49 47 20 46 49 4c 45 2e 2e 2e 00             : FIG FILE....
--------------------------------------------------------------------
read_old_configfile: ; read_old_configfile()->void
; 180, "/home/xahmol/git/UBoot64-v2/src/uboot_upd12.c"
.s4:
1787 : a9 01 __ LDA #$01
1789 : 85 11 __ STA P4 
178b : 20 32 18 JSR $1832 ; (uii_open_file@proxy + 0)
178e : 20 e1 18 JSR $18e1 ; (strcmp@proxy + 0)
1791 : aa __ __ TAX
1792 : f0 10 __ BEQ $17a4 ; (read_old_configfile.s5 + 0)
.s8:
1794 : a9 24 __ LDA #$24
1796 : 8d fc 9f STA $9ffc ; (sstack + 14)
1799 : a9 19 __ LDA #$19
179b : 8d fd 9f STA $9ffd ; (sstack + 15)
179e : 20 b0 0e JSR $0eb0 ; (error.s4 + 0)
17a1 : 20 69 24 JSR $2469 ; (exit@proxy + 0)
.s5:
17a4 : a9 56 __ LDA #$56
17a6 : 85 11 __ STA P4 
17a8 : a9 00 __ LDA #$00
17aa : 85 12 __ STA P5 
17ac : 20 ea 0c JSR $0cea ; (uii_read_file.s4 + 0)
17af : a9 aa __ LDA #$aa
17b1 : 8d fe 9f STA $9ffe ; (sstack + 16)
17b4 : a9 19 __ LDA #$19
17b6 : 8d ff 9f STA $9fff ; (sstack + 17)
17b9 : 20 3b 19 JSR $193b ; (CheckStatus.s4 + 0)
17bc : 20 90 0d JSR $0d90 ; (uii_readdata.s4 + 0)
17bf : 20 82 0e JSR $0e82 ; (uii_accept.s4 + 0)
17c2 : ad c8 25 LDA $25c8 ; (uii_data[0] + 1)
17c5 : 8d 01 25 STA $2501 ; (cfg.timeon + 0)
17c8 : ad cb 25 LDA $25cb ; (uii_data[0] + 4)
17cb : 8d 54 25 STA $2554 ; (cfg.secondsfromutc + 1)
17ce : ad cc 25 LDA $25cc ; (uii_data[0] + 5)
17d1 : 8d 53 25 STA $2553 ; (cfg.secondsfromutc + 0)
17d4 : ad ca 25 LDA $25ca ; (uii_data[0] + 3)
17d7 : 8d 55 25 STA $2555 ; (cfg.secondsfromutc + 2)
17da : ad c9 25 LDA $25c9 ; (uii_data[0] + 2)
17dd : 8d 56 25 STA $2556 ; (cfg.secondsfromutc + 3)
17e0 : a2 00 __ LDX #$00
.l9:
17e2 : bd cd 25 LDA $25cd,x ; (uii_data[0] + 6)
17e5 : 9d 02 25 STA $2502,x ; (cfg.host[0] + 0)
17e8 : e8 __ __ INX
17e9 : e0 50 __ CPX #$50
17eb : d0 f5 __ BNE $17e2 ; (read_old_configfile.l9 + 0)
.s10:
17ed : a9 02 __ LDA #$02
17ef : 85 0d __ STA P0 
17f1 : a9 25 __ LDA #$25
17f3 : 85 0e __ STA P1 
17f5 : 20 93 0c JSR $0c93 ; (strlen.s4 + 0)
17f8 : a5 1b __ LDA ACCU + 0 
17fa : 05 1c __ ORA ACCU + 1 
17fc : d0 0b __ BNE $1809 ; (uii_close_file.s4 + 0)
.s6:
17fe : a2 ff __ LDX #$ff
.l7:
1800 : e8 __ __ INX
1801 : bd 47 0a LDA $0a47,x 
1804 : 9d 02 25 STA $2502,x ; (cfg.host[0] + 0)
1807 : d0 f7 __ BNE $1800 ; (read_old_configfile.l7 + 0)
--------------------------------------------------------------------
uii_close_file: ; uii_close_file()->void
;  32, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
1809 : a9 00 __ LDA #$00
180b : 85 10 __ STA P3 
180d : 8d ec 9f STA $9fec ; (cmd[0] + 0)
1810 : a9 02 __ LDA #$02
1812 : 85 0f __ STA P2 
1814 : a9 01 __ LDA #$01
1816 : 8d fe 1c STA $1cfe ; (uii_target + 0)
1819 : a9 03 __ LDA #$03
181b : 8d ed 9f STA $9fed ; (cmd[0] + 1)
181e : a9 ec __ LDA #$ec
1820 : 85 0d __ STA P0 
1822 : a9 9f __ LDA #$9f
1824 : 85 0e __ STA P1 
1826 : 20 15 0d JSR $0d15 ; (uii_sendcommand.s4 + 0)
1829 : 20 90 0d JSR $0d90 ; (uii_readdata.s4 + 0)
182c : 20 ce 0d JSR $0dce ; (uii_readstatus.s4 + 0)
182f : 4c 82 0e JMP $0e82 ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
uii_open_file@proxy: ; uii_open_file@proxy
1832 : a9 d7 __ LDA #$d7
1834 : 85 12 __ STA P5 
1836 : a9 24 __ LDA #$24
1838 : 85 13 __ STA P6 
--------------------------------------------------------------------
uii_open_file: ; uii_open_file(u8,u8*)->void
;  31, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
183a : a5 12 __ LDA P5 ; (filename + 0)
183c : 85 0d __ STA P0 
183e : 20 7f 24 JSR $247f ; (strlen@proxy + 0)
1841 : 18 __ __ CLC
1842 : a5 1b __ LDA ACCU + 0 
1844 : 69 03 __ ADC #$03
1846 : 85 1b __ STA ACCU + 0 
1848 : 90 02 __ BCC $184c ; (uii_open_file.s11 + 0)
.s10:
184a : e6 1c __ INC ACCU + 1 
.s11:
184c : 20 58 22 JSR $2258 ; (crt_malloc + 0)
184f : a5 1c __ LDA ACCU + 1 
1851 : 05 1b __ ORA ACCU + 0 
1853 : d0 01 __ BNE $1856 ; (uii_open_file.s5 + 0)
.s3:
1855 : 60 __ __ RTS
.s5:
1856 : a5 1c __ LDA ACCU + 1 
1858 : 85 46 __ STA T2 + 1 
185a : a5 1b __ LDA ACCU + 0 
185c : 85 45 __ STA T2 + 0 
185e : a9 00 __ LDA #$00
1860 : a8 __ __ TAY
1861 : 91 1b __ STA (ACCU + 0),y 
1863 : a9 02 __ LDA #$02
1865 : c8 __ __ INY
1866 : 91 1b __ STA (ACCU + 0),y 
1868 : a5 11 __ LDA P4 ; (attrib + 0)
186a : c8 __ __ INY
186b : 91 1b __ STA (ACCU + 0),y 
186d : a9 00 __ LDA #$00
186f : 85 47 __ STA T3 + 0 
1871 : 85 48 __ STA T3 + 1 
.l12:
1873 : 20 7f 24 JSR $247f ; (strlen@proxy + 0)
1876 : a5 48 __ LDA T3 + 1 
1878 : c5 1c __ CMP ACCU + 1 
187a : d0 5f __ BNE $18db ; (uii_open_file.s9 + 0)
.s8:
187c : a5 47 __ LDA T3 + 0 
187e : c5 1b __ CMP ACCU + 0 
1880 : 90 30 __ BCC $18b2 ; (uii_open_file.s7 + 0)
.s6:
1882 : a5 13 __ LDA P6 ; (filename + 1)
1884 : 85 0e __ STA P1 
1886 : a9 01 __ LDA #$01
1888 : 8d fe 1c STA $1cfe ; (uii_target + 0)
188b : 20 93 0c JSR $0c93 ; (strlen.s4 + 0)
188e : a5 45 __ LDA T2 + 0 
1890 : 85 0d __ STA P0 
1892 : a5 46 __ LDA T2 + 1 
1894 : 85 0e __ STA P1 
1896 : 18 __ __ CLC
1897 : a5 1b __ LDA ACCU + 0 
1899 : 69 03 __ ADC #$03
189b : 85 0f __ STA P2 
189d : a5 1c __ LDA ACCU + 1 
189f : 69 00 __ ADC #$00
18a1 : 85 10 __ STA P3 
18a3 : 20 15 0d JSR $0d15 ; (uii_sendcommand.s4 + 0)
18a6 : 20 50 23 JSR $2350 ; (crt_free@proxy + 0)
18a9 : 20 90 0d JSR $0d90 ; (uii_readdata.s4 + 0)
18ac : 20 ce 0d JSR $0dce ; (uii_readstatus.s4 + 0)
18af : 4c 82 0e JMP $0e82 ; (uii_accept.s4 + 0)
.s7:
18b2 : 85 43 __ STA T0 + 0 
18b4 : 18 __ __ CLC
18b5 : a5 13 __ LDA P6 ; (filename + 1)
18b7 : 65 48 __ ADC T3 + 1 
18b9 : 85 44 __ STA T0 + 1 
18bb : a4 12 __ LDY P5 ; (filename + 0)
18bd : b1 43 __ LDA (T0 + 0),y 
18bf : aa __ __ TAX
18c0 : 18 __ __ CLC
18c1 : a5 45 __ LDA T2 + 0 
18c3 : 65 47 __ ADC T3 + 0 
18c5 : 85 43 __ STA T0 + 0 
18c7 : a5 46 __ LDA T2 + 1 
18c9 : 65 48 __ ADC T3 + 1 
18cb : 85 44 __ STA T0 + 1 
18cd : 8a __ __ TXA
18ce : a0 03 __ LDY #$03
18d0 : 91 43 __ STA (T0 + 0),y 
18d2 : e6 47 __ INC T3 + 0 
18d4 : d0 9d __ BNE $1873 ; (uii_open_file.l12 + 0)
.s13:
18d6 : e6 48 __ INC T3 + 1 
18d8 : 4c 73 18 JMP $1873 ; (uii_open_file.l12 + 0)
.s9:
18db : b0 a5 __ BCS $1882 ; (uii_open_file.s6 + 0)
.s14:
18dd : a5 47 __ LDA T3 + 0 
18df : 90 d1 __ BCC $18b2 ; (uii_open_file.s7 + 0)
--------------------------------------------------------------------
strcmp@proxy: ; strcmp@proxy
18e1 : a9 c8 __ LDA #$c8
18e3 : 85 0d __ STA P0 
18e5 : a9 27 __ LDA #$27
18e7 : 85 0e __ STA P1 
18e9 : a9 1e __ LDA #$1e
18eb : 85 0f __ STA P2 
18ed : a9 19 __ LDA #$19
18ef : 85 10 __ STA P3 
--------------------------------------------------------------------
strcmp: ; strcmp(const u8*,const u8*)->i8
;   8, "/home/xahmol/oscar64/include/string.h"
.s4:
18f1 : a0 00 __ LDY #$00
18f3 : b1 0d __ LDA (P0),y 
18f5 : f0 16 __ BEQ $190d ; (strcmp.s4 + 28)
18f7 : d1 0f __ CMP (P2),y 
18f9 : d0 16 __ BNE $1911 ; (strcmp.s4 + 32)
18fb : c8 __ __ INY
18fc : b1 0d __ LDA (P0),y 
18fe : f0 0d __ BEQ $190d ; (strcmp.s4 + 28)
1900 : d1 0f __ CMP (P2),y 
1902 : d0 0d __ BNE $1911 ; (strcmp.s4 + 32)
1904 : c8 __ __ INY
1905 : d0 ec __ BNE $18f3 ; (strcmp.s4 + 2)
1907 : e6 0e __ INC P1 
1909 : e6 10 __ INC P3 
190b : d0 e6 __ BNE $18f3 ; (strcmp.s4 + 2)
190d : d1 0f __ CMP (P2),y 
190f : f0 08 __ BEQ $1919 ; (strcmp.s4 + 40)
1911 : b0 04 __ BCS $1917 ; (strcmp.s4 + 38)
1913 : a9 ff __ LDA #$ff
1915 : 30 02 __ BMI $1919 ; (strcmp.s4 + 40)
1917 : a9 01 __ LDA #$01
1919 : 85 1b __ STA ACCU + 0 
.s3:
191b : a5 1b __ LDA ACCU + 0 
191d : 60 __ __ RTS
--------------------------------------------------------------------
191e : __ __ __ BYT 30 30 2c 4f 4b 00                               : 00,OK.
--------------------------------------------------------------------
1924 : __ __ __ BYT 0a 6e 4f 20 43 4f 4e 46 49 47 20 46 49 4c 45 20 : .nO CONFIG FILE 
1934 : __ __ __ BYT 46 4f 55 4e 44 2e 00                            : FOUND..
--------------------------------------------------------------------
CheckStatus: ; CheckStatus(const u8*)->void
; 121, "/home/xahmol/git/UBoot64-v2/src/uboot_upd12.c"
.s4:
193b : ad c8 27 LDA $27c8 ; (uii_status[0] + 0)
193e : c9 30 __ CMP #$30
1940 : d0 07 __ BNE $1949 ; (CheckStatus.s6 + 0)
.s5:
1942 : ad c9 27 LDA $27c9 ; (uii_status[0] + 1)
1945 : c9 30 __ CMP #$30
1947 : f0 40 __ BEQ $1989 ; (CheckStatus.s3 + 0)
.s6:
1949 : a9 8a __ LDA #$8a
194b : 8d f2 9f STA $9ff2 ; (sstack + 4)
194e : a9 19 __ LDA #$19
1950 : 8d f3 9f STA $9ff3 ; (sstack + 5)
1953 : ad fe 9f LDA $9ffe ; (sstack + 16)
1956 : 8d f4 9f STA $9ff4 ; (sstack + 6)
1959 : ad ff 9f LDA $9fff ; (sstack + 17)
195c : 8d f5 9f STA $9ff5 ; (sstack + 7)
195f : 20 e9 0e JSR $0ee9 ; (cwin_console_printf.s4 + 0)
1962 : a9 c8 __ LDA #$c8
1964 : 8d f4 9f STA $9ff4 ; (sstack + 6)
1967 : a9 27 __ LDA #$27
1969 : 8d f5 9f STA $9ff5 ; (sstack + 7)
196c : a9 9d __ LDA #$9d
196e : 8d f2 9f STA $9ff2 ; (sstack + 4)
1971 : a9 19 __ LDA #$19
1973 : 8d f3 9f STA $9ff3 ; (sstack + 5)
1976 : 20 e9 0e JSR $0ee9 ; (cwin_console_printf.s4 + 0)
1979 : 20 a7 0e JSR $0ea7 ; (uii_abort.s4 + 0)
197c : a9 fe __ LDA #$fe
197e : 8d fc 9f STA $9ffc ; (sstack + 14)
1981 : a9 14 __ LDA #$14
1983 : 8d fd 9f STA $9ffd ; (sstack + 15)
1986 : 4c b0 0e JMP $0eb0 ; (error.s4 + 0)
.s3:
1989 : 60 __ __ RTS
--------------------------------------------------------------------
198a : __ __ __ BYT 0a 69 2f 6f 20 45 52 52 4f 52 20 49 4e 20 25 53 : .i/o ERROR IN %S
199a : __ __ __ BYT 2e 0a 00                                        : ...
--------------------------------------------------------------------
199d : __ __ __ BYT 0a 73 54 41 54 55 53 3a 20 25 53 0a 00          : .sTATUS: %S..
--------------------------------------------------------------------
19aa : __ __ __ BYT 52 45 41 44 49 4e 47 20 43 4f 4e 46 49 47 00    : READING CONFIG.
--------------------------------------------------------------------
19b9 : __ __ __ BYT 0a 77 52 49 54 49 4e 47 20 4e 45 57 20 43 4f 4e : .wRITING NEW CON
19c9 : __ __ __ BYT 46 49 47 20 46 49 4c 45 2e 2e 2e 00             : FIG FILE....
--------------------------------------------------------------------
writeconfigfile: ; writeconfigfile()->void
; 169, "/home/xahmol/git/UBoot64-v2/src/uboot_upd12.c"
.s4:
19d5 : a9 d7 __ LDA #$d7
19d7 : 85 11 __ STA P4 
19d9 : a9 24 __ LDA #$24
19db : 85 12 __ STA P5 
19dd : 20 0a 1a JSR $1a0a ; (uii_delete_file.s4 + 0)
19e0 : a9 06 __ LDA #$06
19e2 : 85 11 __ STA P4 
19e4 : 20 32 18 JSR $1832 ; (uii_open_file@proxy + 0)
19e7 : a9 63 __ LDA #$63
19e9 : 85 13 __ STA P6 
19eb : a9 25 __ LDA #$25
19ed : 85 12 __ STA P5 
19ef : a9 00 __ LDA #$00
19f1 : 85 14 __ STA P7 
19f3 : a9 00 __ LDA #$00
19f5 : 85 11 __ STA P4 
19f7 : 20 a9 1a JSR $1aa9 ; (uii_write_file.s4 + 0)
19fa : a9 2e __ LDA #$2e
19fc : 8d fe 9f STA $9ffe ; (sstack + 16)
19ff : a9 1b __ LDA #$1b
1a01 : 8d ff 9f STA $9fff ; (sstack + 17)
1a04 : 20 3b 19 JSR $193b ; (CheckStatus.s4 + 0)
1a07 : 4c 09 18 JMP $1809 ; (uii_close_file.s4 + 0)
--------------------------------------------------------------------
uii_delete_file: ; uii_delete_file(u8*)->void
;  38, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
1a0a : 20 8b 0c JSR $0c8b ; (strlen@proxy + 0)
1a0d : 18 __ __ CLC
1a0e : a5 1b __ LDA ACCU + 0 
1a10 : 69 02 __ ADC #$02
1a12 : 85 1b __ STA ACCU + 0 
1a14 : 90 02 __ BCC $1a18 ; (uii_delete_file.s11 + 0)
.s10:
1a16 : e6 1c __ INC ACCU + 1 
.s11:
1a18 : 20 58 22 JSR $2258 ; (crt_malloc + 0)
1a1b : a5 1c __ LDA ACCU + 1 
1a1d : 05 1b __ ORA ACCU + 0 
1a1f : d0 01 __ BNE $1a22 ; (uii_delete_file.s5 + 0)
.s3:
1a21 : 60 __ __ RTS
.s5:
1a22 : a5 1c __ LDA ACCU + 1 
1a24 : 85 46 __ STA T2 + 1 
1a26 : a5 1b __ LDA ACCU + 0 
1a28 : 85 45 __ STA T2 + 0 
1a2a : a9 00 __ LDA #$00
1a2c : a8 __ __ TAY
1a2d : 91 1b __ STA (ACCU + 0),y 
1a2f : a9 09 __ LDA #$09
1a31 : c8 __ __ INY
1a32 : 91 1b __ STA (ACCU + 0),y 
1a34 : a9 00 __ LDA #$00
1a36 : 85 47 __ STA T3 + 0 
1a38 : 85 48 __ STA T3 + 1 
.l12:
1a3a : a5 12 __ LDA P5 ; (filename + 1)
1a3c : 85 0e __ STA P1 
1a3e : 20 93 0c JSR $0c93 ; (strlen.s4 + 0)
1a41 : a5 48 __ LDA T3 + 1 
1a43 : c5 1c __ CMP ACCU + 1 
1a45 : d0 5c __ BNE $1aa3 ; (uii_delete_file.s9 + 0)
.s8:
1a47 : a5 47 __ LDA T3 + 0 
1a49 : c5 1b __ CMP ACCU + 0 
1a4b : 90 2d __ BCC $1a7a ; (uii_delete_file.s7 + 0)
.s6:
1a4d : a5 12 __ LDA P5 ; (filename + 1)
1a4f : 85 0e __ STA P1 
1a51 : a9 01 __ LDA #$01
1a53 : 8d fe 1c STA $1cfe ; (uii_target + 0)
1a56 : 20 93 0c JSR $0c93 ; (strlen.s4 + 0)
1a59 : a5 45 __ LDA T2 + 0 
1a5b : 85 0d __ STA P0 
1a5d : a5 46 __ LDA T2 + 1 
1a5f : 85 0e __ STA P1 
1a61 : 18 __ __ CLC
1a62 : a5 1b __ LDA ACCU + 0 
1a64 : 69 02 __ ADC #$02
1a66 : 85 0f __ STA P2 
1a68 : a5 1c __ LDA ACCU + 1 
1a6a : 69 00 __ ADC #$00
1a6c : 85 10 __ STA P3 
1a6e : 20 15 0d JSR $0d15 ; (uii_sendcommand.s4 + 0)
1a71 : 20 50 23 JSR $2350 ; (crt_free@proxy + 0)
1a74 : 20 ce 0d JSR $0dce ; (uii_readstatus.s4 + 0)
1a77 : 4c 82 0e JMP $0e82 ; (uii_accept.s4 + 0)
.s7:
1a7a : 85 43 __ STA T0 + 0 
1a7c : 18 __ __ CLC
1a7d : a5 12 __ LDA P5 ; (filename + 1)
1a7f : 65 48 __ ADC T3 + 1 
1a81 : 85 44 __ STA T0 + 1 
1a83 : a4 11 __ LDY P4 ; (filename + 0)
1a85 : b1 43 __ LDA (T0 + 0),y 
1a87 : aa __ __ TAX
1a88 : 18 __ __ CLC
1a89 : a5 45 __ LDA T2 + 0 
1a8b : 65 47 __ ADC T3 + 0 
1a8d : 85 43 __ STA T0 + 0 
1a8f : a5 46 __ LDA T2 + 1 
1a91 : 65 48 __ ADC T3 + 1 
1a93 : 85 44 __ STA T0 + 1 
1a95 : 8a __ __ TXA
1a96 : a0 02 __ LDY #$02
1a98 : 91 43 __ STA (T0 + 0),y 
1a9a : e6 47 __ INC T3 + 0 
1a9c : d0 9c __ BNE $1a3a ; (uii_delete_file.l12 + 0)
.s13:
1a9e : e6 48 __ INC T3 + 1 
1aa0 : 4c 3a 1a JMP $1a3a ; (uii_delete_file.l12 + 0)
.s9:
1aa3 : b0 a8 __ BCS $1a4d ; (uii_delete_file.s6 + 0)
.s14:
1aa5 : a5 47 __ LDA T3 + 0 
1aa7 : 90 d1 __ BCC $1a7a ; (uii_delete_file.s7 + 0)
--------------------------------------------------------------------
uii_write_file: ; uii_write_file(u8*,u16)->void
;  33, "/home/xahmol/git/UBoot64-v2/include/ultimate_dos_lib.h"
.s4:
1aa9 : 18 __ __ CLC
1aaa : a5 13 __ LDA P6 ; (length + 0)
1aac : 69 04 __ ADC #$04
1aae : 85 45 __ STA T1 + 0 
1ab0 : 85 1b __ STA ACCU + 0 
1ab2 : a5 14 __ LDA P7 ; (length + 1)
1ab4 : 69 00 __ ADC #$00
1ab6 : 85 46 __ STA T1 + 1 
1ab8 : 85 1c __ STA ACCU + 1 
1aba : 20 58 22 JSR $2258 ; (crt_malloc + 0)
1abd : a5 1c __ LDA ACCU + 1 
1abf : 05 1b __ ORA ACCU + 0 
1ac1 : d0 01 __ BNE $1ac4 ; (uii_write_file.s5 + 0)
.s3:
1ac3 : 60 __ __ RTS
.s5:
1ac4 : a9 00 __ LDA #$00
1ac6 : a8 __ __ TAY
1ac7 : 91 1b __ STA (ACCU + 0),y 
1ac9 : a9 05 __ LDA #$05
1acb : c8 __ __ INY
1acc : 91 1b __ STA (ACCU + 0),y 
1ace : a9 00 __ LDA #$00
1ad0 : c8 __ __ INY
1ad1 : 91 1b __ STA (ACCU + 0),y 
1ad3 : c8 __ __ INY
1ad4 : 91 1b __ STA (ACCU + 0),y 
1ad6 : a5 13 __ LDA P6 ; (length + 0)
1ad8 : 05 14 __ ORA P7 ; (length + 1)
1ada : f0 2e __ BEQ $1b0a ; (uii_write_file.s6 + 0)
.s7:
1adc : a5 13 __ LDA P6 ; (length + 0)
1ade : 85 43 __ STA T0 + 0 
1ae0 : a5 1b __ LDA ACCU + 0 
1ae2 : 85 47 __ STA T2 + 0 
1ae4 : a5 1c __ LDA ACCU + 1 
1ae6 : 85 48 __ STA T2 + 1 
1ae8 : a6 14 __ LDX P7 ; (length + 1)
.l8:
1aea : a0 00 __ LDY #$00
1aec : b1 11 __ LDA (P4),y ; (data + 0)
1aee : a0 04 __ LDY #$04
1af0 : 91 47 __ STA (T2 + 0),y 
1af2 : e6 47 __ INC T2 + 0 
1af4 : d0 02 __ BNE $1af8 ; (uii_write_file.s13 + 0)
.s12:
1af6 : e6 48 __ INC T2 + 1 
.s13:
1af8 : e6 11 __ INC P4 ; (data + 0)
1afa : d0 02 __ BNE $1afe ; (uii_write_file.s15 + 0)
.s14:
1afc : e6 12 __ INC P5 ; (data + 1)
.s15:
1afe : a5 43 __ LDA T0 + 0 
1b00 : d0 01 __ BNE $1b03 ; (uii_write_file.s10 + 0)
.s9:
1b02 : ca __ __ DEX
.s10:
1b03 : c6 43 __ DEC T0 + 0 
1b05 : d0 e3 __ BNE $1aea ; (uii_write_file.l8 + 0)
.s11:
1b07 : 8a __ __ TXA
1b08 : d0 e0 __ BNE $1aea ; (uii_write_file.l8 + 0)
.s6:
1b0a : a5 1b __ LDA ACCU + 0 
1b0c : 85 0d __ STA P0 
1b0e : a5 1c __ LDA ACCU + 1 
1b10 : 85 0e __ STA P1 
1b12 : a5 45 __ LDA T1 + 0 
1b14 : 85 0f __ STA P2 
1b16 : a5 46 __ LDA T1 + 1 
1b18 : 85 10 __ STA P3 
1b1a : a9 01 __ LDA #$01
1b1c : 8d fe 1c STA $1cfe ; (uii_target + 0)
1b1f : 20 15 0d JSR $0d15 ; (uii_sendcommand.s4 + 0)
1b22 : 20 50 23 JSR $2350 ; (crt_free@proxy + 0)
1b25 : 20 90 0d JSR $0d90 ; (uii_readdata.s4 + 0)
1b28 : 20 ce 0d JSR $0dce ; (uii_readstatus.s4 + 0)
1b2b : 4c 82 0e JMP $0e82 ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
1b2e : __ __ __ BYT 57 52 49 54 49 4e 47 20 43 4f 4e 46 49 47 00    : WRITING CONFIG.
--------------------------------------------------------------------
1b3d : __ __ __ BYT 0a 72 45 41 44 49 4e 47 20 4f 4c 44 20 53 4c 4f : .rEADING OLD SLO
1b4d : __ __ __ BYT 54 53 20 46 49 4c 45 2e 2e 2e 00                : TS FILE....
--------------------------------------------------------------------
read_old_slotsfile: ; read_old_slotsfile()->void
; 218, "/home/xahmol/git/UBoot64-v2/src/uboot_upd12.c"
.s1:
1b58 : a5 53 __ LDA T3 + 0 
1b5a : 8d 08 9f STA $9f08 ; (read_old_slotsfile@stack + 0)
1b5d : a5 54 __ LDA T3 + 1 
1b5f : 8d 09 9f STA $9f09 ; (read_old_slotsfile@stack + 1)
.s4:
1b62 : 20 fe 0d JSR $0dfe ; (uii_change_dir.s4 + 0)
1b65 : a9 01 __ LDA #$01
1b67 : 85 11 __ STA P4 
1b69 : 20 74 24 JSR $2474 ; (uii_open_file@proxy + 0)
1b6c : 20 e1 18 JSR $18e1 ; (strcmp@proxy + 0)
1b6f : a2 a0 __ LDX #$a0
1b71 : 86 4c __ STX T1 + 0 
1b73 : a2 5f __ LDX #$5f
1b75 : 86 4d __ STX T1 + 1 
1b77 : a2 00 __ LDX #$00
1b79 : 86 4e __ STX T1 + 2 
1b7b : 86 4f __ STX T1 + 3 
1b7d : aa __ __ TAX
1b7e : f0 10 __ BEQ $1b90 ; (read_old_slotsfile.s5 + 0)
.s15:
1b80 : a9 99 __ LDA #$99
1b82 : 8d fc 9f STA $9ffc ; (sstack + 14)
1b85 : a9 1c __ LDA #$1c
1b87 : 8d fd 9f STA $9ffd ; (sstack + 15)
1b8a : 20 b0 0e JSR $0eb0 ; (error.s4 + 0)
1b8d : 20 69 24 JSR $2469 ; (exit@proxy + 0)
.s5:
1b90 : a9 00 __ LDA #$00
1b92 : 8d f6 9f STA $9ff6 ; (sstack + 8)
1b95 : 8d f7 9f STA $9ff7 ; (sstack + 9)
1b98 : 8d fa 9f STA $9ffa ; (sstack + 12)
1b9b : 8d fb 9f STA $9ffb ; (sstack + 13)
1b9e : a9 a0 __ LDA #$a0
1ba0 : 8d f4 9f STA $9ff4 ; (sstack + 6)
1ba3 : a9 5f __ LDA #$5f
1ba5 : 8d f5 9f STA $9ff5 ; (sstack + 7)
1ba8 : ae f2 24 LDX $24f2 ; (cw.cy + 0)
1bab : e8 __ __ INX
1bac : 86 50 __ STX T2 + 0 
1bae : a9 f0 __ LDA #$f0
1bb0 : 8d f8 9f STA $9ff8 ; (sstack + 10)
1bb3 : a9 81 __ LDA #$81
1bb5 : 8d f9 9f STA $9ff9 ; (sstack + 11)
1bb8 : a9 af __ LDA #$af
1bba : 8d f2 9f STA $9ff2 ; (sstack + 4)
1bbd : a9 1c __ LDA #$1c
1bbf : 8d f3 9f STA $9ff3 ; (sstack + 5)
1bc2 : 20 e9 0e JSR $0ee9 ; (cwin_console_printf.s4 + 0)
.l11:
1bc5 : a5 4e __ LDA T1 + 2 
1bc7 : 38 __ __ SEC
1bc8 : d0 0a __ BNE $1bd4 ; (read_old_slotsfile.s14 + 0)
.s12:
1bca : a5 4d __ LDA T1 + 1 
1bcc : c9 81 __ CMP #$81
1bce : d0 04 __ BNE $1bd4 ; (read_old_slotsfile.s14 + 0)
.s13:
1bd0 : a5 4c __ LDA T1 + 0 
1bd2 : c9 f0 __ CMP #$f0
.s14:
1bd4 : 90 03 __ BCC $1bd9 ; (read_old_slotsfile.l8 + 0)
1bd6 : 4c 88 1c JMP $1c88 ; (read_old_slotsfile.s7 + 0)
.l8:
1bd9 : a9 50 __ LDA #$50
1bdb : 85 11 __ STA P4 
1bdd : a9 22 __ LDA #$22
1bdf : 85 12 __ STA P5 
1be1 : 20 ea 0c JSR $0cea ; (uii_read_file.s4 + 0)
1be4 : 2c 1c df BIT $df1c 
1be7 : 30 0c __ BMI $1bf5 ; (read_old_slotsfile.l10 + 0)
.s9:
1be9 : ad 1c df LDA $df1c 
1bec : 29 30 __ AND #$30
1bee : c9 30 __ CMP #$30
1bf0 : f0 03 __ BEQ $1bf5 ; (read_old_slotsfile.l10 + 0)
1bf2 : 4c 7c 1c JMP $1c7c ; (read_old_slotsfile.s6 + 0)
.l10:
1bf5 : 20 90 0d JSR $0d90 ; (uii_readdata.s4 + 0)
1bf8 : a5 1b __ LDA ACCU + 0 
1bfa : 85 53 __ STA T3 + 0 
1bfc : a5 1c __ LDA ACCU + 1 
1bfe : 85 54 __ STA T3 + 1 
1c00 : 20 82 0e JSR $0e82 ; (uii_accept.s4 + 0)
1c03 : a9 c3 __ LDA #$c3
1c05 : 8d fe 9f STA $9ffe ; (sstack + 16)
1c08 : a9 1c __ LDA #$1c
1c0a : 8d ff 9f STA $9fff ; (sstack + 17)
1c0d : 20 3b 19 JSR $193b ; (CheckStatus.s4 + 0)
1c10 : a5 50 __ LDA T2 + 0 
1c12 : 8d f2 24 STA $24f2 ; (cw.cy + 0)
1c15 : a9 c7 __ LDA #$c7
1c17 : 8d 02 df STA $df02 
1c1a : a9 25 __ LDA #$25
1c1c : 8d 03 df STA $df03 
1c1f : a5 4c __ LDA T1 + 0 
1c21 : 8d 04 df STA $df04 
1c24 : a5 4d __ LDA T1 + 1 
1c26 : 8d 05 df STA $df05 
1c29 : a5 53 __ LDA T3 + 0 
1c2b : 8d 07 df STA $df07 
1c2e : 18 __ __ CLC
1c2f : 65 4c __ ADC T1 + 0 
1c31 : 85 4c __ STA T1 + 0 
1c33 : 8d f4 9f STA $9ff4 ; (sstack + 6)
1c36 : a5 54 __ LDA T3 + 1 
1c38 : 8d 08 df STA $df08 
1c3b : 65 4d __ ADC T1 + 1 
1c3d : 85 4d __ STA T1 + 1 
1c3f : 8d f5 9f STA $9ff5 ; (sstack + 7)
1c42 : a5 4e __ LDA T1 + 2 
1c44 : 8d 06 df STA $df06 
1c47 : 69 00 __ ADC #$00
1c49 : 85 4e __ STA T1 + 2 
1c4b : 8d f6 9f STA $9ff6 ; (sstack + 8)
1c4e : a5 4f __ LDA T1 + 3 
1c50 : 69 00 __ ADC #$00
1c52 : 85 4f __ STA T1 + 3 
1c54 : 8d f7 9f STA $9ff7 ; (sstack + 9)
1c57 : a9 00 __ LDA #$00
1c59 : 8d f1 24 STA $24f1 ; (cw.cx + 0)
1c5c : 8d 0a df STA $df0a 
1c5f : a9 90 __ LDA #$90
1c61 : 8d 01 df STA $df01 
1c64 : a9 d1 __ LDA #$d1
1c66 : 8d f2 9f STA $9ff2 ; (sstack + 4)
1c69 : a9 1c __ LDA #$1c
1c6b : 8d f3 9f STA $9ff3 ; (sstack + 5)
1c6e : 20 e9 0e JSR $0ee9 ; (cwin_console_printf.s4 + 0)
1c71 : 2c 1c df BIT $df1c 
1c74 : 10 03 __ BPL $1c79 ; (read_old_slotsfile.l10 + 132)
1c76 : 4c f5 1b JMP $1bf5 ; (read_old_slotsfile.l10 + 0)
1c79 : 4c e9 1b JMP $1be9 ; (read_old_slotsfile.s9 + 0)
.s6:
1c7c : a5 4f __ LDA T1 + 3 
1c7e : d0 03 __ BNE $1c83 ; (read_old_slotsfile.s16 + 0)
1c80 : 4c c5 1b JMP $1bc5 ; (read_old_slotsfile.l11 + 0)
.s16:
1c83 : 10 03 __ BPL $1c88 ; (read_old_slotsfile.s7 + 0)
1c85 : 4c d9 1b JMP $1bd9 ; (read_old_slotsfile.l8 + 0)
.s7:
1c88 : 20 09 18 JSR $1809 ; (uii_close_file.s4 + 0)
1c8b : 20 cd 15 JSR $15cd ; (cwin_cursor_newline.s4 + 0)
.s3:
1c8e : ad 08 9f LDA $9f08 ; (read_old_slotsfile@stack + 0)
1c91 : 85 53 __ STA T3 + 0 
1c93 : ad 09 9f LDA $9f09 ; (read_old_slotsfile@stack + 1)
1c96 : 85 54 __ STA T3 + 1 
1c98 : 60 __ __ RTS
--------------------------------------------------------------------
1c99 : __ __ __ BYT 0a 6e 4f 20 53 4c 4f 54 53 20 46 49 4c 45 20 46 : .nO SLOTS FILE F
1ca9 : __ __ __ BYT 4f 55 4e 44 2e 00                               : OUND..
--------------------------------------------------------------------
1caf : __ __ __ BYT 0a 72 45 41 44 49 4e 47 20 25 4c 55 20 54 4f 20 : .rEADING %LU TO 
1cbf : __ __ __ BYT 25 4c 55 00                                     : %LU.
--------------------------------------------------------------------
1cc3 : __ __ __ BYT 52 45 41 44 49 4e 47 20 53 4c 4f 54 53 00       : READING SLOTS.
--------------------------------------------------------------------
1cd1 : __ __ __ BYT 72 45 41 44 49 4e 47 20 53 4c 4f 54 20 44 41 54 : rEADING SLOT DAT
1ce1 : __ __ __ BYT 41 20 54 4f 20 25 4c 55 2e 00                   : A TO %LU..
--------------------------------------------------------------------
1ceb : __ __ __ BYT 63 4f 4e 56 45 52 54 49 4e 47 20 53 4c 4f 54 20 : cONVERTING SLOT 
1cfb : __ __ __ BYT 25 55 00                                        : %U.
--------------------------------------------------------------------
uii_target:
1cfe : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
1d00 : __ __ __ BYT 0a 63 4f 4e 56 45 52 54 49 4e 47 20 53 4c 4f 54 : .cONVERTING SLOT
1d10 : __ __ __ BYT 20 44 41 54 41 2e 2e 2e 00                      :  DATA....
--------------------------------------------------------------------
convert_slot_data: ; convert_slot_data()->void
; 263, "/home/xahmol/git/UBoot64-v2/src/uboot_upd12.c"
.s4:
1d19 : ae f2 24 LDX $24f2 ; (cw.cy + 0)
1d1c : e8 __ __ INX
1d1d : 86 50 __ STX T6 + 0 
1d1f : a9 5f __ LDA #$5f
1d21 : 85 4f __ STA T1 + 1 
1d23 : a9 a0 __ LDA #$a0
1d25 : 85 4e __ STA T1 + 0 
1d27 : a9 00 __ LDA #$00
1d29 : 85 51 __ STA T7 + 0 
1d2b : 85 4c __ STA T0 + 0 
1d2d : 85 4d __ STA T0 + 1 
.l5:
1d2f : 8d f4 9f STA $9ff4 ; (sstack + 6)
1d32 : a9 00 __ LDA #$00
1d34 : 8d f5 9f STA $9ff5 ; (sstack + 7)
1d37 : 8d f1 24 STA $24f1 ; (cw.cx + 0)
1d3a : a5 50 __ LDA T6 + 0 
1d3c : 8d f2 24 STA $24f2 ; (cw.cy + 0)
1d3f : a9 eb __ LDA #$eb
1d41 : 8d f2 9f STA $9ff2 ; (sstack + 4)
1d44 : a9 1c __ LDA #$1c
1d46 : 8d f3 9f STA $9ff3 ; (sstack + 5)
1d49 : 20 e9 0e JSR $0ee9 ; (cwin_console_printf.s4 + 0)
1d4c : a9 00 __ LDA #$00
1d4e : 85 0f __ STA P2 
1d50 : 85 10 __ STA P3 
1d52 : a9 50 __ LDA #$50
1d54 : 85 11 __ STA P4 
1d56 : a9 05 __ LDA #$05
1d58 : 85 12 __ STA P5 
1d5a : a9 c9 __ LDA #$c9
1d5c : 8d 02 df STA $df02 
1d5f : a9 28 __ LDA #$28
1d61 : 8d 03 df STA $df03 
1d64 : a5 4e __ LDA T1 + 0 
1d66 : 8d 04 df STA $df04 
1d69 : a5 4f __ LDA T1 + 1 
1d6b : 8d 05 df STA $df05 
1d6e : a9 00 __ LDA #$00
1d70 : 8d 06 df STA $df06 
1d73 : a9 e8 __ LDA #$e8
1d75 : 8d 07 df STA $df07 
1d78 : a9 01 __ LDA #$01
1d7a : 8d 08 df STA $df08 
1d7d : a9 00 __ LDA #$00
1d7f : 8d 0a df STA $df0a 
1d82 : a9 91 __ LDA #$91
1d84 : 8d 01 df STA $df01 
1d87 : a9 b1 __ LDA #$b1
1d89 : 85 0d __ STA P0 
1d8b : a9 2a __ LDA #$2a
1d8d : 85 0e __ STA P1 
1d8f : 20 e0 1e JSR $1ee0 ; (memset.s4 + 0)
1d92 : a9 c9 __ LDA #$c9
1d94 : 85 0f __ STA P2 
1d96 : a9 02 __ LDA #$02
1d98 : 8d b1 2a STA $2ab1 ; (Slot.cfgvs + 0)
1d9b : a9 28 __ LDA #$28
1d9d : 85 10 __ STA P3 
1d9f : a9 b2 __ LDA #$b2
1da1 : 85 0d __ STA P0 
1da3 : a9 2a __ LDA #$2a
1da5 : 85 0e __ STA P1 
1da7 : 20 fc 1e JSR $1efc ; (strncpy@proxy + 0)
1daa : a9 b2 __ LDA #$b2
1dac : 85 0d __ STA P0 
1dae : a9 2b __ LDA #$2b
1db0 : 85 0e __ STA P1 
1db2 : a9 2d __ LDA #$2d
1db4 : 85 0f __ STA P2 
1db6 : a9 29 __ LDA #$29
1db8 : 85 10 __ STA P3 
1dba : a9 1e __ LDA #$1e
1dbc : 85 11 __ STA P4 
1dbe : 20 57 24 JSR $2457 ; (strncpy@proxy + 0)
1dc1 : a9 d1 __ LDA #$d1
1dc3 : 85 0d __ STA P0 
1dc5 : a9 2b __ LDA #$2b
1dc7 : 85 0e __ STA P1 
1dc9 : a9 42 __ LDA #$42
1dcb : 85 0f __ STA P2 
1dcd : a9 29 __ LDA #$29
1dcf : 85 10 __ STA P3 
1dd1 : 20 5e 24 JSR $245e ; (strncpy@proxy + 0)
1dd4 : a9 04 __ LDA #$04
1dd6 : 85 0d __ STA P0 
1dd8 : a9 2c __ LDA #$2c
1dda : 85 0e __ STA P1 
1ddc : a9 56 __ LDA #$56
1dde : 85 0f __ STA P2 
1de0 : a9 29 __ LDA #$29
1de2 : 85 10 __ STA P3 
1de4 : a9 50 __ LDA #$50
1de6 : 85 11 __ STA P4 
1de8 : 20 57 24 JSR $2457 ; (strncpy@proxy + 0)
1deb : a9 55 __ LDA #$55
1ded : 85 0d __ STA P0 
1def : a9 2c __ LDA #$2c
1df1 : 85 0e __ STA P1 
1df3 : a9 a6 __ LDA #$a6
1df5 : 85 0f __ STA P2 
1df7 : a9 29 __ LDA #$29
1df9 : 85 10 __ STA P3 
1dfb : 20 5e 24 JSR $245e ; (strncpy@proxy + 0)
1dfe : ad ba 29 LDA $29ba ; (OldSlot.reusize + 0)
1e01 : 8d 88 2d STA $2d88 ; (Slot.reusize + 0)
1e04 : a9 8c __ LDA #$8c
1e06 : 85 0d __ STA P0 
1e08 : a9 2d __ LDA #$2d
1e0a : 85 0e __ STA P1 
1e0c : a9 bf __ LDA #$bf
1e0e : 85 0f __ STA P2 
1e10 : a9 29 __ LDA #$29
1e12 : 85 10 __ STA P3 
1e14 : a9 ff __ LDA #$ff
1e16 : 85 11 __ STA P4 
1e18 : a9 00 __ LDA #$00
1e1a : 85 12 __ STA P5 
1e1c : ad bb 29 LDA $29bb ; (OldSlot.runboot + 0)
1e1f : 8d 89 2d STA $2d89 ; (Slot.runboot + 0)
1e22 : ad bc 29 LDA $29bc ; (OldSlot.device + 0)
1e25 : 8d 8a 2d STA $2d8a ; (Slot.device + 0)
1e28 : ad bd 29 LDA $29bd ; (OldSlot.command + 0)
1e2b : 8d 8b 2d STA $2d8b ; (Slot.command + 0)
1e2e : 20 04 1f JSR $1f04 ; (strncpy.s4 + 0)
1e31 : a9 8c __ LDA #$8c
1e33 : 85 0d __ STA P0 
1e35 : a9 2e __ LDA #$2e
1e37 : 85 0e __ STA P1 
1e39 : a9 23 __ LDA #$23
1e3b : 85 0f __ STA P2 
1e3d : a9 2a __ LDA #$2a
1e3f : 85 10 __ STA P3 
1e41 : 20 5e 24 JSR $245e ; (strncpy@proxy + 0)
1e44 : ad 37 2a LDA $2a37 ; (OldSlot.image_a_id + 0)
1e47 : 8d bf 2e STA $2ebf ; (Slot.image_a_id + 0)
1e4a : a9 c0 __ LDA #$c0
1e4c : 85 0d __ STA P0 
1e4e : a9 2e __ LDA #$2e
1e50 : 85 0e __ STA P1 
1e52 : a9 38 __ LDA #$38
1e54 : 85 0f __ STA P2 
1e56 : a9 2a __ LDA #$2a
1e58 : 85 10 __ STA P3 
1e5a : 20 fc 1e JSR $1efc ; (strncpy@proxy + 0)
1e5d : a9 c0 __ LDA #$c0
1e5f : 85 0d __ STA P0 
1e61 : a9 2f __ LDA #$2f
1e63 : 85 0e __ STA P1 
1e65 : a9 9c __ LDA #$9c
1e67 : 85 0f __ STA P2 
1e69 : a9 2a __ LDA #$2a
1e6b : 85 10 __ STA P3 
1e6d : 20 5e 24 JSR $245e ; (strncpy@proxy + 0)
1e70 : ad b0 2a LDA $2ab0 ; (OldSlot.image_b_id + 0)
1e73 : 8d f3 2f STA $2ff3 ; (Slot.image_b_id + 0)
1e76 : a9 f4 __ LDA #$f4
1e78 : 85 0d __ STA P0 
1e7a : a9 2f __ LDA #$2f
1e7c : 85 0e __ STA P1 
1e7e : a9 5d __ LDA #$5d
1e80 : 85 0f __ STA P2 
1e82 : a9 1f __ LDA #$1f
1e84 : 85 10 __ STA P3 
1e86 : a9 0d __ LDA #$0d
1e88 : 85 11 __ STA P4 
1e8a : 20 57 24 JSR $2457 ; (strncpy@proxy + 0)
1e8d : a9 b1 __ LDA #$b1
1e8f : 8d 02 df STA $df02 
1e92 : a9 2a __ LDA #$2a
1e94 : 8d 03 df STA $df03 
1e97 : a5 4c __ LDA T0 + 0 
1e99 : 8d 04 df STA $df04 
1e9c : a5 4d __ LDA T0 + 1 
1e9e : 8d 05 df STA $df05 
1ea1 : a9 00 __ LDA #$00
1ea3 : 8d 06 df STA $df06 
1ea6 : a9 50 __ LDA #$50
1ea8 : 8d 07 df STA $df07 
1eab : a9 05 __ LDA #$05
1ead : 8d 08 df STA $df08 
1eb0 : a9 00 __ LDA #$00
1eb2 : 8d 0a df STA $df0a 
1eb5 : a9 90 __ LDA #$90
1eb7 : 8d 01 df STA $df01 
1eba : 18 __ __ CLC
1ebb : a5 4c __ LDA T0 + 0 
1ebd : 69 50 __ ADC #$50
1ebf : 85 4c __ STA T0 + 0 
1ec1 : a5 4d __ LDA T0 + 1 
1ec3 : 69 05 __ ADC #$05
1ec5 : 85 4d __ STA T0 + 1 
1ec7 : 18 __ __ CLC
1ec8 : a5 4e __ LDA T1 + 0 
1eca : 69 e8 __ ADC #$e8
1ecc : 85 4e __ STA T1 + 0 
1ece : a5 4f __ LDA T1 + 1 
1ed0 : 69 01 __ ADC #$01
1ed2 : 85 4f __ STA T1 + 1 
1ed4 : e6 51 __ INC T7 + 0 
1ed6 : a5 51 __ LDA T7 + 0 
1ed8 : c9 12 __ CMP #$12
1eda : f0 03 __ BEQ $1edf ; (convert_slot_data.s3 + 0)
1edc : 4c 2f 1d JMP $1d2f ; (convert_slot_data.l5 + 0)
.s3:
1edf : 60 __ __ RTS
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
;  28, "/home/xahmol/oscar64/include/string.h"
.s4:
1ee0 : a5 0f __ LDA P2 
1ee2 : a6 12 __ LDX P5 
1ee4 : f0 0c __ BEQ $1ef2 ; (memset.s4 + 18)
1ee6 : a0 00 __ LDY #$00
1ee8 : 91 0d __ STA (P0),y 
1eea : c8 __ __ INY
1eeb : d0 fb __ BNE $1ee8 ; (memset.s4 + 8)
1eed : e6 0e __ INC P1 
1eef : ca __ __ DEX
1ef0 : d0 f6 __ BNE $1ee8 ; (memset.s4 + 8)
1ef2 : a4 11 __ LDY P4 
1ef4 : f0 05 __ BEQ $1efb ; (memset.s3 + 0)
1ef6 : 88 __ __ DEY
1ef7 : 91 0d __ STA (P0),y 
1ef9 : d0 fb __ BNE $1ef6 ; (memset.s4 + 22)
.s3:
1efb : 60 __ __ RTS
--------------------------------------------------------------------
strncpy@proxy: ; strncpy@proxy
1efc : a9 ff __ LDA #$ff
1efe : 85 11 __ STA P4 
1f00 : a9 00 __ LDA #$00
1f02 : 85 12 __ STA P5 
--------------------------------------------------------------------
strncpy: ; strncpy(u8*,const u8*,i16)->void
;   6, "/home/xahmol/oscar64/include/string.h"
.s4:
1f04 : a6 11 __ LDX P4 ; (n + 0)
.l5:
1f06 : 86 1b __ STX ACCU + 0 
1f08 : 8a __ __ TXA
1f09 : 18 __ __ CLC
1f0a : 69 ff __ ADC #$ff
1f0c : 85 1d __ STA ACCU + 2 
1f0e : aa __ __ TAX
1f0f : a5 12 __ LDA P5 ; (n + 1)
1f11 : 85 1c __ STA ACCU + 1 
1f13 : 69 ff __ ADC #$ff
1f15 : 85 12 __ STA P5 ; (n + 1)
1f17 : a5 1b __ LDA ACCU + 0 
1f19 : 05 1c __ ORA ACCU + 1 
1f1b : f0 15 __ BEQ $1f32 ; (strncpy.s6 + 0)
.s11:
1f1d : a0 00 __ LDY #$00
1f1f : b1 0f __ LDA (P2),y ; (src + 0)
1f21 : 91 0d __ STA (P0),y ; (dst + 0)
1f23 : e6 0f __ INC P2 ; (src + 0)
1f25 : d0 02 __ BNE $1f29 ; (strncpy.s14 + 0)
.s13:
1f27 : e6 10 __ INC P3 ; (src + 1)
.s14:
1f29 : e6 0d __ INC P0 ; (dst + 0)
1f2b : d0 02 __ BNE $1f2f ; (strncpy.s16 + 0)
.s15:
1f2d : e6 0e __ INC P1 ; (dst + 1)
.s16:
1f2f : a8 __ __ TAY
1f30 : d0 d4 __ BNE $1f06 ; (strncpy.l5 + 0)
.s6:
1f32 : a5 1c __ LDA ACCU + 1 
1f34 : 30 26 __ BMI $1f5c ; (strncpy.s3 + 0)
.s10:
1f36 : d0 06 __ BNE $1f3e ; (strncpy.s12 + 0)
.s9:
1f38 : a9 01 __ LDA #$01
1f3a : c5 1b __ CMP ACCU + 0 
1f3c : b0 1e __ BCS $1f5c ; (strncpy.s3 + 0)
.s12:
1f3e : a6 12 __ LDX P5 ; (n + 1)
.l7:
1f40 : a9 00 __ LDA #$00
1f42 : a8 __ __ TAY
1f43 : 91 0d __ STA (P0),y ; (dst + 0)
1f45 : e6 0d __ INC P0 ; (dst + 0)
1f47 : d0 02 __ BNE $1f4b ; (strncpy.s18 + 0)
.s17:
1f49 : e6 0e __ INC P1 ; (dst + 1)
.s18:
1f4b : 18 __ __ CLC
1f4c : a5 1d __ LDA ACCU + 2 
1f4e : 69 ff __ ADC #$ff
1f50 : 85 1d __ STA ACCU + 2 
1f52 : 8a __ __ TXA
1f53 : 69 ff __ ADC #$ff
1f55 : 30 05 __ BMI $1f5c ; (strncpy.s3 + 0)
.s8:
1f57 : aa __ __ TAX
1f58 : 05 1d __ ORA ACCU + 2 
1f5a : d0 e4 __ BNE $1f40 ; (strncpy.l7 + 0)
.s3:
1f5c : 60 __ __ RTS
--------------------------------------------------------------------
1f5d : __ __ __ BYT 55 42 4f 4f 54 36 34 20 58 20 4d 4f 4c 00       : UBOOT64 X MOL.
--------------------------------------------------------------------
1f6b : __ __ __ BYT 0a 77 52 49 54 49 4e 47 20 4e 45 57 20 53 4c 4f : .wRITING NEW SLO
1f7b : __ __ __ BYT 54 53 20 46 49 4c 45 2e 2e 2e 00                : TS FILE....
--------------------------------------------------------------------
write_slotsfile: ; write_slotsfile()->void
; 133, "/home/xahmol/git/UBoot64-v2/src/uboot_upd12.c"
.s4:
1f86 : ad f2 24 LDA $24f2 ; (cw.cy + 0)
1f89 : 85 52 __ STA T5 + 0 
1f8b : 20 fe 0d JSR $0dfe ; (uii_change_dir.s4 + 0)
1f8e : a9 e2 __ LDA #$e2
1f90 : 85 11 __ STA P4 
1f92 : a9 24 __ LDA #$24
1f94 : 85 12 __ STA P5 
1f96 : 20 0a 1a JSR $1a0a ; (uii_delete_file.s4 + 0)
1f99 : a9 06 __ LDA #$06
1f9b : 85 11 __ STA P4 
1f9d : 20 74 24 JSR $2474 ; (uii_open_file@proxy + 0)
1fa0 : a9 00 __ LDA #$00
1fa2 : 85 4c __ STA T1 + 0 
1fa4 : 85 4d __ STA T1 + 1 
1fa6 : 85 4e __ STA T1 + 2 
1fa8 : 85 4f __ STA T1 + 3 
1faa : a9 f4 __ LDA #$f4
1fac : 85 50 __ STA T2 + 0 
1fae : a9 01 __ LDA #$01
1fb0 : 85 51 __ STA T2 + 1 
.l5:
1fb2 : a9 84 __ LDA #$84
1fb4 : 8d f2 9f STA $9ff2 ; (sstack + 4)
1fb7 : a9 20 __ LDA #$20
1fb9 : 8d f3 9f STA $9ff3 ; (sstack + 5)
1fbc : a5 4c __ LDA T1 + 0 
1fbe : 8d f4 9f STA $9ff4 ; (sstack + 6)
1fc1 : a5 4d __ LDA T1 + 1 
1fc3 : 8d f5 9f STA $9ff5 ; (sstack + 7)
1fc6 : a9 00 __ LDA #$00
1fc8 : 8d f6 9f STA $9ff6 ; (sstack + 8)
1fcb : 8d f7 9f STA $9ff7 ; (sstack + 9)
1fce : 8d f1 24 STA $24f1 ; (cw.cx + 0)
1fd1 : a5 52 __ LDA T5 + 0 
1fd3 : 8d f2 24 STA $24f2 ; (cw.cy + 0)
1fd6 : 20 e9 0e JSR $0ee9 ; (cwin_console_printf.s4 + 0)
1fd9 : a9 00 __ LDA #$00
1fdb : a2 fa __ LDX #$fa
.l7:
1fdd : ca __ __ DEX
1fde : 9d 1a 9d STA $9d1a,x ; (save_buffer[0] + 0)
1fe1 : 9d 14 9e STA $9e14,x ; (save_buffer[0] + 250)
1fe4 : d0 f7 __ BNE $1fdd ; (write_slotsfile.l7 + 0)
.s6:
1fe6 : 38 __ __ SEC
1fe7 : a9 a0 __ LDA #$a0
1fe9 : e5 4c __ SBC T1 + 0 
1feb : a8 __ __ TAY
1fec : a9 5f __ LDA #$5f
1fee : e5 4d __ SBC T1 + 1 
1ff0 : aa __ __ TAX
1ff1 : a9 00 __ LDA #$00
1ff3 : e5 4e __ SBC T1 + 2 
1ff5 : 85 1d __ STA ACCU + 2 
1ff7 : a9 00 __ LDA #$00
1ff9 : e5 4f __ SBC T1 + 3 
1ffb : 38 __ __ SEC
1ffc : d0 0a __ BNE $2008 ; (write_slotsfile.s17 + 0)
.s14:
1ffe : a5 1d __ LDA ACCU + 2 
2000 : d0 06 __ BNE $2008 ; (write_slotsfile.s17 + 0)
.s15:
2002 : e0 01 __ CPX #$01
2004 : d0 02 __ BNE $2008 ; (write_slotsfile.s17 + 0)
.s16:
2006 : c0 f4 __ CPY #$f4
.s17:
2008 : b0 04 __ BCS $200e ; (write_slotsfile.s8 + 0)
.s13:
200a : 86 51 __ STX T2 + 1 
200c : 84 50 __ STY T2 + 0 
.s8:
200e : a5 50 __ LDA T2 + 0 
2010 : 85 13 __ STA P6 
2012 : 8d 07 df STA $df07 
2015 : a5 51 __ LDA T2 + 1 
2017 : 85 14 __ STA P7 
2019 : 8d 08 df STA $df08 
201c : a9 1a __ LDA #$1a
201e : 85 11 __ STA P4 
2020 : 8d 02 df STA $df02 
2023 : a9 9d __ LDA #$9d
2025 : 85 12 __ STA P5 
2027 : 8d 03 df STA $df03 
202a : a5 4c __ LDA T1 + 0 
202c : 8d 04 df STA $df04 
202f : a5 4d __ LDA T1 + 1 
2031 : 8d 05 df STA $df05 
2034 : a9 00 __ LDA #$00
2036 : 8d 06 df STA $df06 
2039 : 8d 0a df STA $df0a 
203c : a9 91 __ LDA #$91
203e : 8d 01 df STA $df01 
2041 : 20 a9 1a JSR $1aa9 ; (uii_write_file.s4 + 0)
2044 : a9 9e __ LDA #$9e
2046 : 8d fe 9f STA $9ffe ; (sstack + 16)
2049 : a9 20 __ LDA #$20
204b : 8d ff 9f STA $9fff ; (sstack + 17)
204e : 20 3b 19 JSR $193b ; (CheckStatus.s4 + 0)
2051 : 18 __ __ CLC
2052 : a5 4c __ LDA T1 + 0 
2054 : 69 f4 __ ADC #$f4
2056 : 85 4c __ STA T1 + 0 
2058 : a5 4d __ LDA T1 + 1 
205a : 69 01 __ ADC #$01
205c : 85 4d __ STA T1 + 1 
205e : a5 4e __ LDA T1 + 2 
2060 : 69 00 __ ADC #$00
2062 : 85 4e __ STA T1 + 2 
2064 : a5 4f __ LDA T1 + 3 
2066 : 69 00 __ ADC #$00
2068 : d0 17 __ BNE $2081 ; (write_slotsfile.s9 + 0)
.s10:
206a : 85 4f __ STA T1 + 3 
206c : a5 4e __ LDA T1 + 2 
206e : d0 11 __ BNE $2081 ; (write_slotsfile.s9 + 0)
.s11:
2070 : a5 4d __ LDA T1 + 1 
2072 : c9 5f __ CMP #$5f
2074 : b0 03 __ BCS $2079 ; (write_slotsfile.s18 + 0)
2076 : 4c b2 1f JMP $1fb2 ; (write_slotsfile.l5 + 0)
.s18:
2079 : d0 06 __ BNE $2081 ; (write_slotsfile.s9 + 0)
.s12:
207b : a5 4c __ LDA T1 + 0 
207d : c9 a0 __ CMP #$a0
207f : 90 f5 __ BCC $2076 ; (write_slotsfile.s11 + 6)
.s9:
2081 : 4c 09 18 JMP $1809 ; (uii_close_file.s4 + 0)
--------------------------------------------------------------------
2084 : __ __ __ BYT 77 52 49 54 49 4e 47 20 53 4c 4f 54 20 44 41 54 : wRITING SLOT DAT
2094 : __ __ __ BYT 41 20 41 54 20 25 4c 55 2e 00                   : A AT %LU..
--------------------------------------------------------------------
209e : __ __ __ BYT 57 52 49 54 49 4e 47 20 53 4c 4f 54 53 00       : WRITING SLOTS.
--------------------------------------------------------------------
20ac : __ __ __ BYT 0a 0a 75 50 44 41 54 45 20 43 4f 4d 50 4c 45 54 : ..uPDATE COMPLET
20bc : __ __ __ BYT 45 44 2e 0a 00                                  : ED...
--------------------------------------------------------------------
20c1 : __ __ __ BYT 70 52 45 53 53 20 4b 45 59 20 54 4f 20 45 58 49 : pRESS KEY TO EXI
20d1 : __ __ __ BYT 54 20 54 4f 20 62 61 73 69 63 2e 0a 00          : T TO basic...
--------------------------------------------------------------------
divmod: ; divmod
20de : a5 1c __ LDA ACCU + 1 
20e0 : d0 31 __ BNE $2113 ; (divmod + 53)
20e2 : a5 04 __ LDA WORK + 1 
20e4 : d0 1e __ BNE $2104 ; (divmod + 38)
20e6 : 85 06 __ STA WORK + 3 
20e8 : a2 04 __ LDX #$04
20ea : 06 1b __ ASL ACCU + 0 
20ec : 2a __ __ ROL
20ed : c5 03 __ CMP WORK + 0 
20ef : 90 02 __ BCC $20f3 ; (divmod + 21)
20f1 : e5 03 __ SBC WORK + 0 
20f3 : 26 1b __ ROL ACCU + 0 
20f5 : 2a __ __ ROL
20f6 : c5 03 __ CMP WORK + 0 
20f8 : 90 02 __ BCC $20fc ; (divmod + 30)
20fa : e5 03 __ SBC WORK + 0 
20fc : 26 1b __ ROL ACCU + 0 
20fe : ca __ __ DEX
20ff : d0 eb __ BNE $20ec ; (divmod + 14)
2101 : 85 05 __ STA WORK + 2 
2103 : 60 __ __ RTS
2104 : a5 1b __ LDA ACCU + 0 
2106 : 85 05 __ STA WORK + 2 
2108 : a5 1c __ LDA ACCU + 1 
210a : 85 06 __ STA WORK + 3 
210c : a9 00 __ LDA #$00
210e : 85 1b __ STA ACCU + 0 
2110 : 85 1c __ STA ACCU + 1 
2112 : 60 __ __ RTS
2113 : a5 04 __ LDA WORK + 1 
2115 : d0 1f __ BNE $2136 ; (divmod + 88)
2117 : a5 03 __ LDA WORK + 0 
2119 : 30 1b __ BMI $2136 ; (divmod + 88)
211b : a9 00 __ LDA #$00
211d : 85 06 __ STA WORK + 3 
211f : a2 10 __ LDX #$10
2121 : 06 1b __ ASL ACCU + 0 
2123 : 26 1c __ ROL ACCU + 1 
2125 : 2a __ __ ROL
2126 : c5 03 __ CMP WORK + 0 
2128 : 90 02 __ BCC $212c ; (divmod + 78)
212a : e5 03 __ SBC WORK + 0 
212c : 26 1b __ ROL ACCU + 0 
212e : 26 1c __ ROL ACCU + 1 
2130 : ca __ __ DEX
2131 : d0 f2 __ BNE $2125 ; (divmod + 71)
2133 : 85 05 __ STA WORK + 2 
2135 : 60 __ __ RTS
2136 : a9 00 __ LDA #$00
2138 : 85 05 __ STA WORK + 2 
213a : 85 06 __ STA WORK + 3 
213c : 84 02 __ STY $02 
213e : a0 10 __ LDY #$10
2140 : 18 __ __ CLC
2141 : 26 1b __ ROL ACCU + 0 
2143 : 26 1c __ ROL ACCU + 1 
2145 : 26 05 __ ROL WORK + 2 
2147 : 26 06 __ ROL WORK + 3 
2149 : 38 __ __ SEC
214a : a5 05 __ LDA WORK + 2 
214c : e5 03 __ SBC WORK + 0 
214e : aa __ __ TAX
214f : a5 06 __ LDA WORK + 3 
2151 : e5 04 __ SBC WORK + 1 
2153 : 90 04 __ BCC $2159 ; (divmod + 123)
2155 : 86 05 __ STX WORK + 2 
2157 : 85 06 __ STA WORK + 3 
2159 : 88 __ __ DEY
215a : d0 e5 __ BNE $2141 ; (divmod + 99)
215c : 26 1b __ ROL ACCU + 0 
215e : 26 1c __ ROL ACCU + 1 
2160 : a4 02 __ LDY $02 
2162 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
2181 : 84 02 __ STY $02 
2183 : a0 20 __ LDY #$20
2185 : a9 00 __ LDA #$00
2187 : 85 07 __ STA WORK + 4 
2189 : 85 08 __ STA WORK + 5 
218b : 85 09 __ STA WORK + 6 
218d : 85 0a __ STA WORK + 7 
218f : a5 05 __ LDA WORK + 2 
2191 : 05 06 __ ORA WORK + 3 
2193 : d0 78 __ BNE $220d ; (divmod32 + 140)
2195 : a5 04 __ LDA WORK + 1 
2197 : d0 27 __ BNE $21c0 ; (divmod32 + 63)
2199 : 18 __ __ CLC
219a : 26 1b __ ROL ACCU + 0 
219c : 26 1c __ ROL ACCU + 1 
219e : 26 1d __ ROL ACCU + 2 
21a0 : 26 1e __ ROL ACCU + 3 
21a2 : 2a __ __ ROL
21a3 : 90 05 __ BCC $21aa ; (divmod32 + 41)
21a5 : e5 03 __ SBC WORK + 0 
21a7 : 38 __ __ SEC
21a8 : b0 06 __ BCS $21b0 ; (divmod32 + 47)
21aa : c5 03 __ CMP WORK + 0 
21ac : 90 02 __ BCC $21b0 ; (divmod32 + 47)
21ae : e5 03 __ SBC WORK + 0 
21b0 : 88 __ __ DEY
21b1 : d0 e7 __ BNE $219a ; (divmod32 + 25)
21b3 : 85 07 __ STA WORK + 4 
21b5 : 26 1b __ ROL ACCU + 0 
21b7 : 26 1c __ ROL ACCU + 1 
21b9 : 26 1d __ ROL ACCU + 2 
21bb : 26 1e __ ROL ACCU + 3 
21bd : a4 02 __ LDY $02 
21bf : 60 __ __ RTS
21c0 : a5 1e __ LDA ACCU + 3 
21c2 : d0 10 __ BNE $21d4 ; (divmod32 + 83)
21c4 : a6 1d __ LDX ACCU + 2 
21c6 : 86 1e __ STX ACCU + 3 
21c8 : a6 1c __ LDX ACCU + 1 
21ca : 86 1d __ STX ACCU + 2 
21cc : a6 1b __ LDX ACCU + 0 
21ce : 86 1c __ STX ACCU + 1 
21d0 : 85 1b __ STA ACCU + 0 
21d2 : a0 18 __ LDY #$18
21d4 : 18 __ __ CLC
21d5 : 26 1b __ ROL ACCU + 0 
21d7 : 26 1c __ ROL ACCU + 1 
21d9 : 26 1d __ ROL ACCU + 2 
21db : 26 1e __ ROL ACCU + 3 
21dd : 26 07 __ ROL WORK + 4 
21df : 26 08 __ ROL WORK + 5 
21e1 : 90 0c __ BCC $21ef ; (divmod32 + 110)
21e3 : a5 07 __ LDA WORK + 4 
21e5 : e5 03 __ SBC WORK + 0 
21e7 : aa __ __ TAX
21e8 : a5 08 __ LDA WORK + 5 
21ea : e5 04 __ SBC WORK + 1 
21ec : 38 __ __ SEC
21ed : b0 0c __ BCS $21fb ; (divmod32 + 122)
21ef : 38 __ __ SEC
21f0 : a5 07 __ LDA WORK + 4 
21f2 : e5 03 __ SBC WORK + 0 
21f4 : aa __ __ TAX
21f5 : a5 08 __ LDA WORK + 5 
21f7 : e5 04 __ SBC WORK + 1 
21f9 : 90 04 __ BCC $21ff ; (divmod32 + 126)
21fb : 86 07 __ STX WORK + 4 
21fd : 85 08 __ STA WORK + 5 
21ff : 88 __ __ DEY
2200 : d0 d3 __ BNE $21d5 ; (divmod32 + 84)
2202 : 26 1b __ ROL ACCU + 0 
2204 : 26 1c __ ROL ACCU + 1 
2206 : 26 1d __ ROL ACCU + 2 
2208 : 26 1e __ ROL ACCU + 3 
220a : a4 02 __ LDY $02 
220c : 60 __ __ RTS
220d : a0 10 __ LDY #$10
220f : a5 1e __ LDA ACCU + 3 
2211 : 85 08 __ STA WORK + 5 
2213 : a5 1d __ LDA ACCU + 2 
2215 : 85 07 __ STA WORK + 4 
2217 : a9 00 __ LDA #$00
2219 : 85 1d __ STA ACCU + 2 
221b : 85 1e __ STA ACCU + 3 
221d : 18 __ __ CLC
221e : 26 1b __ ROL ACCU + 0 
2220 : 26 1c __ ROL ACCU + 1 
2222 : 26 07 __ ROL WORK + 4 
2224 : 26 08 __ ROL WORK + 5 
2226 : 26 09 __ ROL WORK + 6 
2228 : 26 0a __ ROL WORK + 7 
222a : a5 07 __ LDA WORK + 4 
222c : c5 03 __ CMP WORK + 0 
222e : a5 08 __ LDA WORK + 5 
2230 : e5 04 __ SBC WORK + 1 
2232 : a5 09 __ LDA WORK + 6 
2234 : e5 05 __ SBC WORK + 2 
2236 : aa __ __ TAX
2237 : a5 0a __ LDA WORK + 7 
2239 : e5 06 __ SBC WORK + 3 
223b : 90 11 __ BCC $224e ; (divmod32 + 205)
223d : 86 09 __ STX WORK + 6 
223f : 85 0a __ STA WORK + 7 
2241 : a5 07 __ LDA WORK + 4 
2243 : e5 03 __ SBC WORK + 0 
2245 : 85 07 __ STA WORK + 4 
2247 : a5 08 __ LDA WORK + 5 
2249 : e5 04 __ SBC WORK + 1 
224b : 85 08 __ STA WORK + 5 
224d : 38 __ __ SEC
224e : 88 __ __ DEY
224f : d0 cd __ BNE $221e ; (divmod32 + 157)
2251 : 26 1b __ ROL ACCU + 0 
2253 : 26 1c __ ROL ACCU + 1 
2255 : a4 02 __ LDY $02 
2257 : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
2258 : 18 __ __ CLC
2259 : a5 1b __ LDA ACCU + 0 
225b : 69 0d __ ADC #$0d
225d : 29 fc __ AND #$fc
225f : 85 03 __ STA WORK + 0 
2261 : a5 1c __ LDA ACCU + 1 
2263 : 69 00 __ ADC #$00
2265 : 85 04 __ STA WORK + 1 
2267 : ad fb 24 LDA $24fb ; (HeapNode.end + 0)
226a : d0 26 __ BNE $2292 ; (crt_malloc + 58)
226c : a9 00 __ LDA #$00
226e : 8d 0a 30 STA $300a 
2271 : 8d 0b 30 STA $300b 
2274 : ee fb 24 INC $24fb ; (HeapNode.end + 0)
2277 : a9 08 __ LDA #$08
2279 : 09 02 __ ORA #$02
227b : 8d f9 24 STA $24f9 ; (HeapNode.next + 0)
227e : a9 30 __ LDA #$30
2280 : 8d fa 24 STA $24fa ; (HeapNode.next + 1)
2283 : 38 __ __ SEC
2284 : a9 00 __ LDA #$00
2286 : e9 02 __ SBC #$02
2288 : 8d 0c 30 STA $300c 
228b : a9 90 __ LDA #$90
228d : e9 00 __ SBC #$00
228f : 8d 0d 30 STA $300d 
2292 : a9 f9 __ LDA #$f9
2294 : a2 24 __ LDX #$24
2296 : 85 1d __ STA ACCU + 2 
2298 : 86 1e __ STX ACCU + 3 
229a : 18 __ __ CLC
229b : a0 00 __ LDY #$00
229d : b1 1d __ LDA (ACCU + 2),y 
229f : 85 1b __ STA ACCU + 0 
22a1 : 65 03 __ ADC WORK + 0 
22a3 : 85 05 __ STA WORK + 2 
22a5 : c8 __ __ INY
22a6 : b1 1d __ LDA (ACCU + 2),y 
22a8 : 85 1c __ STA ACCU + 1 
22aa : f0 20 __ BEQ $22cc ; (crt_malloc + 116)
22ac : 65 04 __ ADC WORK + 1 
22ae : 85 06 __ STA WORK + 3 
22b0 : b0 14 __ BCS $22c6 ; (crt_malloc + 110)
22b2 : a0 02 __ LDY #$02
22b4 : b1 1b __ LDA (ACCU + 0),y 
22b6 : c5 05 __ CMP WORK + 2 
22b8 : c8 __ __ INY
22b9 : b1 1b __ LDA (ACCU + 0),y 
22bb : e5 06 __ SBC WORK + 3 
22bd : b0 0f __ BCS $22ce ; (crt_malloc + 118)
22bf : a5 1b __ LDA ACCU + 0 
22c1 : a6 1c __ LDX ACCU + 1 
22c3 : 4c 96 22 JMP $2296 ; (crt_malloc + 62)
22c6 : a9 00 __ LDA #$00
22c8 : 85 1b __ STA ACCU + 0 
22ca : 85 1c __ STA ACCU + 1 
22cc : 02 __ __ INV
22cd : 60 __ __ RTS
22ce : a5 05 __ LDA WORK + 2 
22d0 : 85 07 __ STA WORK + 4 
22d2 : a5 06 __ LDA WORK + 3 
22d4 : 85 08 __ STA WORK + 5 
22d6 : a0 02 __ LDY #$02
22d8 : a5 07 __ LDA WORK + 4 
22da : d1 1b __ CMP (ACCU + 0),y 
22dc : d0 15 __ BNE $22f3 ; (crt_malloc + 155)
22de : c8 __ __ INY
22df : a5 08 __ LDA WORK + 5 
22e1 : d1 1b __ CMP (ACCU + 0),y 
22e3 : d0 0e __ BNE $22f3 ; (crt_malloc + 155)
22e5 : a0 00 __ LDY #$00
22e7 : b1 1b __ LDA (ACCU + 0),y 
22e9 : 91 1d __ STA (ACCU + 2),y 
22eb : c8 __ __ INY
22ec : b1 1b __ LDA (ACCU + 0),y 
22ee : 91 1d __ STA (ACCU + 2),y 
22f0 : 4c 10 23 JMP $2310 ; (crt_malloc + 184)
22f3 : a0 00 __ LDY #$00
22f5 : b1 1b __ LDA (ACCU + 0),y 
22f7 : 91 07 __ STA (WORK + 4),y 
22f9 : a5 07 __ LDA WORK + 4 
22fb : 91 1d __ STA (ACCU + 2),y 
22fd : c8 __ __ INY
22fe : b1 1b __ LDA (ACCU + 0),y 
2300 : 91 07 __ STA (WORK + 4),y 
2302 : a5 08 __ LDA WORK + 5 
2304 : 91 1d __ STA (ACCU + 2),y 
2306 : c8 __ __ INY
2307 : b1 1b __ LDA (ACCU + 0),y 
2309 : 91 07 __ STA (WORK + 4),y 
230b : c8 __ __ INY
230c : b1 1b __ LDA (ACCU + 0),y 
230e : 91 07 __ STA (WORK + 4),y 
2310 : a0 00 __ LDY #$00
2312 : a5 05 __ LDA WORK + 2 
2314 : 91 1b __ STA (ACCU + 0),y 
2316 : c8 __ __ INY
2317 : a5 06 __ LDA WORK + 3 
2319 : 91 1b __ STA (ACCU + 0),y 
231b : a0 02 __ LDY #$02
231d : a9 bd __ LDA #$bd
231f : 91 1b __ STA (ACCU + 0),y 
2321 : c8 __ __ INY
2322 : 91 1b __ STA (ACCU + 0),y 
2324 : c8 __ __ INY
2325 : 91 1b __ STA (ACCU + 0),y 
2327 : c8 __ __ INY
2328 : 91 1b __ STA (ACCU + 0),y 
232a : 38 __ __ SEC
232b : a5 05 __ LDA WORK + 2 
232d : e9 04 __ SBC #$04
232f : 85 05 __ STA WORK + 2 
2331 : b0 02 __ BCS $2335 ; (crt_malloc + 221)
2333 : c6 06 __ DEC WORK + 3 
2335 : a9 be __ LDA #$be
2337 : a0 00 __ LDY #$00
2339 : 91 05 __ STA (WORK + 2),y 
233b : c8 __ __ INY
233c : 91 05 __ STA (WORK + 2),y 
233e : c8 __ __ INY
233f : 91 05 __ STA (WORK + 2),y 
2341 : c8 __ __ INY
2342 : 91 05 __ STA (WORK + 2),y 
2344 : 18 __ __ CLC
2345 : a5 1b __ LDA ACCU + 0 
2347 : 69 06 __ ADC #$06
2349 : 85 1b __ STA ACCU + 0 
234b : 90 02 __ BCC $234f ; (crt_malloc + 247)
234d : e6 1c __ INC ACCU + 1 
234f : 60 __ __ RTS
--------------------------------------------------------------------
crt_free@proxy: ; crt_free@proxy
2350 : a5 0d __ LDA P0 
2352 : 85 1b __ STA ACCU + 0 
2354 : a5 0e __ LDA P1 
2356 : 85 1c __ STA ACCU + 1 
--------------------------------------------------------------------
crt_free: ; crt_free
2358 : a5 1b __ LDA ACCU + 0 
235a : 05 1c __ ORA ACCU + 1 
235c : d0 01 __ BNE $235f ; (crt_free + 7)
235e : 60 __ __ RTS
235f : 38 __ __ SEC
2360 : a5 1b __ LDA ACCU + 0 
2362 : 29 03 __ AND #$03
2364 : d0 56 __ BNE $23bc ; (crt_free + 100)
2366 : a5 1b __ LDA ACCU + 0 
2368 : e9 06 __ SBC #$06
236a : 85 1b __ STA ACCU + 0 
236c : b0 02 __ BCS $2370 ; (crt_free + 24)
236e : c6 1c __ DEC ACCU + 1 
2370 : a0 02 __ LDY #$02
2372 : a9 bd __ LDA #$bd
2374 : d1 1b __ CMP (ACCU + 0),y 
2376 : d0 44 __ BNE $23bc ; (crt_free + 100)
2378 : c8 __ __ INY
2379 : d1 1b __ CMP (ACCU + 0),y 
237b : d0 3f __ BNE $23bc ; (crt_free + 100)
237d : c8 __ __ INY
237e : d1 1b __ CMP (ACCU + 0),y 
2380 : d0 3a __ BNE $23bc ; (crt_free + 100)
2382 : c8 __ __ INY
2383 : d1 1b __ CMP (ACCU + 0),y 
2385 : d0 35 __ BNE $23bc ; (crt_free + 100)
2387 : a0 00 __ LDY #$00
2389 : 38 __ __ SEC
238a : b1 1b __ LDA (ACCU + 0),y 
238c : e9 04 __ SBC #$04
238e : 85 03 __ STA WORK + 0 
2390 : c8 __ __ INY
2391 : b1 1b __ LDA (ACCU + 0),y 
2393 : e9 00 __ SBC #$00
2395 : 85 04 __ STA WORK + 1 
2397 : a0 00 __ LDY #$00
2399 : a9 be __ LDA #$be
239b : d1 03 __ CMP (WORK + 0),y 
239d : d0 1d __ BNE $23bc ; (crt_free + 100)
239f : c8 __ __ INY
23a0 : d1 03 __ CMP (WORK + 0),y 
23a2 : d0 18 __ BNE $23bc ; (crt_free + 100)
23a4 : c8 __ __ INY
23a5 : d1 03 __ CMP (WORK + 0),y 
23a7 : d0 13 __ BNE $23bc ; (crt_free + 100)
23a9 : c8 __ __ INY
23aa : d1 03 __ CMP (WORK + 0),y 
23ac : d0 0e __ BNE $23bc ; (crt_free + 100)
23ae : a5 1c __ LDA ACCU + 1 
23b0 : a6 1b __ LDX ACCU + 0 
23b2 : c9 30 __ CMP #$30
23b4 : 90 06 __ BCC $23bc ; (crt_free + 100)
23b6 : d0 05 __ BNE $23bd ; (crt_free + 101)
23b8 : e0 08 __ CPX #$08
23ba : b0 01 __ BCS $23bd ; (crt_free + 101)
23bc : 02 __ __ INV
23bd : c9 90 __ CMP #$90
23bf : 90 06 __ BCC $23c7 ; (crt_free + 111)
23c1 : d0 f9 __ BNE $23bc ; (crt_free + 100)
23c3 : e0 00 __ CPX #$00
23c5 : b0 f5 __ BCS $23bc ; (crt_free + 100)
23c7 : a0 02 __ LDY #$02
23c9 : a9 bf __ LDA #$bf
23cb : 91 1b __ STA (ACCU + 0),y 
23cd : c8 __ __ INY
23ce : 91 1b __ STA (ACCU + 0),y 
23d0 : a0 00 __ LDY #$00
23d2 : b1 1b __ LDA (ACCU + 0),y 
23d4 : 85 1d __ STA ACCU + 2 
23d6 : c8 __ __ INY
23d7 : b1 1b __ LDA (ACCU + 0),y 
23d9 : 85 1e __ STA ACCU + 3 
23db : a9 f9 __ LDA #$f9
23dd : a2 24 __ LDX #$24
23df : 85 05 __ STA WORK + 2 
23e1 : 86 06 __ STX WORK + 3 
23e3 : a0 01 __ LDY #$01
23e5 : b1 05 __ LDA (WORK + 2),y 
23e7 : f0 28 __ BEQ $2411 ; (crt_free + 185)
23e9 : aa __ __ TAX
23ea : 88 __ __ DEY
23eb : b1 05 __ LDA (WORK + 2),y 
23ed : e4 1e __ CPX ACCU + 3 
23ef : 90 ee __ BCC $23df ; (crt_free + 135)
23f1 : d0 1e __ BNE $2411 ; (crt_free + 185)
23f3 : c5 1d __ CMP ACCU + 2 
23f5 : 90 e8 __ BCC $23df ; (crt_free + 135)
23f7 : d0 18 __ BNE $2411 ; (crt_free + 185)
23f9 : a0 00 __ LDY #$00
23fb : b1 1d __ LDA (ACCU + 2),y 
23fd : 91 1b __ STA (ACCU + 0),y 
23ff : c8 __ __ INY
2400 : b1 1d __ LDA (ACCU + 2),y 
2402 : 91 1b __ STA (ACCU + 0),y 
2404 : c8 __ __ INY
2405 : b1 1d __ LDA (ACCU + 2),y 
2407 : 91 1b __ STA (ACCU + 0),y 
2409 : c8 __ __ INY
240a : b1 1d __ LDA (ACCU + 2),y 
240c : 91 1b __ STA (ACCU + 0),y 
240e : 4c 26 24 JMP $2426 ; (crt_free + 206)
2411 : a0 00 __ LDY #$00
2413 : b1 05 __ LDA (WORK + 2),y 
2415 : 91 1b __ STA (ACCU + 0),y 
2417 : c8 __ __ INY
2418 : b1 05 __ LDA (WORK + 2),y 
241a : 91 1b __ STA (ACCU + 0),y 
241c : c8 __ __ INY
241d : a5 1d __ LDA ACCU + 2 
241f : 91 1b __ STA (ACCU + 0),y 
2421 : c8 __ __ INY
2422 : a5 1e __ LDA ACCU + 3 
2424 : 91 1b __ STA (ACCU + 0),y 
2426 : a0 02 __ LDY #$02
2428 : b1 05 __ LDA (WORK + 2),y 
242a : c5 1b __ CMP ACCU + 0 
242c : d0 1d __ BNE $244b ; (crt_free + 243)
242e : c8 __ __ INY
242f : b1 05 __ LDA (WORK + 2),y 
2431 : c5 1c __ CMP ACCU + 1 
2433 : d0 16 __ BNE $244b ; (crt_free + 243)
2435 : a0 00 __ LDY #$00
2437 : b1 1b __ LDA (ACCU + 0),y 
2439 : 91 05 __ STA (WORK + 2),y 
243b : c8 __ __ INY
243c : b1 1b __ LDA (ACCU + 0),y 
243e : 91 05 __ STA (WORK + 2),y 
2440 : c8 __ __ INY
2441 : b1 1b __ LDA (ACCU + 0),y 
2443 : 91 05 __ STA (WORK + 2),y 
2445 : c8 __ __ INY
2446 : b1 1b __ LDA (ACCU + 0),y 
2448 : 91 05 __ STA (WORK + 2),y 
244a : 60 __ __ RTS
244b : a0 00 __ LDY #$00
244d : a5 1b __ LDA ACCU + 0 
244f : 91 05 __ STA (WORK + 2),y 
2451 : c8 __ __ INY
2452 : a5 1c __ LDA ACCU + 1 
2454 : 91 05 __ STA (WORK + 2),y 
2456 : 60 __ __ RTS
--------------------------------------------------------------------
strncpy@proxy: ; strncpy@proxy
2457 : a9 00 __ LDA #$00
2459 : 85 12 __ STA P5 
245b : 4c 04 1f JMP $1f04 ; (strncpy.s4 + 0)
--------------------------------------------------------------------
strncpy@proxy: ; strncpy@proxy
245e : a9 32 __ LDA #$32
2460 : 85 11 __ STA P4 
2462 : a9 00 __ LDA #$00
2464 : 85 12 __ STA P5 
2466 : 4c 04 1f JMP $1f04 ; (strncpy.s4 + 0)
--------------------------------------------------------------------
exit@proxy: ; exit@proxy
2469 : a9 01 __ LDA #$01
246b : 85 0d __ STA P0 
246d : a9 00 __ LDA #$00
246f : 85 0e __ STA P1 
2471 : 4c d4 0e JMP $0ed4 ; (exit.s4 + 0)
--------------------------------------------------------------------
uii_open_file@proxy: ; uii_open_file@proxy
2474 : a9 e2 __ LDA #$e2
2476 : 85 12 __ STA P5 
2478 : a9 24 __ LDA #$24
247a : 85 13 __ STA P6 
247c : 4c 3a 18 JMP $183a ; (uii_open_file.s4 + 0)
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
247f : a5 13 __ LDA P6 
2481 : 85 0e __ STA P1 
2483 : 4c 93 0c JMP $0c93 ; (strlen.s4 + 0)
--------------------------------------------------------------------
strlen@proxy: ; strlen@proxy
2486 : a9 24 __ LDA #$24
2488 : 85 0e __ STA P1 
248a : 4c 93 0c JMP $0c93 ; (strlen.s4 + 0)
--------------------------------------------------------------------
mul40:
248d : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
249d : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
24ad : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
24bd : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
p2smap:
24bf : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
p2smap:
24c7 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
configpath:
24cf : __ __ __ BYT 2f 55 53 42 2a 2f 00 00                         : /USB*/..
--------------------------------------------------------------------
configfilename:
24d7 : __ __ __ BYT 44 4d 42 43 46 47 2e 43 46 47 00                : DMBCFG.CFG.
--------------------------------------------------------------------
slotfilename:
24e2 : __ __ __ BYT 44 4d 42 53 4c 54 2e 43 46 47 00                : DMBSLT.CFG.
--------------------------------------------------------------------
cw:
24ed : __ __ __ BSS	12
--------------------------------------------------------------------
HeapNode:
24f9 : __ __ __ BSS	4
--------------------------------------------------------------------
cfg:
2500 : __ __ __ BSS	99
--------------------------------------------------------------------
linebuffer:
2563 : __ __ __ BSS	100
--------------------------------------------------------------------
uii_data:
25c7 : __ __ __ BSS	513
--------------------------------------------------------------------
uii_status:
27c8 : __ __ __ BSS	257
--------------------------------------------------------------------
OldSlot:
28c9 : __ __ __ BSS	488
--------------------------------------------------------------------
Slot:
2ab1 : __ __ __ BSS	1360
