import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_hive_flutter/data/constants/constant_colors.dart';
import 'package:note_hive_flutter/screens/add_task_screen.dart';
import 'package:note_hive_flutter/screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();

  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SM',
        textTheme: TextTheme(
          headline4: TextStyle(
            fontFamily: 'GB',
            fontSize: 16,
            color: whiteColor,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: AddTaskScreen(),
    );
  }
}
