import 'package:flutter/material.dart';
import 'package:tasker_app/data/models/task.dart';
import 'package:tasker_app/presentation/widgets/my_done_tasks.dart';
import 'package:tasker_app/presentation/widgets/task.dart';

class TasksList extends StatelessWidget {
  List<Task> tasks;
  List<Task> doneTasks;
  TasksList({Key? key, required this.doneTasks, required this.tasks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
              children: tasks.map((task) => TaskWidget(task: task)).toList()),
          if (doneTasks.isNotEmpty) MyDoneTasks(tasks: doneTasks),
        ]));
  }
}
