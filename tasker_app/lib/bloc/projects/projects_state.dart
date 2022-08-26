part of 'projects_cubit.dart';

@immutable
abstract class ProjectsState {
  late List<Project> projects;
}

class ProjectsInitial extends ProjectsState {}

//!Project load state
class ProjectsLoading extends ProjectsState {}

class ProjectsLoaded extends ProjectsState {
  List<Project> projects;

  ProjectsLoaded({required this.projects});
}

class ProjectsLoadingErrror extends ProjectsState {}
