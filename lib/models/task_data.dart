import 'package:flutter/foundation.dart';
import 'package:tudu_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(
        title: "Buy a gift for Dave's birthday",
        dateTime: "2019-05-29 13:27:00.000"),
    Task(
        title: "Meeting with client from xyz",
        dateTime: "2019-05-30 13:27:00.000"),
    Task(
        title: "Discuss project with team",
        dateTime: "2019-05-31 13:27:00.000"),
  ];

  List<Task> get tasks => [..._tasks];

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void addTask(String title, String dateTime) {
    _tasks.add(Task(title: title, dateTime: dateTime));
    notifyListeners();
  }
}
