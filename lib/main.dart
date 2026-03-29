import 'package:flutter/material.dart';
import 'settings_service.dart';
import 'task_database.dart';
import 'post_api_client.dart';
import 'calculator_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //SETTINGS
  final settings = SettingsService();
  await settings.saveTheme(true);
  await settings.saveLanguage('en');
  await settings.saveLastLogin(DateTime.now());

  print('Theme: ${await settings.loadTheme()}');
  print('Language: ${await settings.loadLanguage()}');
  print('Last login: ${await settings.loadLastLogin()}');

  //DATABASE
  final db = TaskDatabase();
  await db.initDb();

  await db.addTask('Купити молоко');
  await db.addTask('Зробити ДЗ');

  final tasks = await db.getAllTasks();
  print('All tasks: $tasks');

  await db.toggleTask(1, true);

  final active = await db.getActiveTasks();
  print('Active tasks: $active');

  //API
  try {
    final api = PostApiClient();

    final posts = await api.getPosts();
    print('First post: ${posts[0]}');

    final newPost =
    await api.createPost('Нова стаття', 'Текст', 1);
    print('Created: $newPost');

    final deleted = await api.deletePost(1);
    print('Deleted: $deleted');
  } catch (e) {
    print('API ERROR: $e');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorWidget(),
    );
  }
}