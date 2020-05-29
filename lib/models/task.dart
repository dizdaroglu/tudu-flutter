class Task {
  final String title;
  final String dateTime;
  bool isDone;

  Task({this.title, this.dateTime, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
