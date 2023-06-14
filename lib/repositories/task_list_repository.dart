

import '../models/task_list_model.dart';

abstract class TaskListRepository {
  Future<List<TaskListModel>> getAllTaskList(String offset , String limit , String status);
}
