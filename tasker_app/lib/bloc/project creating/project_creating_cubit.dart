import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasker_app/bloc/projects/projects_cubit.dart';
import 'package:tasker_app/data/models/project.dart';
import 'package:tasker_app/data/services/project/repository.dart';

part 'project_creating_state.dart';

class ProjectCreatingCubit extends Cubit<ProjectCreatingState> {
  final ProjectRepository repository;
  final ProjectsCubit projectCubit;
  ProjectCreatingCubit(this.repository, this.projectCubit)
      : super(ProjectCreatingInitial(data: Project(), users: []));

  void updateTitle(String title) {
    final currentState = state;
    emit(ProjectCreatingDataChanged(
        data: currentState.data.copyWith(title: title),
        users: currentState.users));
  }

  void updateUsers(String username) {
    final currentState = state;
    currentState.users.add(username);
    emit(ProjectCreatingDataChanged(
        data: currentState.data, users: currentState.users));
  }

  void createProject(String title, List<String> users) {
    emit(ProjectCreating());
    repository.create_project(title, users).then((response) {
      if (response.statusCode == 200) {
        emit(ProjectCreated());
        var rawProject = jsonDecode(response.body);
        Project project = Project.fromJson(rawProject);
        projectCubit.addNewProject(project);
        emit(ProjectCreatingInitial(data: Project(), users: []));
      } else {
        emit(ProjectCreatingError());
      }
    });
  }
}
