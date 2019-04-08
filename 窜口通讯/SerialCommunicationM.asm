.include /asm51.h/
.area home (abs)
.org 0x0000
ljmp _main
.org 0x0003
ljmp _InttX0


_main:
  setb _EA
  setb _EX0
  setb _IT0
  mov _SCON,#0x40     ;way1
  mov _PCON,#0x00     ;double
  mov _TMOD,#0x20     ;T2-->way2
  mov _TH1,#0xf3
  mov _TL1,#0xf3      ;4800
  setb _TR1
01$:
  sjmp 01$

_InttX0:
  mov _SBUF,#0xf9
01$:
  jnb _TI,01$
  clr _TI
  cpl _P2_2
  reti
