part of 'project_tasks_cubit.dart';

@immutable
abstract class ProjectTasksState {
  late List<Task> tasks;
}

class ProjectTasksInitial extends ProjectTasksState {}

class ProjectTasksLoaded extends ProjectTasksState {
  final List<Task> tasks;

  ProjectTasksLoaded(this.tasks);
}

class ProjectTasksUpdated extends ProjectTasksState {
  final List<Task> tasks;

  ProjectTasksUpdated(this.tasks);
}

class ProjectTasksError extends ProjectTasksState {}

class ProjectTasksLoading extends ProjectTasksState {}

class ProjectTasksLoadingError extends ProjectTasksState {}
