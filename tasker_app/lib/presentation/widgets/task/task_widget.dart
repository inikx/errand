import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/bloc/add_task/add_task_cubit.dart';
import 'package:tasker_app/bloc/task/task_cubit.dart';
import 'package:tasker_app/constants/locator.dart';
import 'package:tasker_app/data/models/task.dart';
import 'package:tasker_app/route.dart';

class TaskWidget extends StatelessWidget {
  Task task;
  TaskWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: SizedBox(
        child: Card(
          color: const Color(0x26C4C4C4),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onLongPress: () {
              getIt<TaskCubit>().remove_task(task.id);
            },
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        getIt<TaskCubit>().update_task(Task(
                            id: task.id,
                            title: task.title,
                            date: task.date,
                            description: task.description,
                            status: task.status == 2 ? 1 : 2,
                            user_id: task.user_id,
                            project_id: task.project_id));
                      },
                      icon: Icon(
                          task.status == 2
                              ? Icons.check_box_outlined
                              : Icons.check_box_outline_blank,
                          color: const Color(0xFFDADADA),
                          size: 28)),
                  Expanded(
                    child: Text(task.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontFamily: 'Rubik',
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
