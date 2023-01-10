import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_hive_flutter/data/constants/constant_colors.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_hive_flutter/data/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChecked = false;
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
              return Text(task.title);
            },
          ),
        ),
      ),
    );
  }

  Widget _getTaskItem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      height: 132,
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: _getMainContent(),
      ),
    );
  }

  Widget _getMainContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MSHCheckbox(
                    size: 32,
                    style: MSHCheckboxStyle.fillScaleCheck,
                    colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                      checkedColor: greenColor,
                    ),
                    value: isChecked,
                    onChanged: (selected) {
                      setState(() {
                        isChecked = selected;
                      });
                    },
                  ),
                  Text('امروز با هم ورزش داریم'),
                ],
              ),
              Text('SecondText'),
              Spacer(),
              _getTimeAndEditBadges(),
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Image.asset(
          'images/workout.png',
        ),
      ],
    );
  }

  Widget _getTitle() {
    return Column(
      children: [
        _getTimeAndEditBadges(),
      ],
    );
  }

  Row _getTimeAndEditBadges() {
    return Row(
      children: [
        Container(
          width: 90,
          height: 28,
          decoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: Row(
              children: [
                Text('10:30'),
                SizedBox(width: 10),
                Image.asset('images/icon_time.png'),
              ],
            ),
          ),
        ),
        SizedBox(width: 12),
        Container(
          width: 95,
          height: 28,
          decoration: BoxDecoration(
            color: greenLightColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Row(
              children: [
                Text(
                  'ویرایش',
                  style: TextStyle(color: greenColor),
                ),
                SizedBox(width: 10),
                Image.asset('images/icon_edit.png'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
