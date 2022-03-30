part of 'task_cubit.dart';

@immutable
abstract class TaskState {
  late List<Task> tasks;
}

class TaskInitial extends TaskState {}

//! Task load states
class TasksLoading extends TaskState {}

class TasksLoaded extends TaskState {
  final List<Task> tasks;

  TasksLoaded({required this.tasks});
}

class TasksLoadingError extends TaskState {}

//! Task create states
class TaskCreating extends TaskState {}

class TaskCreated extends TaskState {}

class TasksCreatingError extends TaskState {}

//! Task update states
class TaskUpdating extends TaskState {}

class TaskUpdated extends TaskState {}

class TaskUpdatingError extends TaskState {}

//! Task remove states
class TaskRemoving extends TaskState {}

class TaskRemoved extends TaskState {}

class TaskRemovingError extends TaskState {}
