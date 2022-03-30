import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

import 'package:tasker_app/data/models/project.dart';
import 'package:tasker_app/presentation/widgets/project/project.dart';

class ProjectsList extends StatelessWidget {
  final List<Project> projects;
  const ProjectsList({
    Key? key,
    required this.projects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return GridView.count(
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        controller: controller,
        children: projects
            .map((project) => ProjectWidget(project: project))
            .toList());
  }
}
