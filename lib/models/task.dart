import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:tudu_app/key.dart';

class Task extends ChangeNotifier {
  final String id;
  final String title;
  final String dateTime;
  bool isDone;
  final int isColor;

  Task({this.id, this.title, this.dateTime, this.isDone = false, this.isColor});

  void _setFavValue(bool newValue) {
    isDone = newValue;
    notifyListeners();
  }

  Future<void> toggleDone() async {
    final oldStatus = isDone;
    isDone = !isDone;
    // print(isDone);
    notifyListeners();

    final url = "$key/$id.json";
    try {
      final response =
          await http.patch(url, body: json.encode({'isDone': isDone}));
      if (response.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
    } catch (e) {
      _setFavValue(oldStatus);
    }
  }
}
