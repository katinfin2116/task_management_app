import 'dart:convert';

List<TaskListModel> taskListModelFromJson(String str) =>
    List<TaskListModel>.from(
        json.decode(str).map((x) => TaskListModel.fromJson(x)));

String taskListModelToJson(List<TaskListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaskListModel {
  final String id;
  final String title;
  final String description;
  final String createdAt;
  final String status;

  TaskListModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.status,
  });

  factory TaskListModel.fromJson(Map<String, dynamic> json) => TaskListModel(
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
