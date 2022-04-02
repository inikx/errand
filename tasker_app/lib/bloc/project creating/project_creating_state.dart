part of 'project_creating_cubit.dart';

@immutable
abstract class ProjectCreatingState {
  late Project data;
  late List<String> users;
}

class ProjectCreatingInitial extends ProjectCreatingState {
  final Project data;
  final List<String> users;

  ProjectCreatingInitial({required this.data, required this.users});
}

class ProjectCreatingDataChanged extends ProjectCreatingState {
  final Project data;
  final List<String> users;

  ProjectCreatingDataChanged({required this.data, required this.users});
}

class ProjectCreating extends ProjectCreatingState {}

class ProjectCreatingError extends ProjectCreatingState {}

class ProjectCreated extends ProjectCreatingState {}
