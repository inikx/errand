import 'package:flutter/material.dart';
import 'package:tasker_app/data/models/task.dart';
import 'package:tasker_app/presentation/widgets/task/task_widget.dart';

class MyDoneTasks extends StatelessWidget {
  List<Task> tasks;
  MyDoneTasks({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              iconColor: const Color(0xFF7A79CD),
              collapsedIconColor: const Color(0xFF7A79CD),
              title: const Text(
                'Выполненные',
                style: TextStyle(
                  fontFamily: 'Rubik',
                  color: Color(0xFF7A79CD),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              children: tasks.map((task) => TaskWidget(task: task)).toList(),
            ),
          ),
        ]);
  }
}
