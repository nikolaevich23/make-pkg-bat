@echo off
for /d %%d in (*) do (
rem echo Name of folder: %%d
IF EXIST %%d\PARAM.SFO (
tool\sfoprint "%%d\PARAM.SFO" TITLE_ID >> game.txt
set /p title=<game.txt
tool\sfoprint "%%d\PARAM.SFO" CATEGORY >> game.txt
set /p cat=<game.txt
tool\sfoprint "%%d\PARAM.SFO" BOOTABLE >> game.txt
set /p boot=<game.txt
rem tool\sfk partcopy titleid.txt 0x0B 0x9 title.txt -yes
REM set /p NAME=<title.txt
echo %title% %cat% %boot%
)
)