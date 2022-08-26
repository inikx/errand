import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import 'package:tasker_app/bloc/task/task_cubit.dart';
import 'package:tasker_app/constants/locator.dart';
import 'package:tasker_app/data/models/task.dart';
import 'package:tasker_app/presentation/widgets/task/my_done_tasks.dart';
import 'package:tasker_app/presentation/widgets/task/task_widget.dart';

class TasksList extends StatelessWidget {
  List<Task> tasks;
  List<Task> doneTasks;
  TasksList({Key? key, required this.doneTasks, required this.tasks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);

    return SizedBox(
      height: 61.h,
      child: SmartRefresher(
        physics: const BouncingScrollPhysics(),
        controller: _refreshController,
        header: const ClassicHeader(
            releaseText: "Обновляем...",
            refreshingText: "Обновляем...",
            idleText: "Потяните сильнее чтобы обновить!",
            completeText: "Успешно!"),
        onRefresh: () async {
          getIt<TaskCubit>().fetchTasks();
          _refreshController.refreshCompleted();
        },
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: controller,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(
                  children:
                      tasks.map((task) => TaskWidget(task: task)).toList()),
              if (doneTasks.isNotEmpty) MyDoneTasks(tasks: doneTasks),
            ])),
      ),
    );
  }
}
