import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_hive_flutter/data/constants/constant_colors.dart';

import '../data/task.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({Key? key}) : super(key: key);

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();

  final TextEditingController textFiledTaskTitleController =
  TextEditingController();
  final TextEditingController textFiledTaskSubTitleController =
  TextEditingController();

  final taskBox = Hive.box<Task>('taskBox');

  @override
  void initState() {
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
              SizedBox(height: 50),
              _getTextFiledTask(
                  focusNode: negahban1,
                  controller: textFiledTaskTitleController,
                  textName: 'عنوان تسک'
              ),
              SizedBox(height: 50),
              _getTextFiledTask(
                  focusNode: negahban2,
                  controller: textFiledTaskSubTitleController,
                  num: 2,
                  textName: 'توضیحات تسک'),
              Spacer(),
              _getButtonTask(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getButtonTask() {
    return ElevatedButton(
      onPressed: () {
        String taskTitle = textFiledTaskTitleController.text;
        String taskSubTitle = textFiledTaskSubTitleController.text;
        _addTask(taskTitle,taskSubTitle);
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

  Widget _getTextFiledTask(
      {FocusNode? focusNode, TextEditingController? controller, int? num,String? textName}) {
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


  _addTask(String taskTitle, String taskSubTitle){
    //add task
    var task = Task(title: taskTitle, subTitle: taskSubTitle);
    taskBox.add(task);
  }



}
