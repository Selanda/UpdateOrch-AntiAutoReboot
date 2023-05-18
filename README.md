# UpdateOrch-AntiAutoReboot
If you are running Windows 7 or an early build of Windows 10, please use either `anti-ohno.bat` with a copy of `PsExec.exe` in the same location, or use `Anti-OhNo.exe` which contains its own `PsExec.exe` copy within.

If you are running Windows 10 of 21H2 or newer build or any version of Windows 11, please use `anti-ohno (Win10-11).bat`. The updated version is configured to automatically download a copy of `PsExec.exe` from this respository into the Users' Local Temp directory for use and will remove the executable from Temp when completed.

These batch scripts forcefully break UpdateOrchestrator's ability to automatically restart Windows.

Regardless of which method you pick, batch files and executable need to be run as administrator to function properly. If this is the first time you've run this on your system, you will be prompted once by `PsExec.exe` to accept its licensing agreement when it is triggered for the first time during step 4.

**Please read the release notes prior to downloading the Anti-OhNo executible.**