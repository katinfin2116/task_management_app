import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:loadmore/loadmore.dart';
import 'package:task_management_app/models/todo_list_model.dart';
import 'package:task_management_app/repositories/todo_list_api.dart';

import '../../view_models/todo_view_model.dart';

class DoneView extends StatefulWidget {
  const DoneView({Key? key}) : super(key: key);

  @override
  State<DoneView> createState() => _DoneViewState();
}

class _DoneViewState extends State<DoneView> {
  late List<TodoListModel> _todoList = [];
  var todoListViewModel = TodoViewModel(todoListRepository: TodoListAPI());
  ScrollController _scrollController = ScrollController();
  int _currentMax = 10;
  var setGetDataOnInitState = true;

  Future<List<TodoListModel>> getData() {
    return todoListViewModel.fetchAllTodoList(_currentMax.toString());
  }

  @override
  void initState() {
    _currentMax = 10;
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        getMoreData();
      }
    });
    super.initState();
  }

  getMoreData() async {
    if (_currentMax <= 40) {
      _currentMax = _currentMax + 10;
      Future<List<TodoListModel>> listFuture =
          todoListViewModel.fetchAllTodoList(_currentMax.toString());
      _todoList = await listFuture;
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<TodoListModel>>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          _todoList = snapshot.data!;
          return ListView.builder(
            controller: _scrollController,
            itemExtent: 100,
            itemBuilder: (context, index) {
              if (index == _todoList.length) {
                return  const Center(child: CircularProgressIndicator());
              }
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(width: 1.0, color: Colors.black12),
                ),
                elevation: 0.0,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Slidable(
                  key: const ValueKey(0),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    dismissible: DismissiblePane(onDismissed: () {}),
                    children: [
                      SlidableAction(
                        autoClose: true,
                        onPressed: (BuildContext context) {
                          deleteItem(_todoList[index].id.toString());
                        },
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
                          // index.title.substring(0, 2),
                          _todoList[index].title.substring(0, 2),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    title: Text(_todoList[index].title),
                    subtitle: Container(
                        margin: const EdgeInsets.only(top: 6),
                        child: Text(
                          _todoList[index].description,
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
              // return ListTile(
              //   title: Text(myList[i]),
              // );
            },
            itemCount: _todoList.length + 1,
          );
        }
      },
    ));
  }

  void deleteItem(String id) {
    //setGetDataOnInitState = true;
    setState(() {
      _todoList.removeWhere((item) => item.id == id);
    });
  }
}
