# MAKE_PKG_HAN_TOOLS (see [releases](https://github.com/nikolaevich23/make-pkg-bat/releases))
make pkg bat made by Alex_1985 and modified by in1975, ErikPshat.

Many thanks to: hexcsl!

###  Credits:               BIG thanks for PS3XPLOIT TEAM
#### For HAN tools by W, escortd3w, bguerville, habib and Specialy Joonie
#### For RESIGNER ACT.DAT/RIF/ENC/EDAT/CONFIG PS2/PSX/PSP content for PS3
#### For PSPx Team for this utility: in1975, hexcsl, Alex_1985, ErikPshat
--------------------------------------------------------------------

### Usage: English
1. Put the game folders next to the program. 
2. Put *.pkg CWF files in the folder to try fix it (need game update).
3. Put act.dat and idps.hex in the same directory.
4. Run program EXE and select the desired action.

For test you can load v.1.8 with 4 folders

### Использование: Русский
1. Положите рядом с программой папки игры, которую необходимо упаковать в PKG.
2. Положите файлы *.pkg для CFW в папку если их нужно пропатчить для активации PSN-игры (нужны апдейты к игре)
3. Положите файлы act.dat и idps.hex рядом с программой - они так же нужны для подписи активации PSN-игры.
4. Запустите программу и выберите необходимое действие - Создать DEBUG PKG или RETAIL PKG или FIX PKG или RIF PKG.
   - _(имейте в виду, что на создание RETAIL пакета требуется чуть больше времени)_  
Для тестов можете скачать версию 1.8 - там 4 папки, которые там лежат для демонстрации работы программы.
--------------------------------------------------------------------
	
### History:

#### 2.8.1
 :white_check_mark: Небольшие правки (были ошибки после ввода ID для проверки патча и затем при конвертировании)
 :white_check_mark: Добавил иные типы для паковки (пакует как game data, так что не знаю, насколько вам это надо...)

#### 2.8
:white_check_mark: Add check path option to menu / Добавлена опция проверки патча по ID в меню по конвертированию дисковых игр. 

:white_check_mark: Some fix / Небольшие правки

#### 2.7 
:white_check_mark: Remove dubble rap from database / Удалены дубликаты *.rap из базы данных. 

:white_check_mark: Add convert disc game (analog PS3GameConvert_v0.91) / Добавлено конвертирование дисковых игр (аналогично  PS3GameConvert_v0.91, только умеет качать апдейты к играм, проверять есть ли в патче все системные файлы, которые есть в игре)

:white_check_mark: Add RegExp name for directory / Добавлена возможность паковать директории в нижнем регистре (будьте внимательны, если в системных файлах регистр другой - игра не заработает)

:white_check_mark: Some change menu / Небольшое изменение меню.

:white_check_mark: Some fix / Небольшие правки

#### 2.6 
:white_check_mark: Remove fake rap from database / Удалены фейки *.rap из базы данных. База сокращена. Изменена работа с извлечением *.rap 

:white_check_mark: Some fix / Небольшие правки

#### 2.5
:white_check_mark: Add create pkg_list.pkg (analog pkg linker) and run server / Добавлена новая опция - создания пкг листа (аналог пкг линкера) и запуск сервера (hfs.exe)

:white_check_mark: New port.ini file for edit port / Добавлен файл port.ini для конфигурирования порта для hfs. 

#### 2.4.2 
:white_check_mark: Fix name / В связи с проблеммами в установке имена теперь формируются по другому

#### 2.3
Test version

#### 2.2.2
:white_check_mark: New name file / Немного по другому именуются файлы

#### 2.2
:white_check_mark: Add logs / Добавлены логи.

:white_check_mark: Auto find *.rap for pkg in option "RIF PKG"/ Новая функция - автоматически находит RAP в базе пснстаф, просто положите пкг рядом и выберите опцию "RIF PKG"

:white_check_mark: New interface / Добавлен новый интерфейс.

:white_check_mark: New option - sign pkg / Добавлена опция подписывания всех пкг.

:white_check_mark: Fix owerwrite param.sfo / Поправлена паковка - больше версию парам.сфо не переписывает. Нужно тестирование - будут ли проблемы из-за этого?

:white_check_mark: Add Checks / Добавлены проверки

:white_check_mark: Little more / Еще по мелочи.

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
