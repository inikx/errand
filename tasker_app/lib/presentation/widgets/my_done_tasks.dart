import 'package:flutter/material.dart';
import 'package:tasker_app/presentation/widgets/tasks_list.dart';

class MyDoneTasks extends StatefulWidget {
  const MyDoneTasks({Key? key}) : super(key: key);

  @override
  State<MyDoneTasks> createState() => _MyDoneTasksState();
}

class _MyDoneTasksState extends State<MyDoneTasks> {
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
              children: [
                TasksList(done: true),
              ],
            ),
          ),
        ]);
  }
}
