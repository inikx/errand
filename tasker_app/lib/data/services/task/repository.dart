import 'package:http/http.dart';
import 'package:tasker_app/data/models/task.dart';

import 'package:tasker_app/data/services/task/network_service.dart';

class TaskRepository {
  final TaskNetworkService networkService;
  TaskRepository(this.networkService);

  Future<Response> addTask(Task task) async {
    return await networkService.addTask(task);
  }

  Future<Response> get_all_tasks() async {
    return await networkService.get_all_tasks();
  }

  Future<Response> update_task(int id, String title, DateTime? date,
      String? description, int? status, int? user_id, int? project_id) async {
    return await networkService.update_task(
        id, title, date, description, status, user_id, project_id);
  }

  Future<Response> delete_task(int id) async {
    return await networkService.delete_task(id);
  }

  Future<Response> get_all_project_tasks(int project_id) async {
    return await networkService.get_all_project_tasks(project_id);
  }
}
