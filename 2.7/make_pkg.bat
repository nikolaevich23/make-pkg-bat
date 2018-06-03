:: --------------------------------------- ::
:: Created mod by In1975 for site pspx.ru  ::
:: Modded by & rupor & ErikPshat           ::
:: --------------------------------------- ::
@echo off
set bt=MAKE PKG HAN TOOLS v2.7
TITLE -= %bt% =-= by PSPx Team =-
::
chcp 1251 >NUL
rem for /f "tokens=*" %%B in (%sfxcmd%) do cd /d %%~dpB
setlocal enabledelayedexpansion
set tls=%cd%\tools
set col=%tls%\nhcolor
set conf=%tls%\package.conf
set OS=x64& if "%PROCESSOR_ARCHITECTURE%"=="x86" (
if not defined PROCESSOR_ARCHITEW6432 set OS=x86
)
Echo %TIME% -------------------------------- >log.txt
Echo %bt% -= by PSPx Team =- >>log.txt
Echo for site pspx.ru				>>log.txt
Echo %OS% bit. 					>>log.txt
Echo -------------------------------------------- >>log.txt
if exist %tls%\param.sfo del /q %tls%\param.sfo

:: Делаем выбор между опциями.
:menu                                                                                                                                                                            
for /f %%i in ('%tls%\zenity --list --width=375 --height=323 --radiolist --hide-column=2 --title="%bt%. %OS% bit. Choose tools." --column="#" --column="#" --column="Description" TRUE 1 "Make DEBUG PKG - not signed" FALSE 2 "Make RETAIL PKG - signed debug" FALSE 4 "Make RIF PKG from act.dat & idps.hex & rap" FALSE 3 "Try fix PSN PKG CFW (if game have update)" FALSE 7 "Convert Disc Game" FALSE 5 "Just sign PKG" FALSE 6 "Create pkg list and run hfs server" FALSE 0 "Exit"') do goto %%i
if %ERRORLEVEL% == 0 goto :end                                                                                                                             
goto :eof
                                                                                           
:movepkg
if exist *.pkg (
%tls%\zenity --text-info --timeout=3 --title="%bt%. %OS% bit. Move File" --filename=%tls%\move.txt --height=187 --width=461
if not exist BACKUP md BACKUP
move *.pkg BACKUP >>log.txt
)
goto :eof

:Case %1-var %2.option-L-or-U
if not Defined CaseA Call :FillSlovar
set word=!%~1!
if not Defined word Exit /B
set tempvar=
set /A n=-1
:newsymbol
set /A n+=1
set "symb=!word:~%n%,1!"
if "%symb%"=="" (Set "%~1=%tempvar%"& Exit /B)
if "!case%~2%symb%!"=="" (
  set "tempvar=%tempvar%%symb%"
) else (
  set "tempvar=%tempvar%!case%~2%symb%!"
)
goto :newsymbol
 
:FillSlovar
Set AlphabetL=abcdefghijklmnopqrstuvwxyz
Set AlphabetU=ABCDEFGHIJKLMNOPQRSTUVWXYZ
For /L %%C in (0,1,25) do (
  set caseU!AlphabetL:~%%C,1!=!AlphabetU:~%%C,1!
  set caseL!AlphabetU:~%%C,1!=!AlphabetL:~%%C,1!
)
Exit /B

