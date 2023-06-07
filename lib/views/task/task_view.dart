import 'package:flutter/material.dart';
import 'package:task_management_app/views/doing/doing_view.dart';
import 'package:task_management_app/views/done/done_view.dart';
import 'package:task_management_app/views/todo/todo_view.dart';

class TaskView extends StatefulWidget {
  const TaskView({Key? key}) : super(key: key);

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
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
            padding: EdgeInsets.all(0.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
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
                      SizedBox(height: 8,),
                      Text("You can manage your task very simply")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(left: 20,right: 20),
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
    );
  }
}
