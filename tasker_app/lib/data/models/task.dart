import 'dart:convert';

class Task {
  int id;
  String title;
  DateTime? date;
  String? description;
  int status;
  int creator_id;
  int? user_id;
  int? project_id;
  String? project_title;

  Task(
      {this.id = -1,
      this.title = "",
      required this.date,
      this.description = "",
      this.status = 0,
      this.creator_id = -1,
      this.user_id = null,
      this.project_id = null,
      this.project_title = null});

  Task copyWith(
      {int? id,
      String? title,
      DateTime? date,
      String? description,
      int? status,
      int? creator_id,
      int? user_id,
      int? project_id,
      String? project_title}) {
    return Task(
        id: id ?? this.id,
        title: title ?? this.title,
        date: date ?? this.date,
        description: description ?? this.description,
        status: status ?? this.status,
        creator_id: creator_id ?? this.creator_id,
        user_id: user_id ?? this.user_id,
        project_id: project_id == null
            ? this.project_id
            : (project_id == -1 ? null : project_id),
        project_title: project_title == null
            ? this.project_title
            : (project_title == "" ? null : project_title));
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json["id"] ?? null,
      title: json["title"],
      date: json["date"] != null ? DateTime.parse(json["date"]) : null,
      description: json["description"] ?? null,
      status: json["status"] ?? null,
      creator_id: json["creator_id"] ?? null,
      user_id: json["user_id"] ?? null,
      project_id: json["project_id"] ?? null,
      project_title: json["project_title"] ?? null,
    );
  }

  @override
  String toString() {
    return 'Task(id: $id, title: $title, date: $date, description: $description, status: $status, creator_id: $creator_id, user_id: $user_id, project_id: $project_id)';
  }
}