:makepkg
for /d %%d in (*) do (
if exist %%d\PARAM.SFO (
set str=%%d0000000
set dir=!str:~0,16!
set dir=!dir:-=0!
set dir=!dir:_=0!
Call :Case dir U
echo !dir!
for /f "usebackq tokens=3" %%a in (`%tls%\sfoprint "%%d\PARAM.SFO" TITLE_ID`) do set title=%%a
for /f "usebackq tokens=3" %%b in (`%tls%\sfoprint "%%d\PARAM.SFO" CATEGORY`) do set cat=%%b
for /f "usebackq tokens=3" %%c in (`%tls%\sfoprint "%%d\PARAM.SFO" APP_VER`) do set apver=%%c 
if not defined apver set apver=1.00
if !cat!==GD (
set ct=GameData
set pt=DiscGamePatch
set n1=2PATCH
)
if !cat!==HD (
set ct=GameExec
set pt=HDDGamePatch
set n1=1HGAME
)
if !cat!==HG (
set ct=GameExec
set pt=HDDGamePatch
set n1=1HGAME
)
if !cat!==DG (
set ct=GameExec
set pt=HDDGamePatch
set n1=1DGAME
)
if !cat!==AT (
set ct=GameExec
set pt=HDDGamePatch
set n1=10AT00
)
%tls%\sfoprint "%%d\PARAM.SFO" TITLE |%col% 0E
%tls%\sfoprint "%%d\PARAM.SFO" TITLE_ID |%col% 0B
%tls%\sfoprint "%%d\PARAM.SFO" APP_VER |%col% 0B
echo FOLDER : %%d |%col% 09
echo Making DEBUG PKG. WAIT... |%col% 0A
echo ContentID = !n1!-!dir:~0,9!_00-!dir! > %conf%                                             
echo Klicensee = 0x00000000000000000000000000000000 >> %conf%
echo DRMType = Free >> %conf%
echo ContentType = !ct! >> %conf%
echo PackageType = !pt! >> %conf%
echo InstallDirectory = %%d >> %conf%
echo PackageVersion = !apver! >> %conf%
start %tls%\wbs "Creating DEBUG PKG..." "Please wait, the Debug PKG is being created..."  /marquee

cmd /c "%tls%\psn_package_npdrm.exe -n -f %conf% %%d" >>log.txt
%tls%\wbs "Creating DEBUG PKG..." "Done. Debug PKG created for $sec seconds" /Stop /timeout:3

del /q %conf%
)
)
goto :eof

:1
%tls%\zenity --text-info --filename=%tls%\make.txt --height=351 --width=461 --title="%bt%. %OS% bit. Info"
if %ERRORLEVEL% == 1 goto :end
call :movepkg
call :makepkg
goto :end

:2
%tls%\zenity --text-info --filename=%tls%\make.txt --height=351 --width=461 --title="%bt%. %OS% bit. Info"
if %ERRORLEVEL% == 1 goto :end
call :movepkg
call :makepkg
for %%I in (*.pkg) do (
echo Signing DEBUG PKG to RETAIL... |%col% 0A
echo %%I |%col% 09
echo | %tls%\ps3xploit_rifgen_edatresign %%I ps3 >>log.txt
echo.
ren %%~nI.pkg_signed.pkg %%~nI_sign.pkg >>log.txt
del /q %%I >>log.txt
)
goto :end

:3
if exist *.xml del /q *.xml
if exist %tls%\dwn.txt del /q %tls%\dwn.txt
for %%x in (*.pkg) do (
%tls%\PS3P_PKG_Ripper.exe -s param.sfo -o "%tls%" "%%x" >> log.txt 
if exist %tls%\PARAM.SFO (
for /f "usebackq tokens=3" %%s in (`%tls%\sfoprint "%tls%\PARAM.SFO" TITLE_ID`) do set title=%%s
%tls%\wget -C on -nc -O %tls%\ver.xml https://a0.ww.np.dl.playstation.net/tpl/np/!title!/!title!-ver.xml -o wget-log.txt
for /f "usebackq delims=" %%a in (`powershell -ex bypass %tls%\dwn.ps1 '%tls%'`) do echo.%%~a >%tls%\dwn.txt
set /p dst=<%tls%\dwn.txt
echo Downloading Patch for !title!        please wait...|%col% 09
%tls%\wget --input-file=%tls%\dwn.txt -C on -c -nc
find "File not found" < %tls%\dwn.txt && goto not_update 
)
if not defined dst (
:not_update
echo Not find game update. Sorry...|%col% 0B
)
)                                                                                                   
call :4
call :5
goto :end

:notfind
%tls%\zenity --error --text="Not find act.dat, idps.hex or *.pkg" --title="%bt%. %OS% bit. Not find file" --height=40 --width=320
goto end

