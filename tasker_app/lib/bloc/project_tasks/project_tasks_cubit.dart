import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasker_app/bloc/task/task_cubit.dart';
import 'package:tasker_app/data/models/task.dart';
import 'package:tasker_app/data/services/task/repository.dart';

part 'project_tasks_state.dart';

class ProjectTasksCubit extends Cubit<ProjectTasksState> {
  final TaskRepository repository;
  ProjectTasksCubit(this.repository) : super(ProjectTasksInitial());

  void fetchTasks(int project_id) {
    emit(ProjectTasksLoading());
    repository.get_all_project_tasks(project_id).then((response) {
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
}
