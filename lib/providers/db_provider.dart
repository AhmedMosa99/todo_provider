import 'package:flutter/material.dart';
import 'package:login_todo_database/Database/Dbhelper_database.dart';
import 'package:login_todo_database/models/task_model.dart';

class DbProvider extends ChangeNotifier {
  List<Task> allTasks = [];
  List<Task> completeTasks = [];
  List<Task> inCompleteTasks = [];

  getAllTasks() async {
    allTasks = await DBHelper.dbHelper.getAllTasks();
    completeTasks =
        this.allTasks.where((element) => element.isComplete).toList();
    inCompleteTasks =
        this.allTasks.where((element) => !element.isComplete).toList();
    notifyListeners();
  }

  insertTask(Task task) async {
    await DBHelper.dbHelper.insertTask(task);
    getAllTasks();
  }

  deleteTask(Task task) async {
    await DBHelper.dbHelper.deleteTasks(task.id);
    getAllTasks();
  }

  updateTask(Task task) async {
    await DBHelper.dbHelper.updateTask(task);
    getAllTasks();
  }
}
