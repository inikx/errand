part of 'project_creating_cubit.dart';

@immutable
abstract class ProjectCreatingState {
  late Project data;
}

class ProjectCreatingInitial extends ProjectCreatingState {
  final Project data;

  ProjectCreatingInitial({required this.data});
}

class ProjectCreatingDataChanged extends ProjectCreatingState {
  final Project data;

  ProjectCreatingDataChanged({required this.data});
}

class ProjectCreating extends ProjectCreatingState {}

class ProjectCreatingError extends ProjectCreatingState {}

class ProjectCreated extends ProjectCreatingState {}
