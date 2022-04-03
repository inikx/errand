import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasker_app/bloc/project_tasks/project_tasks_cubit.dart';
import 'package:tasker_app/bloc/task/task_cubit.dart';
import 'package:tasker_app/data/models/task.dart';
import 'package:tasker_app/data/models/user.dart';
import 'package:tasker_app/data/services/project/repository.dart';
import 'package:tasker_app/data/services/task/repository.dart';

part 'add_project_task_state.dart';

class AddProjectTaskCubit extends Cubit<AddProjectTaskState> {
  final TaskRepository taskRepository;
  final ProjectRepository projectRepository;
  final ProjectTasksCubit projectTaskCubit;
  final TaskCubit taskCubit;

  AddProjectTaskCubit(
    this.taskRepository,
    this.projectRepository,
    this.projectTaskCubit,
    this.taskCubit,
  ) : super(AddProjectTaskInitial(task: Task(date: DateTime.now())));

  void updateTitle(String title) {
    final currentState = state;
    if (currentState is AddProjectTaskDataChanged ||
        currentState is AddProjectTaskInitial) {
      emit(AddProjectTaskDataChanged(
          task: currentState.task.copyWith(title: title),
          users: currentState.users));
    }
  }

  void getProjectUsers(int projectId) {
    final currentState = state;
    if (currentState is AddProjectTaskDataChanged ||
        currentState is AddProjectTaskInitial) {
      projectRepository.getProjectUsers(projectId).then((response) {
        if (response.statusCode == 200) {
          var json = jsonDecode(response.body) as List;
          List<User> users = json.map((user) => User.fromJson(user)).toList();
          emit(
              AddProjectTaskDataChanged(task: currentState.task, users: users));
        }
      });
    }
  }

  void updateProject(int project_id) {
    final currentState = state;
    if (currentState is AddProjectTaskDataChanged ||
        currentState is AddProjectTaskInitial) {
      emit(AddProjectTaskDataChanged(
          task: currentState.task.copyWith(project_id: project_id),
          users: currentState.users));
    }
  }

  void updateUser(int user_id) {
    final currentState = state;
    if (currentState is AddProjectTaskDataChanged ||
        currentState is AddProjectTaskInitial) {
      emit(AddProjectTaskDataChanged(
          task: currentState.task.copyWith(user_id: user_id),
          users: currentState.users));
    }
  }

  void updateDescription(String description) {
    final currentState = state;
    if (currentState is AddProjectTaskDataChanged ||
        currentState is AddProjectTaskInitial) {
      emit(AddProjectTaskDataChanged(
          task: currentState.task.copyWith(description: description),
          users: currentState.users));
    }
  }

  void addTask(Task task) {
    final currentState = state;
    emit(AddProjectTask());
    taskRepository.addTask(task).then((response) {
      if (response.statusCode == 200) {
        var newTask = jsonDecode(response.body);
        emit(AddProjectTaskSuccess());
        emit(AddProjectTaskInitial());
        projectTaskCubit.addTaskToState(Task.fromJson(newTask));
        taskCubit.addTaskToState(Task.fromJson(newTask));
      } else if (response.statusCode == 400) {
        emit(AddProjectTaskError(
            task: currentState.task, users: currentState.users));
      }
    });
  }
}
