@echo off
echo -----
echo Step 1: Delete unneeded folders (WinREAgent and GetCurrent)
echo -----
rmdir /S /Q "C:\$WinREAgent" 2>NUL
rmdir /S /Q "C:\$GetCurrent" 2>NUL

echo.
echo.
echo.

echo -----
echo Step 2: Delete 'Reboot', 'Reboot_AC', 'Reboot_Battery', & 'USO_UxBroker' tasks
echo -----
del /S /Q "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot"
rmdir /S /Q "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot"
del /S /Q "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_AC"
rmdir /S /Q "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_AC"
del /S /Q "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_Battery"
rmdir /S /Q "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_Battery"
del /S /Q "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker"
rmdir /S /Q "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker"

echo.
echo.
echo.

echo -----
echo Step 3: Hold 'Reboot', 'Reboot_AC', 'Reboot_Battery', & 'USO_UxBroker' hostage
echo -----
mkdir "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot"
C:\Windows\System32\icacls.exe "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot" /setowner %username%
C:\Windows\System32\icacls.exe "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot" /inheritance:r
C:\Windows\System32\icacls.exe "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot" /grant %username%:F
mkdir "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_AC"
C:\Windows\System32\icacls.exe "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_AC" /setowner %username%
C:\Windows\System32\icacls.exe "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_AC" /inheritance:r
C:\Windows\System32\icacls.exe "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_AC" /grant %username%:F
mkdir "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_Battery"
C:\Windows\System32\icacls.exe "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_Battery" /setowner %username%
C:\Windows\System32\icacls.exe "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_Battery" /inheritance:r
C:\Windows\System32\icacls.exe "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_Battery" /grant %username%:F
mkdir "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker"
C:\Windows\System32\icacls.exe "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker" /setowner %username%
C:\Windows\System32\icacls.exe "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker" /inheritance:r
C:\Windows\System32\icacls.exe "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker" /grant %username%:F

echo.
echo.
echo.


echo -----
echo Step 4: Delete 'Reboot', 'Reboot_AC', 'Reboot_Battery', & 'USO_UxBroker' registry keys
echo -----
echo This part will need to be done manually. Please open regedit as adminstrator and navigate to:
echo.
echo - HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\Microsoft\Windows\UpdateOrchestrator\
echo.
echo. Delete the following three keys (if present):
echo      Reboot
echo      Reboot_AC
echo      Reboot_Battery
echo	  USO_UxBroker
echo.
echo.
echo After deleting the above keys, please press any key to continue.
pause

echo.
echo.
echo.

echo Process complete. Press any key to exit.
pause >nul
exit /B