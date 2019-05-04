IfExist, clock.ico
{
    Menu, Tray, Icon, clock.ico
}

MsgBox, , 时间管家, Alt+t 打开计时器`nAlt+d 在文本框输出当前日期`nAlt+x 显示日历, 10
Timer:
~!t::
    InputBox, time, Timer, 请输入计时时长（单位s）, , 180, 125
    If time
    {
        time := time * 1000
        Sleep, %time%
        MsgBox, , Timer, 时间到！,
    }
    Return
; 说明
; InputBox, OutputVar [, Title, Prompt, HIDE, Width, Height, X, Y, Font, Timeout, Default]
; OutputVar : 保存用户输入的变量名
; Title : 输入框的标题. 如果为空或省略, 则它默认为脚本的名称.
; Prompt : 输入框的文本
; HIDE : 如果此参数为 HIDE, 则屏蔽用户的输入, 这可以用于输入密码.


Dater:  ; Alt + d 输入当前日期
~!d::
    d = %A_YYYY%-%A_MM%-%A_DD%
    Clipboard = %d%
    Send, ^v
    Return


calendar:
~!x::
    Gui, Add, MonthCal, vMyCalendar
    Gui, Show
    Return
