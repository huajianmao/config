#Requires AutoHotkey v2.0

SendMode "Input"  ; 在 v2.0 中参数需要用引号
SetWorkingDir A_ScriptDir  ; 在 v2.0 中去掉了百分号

;; Enable it for 60% keyboard
; Up::Send, /
; +Up::Send, ?
; ; Esc::Send, `
; +Esc::Send, ~

CapsLock & h::Send "{Left}"  ; 在 v2.0 中参数需要用引号
CapsLock & l::Send "{Right}"
CapsLock & j::Send "{Down}"
CapsLock & k::Send "{Up}"
^[::Send "{Esc}"  ; 在 v2.0 中参数需要用引号

!w::Send "^w"
