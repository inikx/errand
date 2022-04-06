import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tasker_app/bloc/projects/projects_cubit.dart';
import 'package:tasker_app/constants/locator.dart';

import 'package:tasker_app/data/models/project.dart';
import 'package:tasker_app/presentation/widgets/project/project.dart';

class ProjectsList extends StatelessWidget {
  final bool openProject;
  final List<Project> projects;
  const ProjectsList(
      {Key? key, required this.projects, required this.openProject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);

    return SmartRefresher(
      physics: const BouncingScrollPhysics(),
      controller: _refreshController,
      header: const ClassicHeader(
          releaseText: "Обновляем...",
          refreshingText: "Обновляем...",
          idleText: "Потяните сильнее чтобы обновить!",
          completeText: "Успешно!"),
      onRefresh: () async {
        getIt<ProjectsCubit>().fetchProjects();
        _refreshController.refreshCompleted();
      },
      child: GridView.count(
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          controller: controller,
          children: projects
              .map((project) =>
                  ProjectWidget(project: project, openProject: openProject))
              .toList()),
    );
  }
}
