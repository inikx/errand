import 'package:flutter/material.dart';
import 'package:tasker_app/presentation/widgets/tasks_list.dart';

class MyTasks extends StatelessWidget {
  const MyTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    //add tasks button
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
          height: MediaQuery.of(context).size.height - 360, //?
          child: TasksList(done: false)),
    ]);
  }
}
