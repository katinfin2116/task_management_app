import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:task_management_app/models/TodoListModel.dart';
import 'package:task_management_app/repositories/todo_list_api.dart';

import '../../view_models/todo_view_model.dart';

class TodoView extends StatefulWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  var todoListViewModel = TodoViewModel(todoListRepository: TodoListAPI());

  List<TodoListModel> _todoList = <TodoListModel>[];

  Future<void> _getData() async {
    _todoList = todoListViewModel.fetchAllTodoList() as List<TodoListModel>;
    setState(() {});
  }

  // List _todoList = [
  //   {'name': 'John', 'group': 'Today', 'subtitle': 'Task on day' },
  //   {'name': 'Will', 'group': 'Team B', 'subtitle': 'Task on day' },
  //   {'name': 'Beth', 'group': 'Today', 'subtitle': 'Task on day'},
  //   {'name': 'Miranda', 'group': 'Team B', 'subtitle': 'Task on day'},
  //   {'name': 'Mike', 'group': 'Team C', 'subtitle': 'Task on day'},
  //   {'name': 'Danny', 'group': 'Today', 'subtitle': 'Task on day'},
  //   {'name': 'Ddddd', 'group': 'Today', 'subtitle': 'Task on day'},
  //   {'name': 'GoGogo', 'group': 'Today', 'subtitle': 'Task on day'},
  //   {'name': 'Michel', 'group': 'Today', 'subtitle': 'Task on day'},
  // ];
  //

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GroupedListView<dynamic, String>(
      elements: _todoList,
      groupBy: (element) => element['status'],
      groupComparator: (value1, value2) => value2.compareTo(value1),
      itemComparator: (item1, item2) => item1['title'].compareTo(item2['title']),
      order: GroupedListOrder.ASC,
      useStickyGroupSeparators: true,
      groupSeparatorBuilder: (String value) => Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 16),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            value,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      itemBuilder: (c, element) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(width: 1.0, color: Colors.black12),
          ),
          elevation: 0.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: SizedBox(
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
              leading: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.all(4.0),
                height: 40.0,
                width: 40.0,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    element['title'].substring(0, 2),
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              title: Text(element['title']),
              subtitle: Text(element['title']),
              trailing: IconButton(
                icon: Container(
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, top: 8, bottom: 8),
                    child: Image.asset(
                      'assets/images/menu-dots-vertical.png',
                      color: Colors.grey,
                    )),
                onPressed: () {},
              ),
            ),
          ),
        );
      },
    );
  }
}
