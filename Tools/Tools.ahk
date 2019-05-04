IfExist, all.ico
{
    Menu, Tray, Icon, all.ico, 1
}

;;;;;;;帮助菜单
#h::
    doc := getHelp()
    MsgBox % doc
    ;ToolTip, %doc%
    ;Sleep, 2000
    ;ToolTip,
return

;;;;;;;超链接;;;;;;;;
AHKdoc:
~+!a::  ; Shift+Alt+a AHK中文文档
    Run, https://wyagd001.github.io/zh-cn/docs/AutoHotkey.htm
return

Sjupyter:
~^!j::  ; Ctrl+Alt+j Server Jupyter Notebook
    Run, http://118.25.12.63:8888/
return

jupyter:
~+!j::  ; Shift+Alt+j Jupyter Notebook
    Run, E:\Codes\Jupyter.bat
return

Linuxde:
~!l::
    Run, http://man.linuxde.net/
return

Githubio:
~^!g::  ; Ctrl+Alt+g Gayhub网站
    Run, https://randool.github.io/
return

Notepad:
~^!n::
	Run, F:\Notepad++/notepad++.exe
Return

Working:
~^!w::
    Run, E:\HNU\工作文件
return

Sophomore:
~^!c::  ; Ctrl+Alt+c 当前工作目录
    Run, E:\HNU\semester\大三下
return

~^!v:: ; Ctrl+Alt+v 研究生
    Run, E:\HNU\semester\postgraduate
return

Cmd:
~^!t::  ; Ctrl+Alt+t cmd
    Run, C:\WINDOWS\system32\cmd.exe
Return

WinFocus:
~^!f::  ; Ctrl+Alt+f Windows聚焦
    Run, %localappdata%\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets
return

PDF:
~^!p::  ; Ctrl+Alt+p PDF文件夹
    Run, E:\PDF
return

Paper:
~+!p::   ; Shift+Alt+p Paper文件夹
    Run, E:\PDF\paper
return

FileRecv:
~^!r::  ; Ctrl+Alt+r FileRecv文件夹
    Run, C:\Users\dlf43\Documents\Tencent Files\1021924274\FileRecv
return

Xshell:
~^!x::
    Run, F:\Xshell 6\Xshell.exe
return

;;;;;;;拾色器+计时器;;;;;;;;
;MsgBox, , 说明, Alt+c 拾取颜色`nAlt+t 打开计时器`nAlt+d 输出当前日期`nAlt+e 退出应用 , 5

CustomColor = E3F1FC
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Color, %CustomColor%
Gui, Font, s15, Verdana
Gui, Add, Text, vMyText c1690ED, XXXXX YYYYY  

; 让此颜色的所有像素透明；让文本显示为半透明 (150):
WinSet, TransColor, %CustomColor% 150
SetTimer, UpdateOSD, 80
Gosub, UpdateOSD            ; 立即进行第一此更新而不等待计时器.
Gui, Show, x250 y970 NoActivate  ; NoActivate 让当前活动窗口继续保持活动状态.
return

UpdateOSD:
    color := getColor()
    GuiControl,, MyText, %color%
return

ColorElf:
~!c::
    Clipboard := getColor()
    ToolTip, 颜色 %Clipboard% 已经到粘贴板啦~
    Sleep, 500
    ToolTip,
Return

Timer:
~!t::
    InputBox, time, Timer, 请输入计时时长（单位min）, , 200, 125
    If time
    {
        time := time * 1000 * 60
        Sleep, %time%
        SoundBeep, 2000, 200
        SoundBeep, 2500, 200
        SoundBeep, 2000, 200
        SoundBeep, 2500, 200
        MsgBox, , Timer, 时间到！,
    }
Return

Dater:
~!d::
    d = %A_YYYY%-%A_MM%-%A_DD%
    Clipboard = %d%
    Send, ^v
Return

GuiClose:
~!e::
ExitApp

getColor()
{
    MouseGetPos, mouseX, mouseY
    PixelGetColor, color, %mouseX%, %mouseY%, RGB
    Return SubStr(color, 3)
}

getHelp()
{
    doc := "Alt+c    拾取颜色`nAlt+t     打开计时器`nAlt+d     在剪切板上写入当前日期`n"
    doc .= "Shift+Alt+a     AHK中文文档`nCtrl+Alt+f     Windows聚焦`nCtrl+Alt+g     GitHub个人网站"
    doc .= "Shift+Alt+j     Jupyter Notebook`nCtrl+Alt+j     Server Jupyter Notebook`nCtrl+Alt+p     PDF文件夹"
    doc .= "Ctrl+Alt+r     FileRecv文件夹`nAlt+e     退出应用"
    return doc
}