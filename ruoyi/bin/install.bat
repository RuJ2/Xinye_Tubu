@echo off
# 获取java环境变量 
set JAVA_HOME=%JAVA_HOME%
echo %JAVA_HOME%
# 替换java路径
setlocal enabledelayedexpansion
set file=%cd%\lims.xml
set file_tmp=%cd%\lims_tmp.xml
set source=JAVAHOME
set replaced=%JAVA_HOME%\bin\java

for /f "delims=" %%i in (%file%) do (
    set str=%%i
        set "str=!str:%source%=%replaced%!"
        echo !str!>>%file_tmp%
)
move "%file_tmp%" "%file%"
# 注册并启动服务
MyServer.exe uninstall
MyServer.exe install
MyServer.exe start
EXIT 