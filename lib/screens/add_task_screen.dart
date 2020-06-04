import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:tudu_app/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallBack;

  AddTaskScreen(this.addTaskCallBack);

  @override
  Widget build(BuildContext context) {
    String newText;
    String newDate;
    Color colorSelect;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "New Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff518AFF)),
            ),
            TextField(
              onChanged: (val) {
                newText = val;
              },
              decoration: InputDecoration(
                hintText: "task..",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            FlatButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime.now(),
                      maxTime: DateTime(2025, 12, 12), onChanged: (date) {
                    print('change $date');
                  }, onConfirm: (date) {
                    // DateFormat.yMMMMd().format

                    newDate = date.toString();
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Text(
                  'Select Date',
                  style: TextStyle(color: Color(0xff518AFF)),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SelectCircle(Color(0xffFFEF62), (val) {
                  colorSelect = val;
                }),
                SelectCircle(Color(0xffFF6098), (val) {
                  colorSelect = val;
                }),
                SelectCircle(Color(0xff1DE9B6), (val) {
                  colorSelect = val;
                }),
              ],
            ),
            FlatButton(
              onPressed: () {
                addTaskCallBack(Task(
                    title: newText,
                    dateTime: newDate,
                    isDone: false,
                    isColor: colorSelect.value));
                Navigator.pop(context);
              },
              child: Text(
                "Add".toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
              ),
              color: Color(0xff518AFF),
            )
          ],
        ),
      ),
    );
  }
}

class SelectCircle extends StatefulWidget {
  final Color color;
  final Function colorFunction;

  SelectCircle(this.color, this.colorFunction);

  @override
  _SelectCircleState createState() => _SelectCircleState();
}

class _SelectCircleState extends State<SelectCircle> {
  Color customColor;
  bool _value = false;
  Color selectColor;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      onTap: () {
        selectColor = widget.color;
        //  print(selectColor);
        widget.colorFunction(selectColor);
        setState(() {
          _value = !_value;
        });
      },
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: widget.color),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: _value
              ? Icon(
                  Icons.check,
                  size: 30.0,
                  color: Colors.white,
                )
              : Icon(Icons.check_box_outline_blank,
                  size: 30.0, color: widget.color),
        ),
      ),
    ));
  }
}
