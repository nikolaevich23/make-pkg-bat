@echo off
setlocal enabledelayedexpansion
for /d %%d in (*) do (
set dr=%%d
IF EXIST %%d\PARAM.SFO (
if exist %%d\LICDIR xcopy "%%d\LICDIR\*.*" "%%d_LIC\LICDIR\*.*"
if exist %%d\INSDIR xcopy "%%d\INSDIR\*.*" "%%d_LIC\INSDIR\*.*"
FOR /F "usebackq tokens=3" %%a IN (`tool\sfoprint "%%d\PARAM.SFO" TITLE_ID`) DO set title=%%a
FOR /F "usebackq tokens=3" %%b IN (`tool\sfoprint "%%d\PARAM.SFO" CATEGORY`) DO set cat=%%b
if !cat!==GD (
SET ct=GameData
SET pt=DiscGamePatch
)
if !cat!==HD (
SET ct=GameExec
SET pt=HDDGamePatch
)
if !cat!==DG (
SET ct=GameExec
SET pt=HDDGamePatch
)
)
echo ContentID = 000000-!title:~0,9!_00-00000000!dr:~0,8!> package.conf
echo Klicensee = 0x00000000000000000000000000000000 >> package.conf
echo DRMType = Free >> package.conf
echo ContentType = !ct! >> package.conf
echo PackageType = !pt! >> package.conf
echo InstallDirectory = %%d >> package.conf
echo PackageVersion = 01.00 >> package.conf
psn_package_npdrm.exe -n package.conf %%d
)
del package.conf
RD /S /Q "%%d_LIC"

rem if exist %%d\LICDIR (
rem echo ContentID = 000000-!dr:~0,9!_00-0000000000000LIC> package.conf
rem echo Klicensee = 0x00000000000000000000000000000000 >> package.conf
rem echo DRMType = Free >> package.conf
rem echo ContentType = GameExec >> package.conf
rem echo PackageType = HDDGamePatch >> package.conf
rem echo InstallDirectory = %%d >> package.conf
rem echo PackageVersion = 01.00 >> package.conf
rem make_package_npdrm_retail.exe -n package.conf %%d_LIC
rem )
rem if exist %%d\INSDIR (
rem echo ContentID = 000000-!dr:~0,9!_00-0000000000000LIC> package.conf
rem echo Klicensee = 0x00000000000000000000000000000000 >> package.conf
rem echo DRMType = Free >> package.conf
rem echo ContentType = GameExec >> package.conf
rem echo PackageType = HDDGamePatch >> package.conf
rem echo InstallDirectory = %%d >> package.conf
rem echo PackageVersion = 01.00 >> package.conf
rem make_package_npdrm_retail.exe -n package.conf %%d_LIC)

