; IP 地址控件

Gui, Add, Custom, ClassSysIPAddress32 r1 w150 hwndhIPControl gIPControlEvent
Gui, Add, Button, Default, OK
IPCtrlSetAddress(hIPControl, A_IPAddress1)
Gui, Show
return

GuiClose:
ExitApp

ButtonOK:
Gui, Hide
ToolTip
MsgBox % "You chose " IPCtrlGetAddress(hIPControl)
ExitApp

IPControlEvent:
if A_GuiEvent = Normal
{
    ; 接收到 WM_COMMAND.

    if (A_EventInfo = 0x0300)  ; EN_CHANGE
        ToolTip Control changed!
}
else if A_GuiEvent = N
{
    ; 接收到 WM_NOTIFY.    

	; 获取通告码. 一般情况下这个字段是 UInt 类型, 但 IP 地址
    ; 控件使用负值, 所以为了方便我们把它作为有符号整型读取出来.
    nmhdr_code := NumGet(A_EventInfo + 2*A_PtrSize, "int")
    if (nmhdr_code != -860)  ; IPN_FIELDCHANGED
        return

    ; 从 NMIPADDRESS 结构体中提取信息
    iField := NumGet(A_EventInfo + 3*A_PtrSize + 0, "int")
    iValue := NumGet(A_EventInfo + 3*A_PtrSize + 4, "int")
    if iValue >= 0
        ToolTip Field #%iField% modified: %iValue%
    else
        ToolTip Field #%iField% left empty
}
return

IPCtrlSetAddress(hControl, IPAddress)
{
    static WM_USER := 0x400
    static IPM_SETADDRESS := WM_USER + 101

    ; 把 IP 地址打包成 32 位字以用于 SendMessage.
    IPAddrword := 0
    Loop, Parse, IPAddress, .
        ipaddrword := (IPAddrword * 256) + A_LoopField
    SendMessage IPM_SETADDRESS, 0, IPAddrword,, ahk_id %hControl%
}

IPCtrlGetAddress(hControl)
{
    static WM_USER := 0x400
    static IPM_GETADDRESS := WM_USER + 102

    VarSetCapacity(AddrWord, 4)
    SendMessage IPM_GETADDRESS, 0, &addrword,, ahk_id %hControl%
    return NumGet(AddrWord, 3, "UChar") "." NumGet(AddrWord, 2, "UChar") "." NumGet(AddrWord, 1, "UChar") "." NumGet(AddrWord, 0, "UChar")
}
