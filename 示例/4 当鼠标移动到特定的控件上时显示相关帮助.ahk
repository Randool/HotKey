; 示例: 当鼠标移动到特定的控件上时显示相关帮助(使用工具提示):

Gui, Add, Edit, vMyEdit
MyEdit_TT := "This is a tooltip for the control whose variable is MyEdit."
Gui, Add, DropDownList, vMyDDL, Red|Green|Blue
MyDDL_TT := "Choose a color from the drop-down list."
Gui, Add, Checkbox, vMyCheck, This control has no tooltip.
Gui, Show
OnMessage(0x200, "WM_MOUSEMOVE")
return

WM_MOUSEMOVE()
{
    static CurrControl, PrevControl, _TT  ; _TT 保持为空以便用于下面的 ToolTip 命令.
    CurrControl := A_GuiControl
    If (CurrControl <> PrevControl and not InStr(CurrControl, " "))
    {
        ToolTip  ; 关闭之前的工具提示.
        SetTimer, DisplayToolTip, 1000
        PrevControl := CurrControl
    }
    return

    DisplayToolTip:
    SetTimer, DisplayToolTip, Off
    ToolTip % %CurrControl%_TT  ; 前导的百分号表示要使用表达式.
    SetTimer, RemoveToolTip, 3000
    return

    RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
    return
}


GuiClose:
ExitApp