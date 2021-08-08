import 'package:login_todo_database/Database/Dbhelper_database.dart';

class Task {
  int id;
  String title;
  bool isComplete;
  Task({this.title, this.isComplete = false});
  Task.fromJson(Map<String, dynamic> map) {
    this.id = map[DBHelper.columnId];
    this.title = map[DBHelper.columnName];
    this.isComplete =
        map[DBHelper.columnIsComplete] == 1 ? true : false;
  }
  toJson() {
    return {
     DBHelper.columnName: this.title,
      DBHelper.columnIsComplete: this.isComplete ? 1 : 0
    };
  }

  toggleTask() {
    this.isComplete = !this.isComplete;
  }
}
