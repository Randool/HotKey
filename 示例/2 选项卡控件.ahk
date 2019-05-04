; 示例: 选项卡控件:

Gui, Add, Tab2, , First Tab|Second Tab|Third Tab  ; Tab2 比起 Tab 需要 [v1.0.47.05+].
Gui, Add, Checkbox, vMyCheckbox, Sample checkbox
Gui, Tab, 2
Gui, Add, Radio, vMyRadio, Sample radio1
Gui, Add, Radio,, Sample radio2
Gui, Tab, 3
Gui, Add, Edit, vMyEdit r5  ; r5 表示 5 行的高度.
Gui, Tab  ; 即后续添加的控件将不属于前面那个选项卡控件.
Gui, Add, Button, default xm, OK  ; xm 把它放置在左下角.
Gui, Show
return

ButtonOK:
GuiClose:
GuiEscape:
Gui, Submit  ; 保存每个控件的内容到其关联变量中.
MsgBox You entered:`n%MyCheckbox%`n%MyRadio%`n%MyEdit%
ExitApp