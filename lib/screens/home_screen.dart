import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_hive_flutter/data/constants/constant_colors.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_hive_flutter/data/task.dart';
import 'package:note_hive_flutter/screens/add_task_screen.dart';
import 'package:note_hive_flutter/widget/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var taskBox = Hive.box<Task>('taskBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grayColor,
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemCount: taskBox.values.length,
            itemBuilder: (context, index) {
              var task = taskBox.values.toList()[index];
              return TaskWidget(task: task);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(), //
            ),
          );
        },
        backgroundColor: greenColor,
        child: Image.asset('images/icon_add.png'),
      ),
    );
  }

}
