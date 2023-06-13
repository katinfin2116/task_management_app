

import '../models/todo_list_model.dart';

abstract class TodoListRepository {
  Future<List<TodoListModel>> getAllTodoList(String limit);
}
