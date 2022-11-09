# Download Installers for Tools

echo "Downloading ADW Cleaner. . ."
curl -o "C:\Users\Public\Downloads\ADWCleaner.exe" "https://adwcleaner.malwarebytes.com/adwcleaner?channel=release"
echo "Download Complete!"
echo ""

If (-NOT (Test-Path "C:\Users\Public\Downloads\CCSetup.exe" -PathType Leaf)) {
    echo "Downloading CCleaner. . ."
    curl -O "C:\Users\Public\Downloads\CCSetup.exe" "https://bits.avcdn.net/productfamily_CCLEANER/insttype_FREE/platform_WIN_PIR/installertype_ONLINE/build_RELEASE"
    echo "Download Complete!"
    echo ""

}
else {
    echo "CCleaner Already Downloaded!"
}

If (-NOT (Test-Path "C:\Users\Public\Downloads\GlaryMBSetup.exe" -PathType Leaf)) {
    echo "Downloading Glary and Malwarebytes. . ."
    curl -o "C:\Users\Public\Downloads\GlaryMBSetup.exe" "https://ninite.com/glary-malwarebytes/ninite.exe"
    echo "Download Complete!"
    echo ""
}
else {
    echo "Glary and Malwarebytes Already Downloaded!"
}

If (-NOT (Test-Path "C:\Users\Public\Downloads\remote.msi" -PathType Leaf)) {
    echo "Downloading NOC Remote Support Installer. . ."
    curl -o "C:\Users\Public\Downloads\InstallerMain.zip" "https://github.com/AGiggleSniffer/Installers-for-Autotune/archive/refs/heads/main.zip"
    Expand-Archive -Path "C:\Users\Public\Downloads\InstallerMain.zip" -DestinationPath "C:\Users\Public\Downloads"
    Move-Item –Path "C:\Users\Public\Downloads\Installers-for-Autotune-main\Noc_Downloads\remote.msi" -Destination "C:\Users\Public\Downloads"
    Remove-Item -Path "C:\Users\Public\Downloads\Installers-for-Autotune-main","C:\Users\Public\Downloads\InstallerMain.zip" -Recurse
    echo "Download Complete!"
    echo ""
}
else {
    echo "Remote.msi Already Downloaded!"
}

#Read-Host -Prompt "Press any key to continue"