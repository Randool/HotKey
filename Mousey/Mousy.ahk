IfExist, mouse.ico
{
    Menu, Tray, Icon, mouse.ico
}

CoordMode, Mouse, Screen

~^!d::  ; 重置记录
    IfExist, Mousy.ini
    {
        FileDelete, Mousy.ini
    }
Return

~!^s::  ; 开始记录
    SetTimer, trapTrace, 100
Return

~^!r::  ; 重复记录
    IniRead, pos, Mousy.ini, trace
    xyArray := StrSplit(pos, "`n")
    while True
    {
        Loop % xyArray.MaxIndex()
        {
            XY := StrSplit(xyArray[A_Index], A_Space)
            ;MsgBox % XY[1] XY[2]
            MouseMove, XY[1], XY[2], 0
        }
    }
Return

~!x::
    ToolTip,
    Pause
Return

~^!x::  ; 结束记录
ExitApp

trapTrace:
    MouseGetPos, mX, mY
    pos = %mX% %mY%
    ToolTip, %pos%
    IniWrite, %pos%, Mousy.ini, trace
Return
