import 'package:http/http.dart';
import 'package:tasker_app/data/models/project.dart';

import 'package:tasker_app/data/services/project/network_service.dart';

class ProjectRepository {
  final ProjectNetworkService networkService;
  ProjectRepository(this.networkService);

  Future<Response> create_project(String title, List<String> users) async {
    return await networkService.create_project(title, users);
  }

  Future<Response> get_all_projects() async {
    return await networkService.get_all_projects();
  }

  Future<Response> getAllInvites() async {
    return await networkService.getAllInvites();
  }

  Future<Response> update_project(int id, String title) async {
    return await networkService.update_project(id, title);
  }

  Future<Response> delete_project(int id) async {
    return await networkService.delete_project(id);
  }

  Future<Response> add_user_to_project(int userId, int projectId) async {
    return await networkService.add_user_to_project(userId, projectId);
  }

  Future<Response> getProjectUsers(int projectId) async {
    return await networkService.getProjectUsers(projectId);
  }

  update(Project project, int status) async {
    return await networkService.updateStatus(project.id, status);
  }
}
