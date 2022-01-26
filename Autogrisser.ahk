#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent

stamina := 50
start_time := A_TickCount
InputBox stamina, Stamina, Please Enter the current Stamina

SetTimer, waitCont, 5000
;SetTimer, startNew, -5000	; Uncomment to begin from "Create Team"

waitCont:
PixelGetColor, c1, 1525, 998
PixelGetColor, c2, 1604, 997
PixelGetColor, c3, 1774, 989
if (c1=0xe9fbfc and c1=c2 and c1=c3) {
 MouseClick, left, 1600, 900	; Continue
 sleep, 1500
 MouseClick, left, 1600, 900	; Continue
 Sleep, 1400
 Send #{PrintScreen}		; Screenshot
 Sleep, 1000
 MouseClick, left, 1400, 900	; Leave
 Sleep, 5000
 stamina -= 16
; Calculate accumulated stamina
 stamina_earned := (A_TickCount - start_time) / 1000 / 300
 if (stamina + stamina_earned < 16) { ; Purchase Stamina
   MouseClick, left, 1417, 63   ; Add Stamina
   Sleep, 1500
   MouseClick, left, 789, 666	; Confirm
   Sleep, 1500
   MouseClick, left, 1800, 950	; Close
   Sleep, 1000
   stamina += 50  
 }
 MouseClick, left, 1800, 950    ; Team
 Sleep, 1000
 SetTimer, startNew, -10	; Start New Game
}
return

startNew:
 MouseClick, left, 1600, 960	; Create Team
 Sleep, 1500
 MouseClick, left, 1250, 850	; Create
 Sleep, 1500
 Loop, 14 {			; 
  MouseClick, left, 1520, 960	; Start
  sleep, 8000
  PixelGetColor, c5, 1820, 940
  if (c5=0x0b00a8) {		; Check for Attack
   MouseClick, left, 1820, 940 	; Attack
   return
  }
 }
 sleep 9999			; wait until timeout
 PixelGetColor, c4, 1200, 900
 if (c4=0xd2e7f2) {		; No one joined
   SetTimer, startNew, -10
 }
 return
