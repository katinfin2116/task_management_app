

import '../models/task_list_model.dart';
import '../models/todo_list_model.dart';

abstract class TodoListRepository {
  Future<List<TodoListModel>> getAllTodoList(String limit);
  Future<List<TaskListModel>> getAllTaskList(String offset , String limit);
}
