import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:task_management_app/models/todo_list_model.dart';
import 'package:task_management_app/repositories/todo_list_api.dart';

import '../../view_models/todo_view_model.dart';

class TodoView extends StatefulWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  var todoListViewModel = TodoViewModel(todoListRepository: TodoListAPI());

  late List<TodoListModel> _todoList = [];

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TodoListModel>>(
      future: todoListViewModel.fetchAllTodoList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          _todoList = snapshot.data!;
          return GroupedListView<TodoListModel, String>(
            elements: _todoList,
            groupBy: (element) => element.status,
            groupComparator: (value1, value2) => value2.compareTo(value1),
            itemComparator: (item1, item2) =>
                item1.title.compareTo(item2.title),
            order: GroupedListOrder.ASC,
            useStickyGroupSeparators: true,
            groupSeparatorBuilder: (String value) => Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 16),
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  value,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
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
                margin:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Slidable(
                  // Specify a key if the Slidable is dismissible.
                  key: const ValueKey(0),

                  // The start action pane is the one at the left or the top side.
                  startActionPane: ActionPane(
                    // A motion is a widget used to control how the pane animates.
                    motion: const ScrollMotion(),

                    // A pane can dismiss the Slidable.
                    dismissible: DismissiblePane(onDismissed: () {}),

                    // All actions are defined in the children parameter.
                    children: [
                      SlidableAction(
                        onPressed: deleteItem,
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      SlidableAction(
                        onPressed: deleteItem,
                        backgroundColor: Color(0xFF21B7CA),
                        foregroundColor: Colors.white,
                        icon: Icons.share,
                        label: 'Share',
                      ),
                    ],
                  ),

                  // The end action pane is the one at the right or the bottom side.
                  // endActionPane: const ActionPane(
                  //   motion: ScrollMotion(),
                  //   children: [
                  //     SlidableAction(
                  //       // An action can be bigger than the others.
                  //       flex: 2,
                  //       onPressed: doNothing,
                  //       backgroundColor: Color(0xFF7BC043),
                  //       foregroundColor: Colors.white,
                  //       icon: Icons.archive,
                  //       label: 'Archive',
                  //     ),
                  //     SlidableAction(
                  //       onPressed: doNothing,
                  //       backgroundColor: Color(0xFF0392CF),
                  //       foregroundColor: Colors.white,
                  //       icon: Icons.save,
                  //       label: 'Save',
                  //     ),
                  //   ],
                  // ),

                  // The child of the Slidable is what the user sees when the
                  // component is not dragged.
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
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
                          element.title.substring(0, 2),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    title: Text(element.title),
                    subtitle: Container(
                        margin: const EdgeInsets.only(top: 6),
                        child: Text(
                          element.description,
                          style: TextStyle(fontSize: 12),
                        )),
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
      },
    );
  }

  void deleteItem(BuildContext context) {
    setState(() {});
  }
}
