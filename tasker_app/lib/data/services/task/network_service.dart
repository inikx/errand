import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:tasker_app/constants/storage.dart';
import 'package:tasker_app/constants/strings.dart';
import 'package:tasker_app/data/models/task.dart';

class TaskNetworkService {
  addTask(Task task) async {
    String? token = await storage.read(key: 'token');
    final response = await http.post(Uri.parse('$BASE_URL/api/task/create'),
        headers: {
          "Content-Type": "application/json",
          "x-access-token": token.toString()
        },
        body: jsonEncode({
          "title": task.title,
          "date": task.date.toString(),
          "description": task.description,
          "status": task.status,
          "user_id": task.user_id,
          "project_id": task.project_id
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

  update_task(Task task) async {
    String? token = await storage.read(key: 'token');
    final response = await http.put(Uri.parse('$BASE_URL/api/task/update'),
        headers: {
          "Content-Type": "application/json",
          "x-access-token": token.toString()
        },
        body: jsonEncode({
          "id": task.id,
          "title": task.title,
          "date": task.date.toString(),
          "description": task.description,
          "status": task.status,
          "user_id": task.user_id,
          "project_id": task.project_id
        }));

    return response;
  }

  delete_task(int id) async {
    String? token = await storage.read(key: 'token');
    final response = await http.delete(Uri.parse('$BASE_URL/api/task/remove'),
        headers: {
          "Content-Type": "application/json",
          "x-access-token": token.toString()
        },
        body: jsonEncode({"task_id": id}));

    return response;
  }

  get_all_project_tasks(int project_id) async {
    String? token = await storage.read(key: 'token');
    final response = await http.get(
      Uri.parse('$BASE_URL/api/task/all/project/$project_id'),
      headers: {
        "Content-Type": "application/json",
        "x-access-token": token.toString()
      },
    );

    return response;
  }
}
