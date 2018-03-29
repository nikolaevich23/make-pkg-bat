# MAKE_DEBUG-RETAIL-RIF_PKG v1.8
make pkg bat made by [Alex_1985](http://www.pspx.ru/forum/member.php?u=458658) and modified by in1975, ErikPshat.

Many thanks to: hexcsl, YChvanov !

###  Credits:               BIG thanks for PS3XPLOIT TEAM
#### For HAN tools by W, escortd3w, bguerville, habib and Specialy Joonie
#### For RESIGNER ACT.DAT/RIF/ENC/EDAT/CONFIG PS2/PSX/PSP content for PS3
#### For PSPx Team for this utility: in1975, hexcsl, Alex_1985, ErikPshat
--------------------------------------------------------------------

### Usage: English
1. Delete 4 testing folders from release 
2. Put the game folders next to the program 
3. Put *.rap files in the RAPS folder
4. Put act.dat and idps.hex in the same directory
5. Run program EXE and select the desired action - Make DEBUG PKG(s) or Make RETAIL PKG(s) or Make RIF PKG.

### Использование: Русский
1. Удалите из папки релиза все 4 папки, которые там лежат для демонстрации работы программы.
2. Положите рядом с программой папки игры, которую необходимо упаковать в PKG.
3. Положите файлы *.rap в папку "RAPS", если их нужно подписать и упаковать в PKG для активации PSN-игры.
4. Положите файлы act.dat и idps.hex рядом с программой - они так же нужны для подписи активации PSN-игры.
5. Запустите программу и выберите необходимое действие - Создать DEBUG PKG или RETAIL PKG или RIF PKG.
   - _(имейте в виду, что на создание RETAIL пакета требуется почти в 2 раза больше времени)_
--------------------------------------------------------------------
	
### History:
#### 1.8
:white_check_mark: Python is no longer needed

:white_check_mark: The function of creating a separate DEBUG package is separated.

:white_check_mark: The function of creating a separate RETAIL package is separated.

:white_check_mark: Added a function for generating the RIF and packaging in the Retail package together with the act.dat.

:white_check_mark: In view of the expansion of the functional, the name of the program changed to "MAKE_DEBUG-RETAIL-RIF_PKG".

#### 1.7
:white_check_mark: All utilities are assembled into one EXE.

:white_check_mark: Added assembly code for more than two folders.

:white_check_mark: The batch files of the DEBUG package creation and the signed RETAIL (finalized) are combined into one function.

#### 1.6
:white_check_mark: Rewrite some logic bat file

:white_check_mark: Added manual for pack manuals dir (if you need it)

:negative_squared_cross_mark: Remove *lic.pkg. Now create 2 pkg file with licdir

:negative_squared_cross_mark: Remove old_create_packages.bat to OLD dir

:negative_squared_cross_mark: Remove ps3xploit_rifgen_edatresign v.2.0 to Alt dir

#### 1.5
:white_check_mark: Added color

#### 1.4
:white_check_mark: Added new category

#### 1.3
:white_check_mark: Added make_pkg.bat (rewrite logic bat file)

:white_check_mark: Added resign_all.bat 
