import 'package:sqflite/sqflite.dart';
import 'package:to_do_task/models/todo_model.dart';
import 'package:to_do_task/services/db_service.dart';

class TodoDB {
  final tableName = 'todo';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
        "id" INTEGER NOT NULL,
        "eventName" TEXT NOT NULL,
        "eventDescription" TEXT NOT NULL,
        "eventLocation" TEXT,
        "priorityColor" TEXT NOT NULL,
        "eventTime" TEXT NOT NULL,

        PRIMARY KEY("id" AUTOINCREMENT)
      );""");
  }

  Future<int> createEvent(TodoModel todoModel) async {
    final database = await DatabaseService().database;
    return await database.rawInsert(
        '''INSERT INTO $tableName (eventName, eventDescription, eventLocation, priorityColor, eventTime)
        VALUES (?,?,?,?,?)''',
        [
          todoModel.eventName,
          todoModel.eventDescription,
          todoModel.eventLocation,
          todoModel.priorityColor,
          todoModel.eventTime,
        ]);
  }

  Future<List<TodoModel>> getAllEvent() async {
    final database = await DatabaseService().database;
    final todos = await database.rawQuery('''
      SELECT * FROM $tableName''');
    return todos.map((todo) => TodoModel.fromSqfliteDatabase(todo)).toList();
  }

  Future<int> updateEvent(TodoModel todoModel) async {
    final database = await DatabaseService().database;
    return await database.update(
      tableName,
      todoModel.toMap(),
      where: 'id = ?',
      whereArgs: [todoModel.id],
    );
  }

  Future<int> deleteEvent(int id) async {
    final database = await DatabaseService().database;
    return await database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
