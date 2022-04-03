import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:tasker_app/constants/storage.dart';
import 'package:tasker_app/constants/strings.dart';

class ProjectNetworkService {
  create_project(String title, List<String> users) async {
    String? token = await storage.read(key: 'token');
    print(users);
    print(title);
    final response = await http.post(Uri.parse('$BASE_URL/api/project/create'),
        headers: {
          "Content-Type": "application/json",
          "x-access-token": token.toString()
        },
        body: jsonEncode({"title": title, "users": users}));

    return response;
  }

  get_all_projects() async {
    String? token = await storage.read(key: 'token');

    final response = await http.get(
      Uri.parse('$BASE_URL/api/project'),
      headers: {
        "Content-Type": "application/json",
        "x-access-token": token.toString()
      },
    );

    return response;
  }

  update_project(int id, String title) async {
    String? token = await storage.read(key: 'token');
    final response = await http.put(Uri.parse('$BASE_URL/api/project/update'),
        headers: {
          "Content-Type": "application/json",
          "x-access-token": token.toString()
        },
        body: jsonEncode({"id": id, "title": title}));

    return response;
  }

  delete_project(int id) async {
    String? token = await storage.read(key: 'token');
    final response = await http.delete(
        Uri.parse('$BASE_URL/api/project/remove'),
        headers: {
          "Content-Type": "application/json",
          "x-access-token": token.toString()
        },
        body: jsonEncode({"project_id": id}));

    return response;
  }

  add_user_to_project(int user_id, int project_id) async {
    String? token = await storage.read(key: 'token');
    final response = await http.post(
        Uri.parse('$BASE_URL/api/project/add/user'),
        headers: {
          "Content-Type": "application/json",
          "x-access-token": token.toString()
        },
        body: jsonEncode({"user_id": user_id, "project_id": project_id}));
  }

  getProjectUsers(int projectId) async {
    String? token = await storage.read(key: 'token');
    final response = await http
        .get(Uri.parse('$BASE_URL/api/project/users/$projectId'), headers: {
      "Content-Type": "application/json",
      "x-access-token": token.toString()
    });
    print(response.body);
    return response;
  }
}
