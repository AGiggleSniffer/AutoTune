@echo off

::This code block detects if the script is being running with admin PRIVILEGES If it isn't it pauses and then quits
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    ECHO Administrator PRIVILEGES Detected! 
) ELSE (
   echo ######## ########  ########   #######  ########  
   echo ##       ##     ## ##     ## ##     ## ##     ## 
   echo ##       ##     ## ##     ## ##     ## ##     ## 
   echo ######   ########  ########  ##     ## ########  
   echo ##       ##   ##   ##   ##   ##     ## ##   ##   
   echo ##       ##    ##  ##    ##  ##     ## ##    ##  
   echo ######## ##     ## ##     ##  #######  ##     ## 
   echo.
   echo.
   echo ############# ERROR: ADMINISTRATOR PRIVILEGES REQUIRED ################
   echo # This script must be run as administrator to work properly!          #
   echo # Please right click on the script and select "Run As Administrator". #
   echo #######################################################################
   echo.
   PAUSE
   EXIT /B 1
)

echo.
echo=------------------------------------------------------------
echo.

::For Troubleshooting & Setup
:: - FilePath
echo=File Path
ECHO:%PATH:;= & ECHO:%
echo.

:: Set script directory so it can be used from anywhere
SET ThisScriptsDirectory=%~dp0
SET PSS-DI-Path=%ThisScriptsDirectory%Repository\PSAScript\DiskInfo.ps1
SET PSS-DI2-Path=%ThisScriptsDirectory%Repository\PSAScript\DiskInfo2.ps1
SET PSS-ST-Path=%ThisScriptsDirectory%Repository\PSAScript\SetupTools.ps1
SET PSS-BE-Path=%ThisScriptsDirectory%Repository\PSAScript\BrowserExtensions.ps1

echo=------------------------------------------------------------

::Asset Profile
:: - Host Name + OS + RAM
echo.
systeminfo | findstr /b /c:"Host Name" /c:"OS Version" /c:"Total Physical Memory" /c:"System Manufacturer" /c:"System Model"
echo.

:: - Serial Number
wmic bios get serialnumber

:: - GPU Name
echo=GPU
wmic path win32_VideoController get name

:: - CPU Name
echo=CPU
wmic cpu get name

echo=------------------------------------------------------------
echo.

:: - Disk Info
echo=Disk Info:
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PSS-DI-Path%'";
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PSS-DI2-Path%'";

echo=------------------------------------------------------------

:: - Mac Address
getmac

echo.
echo=------------------------------------------------------------
echo.

::DISM/SFC scan
echo=Start System File Checker?
choice /c yn
goto %ERRORLEVEL%
:1
echo.
echo=Starting System File Checker . . .
start cmd.exe /k "dism /online /cleanup-image /restorehealth&sfc /scannow"
:2
echo.

echo=------------------------------------------------------------
echo.



::Install Prompt
echo=Download and Install Latest Tools?
choice /c yn
goto %ERRORLEVEL%
:1
echo.
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PSS-ST-Path%'";
echo=Installing CCleaner . . .
C:\Users\Public\Downloads\CCSetup.exe /S
echo=Install Complete!
echo.
echo=Installing Glary Utilities . . .
C:\Users\Public\Downloads\GlarySetup.exe /S
echo=Install Complete!
echo.
echo=Installing Malwarebytes . . .
C:\Users\Public\Downloads\MBSetup.exe /Silent
echo=Install Complete!
echo.
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
start cmd.exe /k "C:\Users\Public\Downloads\ADWCleaner.exe" /eula /clean /noreboot
:2
echo.

::Open Malwarebytes
echo=Open Malwarebytes?
choice /c yn
goto %ERRORLEVEL%
:1
echo.
echo=Opening Malwarebytes . . .
start /b cmd.exe /c "C:\Program Files\Malwarebytes\Anti-Malware\mbam.exe"
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
start cmd.exe /k "C:\Program Files\CCleaner\CCleaner64.exe" /AUTO&pause
:2
echo.

::Reg Cleaner
echo=Open CCleaner?
choice /c yn
goto %ERRORLEVEL%
:1
echo.
echo=Opening CCleaner . . .
start /b cmd.exe /c "C:\Program Files\CCleaner\CCleaner64.exe" /registry
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
start /b cmd.exe /c "C:\Program Files (x86)\Glary Utilities 5\OneClickMaintenance.exe"
:2
echo.

echo=------------------------------------------------------------
echo.

::Install Browser Extensions
echo=Install Browser Extensions?
choice /c yn
goto %ERRORLEVEL%
:1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PSS-BE-Path%'";
:2
echo.

echo.
echo=------------------------------------------------------------
echo.

pause
