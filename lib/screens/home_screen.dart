import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tudu_app/models/task.dart';
import 'package:tudu_app/models/task_data.dart';
import 'package:tudu_app/screens/add_task_screen.dart';
import 'package:tudu_app/screens/task_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isLoading = false;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCFCFC),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: SvgPicture.asset("assets/images/menu.svg"),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TaskScreen()));
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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: SvgPicture.asset(
                    "assets/images/llogo.svg",
                    width: 250,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => AddTaskScreen((Task task) {
                              taskData.addTask(task);
                            }));
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Color(0xff518AFF),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(3.0, 5.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
