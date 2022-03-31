part of 'add_project_task_cubit.dart';

@immutable
abstract class AddProjectTaskState {
  late Task task;
}

class AddProjectTaskInitial extends AddProjectTaskState {
  final Task task = Task(date: DateTime.now());
  AddProjectTaskInitial({task});
}

class AddProjectTaskDataChanged extends AddProjectTaskState {
  final Task task;
  AddProjectTaskDataChanged({required this.task});
}

class AddProjectTask extends AddProjectTaskState {}

class AddProjectTaskSuccess extends AddProjectTaskState {}

class AddProjectTaskError extends AddProjectTaskState {
  final Task task;
  AddProjectTaskError({required this.task});
}
