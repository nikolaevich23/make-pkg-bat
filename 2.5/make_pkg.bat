:: --------------------------------------- ::
:: Created mod by In1975 for site pspx.ru  ::
:: Modded by & rupor & ErikPshat           ::
:: --------------------------------------- ::
@echo off
set bt=MAKE PKG HAN TOOLS v2.5
TITLE -= %bt% =-= by PSPx Team =-
::
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

:: Делаем выбор между опциями.
:menu                                                                                                                                                                            
for /f %%i in ('%tls%\zenity --list --width=420 --height=300 --radiolist --title="%bt%. %OS% bit. Choose tools" --column="#" --column="#" --column="Description" TRUE 1 "Make DEBUG PKG - not signed" FALSE 2 "Make RETAIL PKG - signed debug" FALSE 3 "Try fix PSN PKG CFW (if game have update)" FALSE 4 "Make RIF PKG from act.dat & idps.hex & rap" FALSE 5 "Just sign PKG" FALSE 6 "Create list pkg and run hfs" FALSE 0 "Exit"') do goto %%i
if %ERRORLEVEL% == 0 goto :end                                                                                                                             
goto :eof
                                                                                           
:movepkg
if exist *.pkg (
%tls%\zenity --text-info --timeout=3 --title="%bt%. %OS% bit. Move File" --filename=%tls%\move.txt --height=187 --width=461
if not exist BACKUP md BACKUP
move *.pkg BACKUP >>log.txt
)
goto :eof

:makepkg
for /d %%d in (*) do (
if exist %%d\PARAM.SFO (
set str=%%d0000000
set dir=!str:~0,16!
set dir=!dir:-=0!
set dir=!dir:_=0!
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
rem for %%x in (B??S*) do echo its not PSN - NEED convert it with PS3GameConvert |%col% 09
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
for /f "tokens=1,2,3,4,5,6,7 delims=;" %%a in (%tls%\database) do (
if %%a==!title! (
echo TITLE_ID: %%a [%%c][%%d] %%b|%col% 0A
echo RAP NAME: %%f|%col% 0B
echo RAP DATA: %%g|%col% 09
echo.>RAPS\%%f
%tls%\sfk echo %%g +hextobin +setbytes RAPS\%%f 0 -yes || del /q RAPS\%%f && echo Deleted Fake RAP: %%f
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
set /p port=<port.ini
set hs=.\\tools\hfs.exe -c port=%port% .\\tools\PS3Xploit_files\ .\\tools\icons .\\tools\flags
for %%j in (*.pkg) do set hs=!hs! .\\%%j
echo Run Server... |%col% 05
start /B %hs%
goto :end

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