import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task_management_app/repositories/todo_list_repository.dart';

import '../models/TodoListModel.dart';
import '../models/TodoListTestModel.dart';

class TodoListAPI extends TodoListRepository {
  late List<TodoListModel> todoListModel;

  @override
  Future<List<TodoListModel>> getAllTodoList() async {
    try {
      var response = await Dio()
          .get('https://todo-list-api-mfchjooefq-as.a.run.app/todo-list');
      var list = response.data["tasks"] as List;
      todoListModel = list.map((post) => TodoListModel.fromJson(post)).toList();
    } catch (exception) {
      print(exception);
    }

    return todoListModel;
  }
}
