import 'package:note_hive_flutter/data/type_enum.dart';

class TaskType {
  TaskType({
    required this.image,
    required this.title,
    required this.TaskTypeEnum,
  });

  String image;
  String title;
  Enum TaskTypeEnum;
}
