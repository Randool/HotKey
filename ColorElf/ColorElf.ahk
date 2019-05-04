IfExist, ColorElf.ico
{
    Menu, Tray, Icon, ColorElf.ico  ; 这句会把 ColorElf.ico 作为图标
}

; 设置悬浮桌面窗口实时显示颜色
; CustomColor可以为任意 RGB 颜色 (在下面会被设置为透明).
; +LastFound +AlwaysOnTop -Caption +ToolWindow 为浮窗效果且避免显示任务栏按钮和 alt-tab 菜单项.
; 设置大字体 (15磅).
; XX & YY 用来自动调整窗口大小.
CustomColor = E3F1FC
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Color, %CustomColor%
Gui, Font, s15, Verdana
Gui, Add, Text, vMyText c1690ED, XXXXX YYYYY  

; 让此颜色的所有像素透明；让文本显示为半透明 (150):
WinSet, TransColor, %CustomColor% 150
SetTimer, UpdateOSD, 100
Gosub, UpdateOSD            ; 立即进行第一此更新而不等待计时器.
Gui, Show, x250 y970 NoActivate  ; NoActivate 让当前活动窗口继续保持活动状态.
return

UpdateOSD:
    MouseGetPos, mouseX, mouseY
    PixelGetColor, color, %mouseX%, %mouseY%, RGB
    tmp := "(X" . mouseX . ", Y" . mouseY . ") " . color
    GuiControl,, MyText, %color%
return

; 说明
; 使用 Alt + c 即可获取当前鼠标位置的颜色，并自动保存到粘贴板
; 使用 Alt + e 即可退出App
; 获取鼠标坐标
; 获取当前坐标的 RGB color
; 将颜色发送给到粘贴板
; 保留提示1.5s
; 关闭鼠标提示
MsgBox, , ColorElf, 使用 Alt + c 来拾取想要的颜色吧！`n`n注：使用 Alt + e 来退出应用, 2
ColorElf:
~!c::
    MouseGetPos, mouseX, mouseY
    PixelGetColor, color, %mouseX%, %mouseY%, RGB
    Clipboard := SubStr(color, 3)
    ToolTip, 颜色 %color% 已经到粘贴板啦~
    Sleep, 500
    ToolTip,
Return

exitElf:
GuiClose:
~!e::
ExitApp
