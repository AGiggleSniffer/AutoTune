@echo off
echo.
echo=------------------------------------------------------------
echo.

::Asset Profile
:: - FilePath
echo=File Path
ECHO:%PATH:;= & ECHO:%

echo=------------------------------------------------------------

:: - Host Name + OS + RAM
echo.
systeminfo | findstr /b /c:"Host Name" /c:"OS Version" /c:"Total Physical Memory" /c:"System Manufacturer" /c:"System Model"
echo.

:: - CPU Name
echo=CPU
wmic cpu get name

:: - GPU Name
echo=GPU
wmic path win32_VideoController get name

:: - Serial Number
wmic bios get serialnumber

echo=------------------------------------------------------------

:: - Mac Address
getmac

echo.
echo=------------------------------------------------------------
echo.

:: - Disk Info
echo=Disk Info:
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& 'C:\1\Repository\PSAScript\DiskInfo.ps1'";
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& 'C:\1\Repository\PSAScript\DiskInfo2.ps1'";

echo=------------------------------------------------------------
echo.

::Install Prompt
echo=Download and Install Latest Tools?
choice /c yn
goto %ERRORLEVEL%
:1
echo.
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& 'C:\1\Repository\PSAScript\SetupTools.ps1'";
echo=Installing CCleaner . . .
C:\Users\Public\Downloads\CCSetup.exe /S
echo=Install Complete!
echo.
echo=Installing Glary Utilities . . .
echo.
C:\Users\Public\Downloads\GlarySetup.exe /S
echo=Install Complete!
:2
echo.

echo=------------------------------------------------------------
echo.

::Run ADWCleaner
echo=Run ADWCleaner?
choice /c yn
goto %ERRORLEVEL%
:1
echo.
echo=Starting ADW Cleaner
echo.
echo=Running ADW Scan . . .
start "C:\Users\Public\Downloads\ADWCleaner.exe" /eula /clean /noreboot&pause
:2
echo.

echo=------------------------------------------------------------
echo.

::Auto CClean with Previously Congigured Settings
echo=Auto CClean with Previously Congigured Settings?
echo.
echo=###########################################
echo=#                WARNING                  #
echo=###########################################
echo.
echo=This will delete COOKIES and INTERNET HISTORY if you've never set up CCleaner
choice /c yn
goto %ERRORLEVEL%
:1
echo.
echo=Running Auto CCleaner
echo.
"C:\Program Files\CCleaner\CCleaner64.exe" /AUTO&pause
:2
echo.

::Reg Cleaner
echo=Open CCleaner?
choice /c yn
goto %ERRORLEVEL%
:1
echo.
echo=Opening CCleaner . . .
"C:\Program Files\CCleaner\CCleaner64.exe" /registry
:2
echo.

echo=------------------------------------------------------------
echo.

::Open GlaryU
echo=Open Glary 1 Click Maintenance?
choice /c yn
goto %ERRORLEVEL%
:1
echo.
echo=Opening Glary Utilities . . .
echo.
"C:\Program Files (x86)\Glary Utilities 5\OneClickMaintenance.exe"
:2
echo.

echo=------------------------------------------------------------
echo.

::Setup MB Prompt
echo=Setup Malwarebytes?
choice /c yn
goto %ERRORLEVEL%
:1
echo.
echo=Setting up Malwarebytes
echo.
echo=Finish Setup to continue . . .
start C:\Users\Public\Downloads\MBSetup.exe
:2
echo.

::Open MB Prompt
echo=Open Malwarebytes?
choice /c yn
goto %ERRORLEVEL%
:1
echo.
echo=Opening up Malwarebytes . . .
echo.
"C:\Program Files\Malwarebytes\Anti-Malware\mbam.exe"
:2
echo.

echo.
echo=------------------------------------------------------------
echo.

::Browser Extension Install
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& 'C:\1\Repository\PSAScript\PSAdmin(Extensions).cmd'";

echo.
echo=------------------------------------------------------------
echo.
