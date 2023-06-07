// To parse this JSON data, do
//
//     final todoListModel = todoListModelFromJson(jsonString);

import 'dart:convert';

TodoListModel todoListModelFromJson(String str) => TodoListModel.fromJson(json.decode(str));

String todoListModelToJson(TodoListModel data) => json.encode(data.toJson());

class TodoListModel {
  final List<Task> tasks;
  final int pageNumber;
  final int totalPages;

  TodoListModel({
    required this.tasks,
    required this.pageNumber,
    required this.totalPages,
  });

  factory TodoListModel.fromJson(Map<String, dynamic> json) => TodoListModel(
    tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
    pageNumber: json["pageNumber"],
    totalPages: json["totalPages"],
  );

  Map<String, dynamic> toJson() => {
    "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
    "pageNumber": pageNumber,
    "totalPages": totalPages,
  };
}

class Task {
  final String id;
  final String title;
  final String description;
  final String createdAt;
  final String status;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.status,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    createdAt: json["createdAt"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "createdAt": createdAt,
    "status": status,
  };
}
