# tcuclk
RSX-11M/M+ utility for managing a TCU-50 clock board on a PDP-11

I have a PDP-11/23+ that is running RSX-11M-PLUS and used to require the time and date
to be manually entered at each boot. I recently aquired a TCU-50 QBUS card, which has a 
time-of-day clock onboard. It lacks the year, so that is hardcoded in the utility right
now. Future plans are to add a command line parameter allowing the year to be specified.

Since RSX-11M+ doesn't have a utility for dealing with the TCU-50, I write this simple
utility in Macro11, to help me manage the clock on the board, and also to set the time
in RSX-11M+ when it boots up. The following is a brief description of how to use TCUCLK.

First, you have to install it in RSX so you can run it with command line parameters:

  \>ins tcuclk

Once this is done, it is accessible as TCU from the command line.

The valid arguments are:

  /SETTIM   This will tell TCU to get the date and time and use it to set the time in RSX.
            Here we use a hardcoded year. currently set to 2026.

  /SETTCU   This tells TCU to get the current date and time from RSX, and set the clock on
            the TCU-50 board.

  /CHKTCU   This can be used to see what the TCU-50's current date and time are right now.

  /IDENT    The utility displays its version info and exits.

  To build the utility, simply run the TCUBLD,CMD command file:
"
  \>@tcubld
  \>;*********************************************************************
  \>;
  \>;       TCUBLD.CMD
  \>;
  \>;       Date : 26-Aug-2026     P. Ekstrom
  \>;
  \>;*********************************************************************
  \>;
  \>REM TCU
  \>PIP *.MAC;*/PU,*.CMD/PU
  \>MAC TCUCLK,TCUCLK/-SP=TCUCLK
  \>TKB @TCUTKB.CMD
  \>PIP *.LST;*/DE
  \>PIP *.OBJ;*/DE
  \>PIP *.TSK/PU
  \>INS TCUCLK/TASK=...TCU
  \>@ <EOF>
"
If the TCU task is installed, it removes it before continuing, and then it installs it
again once it has been built. So to test the new version, you can simply run TCU.
