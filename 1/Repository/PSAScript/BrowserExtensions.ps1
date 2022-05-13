#Install Browser Extensions w/Registry

#Prompt Variables
$choices  = '&Yes', '&No'
$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)

# Chrome Prompt
#$title    = 'Chrome Extensions'
#$question = 'Would you like to download Google Chrome Extensions?'
#$decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
#if ($decision -eq 0) {
#    Write-Host 'Confirmed'
#} else {
#    Write-Host 'Cancelled'
#}

# UBlock
$RegistryPath = 'HKLM:\Software\Wow6432Node\Google\Chrome\Extensions\cjpalhdlnbpafiamejdnhcphjbkeiagm'
$Name         = 'update_url'
$Value        = 'https://clients2.google.com/service/update2/crx'

# Create the key if it does not exist
If (-NOT (Test-Path $RegistryPath)) {
  New-Item -Path $RegistryPath -Force | Out-Null
}  
# Now set the value
New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType string -Force 
echo "UBlock Origin added to Registry"
echo ""

# HTTPS Everywhere
$RegistryPath = 'HKLM:\Software\Wow6432Node\Google\Chrome\Extensions\gcbommkclmclpchllfjekcdonpmejbdp'
$Name         = 'update_url'
$Value        = 'https://clients2.google.com/service/update2/crx'

# Create the key if it does not exist
If (-NOT (Test-Path $RegistryPath)) {
  New-Item -Path $RegistryPath -Force | Out-Null
}  
# Now set the value
New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType string -Force
echo "HTTPS Everywhere added to Registry"
echo ""

# Privacy Badger
#$RegistryPath = 'HKLM:\Software\Wow6432Node\Google\Chrome\Extensions\pkehgijcmpdhfbdbbnkijodmdjhbjlgp'
#$Name         = 'update_url'
#$Value        = 'https://clients2.google.com/service/update2/crx'

# Create the key if it does not exist
#If (-NOT (Test-Path $RegistryPath)) {
#  New-Item -Path $RegistryPath -Force | Out-Null
#}  
# Now set the value
#New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType string -Force
#echo "Privacy Badger added to Registry"
#echo ""

echo "Extensions Added, Open Google Chrome to Finish"
echo ""

# Prompt for Edge Extensions
#$title    = 'MS Edge Extensions'
#$question = 'Would you like to download Microsoft Edge Extensions?'
#$decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
#if ($decision -eq 0) {
#    Write-Host 'Confirmed'
#} else {
#    Write-Host 'Cancelled'
#}

# UBlock
$RegistryPath = 'HKLM:\Software\Wow6432Node\Microsoft\Edge\Extensions\odfafepnkmbhccpbejgmiehpchacaeak'
$Name         = 'update_url'
$Value        = 'https://edge.microsoft.com/extensionwebstorebase/v1/crx'

# Create the key if it does not exist
If (-NOT (Test-Path $RegistryPath)) {
  New-Item -Path $RegistryPath -Force | Out-Null
}  
# Now set the value
New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType string -Force 
echo "UBlock Origin added to Registry"
echo ""

# HTTPS Everywhere
$RegistryPath = 'HKLM:\Software\Wow6432Node\Microsoft\Edge\Extensions\fchjpkplmbeeeaaogdbhjbgbknjobohb'
$Name         = 'update_url'
$Value        = 'https://edge.microsoft.com/extensionwebstorebase/v1/crx'

# Create the key if it does not exist
If (-NOT (Test-Path $RegistryPath)) {
  New-Item -Path $RegistryPath -Force | Out-Null
}  
# Now set the value
New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType string -Force
echo "HTTPS Everywhere added to Registry"
echo ""

# Privacy Badger
$RegistryPath = 'HKLM:\Software\Wow6432Node\Microsoft\Edge\Extensions\mkejgcgkdlddbggjhhflekkondicpnop'
$Name         = 'update_url'
$Value        = 'https://edge.microsoft.com/extensionwebstorebase/v1/crx'

# Create the key if it does not exist
If (-NOT (Test-Path $RegistryPath)) {
  New-Item -Path $RegistryPath -Force | Out-Null
}  
# Now set the value
New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType string -Force
echo "Privacy Badger added to Registry"
echo ""

echo "Extensions Added, Open Microsoft Edge to Finish"
echo ""

# FF Prompt
#$title    = 'Firefox Extensions'
#$question = 'Would you like to download Mozilla Firefox Extensions?'
#$decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
#if ($decision -eq 0) {
#    Write-Host 'Confirmed'
#} else {
#    Write-Host 'Cancelled'
#}

pause