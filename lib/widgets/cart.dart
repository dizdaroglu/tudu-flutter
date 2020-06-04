import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tudu_app/models/task_data.dart';
import 'package:tudu_app/widgets/cart_circle.dart';
import 'package:tudu_app/widgets/cart_task.dart';

class Cart extends StatelessWidget {
  final String id;
  final String title;
  final String dateTime;
  final bool isDone;
  final Function iconCallback;
  final int isColor;

  Cart(
      {this.id,
      this.title,
      this.dateTime,
      this.isDone,
      this.iconCallback,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) async {
        await Provider.of<TaskData>(context, listen: false).removeItem(id);
      },
      child: Container(
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
                  CartCircle(dateTime, isColor),
                  CartTask(title, dateTime),
                ],
              )),
              GestureDetector(
                onTap: () {
                  iconCallback(isDone);
                },
                child: FaIcon(
                  isDone ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
                  color: Colors.yellow,
                  size: 20,
                ),
              )
            ],
          )),
    );
  }
}
