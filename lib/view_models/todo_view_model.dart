import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/task_list_model.dart';
import '../repositories/task_list_repository.dart';

class TodoViewModel {
  TaskListRepository? taskListRepository;
  TodoViewModel({this.taskListRepository});

  Future<List<TaskListModel>> fetchList(
      String offset, String limit, String status) async {
    List<TaskListModel> list =
    await taskListRepository!.getAllTaskList(offset, limit,status);
    return list;
  }
}
