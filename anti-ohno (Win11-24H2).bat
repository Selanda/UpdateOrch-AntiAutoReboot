@echo off
echo ----
echo Step 0: Copy PsExec from Github to local temp directory
echo ----
bitsadmin.exe /transfer tempdownloadjob /download "https://github.com/Selanda/UpdateOrch-AntiAutoReboot/raw/main/PsExec.exe" "C:\Users\%username%\AppData\Local\Temp\PsExec.exe"

echo.
echo.
echo.

echo -----
echo Step 1: Delete unneeded folders (WinREAgent and GetCurrent)
echo -----
rmdir /S /Q "C:\$WinREAgent" 2>NUL
rmdir /S /Q "C:\$GetCurrent" 2>NUL

echo.
echo.
echo.

echo -----
echo Step 2: Delete 'Schedule Wake To Work' and 'Schedule Work' tasks
echo -----
del /S /Q "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Schedule Wake To Work"
del /S /Q "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Schedule Work"

echo.
echo.
echo.

echo -----
echo Step 3: Hold 'Schedule Wake To Work' and 'Schedule Work' hostage
echo -----
mkdir "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Schedule Wake To Work"
C:\Windows\System32\icacls.exe "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Schedule Wake To Work" /setowner %username%
C:\Windows\System32\icacls.exe "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Schedule Wake To Work" /inheritance:r
C:\Windows\System32\icacls.exe "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Schedule Wake To Work" /grant %username%:F
mkdir "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Schedule Work"
C:\Windows\System32\icacls.exe "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Schedule Work" /setowner %username%
C:\Windows\System32\icacls.exe "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Schedule Work" /inheritance:r
C:\Windows\System32\icacls.exe "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Schedule Work" /grant %username%:F

echo.
echo.
echo.


echo -----
echo Step 4: Disable 'Schedule Wake To Work', 'Schedule Work', 'Schedule Maintenance Work', and 'Maintenance Install' tasks
echo -----
C:\Users\%username%\AppData\Local\Temp\PsExec.exe -i -s cmd.exe /c schtasks /change /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Maintenance Work" /Disable
C:\Users\%username%\AppData\Local\Temp\PsExec.exe -i -s cmd.exe /c schtasks /change /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Wake To Work" /Disable
C:\Users\%username%\AppData\Local\Temp\PsExec.exe -i -s cmd.exe /c schtasks /change /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Work" /Disable
C:\Users\%username%\AppData\Local\Temp\PsExec.exe -i -s cmd.exe /c schtasks /change /TN "\Microsoft\Windows\UpdateOrchestrator\Maintenance Install" /Disable

echo.
echo.
echo.

echo ----
echo Step X: Cleaning up temp
echo ----
del /S /Q "C:\Users\%username%\AppData\Local\Temp\PsExec.exe"

echo Process complete. Press any key to exit.
pause >nul
exit /B
