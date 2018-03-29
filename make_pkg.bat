:: --------------------------------------- ::
:: Created mod by In1975 for site pspx.ru  ::
:: Modded by YChvanov & ErikPshat          ::
:: --------------------------------------- ::
@echo off
TITLE -= MAKE DEBUG RETAIL RIF PKG v1.8 =-= by PSPx Team =-
echo.
echo. =================================================================
echo. =                                                               =
echo. =                          --- ENG ---                          =
echo. =                                                               =
echo. =  Please, put to sign into this folder the following folders:  =
echo. =  (name of game folder specifies to name of directory on PS3)  =
echo. =                                                               =
echo. =                          --- RUS ---                          =
echo. =                                                               =
echo. =  Положите для подписывания в эту директорию следующие папки:  =
echo. =  (имя папки игры определяет имя директории установки на PS3)  =
echo. =                                                               =
echo. =================================================================
echo. =                                                               =
echo. =   ╔═══════════╦═══════════════╦═══════════════╦═══════════╗   =
echo. =   ║ BXXS12345 ║ BXXS12345GAME ║ BXXS12345DATA ║ NPXX12345 ║   =
echo. =   ╚═══════════╩═══════════════╬═══════════════╩═══════════╝   =
echo. =                               ║                               =
echo. =   containing folders ^& files  ║  содержащие папки и файлы     =
echo. =                                                               =
echo. =               USRDIR TROPDIR LICDIR C00 HTMLDIR               =
echo. =        EBOOT.BIN PARAM.SFO ICON0.PNG PIC0.PNG LIC.EDAT        =
echo. =        ICON1.PAM PARAM.HIP  PIC1.PNG PIC2.PNG SND0.AT3        =
echo. =                                                               =
echo. =================================================================
echo.
pause
cd /d %~dp0
setlocal enabledelayedexpansion

set OS=x64& if "%PROCESSOR_ARCHITECTURE%"=="x86" (
if not defined PROCESSOR_ARCHITEW6432 set OS=x86
)
echo ===========================================
echo Detected OS architecture - %OS% bit | nhcolor 0A
echo ===========================================

if exist *.pkg (
echo.
echo.There are old *.pkg files in the folder, do not forget to take them, move it to the folder BACKUP...|nhcolor 06
echo.В папке остались старые файлы *.pkg, не забывайте их забирать, перемещаем в папку BACKUP...|nhcolor 06
if not exist BACKUP md BACKUP
move *.pkg BACKUP
echo.
pause
)
:: Делаем выбор между DEBUG или RETAIL или RIF Generator.
echo.
echo. Making the choice between DEBUG or RETAIL or RIFGEN | nhcolor 0E
echo.
wsl menu.txt "Select an item between DEBUG or RETAIL or RIFGEN compiling..." $item "Select the required action:" /menu /cmdCenter /ontop /fs=12 /bg=#ffCC88 /fc=#440088 /hc=#CC0000 /hh=40
goto Action_%errorlevel%

:Action_1
echo.
for /d %%d in (*) do (
if exist %%d\PARAM.SFO (
set str=%%d0000000
set dir=!str:~0,16!
for /f "usebackq tokens=3" %%a in (`sfoprint "%%d\PARAM.SFO" TITLE_ID`) do set title=%%a
for /f "usebackq tokens=3" %%b in (`sfoprint "%%d\PARAM.SFO" CATEGORY`) do set cat=%%b
if !cat!==GD (
set ct=GameData
set pt=DiscGamePatch
)
if !cat!==HD (
set ct=GameExec
set pt=HDDGamePatch
)
if !cat!==HG (
set ct=GameExec
set pt=HDDGamePatch
)
if !cat!==DG (
set ct=GameExec
set pt=HDDGamePatch
)
if !cat!==AT (
set ct=GameExec
set pt=HDDGamePatch
)
echo Making DEBUG PKG... | nhcolor 0A
sfoprint "%%d\PARAM.SFO" TITLE | nhcolor 0E
sfoprint "%%d\PARAM.SFO" TITLE_ID | nhcolor 0B
echo FOLDER : %%d | nhcolor 09
echo ContentID = 000000-!title:~0,9!_00-!dir! > package.conf
echo Klicensee = 0x00000000000000000000000000000000 >> package.conf
echo DRMType = Free >> package.conf
echo ContentType = !ct! >> package.conf
echo PackageType = !pt! >> package.conf
echo InstallDirectory = %%d >> package.conf
echo PackageVersion = 01.00 >> package.conf
psn_package_npdrm -n -f package.conf %%d
del /q package.conf
)
)
goto end

