import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tudu_app/models/task_data.dart';

class CartCircle extends StatelessWidget {
  final String dateTime;

  CartCircle(this.dateTime);

  Color changeColor(String dateTime) {
    Color todayColor = Color(0xff74c2ff);
    Color tomorrowColor = Color(0xffFF6098);
    Color wednesdayColor = Color(0xff1DE9B6);
    Color noneDateColor = Color(0xffFFEF62);

    int day = DateTime.now().day;
    int todoDay = DateTime.parse(dateTime).day;

    int result = day - todoDay;

    switch (result.toString()) {
      case '0':
        return todayColor;
        break;
      case '-1':
        return tomorrowColor;
        break;
      case '-2':
        return wednesdayColor;
        break;
      default:
        return noneDateColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.00,
      width: 10.00,
      decoration: BoxDecoration(
        color: dateTime == null ? Color(0xffFFEF62) : changeColor(dateTime),
        shape: BoxShape.circle,
      ),
    );
  }
}
