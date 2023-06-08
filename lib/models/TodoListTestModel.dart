// To parse this JSON data, do
//
//     final todoListTestModel = todoListTestModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<TodoListTestModel> todoListTestModelFromJson(String str) => List<TodoListTestModel>.from(json.decode(str).map((x) => TodoListTestModel.fromJson(x)));

String todoListTestModelToJson(List<TodoListTestModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoListTestModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  TodoListTestModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory TodoListTestModel.fromJson(Map<String, dynamic> json) => TodoListTestModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
