import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tudu_app/models/task.dart';
import 'package:tudu_app/models/task_data.dart';
import 'package:tudu_app/screens/add_task_screen.dart';
import 'package:tudu_app/widgets/cart.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<TaskData>(context).fetchTodo().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

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
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: taskData.tasks.length == 0
                    ? Center(
                        child: Text("Add a task to get started",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff707070).withOpacity(0.65),
                            )))
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: taskData.tasks.length,
                        itemBuilder: (context, index) {
                          final task = taskData.tasks[index];
                          print(taskData.tasks);

                          return Cart(
                            id: task.id,
                            title: task.title,
                            dateTime: task.dateTime,
                            isDone: task.isDone,
                            iconCallback: (val) async {
                              await taskData.updateTask(task);
                            },
                            isColor: task.isColor,
                          );
                        },
                      ),
              ));
  }

  Widget _fabButton(BuildContext context, TaskData taskData) =>
      FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => AddTaskScreen((Task task) {
                    taskData.addTask(task);
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
