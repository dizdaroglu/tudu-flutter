import 'package:flutter/material.dart';

class CartCircle extends StatelessWidget {
  final String dateTime;
  final int isColor;

  CartCircle(this.dateTime, this.isColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.00,
      width: 10.00,
      decoration: BoxDecoration(
        color: Color(isColor),
        shape: BoxShape.circle,
      ),
    );
  }
}
