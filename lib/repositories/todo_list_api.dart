import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task_management_app/repositories/todo_list_repository.dart';

import '../models/todo_list_model.dart';

class TodoListAPI extends TodoListRepository {
  late List<TodoListModel> todoListModel;
  var endPoint = "https://todo-list-api-mfchjooefq-as.a.run.app/todo-list";

  @override
  Future<List<TodoListModel>> getAllTodoList() async {
    try {
      var response = await Dio()
          // .get('$endPoint?offset=0&limit=2&sortBy=createdAt&isAsc=true&status=TODO');
          .get(endPoint);
      var list = response.data["tasks"] as List;
      todoListModel = list.map((post) => TodoListModel.fromJson(post)).toList();
    } catch (exception) {
      print(exception);
    }
    return todoListModel;
  }
}
