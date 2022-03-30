import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/bloc/task/task_cubit.dart';
import 'package:tasker_app/presentation/widgets/task/my_tasks.dart';
import 'package:tasker_app/presentation/widgets/wallpaper.dart';

class ProjectDetails extends StatelessWidget {
  int id;
  String title;
  ProjectDetails({
    Key? key,
    required this.id,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TaskCubit>(context).fetchTasks();
    return Scaffold(
      body: Stack(children: [
        Wallpaper(),
        SafeArea(
            child: Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
          child: Center(
              child: Column(
            children: [
              Stack(
                children: [
                  IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context)),
                  Container(
                    margin: const EdgeInsets.only(top: 13, bottom: 30),
                    child: Align(
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       color: const Color(0xffC4C4C4).withOpacity(0.15),
              //       borderRadius: BorderRadius.circular(8)),
              //   width: 330,
              //   height: 55,
              //   child: Center(
              //     child: Padding(
              //       padding: const EdgeInsets.fromLTRB(20, 4, 20, 5),
              //       child: Text(
              //         "desc",
              //         //project description value
              //         style: const TextStyle(
              //             color: Colors.white,
              //             fontFamily: 'Rubik',
              //             fontSize: 14),
              //       ),
              //     ),
              //   ),
              // ),
              MyTasks(project_id: id),
            ],
          )),
        )),
      ]),
    );
  }
}
