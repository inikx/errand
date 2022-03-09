import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:tasker_app/constants/storage.dart';
import 'package:tasker_app/constants/strings.dart';

class TaskNetworkService {
  create_task(String title, DateTime date, String description, int status,
      int user_id, int project_id) async {
    String? token = await storage.read(key: 'token');
    final response = await http.post(Uri.parse('$BASE_URL/api/task/create'),
        headers: {
          "Content-Type": "application/json",
          "x-access-token": token.toString()
        },
        body: jsonEncode({
          "title": title,
          "date": date,
          "description": description,
          "status": status,
          "user_id": user_id,
          "project_id": project_id
        }));

    return response;
  }

  get_all_tasks() async {
    String? token = await storage.read(key: 'token');

    final response = await http.get(
      Uri.parse('$BASE_URL/api/task/all'),
      headers: {
        "Content-Type": "application/json",
        "x-access-token": token.toString()
      },
    );

    return response;
  }

  update_task(int id, String title, DateTime date, String description,
      int status, int user_id, int project_id) async {
    String? token = await storage.read(key: 'token');
    final response = await http.put(Uri.parse('$BASE_URL/api/task/update'),
        headers: {
          "Content-Type": "application/json",
          "x-access-token": token.toString()
        },
        body: jsonEncode({
          "id":id,
          "title": title,
          "date": date,
          "description": description,
          "status": status,
          "user_id": user_id,
          "project_id": project_id
        }));

    return response;
  }

  delete_task(int id) async {
    String? token = await storage.read(key: 'token');
    final response = await http.delete(Uri.parse('$BASE_URL/api/task/update'),
        headers: {
          "Content-Type": "application/json",
          "x-access-token": token.toString()
        },
        body: jsonEncode({"task_id": id}));

    return response;  
  }
}
