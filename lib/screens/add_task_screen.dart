import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallBack;

  AddTaskScreen(this.addTaskCallBack);

  @override
  Widget build(BuildContext context) {
    String newText = "";
    String newDate;

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
            FlatButton(
              onPressed: () {
                addTaskCallBack(newText, newDate);
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
