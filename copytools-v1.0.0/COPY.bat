@echo "Finds the target file to the specified directory(./���Ƴ����ļ�)"

%ע������%

@echo on
setlocal enabledelayedexpansion

set input_mac_listfiles=����ҵ�MAC��ַ.txt
set output_log_dir=���Ƴ����ļ�
set copytools=copytools-v1.0.0

if exist %output_log_dir% (
	rem  Ŀ¼.\���Ƴ����ļ� �Ѵ��ڣ����贴��
	echo Ŀ¼.\���Ƴ����ļ� �Ѵ��ڣ����贴��	
) else (
	rem  ����.\���Ƴ����ļ�
	echo ����%output_log_dir%
	md %output_log_dir%
)

REM ���/����Ŀ���ļ�(AllDestinationFiles)����
cd.>AllDestinationFiles
cd..
cd log*
dir /a:a /b /s .>./../%copytools%/AllDestinationFiles
cd..
cd %copytools%

::��ʾ�ȴ�
echo Please wait while searching...	

:: ���� /R ��ʾ��Ҫ�������ļ���,ȥ����ʾ���������ļ���
:: %%f ��һ������,�����ڵ�����,�����������ֻ����һ����ĸ���,ǰ�����%%
:: ��������ͨ���,����ָ����׺��,*.*��ʾ�����ļ�
for /f "tokens=* " %%c in ( %input_mac_listfiles% ) do (
	echo %%c

	for /f "delims=*" %%i in ('find /i "%%c" AllDestinationFiles') do (
        set var2=%%i
        echo %%i
		@echo N|xcopy "%%i" "%output_log_dir%"
	)
)
rem ɾ�� AllDestinationFiles�ļ�
del AllDestinationFiles

@echo Script execution complete
@pause