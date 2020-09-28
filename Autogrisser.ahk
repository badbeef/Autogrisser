#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent

stamina := 50
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
 if (stamina < 32) { ; Purchase Stamina
   MouseClick, left, 1665, 80   ; Add Stamina
   Sleep, 1500
   MouseClick, left, 789, 666	; Confirm
   Sleep, 1500
   MouseClick, left, 1520, 840	; Close
   Sleep, 1000
   stamina += 52   		; offset stamina growth over the period
 } else {
   Sleep, 4000
 }
 Loop, 12 {
  MouseClick, left, 1520, 840 	; Start
  sleep, 5000
  MouseClick, left, 1820, 960 	; Attack
  sleep, 5000
 }
}
return
