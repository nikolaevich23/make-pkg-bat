@echo off
TITLE PKG.bat by in1975 
cd /d %~dp0
setlocal enabledelayedexpansion
for /d %%d in (*) do (
set dr=%%d
IF EXIST %%d\PARAM.SFO (
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
if !cat!==HG (
SET ct=GameExec
SET pt=HDDGamePatch
)
if !cat!==DG (
SET ct=GameExec
SET pt=HDDGamePatch
)
echo RUN - Wait... | nhcolor 0e
sfoprint "%%d\PARAM.SFO" TITLE | nhcolor 09
sfoprint "%%d\PARAM.SFO" TITLE_ID | nhcolor 0b
echo ContentID = 000000-!title:~0,9!_00-0000000!dr:~0,9!> package.conf
echo Klicensee = 0x00000000000000000000000000000000 >> package.conf
echo DRMType = Free >> package.conf
echo ContentType = !ct! >> package.conf
echo PackageType = !pt! >> package.conf
echo InstallDirectory = %%d >> package.conf
echo PackageVersion = 01.00 >> package.conf
psn_package_npdrm.exe -n -f package.conf %%d
)
)
del package.conf
