import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:tarea_3_todo_app/models/models.dart';
export 'package:tarea_3_todo_app/models/models.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  String _tableName = 'Tasks';
  String _idColum = 'id';
  String _titleColum = 'titleTask';
  String _descColum = 'descTask';
  String _dateColum = 'dateTask';
  String _doneColum = 'doneTask';

  Future<Database> get database async {
    if ( _database != null ) return _database!;

    _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    //PATH WERE THE DATABASE WILL BE STORE
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentDirectory.path, 'ScansDB.db' );
    print(path);

    //CREATE DATABASE
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: ( Database db, int version ) async {
        await db.execute('''
          CREATE TABLE $_tableName(
            $_idColum INTEGER PRIMARY KEY,
            $_titleColum TEXT NOT NULL,
            $_descColum TEXT NOT NULL,
            $_dateColum TEXT NOT NULL,
            $_doneColum INT NOT NULL
          )
        ''');
      }
    );
  }

  Future<int> createNewTask(TaskModel newTask) async {
    final db = await database;
    final res = await db.insert(_tableName, newTask.toJson());

    //ID OF THE LAST REGISTER
    print('>>>>>> HERE COMES THE TASK ID INSERTED >>>>>>');
    print(res);
    return res;
  }

  Future<TaskModel?> getTaskById(int id) async {
    final db = await database;
    final res = await db.query(_tableName, where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty
      ? TaskModel.fromJson(res.first)
      : null;
  }

  Future<List<TaskModel?>> getAllTasks() async {
    final db = await database;
    final res = await db.query(_tableName);

    return res.isNotEmpty
      ? res.map((task) => TaskModel.fromJson(task)).toList()
      : [];
  }

  Future<List<TaskModel?>> getAllTasksWhereDone(int doneFlag) async {
    final db = await database;
    final res = await db.query(_tableName, where: '$_doneColum = ?', whereArgs: [doneFlag]);

    return res.isNotEmpty
      ? res.map((task) => TaskModel.fromJson(task)).toList()
      : [];
  }

  Future<int> updateTask(TaskModel newTask) async {
    final db = await database;
    final res = await db.update(_tableName, newTask.toJson(), where: 'id = ?', whereArgs: [newTask.id]);

    //ID OF THE LAST REGISTER
    print('>>>>>> HERE COMES THE TASK ID UDATED >>>>>>');
    print(res);
    return res;
  }

  Future<int> deleteTask(int id) async {
    final db = await database;
    final res = await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);

    //ID OF THE LAST REGISTER
    print('>>>>>> 1 = REGISTER DELETED >>>>>>');
    print(res);
    return res;
  }

  Future<int> deleteAllTasks() async {
    final db = await database;
    final res = await db.delete(_tableName);

    //ID OF THE LAST REGISTER
    print('>>>>>> ALL INSERTIONS WILL BE DELETED >>>>>>');
    print(res);
    return res;
  }
}