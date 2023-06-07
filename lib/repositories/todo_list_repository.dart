

import '../models/TodoListModel.dart';

abstract class TodoListRepository {
  Future<TodoListModel> getAllTodoList();
}
