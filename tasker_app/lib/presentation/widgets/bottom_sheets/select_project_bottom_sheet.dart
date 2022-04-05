import 'dart:math';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tasker_app/bloc/add_task/add_task_cubit.dart';
import 'package:tasker_app/bloc/task/task_cubit.dart';
import 'package:tasker_app/data/services/task/repository.dart';
import 'package:tasker_app/presentation/widgets/project/projects_list.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'package:tasker_app/bloc/project%20creating/project_creating_cubit.dart';
import 'package:tasker_app/bloc/projects/projects_cubit.dart';
import 'package:tasker_app/constants/locator.dart';
import 'package:tasker_app/data/services/project/repository.dart';
import 'package:tasker_app/presentation/widgets/snackbars/success_widget.dart';

Future<dynamic> SelectProjectBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProjectsCubit(getIt<ProjectRepository>()),
        )
      ],
      child: BottomSheet(),
    ),
  );
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProjectsCubit>(context).fetchProjects();
    var controller = TextEditingController();
    var scrollController = ScrollController();
    return Container(
        height: MediaQuery.of(context).copyWith().size.height * (3 / 4),
        //height: 600,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xff252934),
                  Color.fromARGB(255, 17, 17, 17),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(0.0, 0.9),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Center(
            child: Column(children: [
          Stack(
            children: [
              Center(
                child: Transform.rotate(
                  angle: 90 * pi / 180,
                  child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 20,
                        color: Colors.grey,
                      ),
                      onPressed: () => Navigator.pop(context)),
                ),
              ),
            ],
          ),
          const Text(
            'Выбрать проект',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(36, 30, 18, 30),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                child: BlocBuilder<ProjectsCubit, ProjectsState>(
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case ProjectsLoaded:
                        return ProjectsList(
                            projects: state.projects, openProject: false);
                      default:
                        return Center(child: CircularProgressIndicator());
                    }
                  },
                )),
          ),
        ])));
  }
}
