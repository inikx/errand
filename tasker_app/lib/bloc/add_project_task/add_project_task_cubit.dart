import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasker_app/bloc/project_tasks/project_tasks_cubit.dart';
import 'package:tasker_app/data/models/task.dart';
import 'package:tasker_app/data/services/task/repository.dart';

part 'add_project_task_state.dart';

class AddProjectTaskCubit extends Cubit<AddProjectTaskState> {
  final TaskRepository repository;
  final ProjectTasksCubit projectTaskCubit;

  AddProjectTaskCubit(this.repository, this.projectTaskCubit)
      : super(AddProjectTaskInitial(task: Task(date: DateTime.now())));

  void updateTitle(String title) {
    final currentState = state;
    if (currentState is AddProjectTaskDataChanged ||
        currentState is AddProjectTaskInitial) {
      emit(AddProjectTaskDataChanged(
          task: currentState.task.copyWith(title: title)));
    }
  }

  void updateProject(int project_id) {
    final currentState = state;
    if (currentState is AddProjectTaskDataChanged ||
        currentState is AddProjectTaskInitial) {
      emit(AddProjectTaskDataChanged(
          task: currentState.task.copyWith(project_id: project_id)));
    }
  }

  void updateDescription(String description) {
    final currentState = state;
    if (currentState is AddProjectTaskDataChanged ||
        currentState is AddProjectTaskInitial) {
      emit(AddProjectTaskDataChanged(
          task: currentState.task.copyWith(description: description)));
    }
  }

  void addTask(Task task) {
    final currentState = state;
    emit(AddProjectTask());
    repository.addTask(task).then((response) {
      if (response.statusCode == 200) {
        var newTask = jsonDecode(response.body);
        emit(AddProjectTaskSuccess());
        emit(AddProjectTaskInitial());
        projectTaskCubit.addTaskToState(Task.fromJson(newTask));
      } else if (response.statusCode == 400) {
        emit(AddProjectTaskError(task: currentState.task));
      }
    });
  }
}
