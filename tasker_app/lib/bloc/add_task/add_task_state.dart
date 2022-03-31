part of 'add_task_cubit.dart';

abstract class AddTaskState {
  late Task task;
}

class AddTaskInitial extends AddTaskState {
  final Task task = Task(date: DateTime.now());
  AddTaskInitial({task});
}

class AddingTaskDataChanged extends AddTaskState {
  final Task task;
  AddingTaskDataChanged({required this.task});
}

class AddingTask extends AddTaskState {}

class AddingTaskSuccess extends AddTaskState {}

class AddingTaskError extends AddTaskState {
  final Task task;
  AddingTaskError({required this.task});
}
