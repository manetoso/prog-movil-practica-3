import 'package:flutter/material.dart';
import 'package:tarea_3_todo_app/providers/provider-db.dart';

class TaskListProvider extends ChangeNotifier {
  List<TaskModel?> tasks = [];
  List<TaskModel?> task = [];

  newTask(String title, String desc, String date, bool done) async {
    int? doneFlag;
    if (done) {
      doneFlag = 1;
    } else {
      doneFlag = 0;
    }
    final newTask = new TaskModel(
      titleTask: title,
      descTask: desc,
      dateTask: date,
      doneTask: doneFlag
    );
    final id = await DBProvider.db.createNewTask(newTask);

    newTask.id = id;

    notifyListeners();
  }

  updateTask(int idTask, String title, String desc, String date, bool done) async {
    int? doneFlag;
    if (done) {
      doneFlag = 1;
    } else {
      doneFlag = 0;
    }
    final newTask = new TaskModel(
      id: idTask,
      titleTask: title,
      descTask: desc,
      dateTask: date,
      doneTask: doneFlag
    );
    final id = await DBProvider.db.updateTask(newTask);

    newTask.id = id;

    notifyListeners();
  }

  loadTaskById( int id ) async {
    final taskById = await DBProvider.db.getTaskById(id);
    this.task = [taskById];
    notifyListeners();
  }

  empyTask() {
    this.task = [];
    notifyListeners();
  }

  loadTask() async {
    final tasks = await DBProvider.db.getAllTasks();
    this.tasks = [...tasks];
    notifyListeners();
  }

  loadTaskWhereDone( int doneFlag ) async {
    final tasks = await DBProvider.db.getAllTasksWhereDone(doneFlag);
    this.tasks = [...tasks];
    notifyListeners();
  }

  deleteTaskById(int? id) async {
    await DBProvider.db.deleteTask(id!);
    this.tasks.removeWhere((actualTask) => actualTask!.id == id);
    notifyListeners();
  }
}