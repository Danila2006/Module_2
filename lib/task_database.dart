import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TaskDatabase {
  Database? _db;

  Future<void> initDb() async {
    final path = join(await getDatabasesPath(), 'tasks.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE tasks (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          isDone INTEGER,
          createdAt TEXT
        )
        ''');
      },
    );
  }

  Future<int> addTask(String title) async {
    return await _db!.insert('tasks', {
      'title': title,
      'isDone': 0,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  Future<List<Map<String, dynamic>>> getAllTasks() async {
    return await _db!.query('tasks');
  }

  Future<int> toggleTask(int id, bool isDone) async {
    return await _db!.update(
      'tasks',
      {'isDone': isDone ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteTask(int id) async {
    return await _db!.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getActiveTasks() async {
    return await _db!.query('tasks', where: 'isDone = 0');
  }
}