import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/bloc/project_tasks/project_tasks_cubit.dart';
import 'package:tasker_app/presentation/widgets/bottom_sheets/project_task_bottom_sheet.dart';
import 'package:tasker_app/presentation/widgets/project_tasks/project_tasks_list.dart';
import 'package:tasker_app/presentation/widgets/snackbars/exception_widget.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../data/models/task.dart';

class ProjectTasks extends StatelessWidget {
  final int project_id;
  const ProjectTasks({Key? key, required this.project_id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectTasksCubit, ProjectTasksState>(
      listener: (context, state) {
        if (state is ProjectTasksError)
          showTopSnackBar(context,
              const ErrorSnackbar(info: "нельзя удалить чужую задачу!"));
      },
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Задачи проекта",
                style: TextStyle(
                    fontFamily: 'Rubik',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      AddProjectTaskBottomSheet(context, project_id);
                    },
                    icon: const Icon(Icons.add, color: Colors.white)),
                IconButton(
                    onPressed: () {
                      //sort tasks button
                    },
                    icon: const Icon(Icons.filter_list,
                        color: Colors.white)), //mb another icon
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: BlocBuilder<ProjectTasksCubit, ProjectTasksState>(
              builder: (context, state) {
                if (state is ProjectTasksLoaded ||
                    state is ProjectTasksUpdated) {
                  var tasks = state.tasks;
                  List<Task> allTasks = [];
                  List<Task> doneTasks = [];

                  for (var task in tasks) {
                    if (task.status == 2) {
                      doneTasks.add(task);
                    } else {
                      allTasks.add(task);
                    }
                  }
                  return ProjectTasksList(
                      tasks: allTasks, doneTasks: doneTasks);
                } else if (state is ProjectTasksLoading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container();
                }
              },
            )),
      ]),
    );
  }
}
