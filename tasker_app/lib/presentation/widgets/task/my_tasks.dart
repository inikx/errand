import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/bloc/task/task_cubit.dart';
import 'package:tasker_app/constants/locator.dart';
import 'package:tasker_app/data/models/task.dart';
import 'package:tasker_app/presentation/widgets/bottom_sheets/task.dart';
import 'package:tasker_app/presentation/widgets/task/tasks_list.dart';

class MyTasks extends StatelessWidget {
  const MyTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TaskCubit>(context).fetchTasks();
    double sheet = 0;
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Мои задачи",
              style: TextStyle(
                  fontFamily: 'Rubik',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    AddTaskBottomSheet(context);
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
          height: MediaQuery.of(context).size.height * 0.54, //?
          child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              if (state is TasksLoaded) {
                var tasks = state.tasks;
                List<Task> allTasks = [];
                List<Task> doneTasks = [];

                print(allTasks);
                for (var task in tasks) {
                  if (task.status == 2) {
                    doneTasks.add(task);
                  } else {
                    allTasks.add(task);
                  }
                }
                return TasksList(tasks: allTasks, doneTasks: doneTasks);
              } else if (state is TasksLoading) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Center(child: Text("Error"));
              }
            },
          )),
    ]);
  }
}
