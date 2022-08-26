import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:tasker_app/bloc/task/task_cubit.dart';
import 'package:tasker_app/data/models/task.dart';
import 'package:tasker_app/data/services/task/repository.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  final TaskRepository repository;
  final TaskCubit taskCubit;
  AddTaskCubit(this.repository, this.taskCubit)
      : super(AddTaskInitial(task: Task(date: DateTime.now())));

  void updateTitle(String title) {
    final currentState = state;
    if (currentState is AddingTaskDataChanged ||
        currentState is AddTaskInitial) {
      emit(AddingTaskDataChanged(
          task: currentState.task.copyWith(title: title)));
    }
  }

  void updateProject(List<dynamic> projectData) {
    final currentState = state;
    if (currentState is AddingTaskDataChanged ||
        currentState is AddTaskInitial) {
      emit(AddingTaskDataChanged(
          task: currentState.task.copyWith(
              project_id: projectData[0] != null
                  ? int.parse(projectData[0].toString())
                  : null,
              project_title:
                  projectData[1] != null ? projectData[1] : "Проект")));
    }
  }

  void dropProject() {
    final currentState = state;
    if (currentState is AddingTaskDataChanged ||
        currentState is AddTaskInitial) {
      emit(AddingTaskDataChanged(
          task: currentState.task.copyWith(project_id: -1, project_title: "")));
    }
  }

  void updateDescription(String description) {
    final currentState = state;
    if (currentState is AddingTaskDataChanged ||
        currentState is AddTaskInitial) {
      emit(AddingTaskDataChanged(
          task: currentState.task.copyWith(description: description)));
    }
  }

  void addTask(Task task) {
    final currentState = state;
    emit(AddingTask());
    repository.addTask(task).then((response) {
      if (response.statusCode == 200) {
        var newTask = jsonDecode(response.body);
        emit(AddingTaskSuccess());
        emit(AddTaskInitial());
        taskCubit.addTaskToState(Task.fromJson(newTask));
      } else if (response.statusCode == 400) {
        emit(AddingTaskError(task: currentState.task));
      }
    });
  }
}
