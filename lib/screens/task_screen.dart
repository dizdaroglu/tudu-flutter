import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tudu_app/models/task_data.dart';
import 'package:tudu_app/screens/add_task_screen.dart';
import 'package:tudu_app/widgets/cart.dart';
import 'package:tudu_app/widgets/task_list.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFCFCFC),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: SvgPicture.asset("assets/images/menu.svg"),
              onPressed: () {
                Navigator.of(context).pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Tudu",
                style: TextStyle(
                  fontFamily: "Roboto-Bold",
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                  color: Color(0xff707070),
                ),
              ),
            )
          ],
        ),
        elevation: 0,
      ),
      floatingActionButton: _fabButton(context, taskData),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TaskList()),
      ),
    );
  }

  Widget _fabButton(BuildContext context, TaskData taskData) =>
      FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => AddTaskScreen((newText, newDate) {
                    taskData.addTask(newText, newDate);
                    // Navigator.pop(context);
                  }));
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: Color(0xff518AFF),
      );
}
