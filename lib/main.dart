import 'package:flutter/material.dart';
import 'package:task_management_app/views/login/login_view.dart';
import 'package:task_management_app/views/task/task_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const TaskView(),
      home:   LoginView(),
    );
  }
}