:4
:: Resign all rap files
:start
if not exist act.dat goto :notfind
if not exist idps.hex goto :notfind
rem if not exist *.pkg goto :notfind
rem %tls%\zenity --text-info --filename=%tls%\rap.txt --height=351 --width=461 --title="%OS% bit. Info"
:: Create RAP from base
if not exist RAPS md RAPS
for %%x in (*.pkg) do (
%tls%\PS3P_PKG_Ripper.exe -s PARAM.SFO -o "%tls%" "%%x" >nul
if exist %tls%\PARAM.SFO (
for /f "usebackq tokens=3" %%s in (`%tls%\sfoprint "%tls%\PARAM.SFO" TITLE_ID`) do set title=%%s
for /f "tokens=1,2 delims=;" %%a in (%tls%\database_lite.txt) do (
set la=%%a
set la=!la:~7,9!
if !la!==!title! (
echo RAP NAME: %%a|%col% 0B
echo RAP DATA: %%b|%col% 09
echo.>RAPS\%%a
%tls%\sfk echo %%b +hextobin +setbytes RAPS\%%a 0 -yes >>log.txt

echo.
)
)
)
)
:: Resign
if exist RAPS\*.rap (
set rap=RAPS\*.rap
) else (
%tls%\zenity --error --text="Not find RAP in database" --title="%bt%. %OS% bit. Not find RAP" --height=40 --width=320
goto :end
)
if exist %tls%\exdata del /q %tls%\exdata\*.*
if not exist %tls%\exdata md %tls%\exdata
echo Resigning RAP file(s) to RIF|%col% 0B
for %%I in (%rap%) do (
if exist RAPS\%%~nI.rif del RAPS\%%~nI.rif
echo | %tls%\ps3xploit_rifgen_edatresign %%I >>log.txt
xcopy /y RAPS\%%~nI.rif %tls%\exdata >>log.txt && del /q RAPS\%%~nI.rif >>log.txt
echo.
)
:: Create package with rif and signed act.dat
echo Signing act.dat|%col% 0B
copy /y signed_act.dat %tls%\exdata\act.dat >>log.txt && del signed_act.dat >>log.txt
echo.
set CID=RIF000-INSTALLER_00-MAKERETAILRIFPKG
echo Creating DEBUG PKG from RIF and ACT.DAT     please wait...|%col% 0B
%tls%\make_package_license -c %CID% %tls%\exdata %CID%.pkg >>log.txt

%tls%\zenity --question --ok-label="YES" --cancel-label="NO" --text="Sign PKG?"
if %ERRORLEVEL% == 1 goto no
:yes
echo Creating RETAIL PKG from DEBUG PKG|%col% 0B
echo | %tls%\ps3xploit_rifgen_edatresign %CID%.pkg ps3 >>log.txt && del /q %CID%.pkg >>log.txt
echo.
ren %CID%.pkg_signed.pkg %CID%_signed.pkg >>log.txt
goto :eof
:no
goto :eof

:5
echo Signing PKG to RETAIL... |%col% 0A
if not exist *.pkg echo Not find PKG... Exit |%col% 0B
for %%I in (*.pkg) do (
echo | %tls%\ps3xploit_rifgen_edatresign %%I ps3 >>log.txt
ren %%~nI.pkg_signed.pkg %%~nI_sign.pkg >>log.txt
del /q %%I >>log.txt
)
goto :eof

:6
echo Create Pkg List... |%col% 0A
set curd=%cd%
package_link_maker.exe
cd %tls%
call :makepkg
call :5
move /Y %tls%\*.pkg %curd%\Package_List.pkg >>log.txt
cd %curd%
if exist port.ini (set /p port=<port.ini) else (set port=80)
set hs=.\\tools\hfs.exe -c port=%port% .\\tools\PS3Xploit_files\ .\\tools\icons .\\tools\flags
for %%j in (*.pkg) do set hs=!hs! .\\%%j
echo Run Server... |%col% 05
start /B %hs%
goto :end

:7
for /f %%i in ('%tls%\zenity --list --width=375 --height=323 --radiolist --hide-column=2 --title="%bt%. %OS% bit. Choose tools" --column="#" --column="#" --column="Description" TRUE 71 "ISO image" FALSE 72 "folder PS3_GAME" FALSE 0 "Exit"') do goto %%i
if %ERRORLEVEL% == 0 goto :end

:dwnl
if exist *.xml del /q *.xml
if exist %tls%\dwn.txt del /q %tls%\dwn.txt

%tls%\wget -C on -nc -O %tls%\ver.xml https://a0.ww.np.dl.playstation.net/tpl/np/!title!/!title!-ver.xml -o wget-log.txt
for /f "usebackq delims=" %%a in (`powershell -ex bypass %tls%\dwn.ps1 '%tls%'`) do echo.%%~a >>%tls%\dwn.txt
set /p dst=<%tls%\dwn.txt
echo Downloading Patch for !title!        please wait...|%col% 09
%tls%\wget --input-file=%tls%\dwn.txt -C on -c -nc
find "File not found" < %tls%\dwn.txt && goto :not_update 
goto :eof

