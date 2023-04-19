# Приложение для Новосибирского крокет клуба

<p align="center">
<img src="./docs/assets/main_screen.png" height="150" />
</p>

### Функционал:
- Возможен выбор времени игры 30, 20, 15, 10 или 5 минут;
- Для увеличения очков игрока нажать на серый прямоугольник с именем игрока;
- Для уменьшения очков на 1, необходимо "смахнуть" игрока влево, затем нажать на кнопку "минус";
- Для сброса очков игрока, необходимо зажать серый прямоугольник с именем игрока, после чего появится предупреждающий диалог;
- После завершения игры, появляется диалоговое окно с информацией об игре.

### Скриншоты приложения

Действия
<p align="left">
<img src="./docs/assets/main_screen.png" height="150" />
</p>
Локализация
<p align="left">
<img src="./docs/assets/main_screen_actions.png" height="150" />
</p>
Экран настроек
<p align="left">
<img src="./docs/assets/settings_screen_start.png" height="150" />
</p>
<p align="left">
<img src="./docs/assets/settings_screen_end.png" height="150" />
</p>
Диалоговое окно при сбросе очков
<p align="left">
<img src="./docs/assets/reset_score_warning.png" height="150" />
</p>
Диалоговое окно при завершении игры
<p align="left">
<img src="./docs/assets/end_game.png" height="150" />
</p>





### Terminal comand
For localization:
flutter pub run easy_localization:generate -S "assets/translations"
flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S "assets/translations"
