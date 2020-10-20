@echo off
echo -----
echo Step 1: Delete unneeded folders
echo -----
rmdir /S /Q "C:\$WinREAgent"
rmdir /S /Q "C:\$GetCurrent"

echo.
echo.
echo.

echo -----
echo Step 2: Delete 'Reboot', 'Reboot_AC', and 'Reboot_Battery' tasks
echo -----
del /S /Q "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot"
rmdir /S /Q "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot"
del /S /Q "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_AC"
rmdir /S /Q "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_AC"
del /S /Q "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_Battery"
rmdir /S /Q "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_Battery"

echo.
echo.
echo.

echo -----
echo Step 3: Delete 'Reboot', 'Reboot_AC', and 'Reboot_Battery' registry keys
echo -----
echo This part will need to be done manually. Please open regedit as adminstrator and delete the following keys:
echo.
echo - HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\Microsoft\Windows\UpdateOrchestrator\Reboot
echo - HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\Microsoft\Windows\UpdateOrchestrator\Reboot_AC
echo - HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\Microsoft\Windows\UpdateOrchestrator\Reboot_Battery
echo.
echo After deleting the above keys, please press any key to continue.
pause

echo.
echo.
echo.

echo -----
echo Step 4: Hold 'Reboot', 'Reboot_AC', and 'Reboot_Battery' hostage
echo -----
mkdir "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot"
icacls "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot" /setowner %username%
icacls "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot" /inheritance:r
icacls "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot" /grant %username%:F
mkdir "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_AC"
icacls "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_AC" /setowner %username%
icacls "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_AC" /inheritance:r
icacls "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_AC" /grant %username%:F
mkdir "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_Battery"
icacls "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_Battery" /setowner %username%
icacls "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_Battery" /inheritance:r
icacls "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot_Battery" /grant %username%:F
echo.
echo.
echo.
echo Press any key to exit.
pause >nul
exit /B