import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task_management_app/models/task_list_model.dart';
import 'package:task_management_app/repositories/task_list_repository.dart';

class TaskListAPI extends TaskListRepository {
  late List<TaskListModel> taskListModel;
  var endPoint = "https://todo-list-api-mfchjooefq-as.a.run.app/todo-list";

  @override
  Future<List<TaskListModel>> getAllTaskList(String offset , String limit , String status) async {
    try {
      var response = await Dio().get(
          '$endPoint?offset=$offset&limit=$limit&sortBy=createdAt&isAsc=true&status=$status');
      var list = response.data["tasks"] as List;
      taskListModel = list.map((post) => TaskListModel.fromJson(post)).toList();
    } catch (exception) {
      print(exception);
    }
    return taskListModel;
  }
}
