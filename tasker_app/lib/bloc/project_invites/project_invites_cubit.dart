import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasker_app/data/models/project.dart';
import 'package:tasker_app/data/services/project/repository.dart';

part 'project_invites_state.dart';

class ProjectInvitesCubit extends Cubit<ProjectInvitesState> {
  ProjectRepository projectRepository;
  ProjectInvitesCubit(this.projectRepository) : super(ProjectInvitesInitial());

  fetchInvites() {
    projectRepository.getAllInvites().then((response) {
      if (response.statusCode == 200) {
        var responseJSON = jsonDecode(response.body) as List;
        List<Project> projects =
            responseJSON.map((e) => Project.fromJson(e)).toList();
        emit(ProjectInvitesLoaded(projects));
      } else {
        emit(ProjectInvitesLoaded([]));
      }
    });
  }

  updateProject(Project project, int status) {
    projectRepository.update(project, status).then((response) {
      if (response.statusCode == 200) {
        List<Project> newProjects = [...state.projects];
        newProjects.removeWhere(((element) => element.id == project.id));
        emit(ProjectInvitesUpdated());
        emit(ProjectInvitesLoaded(newProjects));
      }
    });
  }
}
