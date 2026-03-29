# Flutter Practical Assignment

## Опис
Цей проєкт містить реалізацію практичних завдань з Flutter:

1. **Локальне збереження даних** за допомогою SharedPreferences (`SettingsService`)
2. **SQLite CRUD операції** для роботи із задачами (`TaskDatabase`)
3. **REST API клієнт** для роботи з сервером (`PostApiClient`)
4. **Unit та Widget тести** для перевірки логіки та UI

## Використані технології
- Flutter
- Dart
- shared_preferences
- sqflite
- path
- dio
- flutter_test

## Структура проєкту
lib/
├── settings_service.dart
├── task_database.dart
├── post_api_client.dart
├── calculator.dart
└── calculator_widget.dart

test/
├── calculator_test.dart
└── calculator_widget_test.dart

## Запуск проєкту
1. Встановити залежності:
```bash
flutter pub get
```
2. Запустити додаток:
```bash
flutter run
```

## Запуск тестів
```bash
flutter test
```
