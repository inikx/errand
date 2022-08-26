import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasker_app/data/models/project.dart';
import 'package:tasker_app/data/services/project/repository.dart';

part 'projects_state.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  final ProjectRepository repository;
  ProjectsCubit(this.repository) : super(ProjectsInitial());

  void fetchProjects() {
    emit(ProjectsLoading());
    repository.get_all_projects().then((response) {
      if (response.statusCode == 200) {
        var rawProjects = jsonDecode(response.body) as List;
        List<Project> projects =
            rawProjects.map((project) => Project.fromJson((project))).toList();
        emit(ProjectsLoaded(projects: projects));
      } else {
        emit(ProjectsLoadingErrror());
      }
    });
  }

  addNewProject(Project project) {
    final projects = state.projects;
    projects.add(project);
    emit(ProjectsLoaded(projects: projects));
  }

  deleteProject(int project_id) {
    repository.delete_project(project_id).then((response) {
      if (response.statusCode == 200) {
        final projects = state.projects;
        projects.removeWhere((project) => project.id == project_id);
        emit(ProjectsLoaded(projects: projects));
      } else {
        emit(ProjectsLoadingErrror());
      }
    });
  }
}
