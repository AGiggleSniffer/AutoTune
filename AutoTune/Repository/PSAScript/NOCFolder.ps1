#Make NOC Folder

$TargetDirectory = "C:\Users\Public\Desktop\Nerds On Call 800-919NERD"
$ParentPath = Split-Path $PSScriptRoot -Parent

#Test to see if its already made, if so then quit
If (-NOT (Test-Path $TargetDirectory)) {
  mkdir "C:\Users\Public\Desktop\Nerds On Call 800-919NERD"
  Copy-Item "$ParentPath\nerd.ico" -Destination "C:\Users\Public\Desktop\Nerds On Call 800-919NERD"
}
Else  {
  quit
}

#Write desktop.ini values for nerds face icon
$DesktopIni = @"
[.ShellClassInfo]
ConfirmFileOp=0
IconFile=nerd.ico
IconIndex=0
InfoTip=Contains the Nerds On Call Security Suite
"@

#Create/Add content to the desktop.ini file
Add-Content "$($TargetDirectory)\desktop.ini" -Value $DesktopIni
  
#Set the attributes for $DesktopIni & the icon
(Get-Item "$($TargetDirectory)\desktop.ini" -Force).Attributes = 'Hidden, System, Archive'
(Get-Item "$("C:\Users\Public\Desktop\Nerds On Call 800-919NERD")\nerd.ico" -Force).Attributes = 'Hidden, System, Archive'

#Finally, set the folder's attributes
(Get-Item $TargetDirectory -Force).Attributes = 'ReadOnly, Directory'

#
#
#

#Populate Folder with shortcuts

#MB
$SourceFilePath = "C:\Program Files\Malwarebytes\Anti-Malware\mbam.exe"
$ShortcutPath = "$TargetDirectory\Malwarebytes.lnk"
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$shortcut.Save()

#ADWCleaner
$SourceFilePath = "C:\Users\Public\Downloads\ADWCleaner.exe"
$ShortcutPath = "$TargetDirectory\ADWCleaner.lnk"
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$shortcut.Save()

#Glary
$SourceFilePath = "C:\Program Files (x86)\Glary Utilities 5\Integrator.exe"
$ShortcutPath = "$TargetDirectory\Glary Utilities.lnk"
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$shortcut.Save()

#CCleaner
$SourceFilePath = "C:\Program Files\CCleaner\CCleaner64.exe"
$ShortcutPath = "$TargetDirectory\CCleaner.lnk"
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$shortcut.Save()