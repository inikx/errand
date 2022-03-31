import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tasker_app/data/models/task.dart';
import 'package:tasker_app/presentation/widgets/project_tasks/project_done_tasks.dart';
import 'package:tasker_app/presentation/widgets/project_tasks/project_task_widget.dart';

class ProjectTasksList extends StatelessWidget {
  List<Task> tasks;
  List<Task> doneTasks;
  ProjectTasksList({Key? key, required this.doneTasks, required this.tasks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return SizedBox(
      height: 61.h,
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: controller,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(
                children: tasks
                    .map((task) => ProjectTaskWidget(task: task))
                    .toList()),
            if (doneTasks.isNotEmpty) ProjectDoneTasks(tasks: doneTasks),
          ])),
    );
  }
}
