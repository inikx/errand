import 'package:bloc/bloc.dart';
import 'package:tasker_app/data/models/task.dart';
import 'package:tasker_app/data/services/task/repository.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  final TaskRepository repository;
  AddTaskCubit({required this.repository})
      : super(AddTaskInitial(task: Task(date: DateTime.now())));

  void updateTitle(String title) {
    final currentState = state;
    if (currentState is AddingTaskDataChanged ||
        currentState is AddTaskInitial) {
      emit(AddingTaskDataChanged(
          task: currentState.task.copyWith(title: title)));
    }
  }

  void updateProject(int project_id) {
    final currentState = state;
    if (currentState is AddingTaskDataChanged ||
        currentState is AddTaskInitial) {
      emit(AddingTaskDataChanged(
          task: currentState.task.copyWith(project_id: project_id)));
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
    repository
        .addTask(task.title, task.date, task.description, task.status,
            task.user_id, task.project_id)
        .then((response) {
      if (response.statusCode == 200) {
        emit(AddingTaskSuccess());
        emit(AddTaskInitial());
      } else if (response.statusCode == 400) {
        emit(AddingTaskError(task: currentState.task));
      }
    });
  }
}
