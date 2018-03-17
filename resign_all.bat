:: --------------------------------------- ::
:: Created mod by In1975 for site pspx.ru  ::
:: --------------------------------------- ::
@echo off
setlocal ENABLEDELAYEDEXPANSION
cd %~dp0

:: Change these for your application / manual...
set OS=32

:: Calculate count files
echo =================================================
echo Detect OS - %OS%bit.
echo =================================================
echo.

:: FUNCTIONS ---------------------------------------------------------------

:getos
  reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32 || set OS=64

for %%f in (*.pkg) do (
ps3xploit_rifgen_edatresign_x%OS%_mod.exe %%f ps3
rem del %%f
)

