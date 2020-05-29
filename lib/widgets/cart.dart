import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tudu_app/widgets/cart_circle.dart';
import 'package:tudu_app/widgets/cart_task.dart';

class Cart extends StatelessWidget {
  final String title;
  final String dateTime;
  final bool isDone;
  final Function iconCallback;

  Cart({this.title, this.dateTime, this.isDone, this.iconCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 65.00,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.00, 5.00),
              color: Color(0xff000000).withOpacity(0.09),
              blurRadius: 3,
            ),
          ],
          borderRadius: BorderRadius.circular(15.00),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              children: <Widget>[
                CartCircle(dateTime),
                CartTask(title, dateTime),
              ],
            )),
            GestureDetector(
              onTap: () => iconCallback(isDone),
              child: FaIcon(
                isDone ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
                color: Colors.yellow,
                size: 20,
              ),
            )
          ],
        ));
  }
}
