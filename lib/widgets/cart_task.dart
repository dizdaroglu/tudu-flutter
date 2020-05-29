import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartTask extends StatelessWidget {
  final String title;
  final String dateTime;

  CartTask(this.title, this.dateTime);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,
            style: TextStyle(
                fontSize: 14,
                fontFamily: "Roboto-Regular",
                fontWeight: FontWeight.w400,
                color: Color(0xFF707070))),
        SizedBox(
          height: 4,
        ),
        if (dateTime != null)
          Text(
            DateFormat.yMMMMd().format(DateTime.parse(dateTime)),
            style: TextStyle(
                fontSize: 10,
                fontFamily: "Roboto-Regular",
                fontWeight: FontWeight.w400,
                color: Color(0xFF707070).withOpacity(0.90)),
          ),
      ],
    );
  }
}
