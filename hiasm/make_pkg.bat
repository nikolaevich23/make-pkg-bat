:: --------------------------------------- ::
:: Created mod by In1975 for site pspx.ru  ::
:: Modded by & rupor & ErikPshat           ::
:: --------------------------------------- ::
@echo off
set bt=MAKE PKG HAN TOOLS v3.0
TITLE -= %bt% =-= by PSPx Team =-
::
:: chcp 1251 >NUL
setlocal enabledelayedexpansion
set tls=%cd%\tools
set ts=.\tools\
set conf=!ts!package.conf
set curd=%cd%
for /f "tokens=1,2 delims==" %%a in (config.ini) do (
set nm=%%a
if !nm!==4 set logs=%%b
if !logs!==4 (
Echo.
set logs=%cd%\log.txt
echo "Log on - %cd%\log.txt"
)
if !logs!==Off (set logs=nul)
)
set OS=x64& if "%PROCESSOR_ARCHITECTURE%"=="x86" (
if not defined PROCESSOR_ARCHITEW6432 set OS=x86
)
Echo.
Echo %TIME% -------------------------------- >!logs!
Echo %bt% -= by PSPx Team =- >>!logs!
Echo for site pspx.ru				>>!logs!
Echo %OS% bit. Run from: "%CD%"			>>!logs!
Echo -------------------------------------------- >>!logs!
if exist .\tools\param.sfo del /q .\tools\param.sfo

:: Делаем выбор между опциями.
:menu   
goto %1
if !ERRORLEVEL!==1 goto 0                                                                                                                             
goto :eof
                                                                                          
