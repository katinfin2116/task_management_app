import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task_management_app/repositories/todo_list_repository.dart';

import '../models/TodoListModel.dart';

class TodoListAPI extends TodoListRepository {

  late final TodoListModel todoListModel;

  @override
  Future<TodoListModel> getAllTodoList() async {
    try {
      var response =
          await Dio().get('https://todo-list-api-mfchjooefq-as.a.run.app/todo-list');
      Map<String, dynamic> map = jsonDecode(response.data);
      todoListModel = TodoListModel.fromJson(map);
      var check = "";

    } catch (exception) {
      print(exception);
    }

    return todoListModel;
  }
}
