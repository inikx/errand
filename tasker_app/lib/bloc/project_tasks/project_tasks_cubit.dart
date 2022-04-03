import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasker_app/bloc/task/task_cubit.dart';
import 'package:tasker_app/data/models/task.dart';
import 'package:tasker_app/data/services/project/repository.dart';
import 'package:tasker_app/data/services/task/repository.dart';

part 'project_tasks_state.dart';

class ProjectTasksCubit extends Cubit<ProjectTasksState> {
  final TaskRepository taskRepository;
  final TaskCubit taskCubit;
  ProjectTasksCubit(
    this.taskRepository,
    this.taskCubit,
    ProjectRepository projectRepository,
  ) : super(ProjectTasksInitial());

  void fetchTasks(int project_id) {
    emit(ProjectTasksLoading());
    taskRepository.get_all_project_tasks(project_id).then((response) {
      if (response.statusCode == 200) {
        var rawTasks = jsonDecode(response.body) as List;
        List<Task> tasks =
            rawTasks.map((task) => Task.fromJson((task))).toList();
        emit(ProjectTasksLoaded(tasks));
      } else {
        emit(ProjectTasksLoadingError());
      }
    });
  }

  void update_task(Task task) {
    taskRepository.update_task(task).then((response) {
      if (response.statusCode == 200) {
        if (state is ProjectTasksLoaded || state is ProjectTasksUpdated) {
          var currentTasks = state.tasks;
          currentTasks.removeWhere((stateTask) => stateTask.id == task.id);
          currentTasks.add(task);
          taskCubit.updateTaskInState(task);
          emit(ProjectTasksUpdated(currentTasks));
        }
      } else {
        emit(ProjectTasksError());
      }
    });
  }

  addTaskToState(Task task) {
    final currentState = state;
    final tasks = currentState.tasks;
    tasks.add(task);
    emit(ProjectTasksLoaded(tasks));
  }

  // void remove_task(int id) {
  //   emit(TaskRemoving());
  //   repository.delete_task(id).then((response) {
  //     if (response.statusCode == 200) {
  //       emit(TaskRemoved());
  //       emit(TaskInitial());
  //     } else {
  //       emit(TaskRemovingError());
  //     }
  //   });
  // }
}
