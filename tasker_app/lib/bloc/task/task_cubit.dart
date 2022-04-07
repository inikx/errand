import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasker_app/data/models/task.dart';
import 'package:tasker_app/data/services/task/repository.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository repository;
  TaskCubit(this.repository) : super(TaskInitial());

  void fetchTasks() {
    emit(TasksLoading());
    repository.get_all_tasks().then((response) {
      if (response.statusCode == 200) {
        var rawTasks = jsonDecode(response.body) as List;
        List<Task> tasks =
            rawTasks.map((task) => Task.fromJson((task))).toList();
        emit(TasksLoaded(tasks: tasks));
      } else {
        emit(TasksLoadingError());
      }
    });
  }

  void update_task(Task task) {
    var currentTasks = state.tasks;
    repository.update_task(task).then((response) {
      if (response.statusCode == 200) {
        if (state is TasksLoaded || state is TaskUpdated) {
          currentTasks.removeWhere((stateTask) => stateTask.id == task.id);
          currentTasks.add(task);
          emit(TaskUpdated(tasks: currentTasks));
        }
      } else {
        emit(TaskUpdatingError());
      }
    });
  }

  updateTaskInState(Task task) {
    var currentTasks = state.tasks;
    currentTasks.removeWhere((stateTask) => stateTask.id == task.id);
    currentTasks.add(task);
    emit(TaskUpdated(tasks: currentTasks));
  }

  addTaskToState(Task task) {
    final currentState = state;
    final tasks = currentState.tasks;
    tasks.add(task);
    emit(TasksLoaded(tasks: tasks));
  }

  void remove_task(int id) {
    final tasks = state.tasks;
    repository.delete_task(id).then((response) {
      if (response.statusCode == 200) {
        tasks.removeWhere((element) => element.id == id);
        emit(TasksLoaded(tasks: tasks));
      } else {
        emit(TaskRemovingError());
        emit(TasksLoaded(tasks: tasks));
      }
    });
  }
}
