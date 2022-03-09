import 'dart:convert';

class Task {
  String title;
  DateTime date;
  String description;
  int status;
  int creator_id;
  int? user_id;
  int? project_id;
  
  Task({
    this.title="",
    required this.date,
    this.description="",
    this.status=0,
    this.creator_id=-1,
    this.user_id=null,
    this.project_id=null,
  });


  Task copyWith({
    String? title,
    DateTime? date,
    String? description,
    int? status,
    int? creator_id,
    int? user_id,
    int? project_id,
  }) {
    return Task(
      title: title ?? this.title,
      date: date ?? this.date,
      description: description ?? this.description,
      status: status ?? this.status,
      creator_id: creator_id ?? this.creator_id,
      user_id: user_id ?? this.user_id,
      project_id: project_id ?? this.project_id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date.millisecondsSinceEpoch,
      'description': description,
      'status': status,
      'creator_id': creator_id,
      'user_id': user_id,
      'project_id': project_id,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      description: map['description'] ?? '',
      status: map['status']?.toInt() ?? 0,
      creator_id: map['creator_id']?.toInt() ?? 0,
      user_id: map['user_id']?.toInt() ?? 0,
      project_id: map['project_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Task(title: $title, date: $date, description: $description, status: $status, creator_id: $creator_id, user_id: $user_id, project_id: $project_id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Task &&
      other.title == title &&
      other.date == date &&
      other.description == description &&
      other.status == status &&
      other.creator_id == creator_id &&
      other.user_id == user_id &&
      other.project_id == project_id;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      date.hashCode ^
      description.hashCode ^
      status.hashCode ^
      creator_id.hashCode ^
      user_id.hashCode ^
      project_id.hashCode;
  }
}
