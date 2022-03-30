part of 'project_tasks_cubit.dart';

@immutable
abstract class ProjectTasksState {}

class ProjectTasksInitial extends ProjectTasksState {}

class ProjectTasksLoaded extends ProjectTasksState {
  final List<Task> tasks;

  ProjectTasksLoaded(this.tasks);
}

class ProjectTasksLoading extends ProjectTasksState {}

class ProjectTasksLoadingError extends ProjectTasksState {}
