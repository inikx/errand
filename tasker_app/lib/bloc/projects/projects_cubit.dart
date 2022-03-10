import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasker_app/data/models/project.dart';
import 'package:tasker_app/data/services/project/repository.dart';

part 'projects_state.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  final ProjectRepository repository;
  ProjectsCubit({required this.repository}) : super(ProjectsInitial());

  void fetchProjects() {
    emit(ProjectsLoading());
    repository.get_all_projects().then((response) {
      emit(ProjectsLoaded(
          data: jsonDecode(response.body)
              .map((project) => Project.fromJson(project))
              .toList()));
    });
  }
}
