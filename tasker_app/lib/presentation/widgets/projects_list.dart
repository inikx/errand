import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:tasker_app/presentation/widgets/project.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return GridView.count(
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        controller: controller,
        children: const [
          //list
          ProjectWidget(),
          ProjectWidget(),
          ProjectWidget(),
          ProjectWidget(),
          ProjectWidget(),
        ]);
  }
}
