import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/presentation/widgets/project_tasks/project_tasks.dart';
import 'package:tasker_app/presentation/widgets/wallpaper.dart';

import '../../bloc/project_tasks/project_tasks_cubit.dart';

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
    BlocProvider.of<ProjectTasksCubit>(context).fetchTasks(id);
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
              ProjectTasks(project_id: id)
            ],
          )),
        )),
      ]),
    );
  }
}
