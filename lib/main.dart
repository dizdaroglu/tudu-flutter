import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tudu_app/models/task_data.dart';
import 'package:tudu_app/screens/home_screen.dart';
import 'package:tudu_app/screens/task_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Roboto"),
        home: HomeScreen(),
      ),
    );
  }
}
