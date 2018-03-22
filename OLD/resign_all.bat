:: --------------------------------------- ::
:: Created mod by In1975 for site pspx.ru  ::
:: Modded by YChvanov                      ::
:: --------------------------------------- ::
@echo off
setlocal ENABLEDELAYEDEXPANSION
cd /d %~dp0

:getos
  reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32|| set OS=64
  echo =================================================
  echo Detected OS architecture - %OS%bit.
  echo =================================================
  echo.

if not exist *.pkg (echo No .pkg were found. Exiting... & exit/b)

for %%f in (*.pkg) do (ps3xploit_rifgen_edatresign_x%OS%_mod.exe %%f ps3)
