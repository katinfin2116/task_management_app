import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task_management_app/models/todo_list_model.dart';

import '../models/task_list_model.dart';
import '../repositories/todo_list_repository.dart';

class DoingViewModel {
  TodoListRepository? todoListRepository;
  DoingViewModel({this.todoListRepository});

  Future<List<TaskListModel>> fetchList(
      String offset, String limit) async {
    List<TaskListModel> list =
        await todoListRepository!.getAllTaskList(offset, limit);
    return list;
  }
}
