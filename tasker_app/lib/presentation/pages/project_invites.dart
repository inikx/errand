import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:tasker_app/bloc/project_invites/project_invites_cubit.dart';
import 'package:tasker_app/constants/locator.dart';
import 'package:tasker_app/data/models/project.dart';
import 'package:tasker_app/data/services/project/repository.dart';
import 'package:tasker_app/presentation/widgets/wallpaper.dart';

class ProjectInvitesPage extends StatelessWidget {
  const ProjectInvitesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getIt<ProjectInvitesCubit>().fetchInvites();
    return BlocBuilder<ProjectInvitesCubit, ProjectInvitesState>(
      builder: (context, state) {
        return Scaffold(
            body: Stack(children: [
          const Wallpaper(),
          SafeArea(
              child: Center(
                  child: state is ProjectInvitesLoaded
                      ? SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: const Pad(horizontal: 20),
                          child: state.projects.isNotEmpty
                              ? Column(
                                  children: state.projects
                                      .map((project) =>
                                          ProjectWidget(project: project))
                                      .toList())
                              : Text("У вас нет приглашений",
                                  style: const TextStyle(
                                      fontFamily: 'Rubik',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                        )
                      : const CircularProgressIndicator())),
        ]));
      },
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final Project project;
  const ProjectWidget({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: const Color(0x26C4C4C4),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onLongPress: () {},
          onTap: () => {
            showDialog(
                context: context,
                builder: (context) {
                  return ProjectDialog(project: project);
                })
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Padding(
              padding: const Pad(horizontal: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    width: 80,
                    child: Text(project.creator,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontFamily: 'Rubik',
                            color: Color(0xff7A79CD),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                  Text("пригласил в проект",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                  Positioned(
                    right: 0,
                    width: 60,
                    child: Text(project.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontFamily: 'Rubik',
                            color: Color(0xff7A79CD),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
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

class ProjectDialog extends StatelessWidget {
  final Project project;
  const ProjectDialog({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.fromLTRB(20, 26, 20, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff252934)),
          width: 90.w,
          height: 24.h,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Text("Принять приглашение",
                      style: const TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.normal))),
              Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("от ",
                          style: const TextStyle(
                              fontFamily: 'Rubik',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal)),
                      Text(project.creator,
                          style: const TextStyle(
                              fontFamily: 'Rubik',
                              color: Color(0xFF7A79CD),
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
              Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("в проект ",
                          style: const TextStyle(
                              fontFamily: 'Rubik',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal)),
                      Text(project.title,
                          style: const TextStyle(
                              fontFamily: 'Rubik',
                              color: Color(0xFF7A79CD),
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      Text("?",
                          style: const TextStyle(
                              fontFamily: 'Rubik',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal)),
                    ],
                  )),
              Padding(
                padding: const Pad(top: 20),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 120,
                          height: 40,
                          child: ElevatedButton(
                              child: const Text('Принять',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'Rubik',
                                      fontSize: 16)),
                              onPressed: () async {
                                getIt<ProjectInvitesCubit>()
                                    .updateProject(project, 1);
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF70AA67)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )))),
                        ),
                        Container(
                          width: 120,
                          height: 40,
                          child: ElevatedButton(
                            child: const Text('Отклонить',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'Rubik',
                                    fontSize: 16)),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xCCD43232)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ))),
                            onPressed: () async {
                              getIt<ProjectInvitesCubit>()
                                  .updateProject(project, 1);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          )),
    );
  }
}
