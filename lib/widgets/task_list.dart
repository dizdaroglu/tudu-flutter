import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tudu_app/models/task_data.dart';
import 'package:tudu_app/widgets/cart.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: taskData.tasks.length,
      itemBuilder: (context, index) {
        final task = taskData.tasks[index];
        return Cart(
          title: task.title,
          dateTime: task.dateTime,
          isDone: task.isDone,
          iconCallback: (val) {
            taskData.updateTask(task);
          },
        );
      },
    );
  }
}
