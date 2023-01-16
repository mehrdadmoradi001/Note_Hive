import 'package:flutter/material.dart';
import 'package:note_hive_flutter/data/constants/constant_colors.dart';
import 'package:note_hive_flutter/data/task.type.dart';

class TaskTypeItemList extends StatelessWidget {
  TaskTypeItemList(
      {Key? key,
      required this.taskType,
      required this.index,
      required this.selectedItemList})
      : super(key: key);

  TaskType taskType;
  int index;
  int selectedItemList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (selectedItemList == index) ? greenColor : whiteColor,
        border: Border.all(
          color: selectedItemList == index ? Colors.green : grayColor,
          width: selectedItemList == index ? 3 : 2,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      width: 140,
      child: Column(
        children: [
          Image.asset(taskType.image),
          Text(
            taskType.title,
            style: TextStyle(
              fontSize: (selectedItemList == index) ? 18 : 16,
              color: (selectedItemList == index) ? whiteColor : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
