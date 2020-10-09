#SingleInstance, force

CheckBox_1 = "5"
CheckBox_2 = "10"
CheckBox_3 = "15"
CheckBox_4 = "20"

AF = 0 ;existing variable
Execs = 0 ;variavel de checkbox

; ------------
;  GUI Layout |
; ------------


;#[BOTOES GAMDOM]

Gui, Add, Text, x40 y10, GAMDOM
Gui, Add, Text, x300 y27 w20 h20 HwndDisplay, %Execs%

SetTimer, GuiUpdate

Gui, Add, Button, x10 y30 w120 h30 gGamdom_Start, Start GamdomBot!
Gui, Add, Button, x10 y70 w120 h30 gGamdom_Stop, Stop GamdomBot!

;#[BOTOES ATSE]
 ;#[Teste_GUI] ;#[Teste_GUI]
Gui, Add, Text, x190 y10, CSGOATSE

Gui, Add, Button, x166 y30 w120 h30 gAtse_Start, Start AtseBot!
Gui, Add, Button, x166 y70 w120 h30 gAtse_Stop, Stop AtseBot!
Gui, Add, Button, x300 y47 w80 h30 gReload, RELOAD!

Gui, Add, CheckBox, x166 y120 vCheckBox_1 gSubmitx5, x5
Gui, Add, CheckBox, x206 y120 vCheckBox_2 gSubmitx10, x10
Gui, Add, CheckBox, x246 y120 vCheckBox_3 gSubmitx15, x15
Gui, Add, CheckBox, x286 y120 vCheckBox_4 gSubmitx18, x18

 ;#[BOTOES CSGO500]

Gui, Add, Text, x40 y160, CSGO500
Gui, Add, Button,x40 y200 w80 h30 , SpinDaily
Gui, Add, Text, x+10 y200 w100 h30 vCountdown


;#[OPCOES GUI]

Gui, +AlwaysOntop
Gui, Show, w500 h300, %A_WorkingDir%
return


; ------------
;    Lables   |
; ------------

Gamdom_Start:
Run, F:\Users\Blaze\Documents\bot_atse\scripts\GAMDOM_ALL.scp
Return

Gamdom_Stop:
Send +{Escape}
Return

Atse_Start:
Loop %Execs% {
					AF += 1
					Run, F:\Users\Blaze\Documents\bot_atse\scripts\ATSEFLIP.scp
						If AF=Execs
						{
							Return
						}
				 		Else
				 			Sleep, 3750000
					 		process,close,msched.exe
				 	}
	Return

Reload:
	Execs=0
	Process,close,msched.exe
	Run https://csgoatse.com/atseflip
	Reload

Atse_Stop:
	;;
	Return

Submit_All:
	Gui, Submit, NoHide
	Return

Submitx5:
	Execs=5
	Gui, Submit, NoHide
	Return

Submitx10:
	Execs=10
	Gui, Submit, NoHide
	Return

Submitx15:
	Execs=15
	Gui, Submit, NoHide
	Return

Submitx18:
	Execs=18
	Gui, Submit, NoHide
	Return

GuiUpdate:
	GuiControl,, %Display%, %AF%
	Return

ButtonSpinDaily:
   Run chrome.exe https://csgo500.com/rewards
   
   ;;RUN CSGO500 SPINNER
   ;;VERIFY SPINNER ENDED , IF YES  CNT START
   
   cnt := 3750000
   SetTimer, Go, 1000
    Send {Ctrl Down}
	Sleep 1000
	Send w
	Sleep 1000
	Send {Ctrl Up}
	return

Go:
   GuiControl,,Countdown, % cnt
	if (--cnt < 0)
      SetTimer, Go, off
      Return

; ------------
;   Functions |
; ------------



; ------------
;    Hotkeys  |
; ------------


;; validador de execuÃ§Ãµes escolhidas
^j::
	MsgBox, %Execs%
	return

;; validador de Flips Feitos
^n::
	MsgBox, %AF%
	return

;; save & reload app
~^s::
	Reload
	return
