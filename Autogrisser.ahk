#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent

stamina := 50
start_time := A_TickCount
InputBox stamina, Stamina, Please Enter the current Stamina

SetTimer, waitCont, 5000
;SetTimer, startNew, -2000

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
 MouseClick, left, 1580, 920	; Leave
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
 Loop, 12 {
  MouseClick, left, 1520, 840 	; Start
  sleep, 5000
  MouseClick, left, 1820, 960 	; Attack
  sleep, 5000
 }
 SetTimer, startNew, -600000	; safety net 
 return
