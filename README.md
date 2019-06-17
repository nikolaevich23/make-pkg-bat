# MPHT (Make Pkg Han Tools)
make pkg made by in1975 and other.

Many thanks to: hexcsl, BaseD and ErikPshat!

###  Credits:               BIG thanks for PS3XPLOIT TEAM
#### For HAN tools by W, escortd3w, bguerville, habib and Specialy Joonie
#### For RESIGNER ACT.DAT/RIF/ENC/EDAT/CONFIG PS2/PSX/PSP content for PS3
#### For PSPx Team for this utility: in1975, hexcsl, BaseD, ErikPshat
--------------------------------------------------------------------

### Usage: English
Some antivirus programs [falsely triggered](https://www.virustotal.com/ru/file/a378d1a70deed7b45592a86b2f0995590d4a92050b71fd991be3290b94c74f0d/analysis/1546160432/), unplug before installing.

1. Put the game folders next to the program. 
2. Put *.pkg CWF files in the folder to try fix it (need game update).
3. Put act.dat and idps.hex in the same directory.
4. Run program EXE and select the desired action.

### Использование: Русский
Некоторые антивирусы [ложно срабатывают](https://www.virustotal.com/ru/file/a378d1a70deed7b45592a86b2f0995590d4a92050b71fd991be3290b94c74f0d/analysis/1546160432/), отключайте перед установкой.

1. Положите рядом с программой папки игры, которую необходимо упаковать в PKG.
2. Положите файлы *.pkg для CFW в папку если их нужно пропатчить для активации PSN-игры (нужны апдейты к игре)
3. Положите файлы act.dat и idps.hex рядом с программой - они так же нужны для подписи активации PSN-игры.
4. Запустите программу и выберите необходимое действие.

--------------------------------------------------------------------
### Requirements
+ For old version Windows need [PowerShell 5.1](https://docs.microsoft.com/ru-ru/powershell/scripting/setup/installing-windows-powershell?view=powershell-6#upgrading-existing-windows-powershell)
+ Для старых версий Windows требуется [PowerShell 5.1](https://docs.microsoft.com/ru-ru/powershell/scripting/setup/installing-windows-powershell?view=powershell-6#upgrading-existing-windows-powershell)

Небольшой фикс в батнике при формировании имени
Небольшой фикс в DLC
	
### History:
#### 3.7.3
:white_check_mark: Изменена настройка, теперь она "Подписывать Package_List.pkg и rif*.pkg"

#### 3.7.1-2
:white_check_mark: Небольшой фикс в батнике при формировании имени

:white_check_mark: Небольшой фикс в DLC

#### 3.7.0
:white_check_mark: Исправлена утечка памяти при обработке большого количества *.rap

#### 3.6.0
:white_check_mark: Добавлен набор инструментов (многое взято из PS3GameExtractor v1.8.7).

:white_check_mark: Переписан батник в части формирования имени pkg.

:white_check_mark: Другие правки.

#### 3.5.5
:white_check_mark: Добавлено автоматическое извлечение 2P0001-PS2U10000_00-0000111122223333.rap ко всем классическим PS2 играм при создании RIF.

#### 3.5.4 
:white_check_mark:  Добавлена проверка *.pkg файлов при создании списка *.pkg. 
Если файл не имеет заголовка по стандарту pkg, то файл перемещается в папку NOT_PKG
(если вы качали части файла pkg, то его надо склеивать)

#### 3.5.3 
:white_check_mark:  В связи с обновлением сайта ps3xploit файлы на дополнительные опции удалены, версия облегчена. 

#### 3.5.1-2 
:white_check_mark:  Добавлены батники 482.bat и 4.84.bat для копирования нужных файлов, под вашу версию прошивки, для запуска опций HAN с локального сервера;

:white_check_mark:  Мелкие правки (подписывает только обрабатываемые pkg, а не все);

#### 3.5.0
:white_check_mark:  Переделан механизм подписи *.edat - теперь программа сама определяет его тип;

:white_check_mark:  Обновлено руководство в связи с новыми пунктами;

:white_check_mark:  Мелкие правки;

#### 3.4.2
:white_check_mark: Добавлены кнопки - переподписывать DLC/ExData/Theme;

:white_check_mark: Небольшие правки;

#### 3.4.0 
:white_check_mark: Кнопка 5 переименована в "меню конвертации";

:white_check_mark: Добавлена кнопка - переподписывать DLC:
- Указывать корневую папку игры например BLES* или NPEB*
- После обработки DLC будет перезаписан (подписан свободной лицензией);

:white_check_mark: Заменен make_npdata.exe;

#### 3.3.0 
:white_check_mark: Added to settings: / В настройки добавлены:
- sign or not Package_List.pkg / подписывать или нет Package_List.pkg;

#### 3.2.0 
:white_check_mark: Added to settings: /  В настройки добавлены:
 - sound /  звук, 
 - minimize to tray or not / сворачивать в трей или нет, 
 - Hotkeys / горячие клавиши

:white_check_mark:  Reworked the menu / Переработано меню, 

:white_check_mark:  Added alerts / Добавлены оповещения,

:white_check_mark:  Added tray menu / Добавлено меню в трее,

:white_check_mark:  In order to avoid false triggering of antiviruses, exe is not compressed (if you like, compress yourself) / В целях исключения ложного срабатывания антивирусов exe не сжат (хотите - сжимайте сами)  

:white_check_mark:  Other changes / Другие изменения

#### 3.1.1 - 3.1.4 
:white_check_mark: Corrected translation / Поправлен перевод

:white_check_mark: German language added / Добавлен немецкий язык

:white_check_mark: Installer added check on PowerShell and download it if necessary / В установщик добавлена проверка на PowerShell и скачивание его при необходимости

:white_check_mark: Fixed conversion / Поправлено конвертирование

:white_check_mark: exe compressed / exe сжат

:white_check_mark: Other edits / Другие правки 

#### 3.1.0 
:white_check_mark: 3.1.0 в установщик добавлена проверка на PowerShell

:white_check_mark: Сделан выбор IP

:white_check_mark: поправлен батник (теперь не надо выгружать hfs при обновлении списка)

#### 3.0.4 - 3.0.8
:white_check_mark: Changes in the update process / Изменения в процессе обновления 

#### 3.0.3
:white_check_mark: Added refresh button / Добавлена кнопка обновить

#### 3.0.2
:white_check_mark: IP detection without the need to restart / Определение IP без необходимости перезапуска.

#### 3.0.1
:white_check_mark: Other edits / Другие правки 

#### 3.0
:white_check_mark: New interface / Новый интерфейс

:white_check_mark: Help / Справка

:white_check_mark: Ability to work in directories with spaces and Russian characters / Возможность работы в директориях с пробелами и русскими символами

:white_check_mark: The ip.ini and port.ini files are combined in the config.ini 
/ Файлы ip.ini и port.ini объеденены в config.ini

:white_check_mark: Other edits / Другие правки 

#### 2.9
:white_check_mark: Add chose IP / Добавлен выбор IP для создания pkg linker.pkg и сервера

#### 2.8.2 and 2.8.3
:white_check_mark: Some fix / Небольшие правки
 
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
