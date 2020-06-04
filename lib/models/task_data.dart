import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tudu_app/models/task.dart';
import 'package:http/http.dart' as http;
import 'package:tudu_app/key.dart';

class TaskData with ChangeNotifier {
  String _baseUrl = "$key.json";

  List<Task> _tasks = [];

  List<Task> get tasks => [..._tasks];

  Future<void> updateTask(Task task) async {
    await task.toggleDone();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    final response = await http.post(_baseUrl,
        body: json.encode({
          "title": task.title,
          "dateTime": task.dateTime,
          "isDone": task.isDone,
          "isColor": task.isColor
        }));

    final newTodo = Task(
        id: json.decode(response.body)["name"],
        title: task.title,
        dateTime: task.dateTime,
        isDone: task.isDone,
        isColor: task.isColor);

    _tasks.add(newTodo);
    notifyListeners();
  }

  Future<void> removeItem(String id) async {
    final url = "$key/$id.json";

    final existingProductIndex = _tasks.indexWhere((prod) => prod.id == id);
    var existingProduct = _tasks[existingProductIndex];

    _tasks.removeAt(existingProductIndex);
    notifyListeners();

    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _tasks.insert(existingProductIndex, existingProduct);
      notifyListeners();
    }
    existingProduct = null;
  }

  Future<void> fetchTodo() async {
    try {
      final response = await http.get(_baseUrl);
      final List<Task> loadedData = [];

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }

      extractedData.forEach((todoId, todoData) {
        loadedData.add(Task(
            id: todoId,
            title: todoData["title"],
            dateTime: todoData["dateTime"],
            isDone: todoData["isDone"],
            isColor: todoData["isColor"]));
      });
      _tasks = loadedData;
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }
}
