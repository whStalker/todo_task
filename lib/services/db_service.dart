import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:to_do_task/services/todo_db.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  // Future<String> get fullPath async {
  //   const dbName = 'todo.db';
  //   final path = await getDatabasesPath();
  //   return join(path, dbName);
  // }

  Future<Database> _initialize() async {
    const dbName = 'todo.db';
    var databasePath = await getDatabasesPath();

    String path = join(databasePath, dbName);
    // final path = await fullPath;
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true,
    );
    return database;
  }

  Future<void> create(Database database, int version) async =>
      await TodoDB().createTable(database);

  Future close() async => _database!.close();
}
