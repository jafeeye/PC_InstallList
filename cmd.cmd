@echo off & setlocal
::關閉服務
sc stop "wuauserv" && sc config "wuauserv" start= disabled
sc stop "BITS" && sc config "BITS" start= disabled
sc stop "wsearch" && sc config "wsearch" start= disabled
sc stop "sysmain" && sc config "sysmain" start= disabled

::刪除排程
schtasks /delete /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /F
schtasks /delete /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /F

::啟用傳統圖片檢視器
sc sdset WinDefend [CC LC SW RP LO CR RC]