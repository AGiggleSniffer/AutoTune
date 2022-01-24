#Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

reg add HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist /v 1 /t REG_SZ /d cjpalhdlnbpafiamejdnhcphjbkeiagm /f
pause