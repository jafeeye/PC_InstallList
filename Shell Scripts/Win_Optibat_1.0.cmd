@echo off

:: BatchGotAdmin (Run as Admin code starts)
REM --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
echo 取得系統管理員權限...
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"
:: BatchGotAdmin (Run as Admin code ends)
:: Your codes should start from the following line

echo *************************************
echo *                                   * 
echo *                                   * 
echo *   Windows    Opti Script          * 
echo *                                   * 
echo *                                   *
echo *                                   * 
echo *                                   * 
echo *   2022.07.03                      * 
echo *                                   * 
echo *************************************

:MENU
echo 1 - "優化"
echo 2 - "離開"
echo 3 - "啟用.Net 3.5"
echo 4 - "自訂排程工作"

set /P var="Please select a numaber : "
if %var% == 1 goto :install_all
if %var% == 2 goto :dev_exit
if %var% == 3 goto :install_net3.5
if %var% == 4 goto :install_task

:install_all
::1.刪除相容性遙測
schtasks /delete /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /F
schtasks /delete /TN "\Microsoft\Windows\Application Experience\PcaPatchDbTask" /F
schtasks /delete /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /F
schtasks /delete /TN "\Microsoft\Windows\Application Experience\StartupAppTask" /F
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "Allow Telemetry" /d 0 /t REG_DWORD /f
::2.Microsoft 客戶經驗改進計畫
schtasks /delete /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /F
schtasks /delete /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /F
::3.停用多餘服務
::Connected User Experiences and Telemetry Service
sc stop "DiagTrack" && sc config "DiagTrack" start= disabled
::4.停用系統還原
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v DisableSR /t reg_dword /d 00000001 /F
schtasks /delete /TN "\Microsoft\Windows\SystemRestore\SR" /F
::5.工作排成新增MountVHD 與 TrafficMointor
schtasks /create /tn "Auto-Mount VHD" /tr "PowerShell Mount-DiskImage -ImagePath 'C:\PortableFiles\VHD\AppTools_2022.07.03.vhd'" /sc onstart /RL HIGHEST /RU System
schtasks /create /tn "TrafficeMointor" /tr "C:\PortableFiles\TrafficMonitor_V1.83_x64\TrafficMonitor\TrafficMonitor.exe" /sc onlogon /RL HIGHEST
::6.Copy++設定檔
copy %~dp0Settings.xml "%APPDATA%\Open with++"
::7.啟用_net3.5
dism /online /enable-feature /featurename:NetFx3
::8.停用錯誤報告
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /d 1 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /d 0 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
pause
exit

:install_net3.5
dism /online /enable-feature /featurename:NetFx3
pause
exit


:install_task
schtasks /create /tn "Auto-MountVHD" /tr "PowerShell Mount-DiskImage -ImagePath 'C:\PortableFiles\VHD\AppTools_2022.07.03.vhd'" /sc onstart /RL HIGHEST /RU System
schtasks /create /tn "SmartToolsLauncher" /tr "C:\PortableFiles\TrafficMonitor_V1.83_x64\TrafficMonitor\TrafficMonitor.exe" /sc onlogon /RL HIGHEST



:dev_exit
exit
