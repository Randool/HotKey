getIniArray(filename, Section)
{
    IniRead, OutputVarSection, %filename%, %Section%,
    Return StrSplit(OutputVarSection, "`n")
}

folder := getIniArray("lab.ini", "folder")
website := getIniArray("lab.ini", "website")

For Key, in website
{
    ss := StrSplit(website[Key], "=")
    MsgBox % ss[1] . " : " . ss[2]
}
