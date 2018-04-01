# MAKE_PKG_HAN_TOOLS (see releases)
make pkg bat made by [Alex_1985](http://www.pspx.ru/forum/member.php?u=458658) and modified by in1975, ErikPshat.

Many thanks to: hexcsl, YChvanov !

###  Credits:               BIG thanks for PS3XPLOIT TEAM
#### For HAN tools by W, escortd3w, bguerville, habib and Specialy Joonie
#### For RESIGNER ACT.DAT/RIF/ENC/EDAT/CONFIG PS2/PSX/PSP content for PS3
#### For PSPx Team for this utility: in1975, hexcsl, Alex_1985, ErikPshat
--------------------------------------------------------------------

### Usage: English
1. Put the game folders next to the program. 
2. Put *.pkg CWF files in the folder to try fix it.
3. Put act.dat and idps.hex in the same directory.
4. Run program EXE and select the desired action.

For test you can load v.1.8 with 4 folders

### Использование: Русский
1. Положите рядом с программой папки игры, которую необходимо упаковать в PKG.
2. Положите файлы *.pkg для CFW в папку если их нужно пропатчить для активации PSN-игры.
3. Положите файлы act.dat и idps.hex рядом с программой - они так же нужны для подписи активации PSN-игры.
4. Запустите программу и выберите необходимое действие - Создать DEBUG PKG или RETAIL PKG или FIX PKG или RIF PKG.
   - _(имейте в виду, что на создание RETAIL пакета требуется чуть больше времени)_  
Для тестов можете скачать версию 1.8 - там 4 папки, которые там лежат для демонстрации работы программы.
--------------------------------------------------------------------
	
### History:

#### 2.0
:white_check_mark: Add new tools: try fix CFW pkg

:white_check_mark: Cleanup github files (now all in releases)

#### 1.9
:white_check_mark: Add database for create *.rap file. Just put psn *.pkg file same directory, run tools and Make RIF PKG - from act.dat & idps.hex & rap

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
