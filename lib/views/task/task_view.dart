import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:task_management_app/views/doing/doing_view.dart';
import 'package:task_management_app/views/done/done_view.dart';
import 'package:task_management_app/views/todo/todo_view.dart';

class TaskView extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;

  TaskView({required this.sessionStateStream});

  @override
  State<TaskView> createState() => _TaskViewState(sessionStateStream);
}

class _TaskViewState extends State<TaskView> {

  final StreamController<SessionState> sessionStateStream;
  _TaskViewState(this.sessionStateStream);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: const Color(0xffE9EDFF),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.account_circle_outlined,
                          color: Colors.deepPurple),
                      onPressed: () {},
                    ),
                  ],
                  elevation: 0,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Color(0xffE9EDFF),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Task Management",
                              style: TextStyle(fontSize: 24),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text("You can manage your task very simply")
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(25.0)),
                        child: TabBar(
                          indicator: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(25.0)),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: const [
                            Tab(
                              text: 'To-do',
                            ),
                            Tab(
                              text: 'Doing',
                            ),
                            Tab(
                              text: 'Done',
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                          child: TabBarView(
                        children: [
                          Center(
                            child: TodoView(),
                          ),
                          Center(
                            child: DoingView(),
                          ),
                          Center(
                            child: DoneView(),
                          ),
                        ],
                      ))
                    ],
                  ),
                )),
          )),
    );
  }
}
