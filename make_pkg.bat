@echo off
setlocal enabledelayedexpansion
for /d %%d in (*) do (
set dr=%%d
IF EXIST %%d\PARAM.SFO (
if exist %%d\LICDIR xcopy "%%d\LICDIR\*.*" "%%d_LIC\LICDIR\*.*"
if exist %%d\INSDIR xcopy "%%d\INSDIR\*.*" "%%d_LIC\INSDIR\*.*"
FOR /F "usebackq tokens=3" %%a IN (`sfoprint "%%d\PARAM.SFO" TITLE_ID`) DO set title=%%a
FOR /F "usebackq tokens=3" %%b IN (`sfoprint "%%d\PARAM.SFO" CATEGORY`) DO set cat=%%b
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
echo ContentID = 000000-!title:~0,9!_00-0000000!dr:~0,9!> package.conf
echo Klicensee = 0x00000000000000000000000000000000 >> package.conf
echo DRMType = Free >> package.conf
echo ContentType = !ct! >> package.conf
echo PackageType = !pt! >> package.conf
echo InstallDirectory = %%d >> package.conf
echo PackageVersion = 01.00 >> package.conf
psn_package_npdrm.exe -n package.conf %%d
:: licdir
if exist %%d_LIC (
echo ContentID = 000000-!dr:~0,9!_00-0000000000000LIC> package.conf
echo Klicensee = 0x00000000000000000000000000000000 >> package.conf
echo DRMType = Free >> package.conf
echo ContentType = GameExec >> package.conf
echo PackageType = HDDGamePatch >> package.conf
echo InstallDirectory = %%d >> package.conf
echo PackageVersion = 01.00 >> package.conf
make_package_npdrm_retail.exe -n package.conf !dr!_LIC
RD /S /Q "%%d_LIC"
)
)
)
del package.conf
