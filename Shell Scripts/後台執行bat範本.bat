@echo off 
if "%1" == "h" goto begin 
mshta vbscript:createobject("wscript.shell").run("%~nx0 h",0)(window.close)&&exit 
:: 在begin處放上執行程式碼
:begin
echo 操作順利完成
pause