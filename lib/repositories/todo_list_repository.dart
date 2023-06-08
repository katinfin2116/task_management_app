

import '../models/TodoListModel.dart';

abstract class TodoListRepository {
  Future<List<TodoListModel>> getAllTodoList();
}
