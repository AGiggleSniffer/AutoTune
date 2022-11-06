$SourceFilePath = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$ShortcutPath = "C:\Users\Public\Desktop\MsEdge.lnk"
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$shortcut.Save()