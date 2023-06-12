import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:loadmore/loadmore.dart';
import 'package:task_management_app/models/todo_list_model.dart';
import 'package:task_management_app/repositories/todo_list_api.dart';

import '../../view_models/todo_view_model.dart';

class TodoView extends StatefulWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  int get count => _todoList.length;
  var todoListViewModel = TodoViewModel(todoListRepository: TodoListAPI());

  late List<TodoListModel> _todoList = [];
  var setGetDataOnInitState = true;

  Future<List<TodoListModel>> getData() async {
    if (_todoList.isEmpty) {
      if (setGetDataOnInitState == false) {
        return todoListViewModel.fetchAllTodoList();
      }
      return _todoList;
    }
    return _todoList;
  }

  Future<bool> _loadMore() async {
    print("onLoadMore");
    await Future.delayed(const Duration(seconds: 0, milliseconds: 100));
    getData();
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 100));
    _todoList.clear();
    getData();
  }

  @override
  void initState() {
    setGetDataOnInitState = false;
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TodoListModel>>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          _todoList = snapshot.data!;
          return RefreshIndicator(
              onRefresh: _refresh,
              child: LoadMore(
                  isFinish: count >= 5,
                  onLoadMore: _loadMore,
                  whenEmptyLoad: true,
                  child: GroupedListView<TodoListModel, String>(
                    elements: _todoList,
                    groupBy: (element) => element.status,
                    groupComparator: (value1, value2) =>
                        value2.compareTo(value1),
                    itemComparator: (item1, item2) =>
                        item1.title.compareTo(item2.title),
                    order: GroupedListOrder.ASC,
                    useStickyGroupSeparators: true,
                    groupSeparatorBuilder: (String value) => Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8, top: 16),
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
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(
                              width: 1.0, color: Colors.black12),
                        ),
                        elevation: 0.0,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Slidable(
                          key: const ValueKey(0),
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            dismissible: DismissiblePane(onDismissed: () {}),
                            children: [
                              SlidableAction(
                                autoClose: true,
                                onPressed: (BuildContext context) {
                                  deleteItem(index.id.toString());
                                },
                                // onPressed: (value) {
                                //   _todoList.removeAt(0);
                                //   setState(() {});
                                // },
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
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
                                  index.title.substring(0, 2),
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                            title: Text(index.title),
                            subtitle: Container(
                                margin: const EdgeInsets.only(top: 6),
                                child: Text(
                                  index.description,
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
                  )));
        }
      },
    );
  }

  void deleteItem(String id) {
    setGetDataOnInitState = true;
    setState(() {
      _todoList.removeWhere((item) => item.id == id);
    });
  }
}
