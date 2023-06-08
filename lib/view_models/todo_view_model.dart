import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task_management_app/models/TodoListModel.dart';

import '../repositories/todo_list_repository.dart';

class TodoViewModel {
  TodoListRepository? todoListRepository;
  TodoViewModel({this.todoListRepository});

  Future<List<TodoListModel>> fetchAllTodoList() async {
    List<TodoListModel> todoListModel = await todoListRepository!.getAllTodoList();
    List<TodoListModel> list = <TodoListModel>[] ;
    var map = jsonDecode(todoListModel as String);
    list = (map)
        .map((i) => TodoListModel.fromJson(i)).where((item) => item == "TODO")
        .toList();
    return list;
  }

}
