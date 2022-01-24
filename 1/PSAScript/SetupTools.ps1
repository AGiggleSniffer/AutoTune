#Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

#mkdir %installpath%\TempDownloads

# Download Installers for Tools

echo "Downloading CCleaner. . ."
curl -O "C:\Users\Public\Downloads\CCSetup.exe" "https://bits.avcdn.net/productfamily_CCLEANER/insttype_FREE/platform_WIN_PIR/installertype_ONLINE/build_RELEASE"
echo "Download Complete!"
echo ""

echo "Downloading Glary Utilities. . ."
curl -o "C:\Users\Public\Downloads\GlarySetup.exe" "https://www.glarysoft.com/aff/download.php?s=GU"
echo "Download Complete!"
echo ""

echo "Downloading ADW Cleaner. . ."
curl -o "C:\Users\Public\Downloads\ADWCleaner.exe" "https://downloads.malwarebytes.com/file/adwcleaner?2"
echo "Download Complete!"
echo ""

echo "Downloading Malwarebytes. . ."
curl -o "C:\Users\Public\Downloads\MBSetup.exe" "https://downloads.malwarebytes.com/file/mb-windows"
echo "Download Complete!"
echo ""

Read-Host -Prompt "Press any key to continue"