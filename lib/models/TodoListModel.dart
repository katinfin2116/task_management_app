// To parse this JSON data, do
//
//     final todoListModel = todoListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<TodoListModel> todoListModelFromJson(String str) =>
    List<TodoListModel>.from(
        json.decode(str).map((x) => TodoListModel.fromJson(x)));

String todoListModelToJson(List<TodoListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoListModel {
  final String id;
  final String title;
  final String description;
  final String createdAt;
  final String status;

  TodoListModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.status,
  });

  factory TodoListModel.fromJson(Map<String, dynamic> json) => TodoListModel(
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
