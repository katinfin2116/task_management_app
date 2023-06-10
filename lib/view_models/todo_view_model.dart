import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task_management_app/models/todo_list_model.dart';

import '../repositories/todo_list_repository.dart';

class TodoViewModel {
  TodoListRepository? todoListRepository;

  TodoViewModel({this.todoListRepository});

  Future<List<TodoListModel>> fetchAllTodoList() async {
    List<TodoListModel> list = await todoListRepository!.getAllTodoList();
    return list;
  }
}
