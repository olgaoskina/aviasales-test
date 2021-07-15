# aviasales-test

Реализовать приложение, которое будет состоять из двух экранов:

1) Экран выбора аэропорта с полем ввода названия города
Дизайн экрана — на усмотрение разработчика.
Серверный API, пример запроса: http://places.aviasales.ru/places?term=париж&locale=ru

2) Экран отображения анимации полета самолетика между Санкт-Петербургом и выбранным аэропортом/городом
- В минимальном варианте форма пути - геодезическая прямая. Дополнительным плюсом будет форма пути в соответствии с референсом (flight.png). В остальном результат должен быть близок к дизайну по внешнему виду
- Самолетик должен лететь плавно (в том числе при манипуляциях с картой)
- При смещении карты самолетик и путь не должны смещаться относительно карты
- В качестве иконки самолётика необходимо использовать приложенный plane.pdf. 

Задание предлагается выполнить полностью на Swift и должны поддерживаться версии iOS 12 и выше.
