import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_hive_flutter/data/constants/constant_colors.dart';
import 'package:note_hive_flutter/data/task.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({Key? key, required this.task}) : super(key: key);
  Task task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return _getTaskItem();
  }

  Widget _getTaskItem() {
    return GestureDetector(
      onTap: (){
        setState(() {
          isDone = !isDone;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18,vertical: 12),
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
                    value: isDone,
                    onChanged: (selected) {
                      setState(() {
                        isDone = selected;
                      });
                    },
                  ),
                  Text(widget.task.title),
                ],
              ),
              Text(widget.task.subTitle),
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
