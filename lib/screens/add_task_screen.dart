import 'package:flutter/material.dart';
import 'package:note_hive_flutter/data/constants/constant_colors.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();

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
              _getTextFiledTask(focusNode: negahban1),
              SizedBox(height: 50),
              _getTextFiledTask(focusNode: negahban2, num: 2),
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
      onPressed: () {},
      child: Text(
        'اضافه کردن تسک',
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

  Widget _getTextFiledTask({FocusNode? focusNode, int? num}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 44),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          maxLines: num,
          focusNode: focusNode,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            labelText: 'عنوان تسک',
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
}
