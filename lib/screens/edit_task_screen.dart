import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_hive_flutter/data/constants/constant_colors.dart';
import 'package:note_hive_flutter/data/task.type.dart';
import 'package:note_hive_flutter/utility/utility.dart';
import 'package:time_pickerr/time_pickerr.dart';

import '../data/task.dart';

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({Key? key, required this.task}) : super(key: key);
  Task task;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();

  TextEditingController? textFiledTaskTitleController;

  TextEditingController? textFiledTaskSubTitleController;

  final taskBox = Hive.box<Task>('taskBox');
  DateTime? _time;

  int _selectedTaskTypeItem = 0;

  @override
  void initState() {
    textFiledTaskTitleController =
        TextEditingController(text: widget.task.title);
    textFiledTaskSubTitleController =
        TextEditingController(text: widget.task.subTitle);

    // TODO: implement initState
    super.initState();
    negahban1.addListener(() {
      setState(() {});
    });

    negahban2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40),
              _getTextFiledTask(
                  focusNode: negahban1,
                  controller: textFiledTaskTitleController,
                  textName: 'عنوان تسک'),
              SizedBox(height: 40),
              _getTextFiledTask(
                  focusNode: negahban2,
                  controller: textFiledTaskSubTitleController,
                  num: 2,
                  textName: 'توضیحات تسک'),
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomHourPicker(
                  title: 'زمان تسک رو انتخاب کن',
                  negativeButtonText: 'حذف کن',
                  positiveButtonText: 'انتخاب زمان',
                  elevation: 2,
                  titleStyle: _getTextStyle(greenColor, 18, FontWeight.bold),
                  negativeButtonStyle: _getTextStyle(
                      Colors.red, 18, FontWeight.bold),
                  positiveButtonStyle: _getTextStyle(
                      greenColor, 18, FontWeight.bold),
                  onNegativePressed: (context) {},
                  onPositivePressed: (context, time) {
                    _time = time;
                  },
                ),
              ),
              Container(
                height: 165,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: getTaskTypeList().length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedTaskTypeItem = index;
                          });
                        },
                        child: TaskTypeItemList(
                          taskType: getTaskTypeList()[index],
                          index: index,
                          selectedItemList: _selectedTaskTypeItem,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Spacer(),
              _getButtonTask(),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _getTextStyle(Color color, double double, FontWeight fontWeight) {
    return TextStyle(
      color: color,
      fontSize: double,
      fontWeight: fontWeight,
    );
  }

  Widget _getButtonTask() {
    return ElevatedButton(
      onPressed: () {
        String taskTitle = textFiledTaskTitleController!.text;
        String taskSubTitle = textFiledTaskSubTitleController!.text;
        _editTask(taskTitle, taskSubTitle);
        Navigator.of(context).pop();
      },
      child: Text(
        'ویرایش کردن تسک',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: greenColor,
        minimumSize: Size(200, 48),
      ),
    );
  }

  Widget _getTextFiledTask({FocusNode? focusNode,
    TextEditingController? controller,
    int? num,
    String? textName}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 44),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: controller,
          maxLines: num,
          focusNode: focusNode,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            labelText: textName,
            labelStyle: TextStyle(
              fontSize: 20,
              color: focusNode!.hasFocus ? greenColor : grayColor2,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide(color: grayColor2, width: 3.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide(
                width: 3,
                color: greenColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _editTask(String taskTitle, String taskSubTitle) {
    //edit task
    widget.task.title = taskTitle;
    widget.task.subTitle = taskSubTitle;
    widget.task.time = _time!;
    widget.task.taskType = getTaskTypeList()[_selectedTaskTypeItem];
    widget.task.save();
  }
}


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
          Text(taskType.title),
        ],
      ),
    );
  }
}
