import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:task_management_app/models/todo_list_model.dart';

import '../../models/task_list_model.dart';
import '../../repositories/todo_list_api.dart';
import '../../view_models/doing_view_model.dart';
import '../../view_models/todo_view_model.dart';

class DoingView extends StatefulWidget {
  const DoingView({Key? key}) : super(key: key);

  @override
  State<DoingView> createState() => _DoingViewState();
}

class _DoingViewState extends State<DoingView> {
  var doingListViewModel = DoingViewModel(todoListRepository: TodoListAPI());

  int _page = 0;
  final int _limit = 10;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  late final List<TaskListModel> _doingList = [];

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      List<dynamic> taskFuture = await doingListViewModel.fetchList(
          _page.toString(), _limit.toString());
      setState(() {
        for (var item in taskFuture) {
          _doingList.add(item);
        }
      });
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  Future<void> _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true;
      });
      _page += 1;
      try {
        List<dynamic> taskFuture = await doingListViewModel.fetchList(
            _page.toString(), _limit.toString());
        if (taskFuture.isNotEmpty) {
          setState(() {
            for (var item in taskFuture) {
              _doingList.add(item);
            }
          });
        } else {
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isFirstLoadRunning
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: _doingList.length,
                    itemBuilder: (_, index) {
                      bool isSameDate = true;
                      final String dateString = _doingList[index].createdAt;
                      final DateTime date = DateTime.parse(dateString);
                      final item = _doingList[index];
                      if (index == 0) {
                        isSameDate = false;
                      } else {
                        final String prevDateString =
                            _doingList[index - 1].createdAt;
                        final DateTime prevDate =
                            DateTime.parse(prevDateString);
                        isSameDate = date.isSameDate(prevDate);
                      }
                      if (index == 0 || !(isSameDate)) {
                        return Column(children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(10.0),
                              child: Text(date.formatDate(),style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)),
                          Card(
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
                                // dismissible:
                                //     DismissiblePane(onDismissed: () {}),
                                children: [
                                  SlidableAction(
                                    autoClose: true,
                                    onPressed: (BuildContext context) {
                                      deleteItem(
                                          _doingList[index].id.toString());
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
                                      _doingList[index].title.substring(0, 2),
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                                title: Text(_doingList[index].title),
                                subtitle: Container(
                                    margin: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      _doingList[index].description,
                                      style: const TextStyle(fontSize: 12),
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
                          ),
                        ]);
                      } else {
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
                              // dismissible:
                              //     DismissiblePane(onDismissed: () {}),
                              children: [
                                SlidableAction(
                                  autoClose: true,
                                  onPressed: (BuildContext context) {
                                    deleteItem(_doingList[index].id.toString());
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
                                    _doingList[index].title.substring(0, 2),
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ),
                              title: Text(_doingList[index].title),
                              subtitle: Container(
                                  margin: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    _doingList[index].description,
                                    style: const TextStyle(fontSize: 12),
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
                      }
                    },
                  ),
                ),
                if (_isLoadMoreRunning == true)
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 40),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (_hasNextPage == false)
                  Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    color: Colors.grey,
                    child: const Center(
                      child: Text('You have fetched all of the content'),
                    ),
                  ),
              ],
            ),
    );
  }

  void deleteItem(String id) {
    setState(() {
      _doingList.removeWhere((item) => item.id == id);
    });
  }
}

const String dateFormatter = 'dd MMMM y';

extension DateHelper on DateTime {
  String formatDate() {
    final formatter = DateFormat(dateFormatter);
    return formatter.format(this);
  }

  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }
}
