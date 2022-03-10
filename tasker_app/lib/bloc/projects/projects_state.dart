part of 'projects_cubit.dart';

@immutable
abstract class ProjectsState {}

class ProjectsInitial extends ProjectsState {}

//!Project load state
class ProjectsLoading extends ProjectsState {}

class ProjectsLoaded extends ProjectsState {
  List<Project> data;

  ProjectsLoaded({required this.data});
}

class ProjectsLoadingErrror extends ProjectsState {}
