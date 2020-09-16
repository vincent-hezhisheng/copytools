@echo "Finds the target file to the specified directory(./复制出的文件)"

%注释内容%

@echo on
setlocal enabledelayedexpansion

set input_mac_listfiles=需查找的MAC地址.txt
set output_log_dir=复制出的文件
set copytools=copytools-v1.0.0

if exist %output_log_dir% (
	rem  目录.\复制出的文件 已存在，无需创建
	echo 目录.\复制出的文件 已存在，无需创建	
) else (
	rem  创建.\复制出的文件
	echo 创建%output_log_dir%
	md %output_log_dir%
)

REM 清除/创建目标文件(AllDestinationFiles)内容
cd.>AllDestinationFiles
cd..
cd log*
dir /a:a /b /s .>./../%copytools%/AllDestinationFiles
cd..
cd %copytools%

::提示等待
echo Please wait while searching...	

:: 参数 /R 表示需要遍历子文件夹,去掉表示不遍历子文件夹
:: %%f 是一个变量,类似于迭代器,但是这个变量只能由一个字母组成,前面带上%%
:: 括号中是通配符,可以指定后缀名,*.*表示所有文件
for /f "tokens=* " %%c in ( %input_mac_listfiles% ) do (
	echo %%c

	for /f "delims=*" %%i in ('find /i "%%c" AllDestinationFiles') do (
        set var2=%%i
        echo %%i
		@echo N|xcopy "%%i" "%output_log_dir%"
	)
)
rem 删除 AllDestinationFiles文件
del AllDestinationFiles

@echo Script execution complete
@pause