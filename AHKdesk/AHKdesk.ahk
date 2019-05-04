IfExist, AHKdesk.ico
{
    Menu, Tray, Icon, AHKdesk.ico
}
;; 大小参数
wt = w230   ; 界面宽度
ht = h250   ; 截面高度

wtb = w100  ; 按钮的宽度
htb = h30   ; 按钮的高度

picw = w45  ; App图标大小

;; 日历框架 ;;
Gui, Add, MonthCal, vMyCalendar %wt%

;; 创建标签页 ;;
Gui, Add, Tab3, %wt% %ht%, Folders|Website|Todo-List|APPs

Gui, Tab, 1,, vTabList

Gui, Add, Button, gCodes    %wtb% %htb%, Codes
Gui, Add, Button, gWinFocus %wtb% %htb% , Windows聚焦
Gui, Add, Button, gWorkFile %wtb% %htb%, WorkFile
Gui, Add, Button, gFileRecv %wtb% %htb%, FileRecv
Gui, Add, Button, gPGF      %wtb% %htb%, PDF
Gui, Add, Button, gHNU      %wtb% %htb%, HNU

Gui, Tab, 2,, vTabList
Gui, Add, Button, gBaidu           %wtb% %htb%, Baidu
Gui, Add, Button, gbookmarker1     %wtb% %htb%, 书签1
Gui, Add, Button, gLocal_Notebook  %wtb% %htb%, Local Notebook
Gui, Add, Button, gServer_Notebook %wtb% %htb%, Server Notebook

Gui, Tab, 3,, vTabCheck
Gui, Add, Checkbox, , 锻炼

Gui, Tab, 4,, vTabApp
Gui, Add, Picture, %picw% h-1 gClockElf, %A_ScriptDir%\..\ClockElf\clock.ico
Gui, Add, Picture, %picw% h-1 gColorElf, %A_ScriptDir%\..\ColorElf\ColorElf.ico

Gui, Show
return

GuiClose:
GuiEscape:
ExitApp

;; 网址类
bookmarker1:
    Run http://pytorch.org/docs/0.2.0/torch.html#module-torch
    Return
AHKdoc:
    Run https://wyagd001.github.io/zh-cn/docs/AutoHotkey.htm
    return
Local_Notebook:
    Run G:\Codes\Jupyter.bat
    Return
Server_Notebook:
    Run http://123.206.228.144:8888/
    Return
Baidu:
    Run http://www.baidu.com
    Return

;; 文件夹类
Codes:
    Run G:\Codes
    Return
WinFocus:   ; Windows 聚焦
    Run %localappdata%\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets
    Return
WorkFile:
    Run G:\湖大\工作文件
    Return
FileRecv:
    Run C:\Users\dlf43\Documents\Tencent Files\1021924274\FileRecv
    Return
PGF:
    Run G:\PDF
    Return
HNU:
    Run G:\湖大
    Return

;; Apps
ColorElf:
    Run %A_ScriptDir%\..\ColorElf\ColorElf.exe
    return
ClockElf:
    Run %A_ScriptDir%\..\ClockElf\ClockElf.exe
    return