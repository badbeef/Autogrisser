#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent

stamina := 50
start_time := A_TickCount
InputBox stamina, Stamina, Please Enter the current Stamina

SetTimer, waitCont, 5000


waitCont:
PixelGetColor, c1, 1610, 991
PixelGetColor, c2, 1662, 989
PixelGetColor, c3, 1803, 986
if (c1=0xe9fbfc and c1=c2 and c1=c3) {
 MouseClick, left, 1600, 900	; Continue
 sleep, 1500
 MouseClick, left, 1600, 900	; Continue
 Sleep, 1400
 Send #{PrintScreen}		; Screenshot
 Sleep, 1000
 MouseClick, left, 1100, 650	; Confirm Invite
 Sleep, 1000
 MouseClick, left, 1100, 650	; Confirm Invite
 stamina -= 16
 Sleep, 7000
; Calculate accumulated stamina
 stamina_earned := (A_TickCount - start_time) / 1000 / 300
 ToolTip "Stamina Left = %stamina% + %stamina_earned%"
 if (stamina + stamina_earned < 32) { ; Purchase Stamina
   MouseClick, left, 1665, 80   ; Add Stamina
   Sleep, 1500
   MouseClick, left, 789, 666	; Confirm
   Sleep, 1500
   MouseClick, left, 1520, 840	; Close
   Sleep, 1000
   stamina += 50  
 } else {
   Sleep, 4000
 }
 Loop, 12 {
  MouseClick, left, 1520, 840 	; Start
  sleep, 5000
  MouseClick, left, 1820, 960 	; Attack
  sleep, 5000
 }
 SetTimer, startNew, -600000	; safety net 
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
