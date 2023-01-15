import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
  bool isFabVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grayColor,
      body: SafeArea(
        child: Center(
          child: _getValueListenableBuilder(),
        ),
      ),
      floatingActionButton: _getFloatingActionButton(context),
    );
  }

  Widget _getValueListenableBuilder() {
    return ValueListenableBuilder(
      valueListenable: taskBox.listenable(),
      builder: (context, value, child) =>
          NotificationListener<UserScrollNotification>(
        onNotification: (notif) {
          setState(
            () {
              if (notif.direction == ScrollDirection.forward) {
                isFabVisible = true;
              }
              if (notif.direction == ScrollDirection.reverse) {
                isFabVisible = false;
              }
            },
          );
          return true;
        },
        child: ListView.builder(
          itemCount: taskBox.values.length,
          itemBuilder: (context, index) {
            var task = taskBox.values.toList()[index];
            print(task.taskType.title);
            return _getListItem(task);
          },
        ),
      ),
    );
  }

  Widget _getFloatingActionButton(BuildContext context) {
    return Visibility(
      visible: isFabVisible,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(),
            ),
          );
        },
        backgroundColor: greenColor,
        child: Image.asset('images/icon_add.png'),
      ),
    );
  }

  Widget _getListItem(Task task) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        task.delete();
      },
      child: TaskWidget(task: task),
    );
  }
}
