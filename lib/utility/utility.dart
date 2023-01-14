import 'package:note_hive_flutter/data/task.type.dart';
import 'package:note_hive_flutter/data/type_enum.dart';

List<TaskType> getTaskTypeList() {
  var list = [
    TaskType(
        image: 'images/meditate.png',
        title: 'تمرکز',
        TaskTypeEnum: TaskTypeEnum.focus),
    TaskType(
        image: 'images/social_frends.png',
        title: 'میتینگ',
        TaskTypeEnum: TaskTypeEnum.date),
    TaskType(
        image: 'images/hard_working.png',
        title: 'کار زیاد',
        TaskTypeEnum: TaskTypeEnum.working),
  ];

  return list;
}