:movepkg
if exist *.pkg (
if not exist BACKUP md BACKUP
move *.pkg BACKUP >>!logs!
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
Set AlphabetL=abcdefghijklmnopqrstuvwxyz !"#$%&()*+,-/;<>?[\]^_„†‡‰•–™Ўў¤¦§Ё©Є¬Ї°µ¶·ё№є~+-`'©®
Set AlphabetU=ABCDEFGHIJKLMNOPQRSTUVWXYZ000000000000000000000000000000000000000000000000000000
For /L %%C in (0,1,80) do (
  set caseU!AlphabetL:~%%C,1!=!AlphabetU:~%%C,1!
  set caseL!AlphabetU:~%%C,1!=!AlphabetL:~%%C,1!
)
Exit /B

:makepkg
for /d %%d in (*) do (
if exist "%%d\PARAM.SFO" (
set str=%%d000000000000000
set dir=!str:~0,16!
set dir=!dir::=0!
Call :Case dir U
for /f "usebackq tokens=3" %%a in (`!ts!sfoprint "%%d\PARAM.SFO" TITLE_ID`) do set title=%%a
for /f "usebackq tokens=3" %%b in (`!ts!sfoprint "%%d\PARAM.SFO" CATEGORY`) do set cat=%%b
for /f "usebackq tokens=3" %%c in (`!ts!sfoprint "%%d\PARAM.SFO" APP_VER`) do set apver=%%c 
for /f "usebackq tokens=3" %%s in (`!ts!sfoprint "%%d\PARAM.SFO" TITLE`) do set tname=%%s
set "tname=!tname!0%%d000000000000000"
set tname=!tname:~0,16!
set tname=!tname::=0!
set tname=!tname:.=0!
Call :Case tname U
if not defined apver set apver=1.00
Set DRM=Free
set n1=00ELSE
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
if !cat!==1P (
set DRM=Local
set ct=PS1Game
set tid=!title!
set pt=
set n1=1PS1GM
)
if !cat!==MN (
set DRM=Local
set ct=minis
set tid=!title!
set pt=
set n1=10MINI
)
!ts!sfoprint "%%d\PARAM.SFO" TITLE 
echo.
!ts!sfoprint "%%d\PARAM.SFO" TITLE_ID 
!ts!sfoprint "%%d\PARAM.SFO" APP_VER 
echo FOLDER : %%d 
echo Making DEBUG PKG. WAIT... 
echo ContentID = !n1!-!dir:~0,9!_00-!tname! > %conf%                                             
echo Klicensee = 0x00000000000000000000000000000000 >> %conf%
echo DRMType = !DRM! >> %conf%
echo ContentType = !ct! >> %conf%
if Defined tid echo TitleID = !tid! >> %conf%
if Defined pt echo PackageType = !pt! >> %conf%
echo InstallDirectory = %%d >> %conf%
echo PackageVersion = !apver! >> %conf%
echo "Creating DEBUG PKG..." "Please wait, the Debug PKG is being created..."  

!ts!psn_package_npdrm.exe -n -f %conf% %%d >>!logs!
if !ERRORLEVEL! NEQ 0 (
set tname=CHANGENAME000000
echo CHANGE ContentID = !n1!-!title:~0,9!_00-!tname! 
echo FOLDER : %%d 
echo Making DEBUG PKG. WAIT... 
echo ContentID = !n1!-!dir:~0,9!_00-!tname! > %conf%                                             
echo Klicensee = 0x00000000000000000000000000000000 >> %conf%
echo DRMType = !DRM! >> %conf%
echo ContentType = !ct! >> %conf%
if Defined tid echo TitleID = !tid! >> %conf%
if Defined pt echo PackageType = !pt! >> %conf%
echo InstallDirectory = %%d >> %conf%
echo PackageVersion = !apver! >> %conf%
echo "Creating DEBUG PKG..." "Please wait, the Debug PKG is being created..." 
!ts!psn_package_npdrm.exe -n -f %conf% %%d >>!logs!
)

echo "Creating DEBUG PKG..." "Done. Debug PKG created"
echo.
del /q %conf%
)
)
goto :eof

:1
rem call :movepkg
call :makepkg
goto 0

:2
rem call :movepkg
call :makepkg
for %%I in (*.pkg) do (
echo Signing DEBUG PKG to RETAIL... 
echo %%I 
echo | !ts!ps3xploit_rifgen_edatresign %%I ps3 >>!logs!
echo.
ren %%~nI.pkg_signed.pkg %%~nI_sign.pkg >>!logs!
del /q %%I >>!logs!
)
goto :0

:3
if exist *.xml del /q *.xml
if exist !ts!dwn.txt del /q !ts!dwn.txt
for %%x in (*.pkg) do (
!ts!PS3P_PKG_Ripper.exe -s param.sfo -o "!ts!" "%%x" >> log.txt 
if exist !ts!PARAM.SFO (
for /f "usebackq tokens=3" %%s in (`!ts!sfoprint "!ts!PARAM.SFO" TITLE_ID`) do set title=%%s
!ts!wget -C on -nc -nv -O !ts!ver.xml https://a0.ww.np.dl.playstation.net/tpl/np/!title!/!title!-ver.xml -o wget-log.txt
set /p dst=<!ts!ver.xml
if not defined dst (
echo Not find game update. Sorry...
goto :not_update
)
pushd "%tls%"
for /f "usebackq delims=" %%a in (`powershell -ex bypass .\dwn.ps1 '.'`) do echo.%%~a >>dwn.txt
popd
echo Downloading Patch for !title!        please wait...
!ts!wget --input-file=!ts!dwn.txt -C on -c -nc -b --progress=dot
find "File not found" < !ts!dwn.txt && goto not_update
)
)                                                                                                   
call :4
call :5
goto 0

:notfind
echo Not find act.dat, idps.hex or *.pkg
goto 0

:4
:: Resign all rap files
:start
if not exist act.dat goto :notfind
if not exist idps.hex goto :notfind
:: Create RAP from base
if not exist RAPS md RAPS
for %%x in (*.pkg) do (
!ts!PS3P_PKG_Ripper.exe -s PARAM.SFO -o "!ts!" "%%x" >nul
if exist !ts!PARAM.SFO (
for /f "usebackq tokens=3" %%s in (`!ts!sfoprint "!ts!PARAM.SFO" TITLE_ID`) do set title=%%s
for /f "tokens=1,2 delims=;" %%a in (!ts!database_lite.txt) do (
set la=%%a
set la=!la:~7,9!
if !la!==!title! (
echo RAP NAME: %%a
echo RAP DATA: %%b
echo.>RAPS\%%a
!ts!sfk echo %%b +hextobin +setbytes RAPS\%%a 0 -yes >>!logs!

echo.
)
)
)
)
:: Resign
if exist RAPS\*.rap (
set rap=RAPS\*.rap
) else (
echo Not find RAP in database
goto 0
)
if exist !ts!exdata del /q !ts!exdata\*.*
if not exist !ts!exdata md !ts!exdata
echo Resigning RAP file(s) to RIF
for %%I in (%rap%) do (
if exist RAPS\%%~nI.rif del RAPS\%%~nI.rif
echo | !ts!ps3xploit_rifgen_edatresign %%I > nul
echo Convert %%I
xcopy /y RAPS\%%~nI.rif !ts!exdata >>!logs! && del /q RAPS\%%~nI.rif >>!logs!
echo.
)
:: Create package with rif and signed act.dat
echo Signing act.dat
copy /y signed_act.dat !ts!exdata\act.dat >>!logs! && del signed_act.dat >>!logs!
echo.
set CID=RIF000-INSTALLER_00-MAKERETAILRIFPKG
echo Creating DEBUG PKG from RIF and ACT.DAT     please wait...
!ts!make_package_license -c %CID% !ts!exdata %CID%.pkg >>!logs!
echo			 DONE 
goto :eof

:5
echo Signing PKG to RETAIL... 
if not exist *.pkg echo Not find PKG... Exit 
for %%I in (*.pkg) do (
set tmpname=%%~nI
echo | !ts!ps3xploit_rifgen_edatresign "%%I" ps3 >>!logs!
set "tmp2=!tmpname: =-!"
ren "!tmpname!.pkg_signed.pkg" "!tmp2!_sign.pkg" >>!logs!
del /q "!tmpname!.pkg" >>!logs!
)
echo			DONE
goto :eof

:6
set name=Language
for /f "tokens=1,2 delims==" %%a in (config.ini) do (
set nm=%%a
if !nm!==!name! set lng=%%b
)
set pklm=package_link_maker_!lng!.exe  

:63
del /q ".\Package_List*.pkg"
start /B .\tools\hfs.exe -q
echo Create Pkg List... 
echo run %pklm%
%pklm%
cd "%tls%"
set ts=.\
set conf=!ts!package.conf
call :makepkg
call :5
move /Y *.pkg "%curd%\Package_List.pkg" >>!logs!
cd %curd%

set name=Host
set prt=port
for /f "tokens=1,2 delims==" %%a in (config.ini) do (
set nm=%%a
if !nm!==!name! set ips=%%b
if !nm!==!prt! set port=%%b
)
set hs=.\\tools\hfs.exe -c ip=%ips%\nport=%port% .\\tools\PS3Xploit_files\ .\\tools\icons .\\tools\flags
for %%j in (*.pkg) do set hs=!hs! .\\%%j
echo Run Server... 
start /B %hs%
goto 0

:dwnl
set dst=
::for /f "usebackq tokens=*" %%S in (`!ts!sfoprint "!ts!PARAM.SFO" TITLE`) do set tname=%%S
::set tname=!tname:~8,60!
if exist !ts!*.xml del /q !ts!*.xml
if exist "%tls%\dwn.txt" del /q "%tls%\dwn.txt"
echo Check path for !title! 
::!tname!
echo ==============================================
!ts!wget -C on -nc -nv -O !ts!ver.xml https://a0.ww.np.dl.playstation.net/tpl/np/!title!/!title!-ver.xml
set /p dst=<!ts!ver.xml
if not Defined dst (
:not_update
echo Not find game update. Sorry... 
set flag=0
goto :fl 
)
pushd "%tls%"
for /f "usebackq delims=" %%a in (`powershell -ex bypass .\dwn.ps1 '.'`) do echo.%%~a >>dwn.txt
popd
:fl
if %flag%==0 (
if Defined dst echo Find path for !title!:
type !ts!dwn.txt
echo ==============================================
goto 0
)
!ts!wget --input-file=!ts!dwn.txt -C on -c -nc
find "File not found" < !ts!dwn.txt && goto :not_update 
goto :eof

:conv
set NAME=!title!
if %flag%==0 exit

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
type %temp%\temp.txt | findstr /i /v /c:".sdat" /c:".edat" /c:"EBOOT.BIN" /c:"EBOOT*.BIN" > %temp%\list.txt
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
%ts%sfk partcopy %ts%LIC.DAT 0x0 0x900 LIC.hash -yes
echo %NAME% > %temp%\1.tmp
%ts%sfk partcopy %temp%\1.tmp 0x0 0x9 LIC.hash 0x801 -yes
%ts%exf -osfv -otf %temp%\2.tmp -crc32 LIC.hash
type %temp%\2.tmp | findstr LIC.hash > %temp%\3.tmp
set /p str=<%temp%\3.tmp
set CRC32=%str:~9,8%
echo.%CRC32%>%temp%\4.tmp
%ts%sfk filter %temp%\4.tmp +hextobin %temp%\5.tmp
%ts%sfk partcopy %temp%\5.tmp 0x0 0x4 LIC.hash 0x20 -yes
copy %ts%LIC.DAT LIC.DAT /y
%ts%sfk partcopy LIC.hash 0x0 0x900 LIC.DAT 0x0 -yes
echo.
echo. Encrypting LIC.DAT to LIC.EDAT:
echo.
%ts%sfk partcopy "%DEST%\%NAME%\USRDIR\EBOOT.BIN" 0x450 0x24 %temp%\6.tmp -yes
echo.
set /p contentID=<%temp%\6.tmp
set cID=%contentID:~0,7%%DIRNAME%%contentID:~16,20%
%ts%make_npdata -e LIC.DAT "%DEST%\%DIRNAME%\LICDIR\LIC.EDAT" 1 1 3 0 16 3 00 %cID% 1 >>!logs!
echo. LIC.EDAT succesfully encripted.
echo.
del %temp%\*.tmp LIC.hash LIC.DAT/q

:: Конвертируем в sdat файлы из папки USRDIR
echo. Signing files to SDAT:
echo.
if not exist "%DEST%\PS3_GAME" (goto ps3_game)
for /f "tokens=*" %%B in (%infile%) do (
!ts!make_npdata -e "%PS3GAME%\%%~B" "%DEST%\%DIRNAME%\%%~B" 0 1 3 0 16 && del /q "%PS3GAME%\%%~B"
)
goto next_step

:ps3_game
for /f "tokens=*" %%B in (%infile%) do (
!ts!make_npdata -e "%PS3GAME%\%%~B" "%DEST%\%DIRNAME%\%%~B" 0 1 3 0 16 
)
:next_step
del /q /f %infile%

:: Копируем EBOOT.BIN из патча в папку USRDIR игры
echo. Copying EBOOT.BIN from the Patch to the Game:
xcopy /y "%DEST%\%NAME%\USRDIR\EBOOT*.BIN" "%DEST%\%DIRNAME%\USRDIR\"

:: Проверяем пустые папки
for /f "delims=" %%a in ('dir /ad/b/s "%DEST%\%DIRNAME%\USRDIR"') do dir/b "%%a"|>nul find/v "" || echo %NAME%>"%%a\%NAME%.txt"

:: Удаляем папку PS3_GAME от ISO-образа
if exist "%cd%\TEMP" rd /q /s "%cd%\TEMP"
goto :0

:check
if exist nofind.txt del /q nofind.txt
if not exist "!PS3GAME!\PARAM.SFO" (
echo "!PS3GAME!\PARAM.SFO" not find - please check path.
where /F /R !PS3GAME! PARAM.SFO 
goto 0
)
for /f "usebackq tokens=3" %%a in (`!ts!sfoprint "!PS3GAME!\PARAM.SFO" TITLE_ID`) do set title=%%a
echo Find !title!. Check system file in !PS3GAME! 
call :dwnl
set UPGAME=%DEST%\UPDATE
for %%b in (*!title!*.pkg) do !ts!PS3P_PKG_Ripper.exe -o "!UPGAME!" %%b 
!ts!sfk xhexfind -pat "/\x53\x43\x45\x00[0.4 bytes]\x00\x00\x00/" -names -dir "!PS3GAME!" -file .bin .self .sprx +tofile list.txt
FOR /F "usebackq delims= eol=" %%I IN (list.txt) DO echo "%%I" >>list2.txt
del list.txt 
ren list2.txt list.txt 
!ts!sfk xhexfind -pat "/\x53\x43\x45\x00[0.4 bytes]\x00\x00\x00/" -names -dir "!UPGAME!" -file .bin .self .sprx +tofile ulist.txt
FOR /F "usebackq delims= eol=" %%I IN (ulist.txt) DO echo "%%I" >>ulist2.txt
del ulist.txt 
ren ulist2.txt ulist.txt 
for /f "tokens=*" %%a in (list.txt) do (
call :nm %%a
set var=!fn!
echo fn: !fn!
findstr /i /c:"!var!" ulist.txt >nul || echo !var! >> nofind.txt
)
del /q list.txt ulist.txt
goto :mn

:nm
set fn=%~nx1
exit /b

:pt
set pth=%~dp1
exit /b

:mn
if exist nofind.txt (
Echo WARNING NO FIND THIS SISTEM FILE IN PATH:
type nofind.txt
if !ERRORLEVEL!==1 goto :conv
if !ERRORLEVEL!==0 goto 0
)
goto :conv

:71
Set iso=%2
cd %curd%
Set PS3GAME=%cd%\TEMP\
set DEST=%CD%
set flag=1
echo Extract !iso! to !PS3GAME!... Wait!
!ts!extractps3iso !ISO! "!PS3GAME!"
Set PS3GAME=%cd%\TEMP\PS3_GAME
goto :check

:72
set DEST=%cd%
Set PS3GAME=%~2
set flag=1
goto :check

:73
set title=%2
if !ERRORLEVEL!==0 (
set flag=0 
goto :dwnl
)
if !ERRORLEVEL!==1 goto :7
goto 0

:0
if exist "%cd%\TEMP" rd /q /s "%cd%\TEMP"
echo ============================================
echo.
echo                -= DONE =-
echo.
echo ======= DONE ======= >>!logs!
Echo %TIME% -------------------------------- >>!logs!