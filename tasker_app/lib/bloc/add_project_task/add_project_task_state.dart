part of 'add_project_task_cubit.dart';

@immutable
abstract class AddProjectTaskState {
  late Task task;
  late List<User> users;
}

class AddProjectTaskInitial extends AddProjectTaskState {
  final Task task = Task(date: DateTime.now());
  final List<User> users = [];
  AddProjectTaskInitial({task, users});
}

class AddProjectTaskDataChanged extends AddProjectTaskState {
  final Task task;
  final List<User> users;
  AddProjectTaskDataChanged({required this.task, required this.users});
}

class AddProjectTask extends AddProjectTaskState {}

class AddProjectTaskSuccess extends AddProjectTaskState {}

class AddProjectTaskError extends AddProjectTaskState {
  final Task task;
  final List<User> users;
  AddProjectTaskError({required this.task, required this.users});
}