:Action_3
echo.
for /d %%d in (*) do (
if exist %%d\PARAM.SFO (
set str=%%d0000000
set dir=!str:~0,16!
for /f "usebackq tokens=3" %%a in (`sfoprint "%%d\PARAM.SFO" TITLE_ID`) do set title=%%a
for /f "usebackq tokens=3" %%b in (`sfoprint "%%d\PARAM.SFO" CATEGORY`) do set cat=%%b
if !cat!==GD (
set ct=GameData
set pt=DiscGamePatch
)
if !cat!==HD (
set ct=GameExec
set pt=HDDGamePatch
)
if !cat!==HG (
set ct=GameExec
set pt=HDDGamePatch
)
if !cat!==DG (
set ct=GameExec
set pt=HDDGamePatch
)
if !cat!==AT (
set ct=GameExec
set pt=HDDGamePatch
)
echo Making DEBUG PKG... | nhcolor 0A
sfoprint "%%d\PARAM.SFO" TITLE | nhcolor 0E
sfoprint "%%d\PARAM.SFO" TITLE_ID | nhcolor 0B
echo FOLDER : %%d | nhcolor 09
echo ContentID = 000000-!title:~0,9!_00-!dir! > package.conf
echo Klicensee = 0x00000000000000000000000000000000 >> package.conf
echo DRMType = Free >> package.conf
echo ContentType = !ct! >> package.conf
echo PackageType = !pt! >> package.conf
echo InstallDirectory = %%d >> package.conf
echo PackageVersion = 01.00 >> package.conf
psn_package_npdrm -n -f package.conf %%d
echo Signing DEBUG PKG to RETAIL... | nhcolor 0A
sfoprint "%%d\PARAM.SFO" TITLE | nhcolor 0E
sfoprint "%%d\PARAM.SFO" TITLE_ID | nhcolor 0B
echo FOLDER : %%d | nhcolor 09
ps3xploit_rifgen_edatresign_!OS!_mod 000000-!title:~0,9!_00-!dir!.pkg ps3
echo.
del /q 000000-!title:~0,9!_00-!dir!.pkg package.conf
ren 000000-!title:~0,9!_00-!dir!.pkg_signed.pkg 000000-!title:~0,9!_00-!dir!_signed.pkg
)
)
goto end

:Action_5
:: Resign all rap files
:start
echo.
echo. =================================================================
echo. =                                                               =
echo. =                          --- ENG ---                          =
echo. =                                                               =
echo. =        Please paste the RAP file(s) to the RAPS folder        =
echo. =          And paste ACT.DAT ^& IDPS.HEX to this folder          =
echo. =                Then press any key to continue                 =
echo. =                                                               =
echo. =                          --- RUS ---                          =
echo. =                                                               =
echo. =         Пожалуйста, положите файл(ы) RAP в папку RAPS         =
echo. =  Не забудьте положить файл(ы) ACT.DAT и IDPS.HEX в эту папку  =
echo. =         Затем нажмите любую клавишу, чтобы продолжить         =
echo. =                                                               =
echo. =================================================================
echo.
pause
echo.
if not exist RAPS\*.rap (
if not exist RAPS md RAPS
wpt "Not found *.rap file(s) in RAPS folder!" "Please paste the *.rap file(s) to the RAPS folder, then click OK" Ok i
if exist RAPS\*.rap (
set rap=RAPS\*.rap
) else (
wpt "Not found RAP file(s) in RAPS folder" "Do you want to sign the RAP file(s) to RIF?^^Please paste the RAP file(s) to the RAPS folder.^And paste ACT.DAT & IDPS.HEX to this folder.^Then click Yes to continue or click No to exit." YesNo i
if errorlevel 2 goto end
if not exist RAPS\*.rap goto start
)
) else (
set rap=RAPS\*.rap
)
if exist exdata del /q exdata\*.*
if not exist exdata md exdata
echo Resigning RAP file(s) to RIF | nhcolor 0B
for %%I in (%rap%) do (
if exist RAPS\%%~nI.rif del RAPS\%%~nI.rif
ps3xploit_rifgen_edatresign_!OS!_mod %%I
move /y RAPS\%%~nI.rif exdata
echo.
)
echo Signing act.dat | nhcolor 0B
move /y signed_act.dat exdata\act.dat
echo.
set CID=RIF000-INSTALLER_00-MAKERETAILRIFPKG
echo Creating DEBUG PKG from RIF and ACT.DAT     please wait... | nhcolor 0B
make_package_license -c %CID% exdata %CID%.pkg
echo Creating RETAIL PKG from DEBUG PKG | nhcolor 0B
ps3xploit_rifgen_edatresign_!OS!_mod %CID%.pkg ps3
echo.
del /q %CID%.pkg exdata\*.* & rd /q exdata
ren %CID%.pkg_signed.pkg %CID%_signed.pkg

:Action_7
:end
echo DONE. | nhcolor 0A
del /q /a:h cyg_x??.dll make_package_license.exe menu.txt ps3xploit_rifgen_edatresign_x??_mod.exe psn_package_npdrm.exe sfoprint.exe wpt.exe wsl.exe
echo.
echo -------------------BIG thanks for PS3XPLOIT TEAM-------------------- | nhcolor 09
echo For HAN tools by W, escortd3w, bguerville, habib and Specialy Joonie | nhcolor 06
echo For RESIGNER ACT.DAT/RIF/ENC/EDAT/CONFIG PS2/PSX/PSP content for PS3 | nhcolor 0C
echo For PSPx Team for this utility: in1975, hexcsl, Alex_1985, ErikPshat | nhcolor 0D
echo -------------------------------------------------------------------- | nhcolor 09
echo.
pause
del /q /a:h make_pkg.bat nhcolor.exe
