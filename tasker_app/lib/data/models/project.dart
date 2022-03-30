import 'dart:convert';

class Project {
  int id;
  String title;
  String creator;
  Project({
    this.id = -1,
    this.title = "",
    this.creator = "",
  });

  Project copyWith({
    int? id,
    String? title,
    String? creator,
  }) {
    return Project(
      id: id ?? this.id,
      title: title ?? this.title,
      creator: creator ?? this.creator,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'creator': creator,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      creator: map['creator'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      title: json["title"],
    );
  }

  @override
  String toString() => 'Project(id: $id, title: $title, creator: $creator)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Project &&
        other.id == id &&
        other.title == title &&
        other.creator == creator;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ creator.hashCode;
}
