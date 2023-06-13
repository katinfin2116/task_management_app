import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task_management_app/models/task_list_model.dart';
import 'package:task_management_app/repositories/todo_list_repository.dart';

import '../models/todo_list_model.dart';

class TodoListAPI extends TodoListRepository {
  late List<TodoListModel> todoListModel;
  late List<TaskListModel> taskListModel;
  var endPoint = "https://todo-list-api-mfchjooefq-as.a.run.app/todo-list";

  @override
  Future<List<TodoListModel>> getAllTodoList(String limit) async {
    try {
      var response = await Dio().get(
          '$endPoint?offset=0&limit=$limit&sortBy=createdAt&isAsc=true&status=TODO');
      var list = response.data["tasks"] as List;
      todoListModel = list.map((post) => TodoListModel.fromJson(post)).toList();
    } catch (exception) {
      print(exception);
    }
    return todoListModel;
  }

  @override
  Future<List<TaskListModel>> getAllTaskList(String offset , String limit) async {
    try {
      var response = await Dio().get(
          '$endPoint?offset=$offset&limit=$limit&sortBy=createdAt&isAsc=true&status=DOING');
      // .get(endPoint);
      var list = response.data["tasks"] as List;
      taskListModel = list.map((post) => TaskListModel.fromJson(post)).toList();
    } catch (exception) {
      print(exception);
    }
    return taskListModel;
  }
}
