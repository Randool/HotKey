; 示例: 在背景图像上移动的进度条.

Gui, Color, White
Gui, Add, Picture, x0 y0 h350 w450, %A_WinDir%\system32\ntimage.gif
Gui, Add, Button, Default xp+20 yp+250, Start the Bar Moving
Gui, Add, Progress, vMyProgress w416
Gui, Add, Text, vMyText wp  ; wp 表示 "使用之前的宽度".
Gui, Show
return

ButtonStartTheBarMoving:
Loop, %A_WinDir%\*.*
{
    if A_Index > 100
        break
    GuiControl,, MyProgress, %A_Index%
    GuiControl,, MyText, %A_LoopFileName%
    Sleep 50
}
GuiControl,, MyText, Bar finished.
return

GuiClose:
ExitApp