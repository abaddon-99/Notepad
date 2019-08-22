# Notepad

#### Установка:
Каталог модуля перемістити в /usr/abills/Abills/modules/

В терміналі ввести ```sudo ln -s /usr/abills/Abills/modules/Notepad/js/ /usr/abills/Abills/templates/```,```sudo ln -s /usr/abills/Abills/modules/Notepad/sticker_style.css /usr/abills/Abills/templates/``` та ```mv /usr/abills/Abills/modules/Notepad/Notepad.pm /usr/abills/Abills/mysql/```.


В файлі **config.pl**:
```
@MODULES = (
             'Notepad'
           );
```
