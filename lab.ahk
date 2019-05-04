Gui, Add, Link,, This is a <a href="https://autohotkey.com">link</a>

Gui, Add, Tab3, , 3
Gui, Tab, 1
Gui, Add, ListBox, vMyListBox w640 r10

folder := getIniArray("lab.ini", "folder")
website := getIniArray("lab.ini", "website")

For Key, in folder
{
    ss := StrSplit(folder[Key], "=")
    tmp := "<a href=`"" . ss[2] . "`">" . ss[1] . "</a>"
    Gui, Add, Link,, %tmp%
}


Gui, Show
Return

getIniArray(filename, Section)
{
    IniRead, OutputVarSection, %filename%, %Section%,
    Return StrSplit(OutputVarSection, "`n")
}

