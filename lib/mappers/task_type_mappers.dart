import 'package:hello_earth/networking/models/task_type.dart';
import 'package:hello_earth/ui/models/task_type_model.dart';

extension TaskTypeMapper on TaskType {
  TaskTypeModel mapToTaskTypeModel() {
    return TaskTypeModel.values[index];
  }
}
