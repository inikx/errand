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
      : super(ProjectCreatingInitial(data: Project()));

  void updateTitle(String title) {
    final currentState = state;
    if (currentState is ProjectCreatingDataChanged ||
        currentState is ProjectCreatingInitial) {
      emit(ProjectCreatingDataChanged(
          data: currentState.data.copyWith(title: title)));
    }
  }

  void createProject(String title) {
    emit(ProjectCreating());
    repository.create_project(title).then((response) {
      if (response.statusCode == 200) {
        emit(ProjectCreated());
        var rawProject = jsonDecode(response.body);
        Project project = Project.fromJson(rawProject);
        projectCubit.addNewProject(project);
        emit(ProjectCreatingInitial(data: Project()));
      } else {
        emit(ProjectCreatingError());
      }
    });
  }
}
