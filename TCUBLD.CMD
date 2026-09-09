;*********************************************************************
;
;       TCUBLD.CMD
;
;       Date : 26-Aug-2026     P. Ekstrom
;
;*********************************************************************
;
.IFNINS ...MAC INS $MAC
.IFNINS ...TKB INS $TKB
.IFINS ...TCU REM TCU

PIP *.MAC;*/PU,*.CMD/PU
MAC TCUCLK,TCUCLK/-SP=TCUCLK
TKB @TCUTKB.CMD
PIP *.LST;*/DE
PIP *.OBJ;*/DE
PIP *.TSK/PU

INS TCUCLK/TASK=...TCU
