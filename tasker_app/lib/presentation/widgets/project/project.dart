import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/bloc/task/task_cubit.dart';
import 'package:tasker_app/constants/strings.dart';
import 'package:tasker_app/data/models/project.dart';
import 'package:tasker_app/data/models/task.dart';
import 'package:tasker_app/presentation/widgets/task/tasks_list.dart';
import 'package:tasker_app/route.dart';

class ProjectWidget extends StatelessWidget {
  final Project project;
  const ProjectWidget({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
      child: SizedBox(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Navigator.pushNamed(context, PROJECT_DETAILS,
                  arguments:
                      ProjectDetailsScreenArguments(project.id, project.title));
            },
            child: Stack(children: [
              Ink(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                        colors: [
                          Color(0xFF908FEC),
                          Color(0xFF3A49F9),
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(0.0, 1.0),
                        tileMode: TileMode.clamp)),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(project.title,
                            overflow: TextOverflow.visible,
                            style: const TextStyle(
                                fontFamily: 'Rubik',
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            BlocBuilder<TaskCubit, TaskState>(
                                builder: (context, state) {
                              if ((state is TasksLoaded ||
                                      state is TaskUpdated) &&
                                  project.id != -1) {
                                TasksList taskCount = TasksList(
                                    tasks: state.tasks
                                        .where((task) =>
                                            task.project_id == project.id &&
                                            task.status != 2)
                                        .toList(),
                                    doneTasks: state.tasks
                                        .where((task) =>
                                            task.project_id == project.id &&
                                            task.status == 2)
                                        .toList());

                                var allTasksCount = taskCount.tasks.length;
                                var doneTasksCount = taskCount.doneTasks.length;
                                return Text(
                                    allTasksCount != doneTasksCount
                                        ? '${doneTasksCount}/${allTasksCount + doneTasksCount}'
                                        : "",
                                    style: TextStyle(
                                        fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontSize: 43,
                                        fontWeight: FontWeight.w100));
                              } else if (state is TasksLoading) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return Center(child: Text("Error"));
                              }
                            })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 60,
                top: 90,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0x13242736),
                  ),
                  height: 150,
                  width: 150,
                ),
              ),
              Positioned(
                left: 60,
                bottom: 80,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0x13242736),
                  ),
                  height: 150,
                  width: 150,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