:conv
set NAME=!title!

:directory
:: Создаем список файлов и каталогов папки USRDIR. Нужно для make_npdata
if %NAME:~0,2%==BL (
set DIRNAME=NP%NAME:~2,1%B%NAME:~4,5%
) else (
set DIRNAME=NP%NAME:~2,1%A%NAME:~4,5%
)
echo.
echo. Creating directory for Game: %DIRNAME%
echo.
md "%DEST%\%DIRNAME%"
md "%DEST%\%DIRNAME%\LICDIR"
md "%DEST%\%DIRNAME%\USRDIR"
xcopy /y "%PS3GAME%\TROPDIR" "%DEST%\%DIRNAME%\TROPDIR\" /e /i
xcopy /y "%PS3GAME%\USRDIR" "%DEST%\%DIRNAME%\USRDIR\" /t /e
xcopy /y "%PS3GAME%\USRDIR\*.sdat" "%DEST%\%DIRNAME%\USRDIR\" /e /i
xcopy /y "%PS3GAME%\USRDIR\*.edat" "%DEST%\%DIRNAME%\USRDIR\" /e /i
xcopy /y "%PS3GAME%\USRDIR\EBOOT*.BIN" "%DEST%\%DIRNAME%\USRDIR\"
xcopy /y "%PS3GAME%\*.*" "%DEST%\%DIRNAME%\"
echo.
echo. Creating directory for Patch: %NAME%
echo.
if exist "%DEST%\INSDIR" (
     ren "%DEST%\INSDIR" %NAME%
) else (
     ren "%DEST%\UPDATE" %NAME%
)
if exist "%DEST%\UPDATE" (
     xcopy /y "%DEST%\UPDATE" "%DEST%\%NAME%\" /e /i
     del /s /q "%DEST%\UPDATE\.*"
     rd /s /q "%DEST%\UPDATE"
)
echo. Creating listing files for sign:
echo.
dir /b /s /a:-d "%PS3GAME%\USRDIR\" > %temp%\temp.txt
type %temp%\temp.txt | findstr /i /v /c:".sdat" /c:".edat" /c:".BIN" > %temp%\list.txt
del %temp%\temp.txt
set infile=%temp%\list.txt
set find=%PS3GAME%\
set replace=
for /f "tokens=*" %%n in (%infile%) do (
set LINE=%%n
set TMPR=!LINE:%find%=%replace%!
echo !TMPR!>>%temp%\TMP.TXT
)
move /y %temp%\TMP.TXT %infile%

:: Создаём LIC.DAT
echo.
echo. Creating LIC.DAT:
echo.
%tls%\sfk partcopy %tls%\LIC.DAT 0x0 0x900 LIC.hash -yes
echo %NAME% > %temp%\1.tmp
%tls%\sfk partcopy %temp%\1.tmp 0x0 0x9 LIC.hash 0x801 -yes
%tls%\exf -osfv -otf %temp%\2.tmp -crc32 LIC.hash
type %temp%\2.tmp | findstr LIC.hash > %temp%\3.tmp
set /p str=<%temp%\3.tmp
set CRC32=%str:~9,8%
echo.%CRC32%>%temp%\4.tmp
%tls%\sfk filter %temp%\4.tmp +hextobin %temp%\5.tmp
%tls%\sfk partcopy %temp%\5.tmp 0x0 0x4 LIC.hash 0x20 -yes
copy %tls%\LIC.DAT LIC.DAT /y
%tls%\sfk partcopy LIC.hash 0x0 0x900 LIC.DAT 0x0 -yes
echo.
echo. Encrypting LIC.DAT to LIC.EDAT:
echo.
%tls%\sfk partcopy "%DEST%\%NAME%\USRDIR\EBOOT.BIN" 0x450 0x24 %temp%\6.tmp -yes
echo.
set /p contentID=<%temp%\6.tmp
set cID=%contentID:~0,7%%DIRNAME%%contentID:~16,20%
%tls%\make_npdata -e LIC.DAT "%DEST%\%DIRNAME%\LICDIR\LIC.EDAT" 1 1 3 0 16 3 00 %cID% 1 >>log.txt
echo. LIC.EDAT succesfully encripted.
echo.
del %temp%\*.tmp LIC.hash LIC.DAT/q

