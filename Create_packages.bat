@echo off
set patch=
set game=%1
for /d %%d in (B??S?????) do set patch=%%d
for /d %%d in (NP???????) do set game=%%d


if "%game%" NEQ "" (
echo ContentID = 000000-%game:~0,9%_00-000000000000GAME> package.conf
echo Klicensee = 0x00000000000000000000000000000000 >> package.conf
echo DRMType = Free >> package.conf
echo ContentType = GameExec >> package.conf
echo PackageType = HDDGamePatch >> package.conf
echo InstallDirectory = %game% >> package.conf
echo PackageVersion = 01.00 >> package.conf
psn_package_npdrm.exe -n package.conf %game%
if exist %game%\LICDIR xcopy "%game%\LICDIR\*.*" "%game%_LIC\LICDIR\*.*"
if exist %game%\INSDIR xcopy "%game%\INSDIR\*.*" "%game%_LIC\INSDIR\*.*"
)

if "%patch%" NEQ "" (
echo ContentID = 000000-%game:~0,9%_00-00000000000PATCH > package.conf
echo Klicensee = 0x00000000000000000000000000000000 >> package.conf
echo DRMType = Free >> package.conf
echo ContentType = GameData >> package.conf
echo PackageType = DiscGamePatch >> package.conf
echo InstallDirectory = %patch% >> package.conf
echo PackageVersion = 01.00 >> package.conf
psn_package_npdrm.exe -n package.conf %patch%
)

if exist %game%_LIC (
echo ContentID = 000000-%game:~0,9%_00-0000000000000LIC> package.conf
echo Klicensee = 0x00000000000000000000000000000000 >> package.conf
echo DRMType = Free >> package.conf
echo ContentType = GameExec >> package.conf
echo PackageType = HDDGamePatch >> package.conf
echo InstallDirectory = %game% >> package.conf
echo PackageVersion = 01.00 >> package.conf
make_package_npdrm_retail.exe -n package.conf %game%_LIC
RD /S /Q "%game%_LIC"
)

del package.conf

pause