:: Конвертируем в sdat файлы из папки USRDIR
echo. Signing files to SDAT:
echo.
if not exist "%DEST%\PS3_GAME" (goto ps3_game)
for /f "tokens=*" %%B in (%infile%) do (
%tls%\make_npdata -e "%PS3GAME%\%%~B" "%DEST%\%DIRNAME%\%%~B" 0 1 3 0 16 && del /q "%PS3GAME%\%%~B"
)
goto next_step

:ps3_game
for /f "tokens=*" %%B in (%infile%) do (
%tls%\make_npdata -e "%PS3GAME%\%%~B" "%DEST%\%DIRNAME%\%%~B" 0 1 3 0 16 
)
:next_step
rem del /q /f %infile%

:: Копируем EBOOT.BIN из патча в папку USRDIR игры
echo. Copying EBOOT.BIN from the Patch to the Game:
xcopy /y "%DEST%\%NAME%\USRDIR\EBOOT*.BIN" "%DEST%\%DIRNAME%\USRDIR\"

:: Проверяем пустые папки
for /f "delims=" %%a in ('dir /ad/b/s "%DEST%\%DIRNAME%\USRDIR"') do dir/b "%%a"|>nul find/v "" || echo %NAME%>"%%a\%NAME%.txt"

:: Удаляем папку PS3_GAME от ISO-образа
rd /q /s %cd%\TEMP
goto :end

:check
if exist nofind.txt del /q nofind.txt
for /f "usebackq tokens=3" %%a in (`%tls%\sfoprint "!PS3GAME!\PARAM.SFO" TITLE_ID`) do set title=%%a
echo Find !title!. Check system file in !PS3GAME! |%col% 0D
call :dwnl
set UPGAME=%DEST%\UPDATE
for %%b in (*!title!*.pkg) do %tls%\PS3P_PKG_Ripper.exe -o !UPGAME! %%b 
findstr /M /B /S /C:"SCE" !PS3GAME!\*.BIN !PS3GAME!\*.SELF !PS3GAME!\*.SPRX >list.txt
findstr /M /B /S /C:"SCE" !UPGAME!\*.BIN !UPGAME!\*.SELF !UPGAME!\*.SPRX >ulist.txt
for /f "tokens=*" %%a in (list.txt) do (
call :nm %%a
set var=!file_name!!file_ext!
findstr /i /c:"!var!" ulist.txt >nul || echo !var! >> nofind.txt
)
goto :mn

:nm
set file_ext=%~x1
set file_name=%~n1
exit /b

:mn
if exist nofind.txt %tls%\zenity --text-info --title="%bt%. %OS% bit. No find this file in path! Exit or Try convert ?" --filename=nofind.txt --height=400 --width=510 --ok-label="Try convert" --cancel-label="Exit"
if %ERRORLEVEL% == 0 goto :conv
if %ERRORLEVEL% == 1 goto :end
goto :end

:71
for /f %%i in ('%tls%\zenity --file-selection --title="Select a ISO-File" --file-filter="*.iso"') do set iso=%%i
rem for /f %%i in ('%tls%\zenity --file-selection --title="Select Destination folder" --directory') do set DEST=%%i
Set PS3GAME=%cd%\TEMP\
set DEST=%CD%
echo Extract !iso! to !PS3GAME!... Wait! |%col% 0B
%tls%\extractps3iso !ISO! !PS3GAME! 
Set PS3GAME=%cd%\TEMP\PS3_GAME
goto :check

:72
for /f %%i in ('%tls%\zenity --file-selection --title="Select folder PS3_GAME" --directory') do set PS3GAME=%%i
set DEST=%CD%
goto :check

:0
:end
echo -= DONE =- >>log.txt
Echo %TIME% -------------------------------- >>log.txt
echo			-= DONE =- |%col% 0A 
%tls%\zenity --text-info --timeout=3 --title="%bt%. %OS% bit. END" --filename=%tls%\end.txt --height=227 --width=500
echo.
echo -------------------BIG thanks for PS3XPLOIT TEAM-------------------- |%col% 09
echo For HAN tools by W, escortd3w, bguerville, habib and Specialy Joonie |%col% 06
echo For RESIGNER ACT.DAT/RIF/ENC/EDAT/CONFIG PS2/PSX/PSP content for PS3 |%col% 03
echo For PSPx Team for this utility: in1975, hexcsl, Alex_1985, ErikPshat |%col% 0D
echo -------------------------------------------------------------------- |%col% 09
echo.
rem rd /q /s %tls%