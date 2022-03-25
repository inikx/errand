import 'package:flutter/material.dart';
import 'package:tasker_app/presentation/widgets/projects_list.dart';

class MyProjects extends StatelessWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            const Text("Мои проекты",
                style: TextStyle(
                    fontFamily: 'Rubik',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            IconButton(
                onPressed: () {
                  //notifications button
                },
                icon: const Icon(Icons.notifications_outlined,
                    color: Colors.white)),
          ]),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    //add project button
                  },
                  icon: const Icon(Icons.add, color: Colors.white)),
              IconButton(
                  onPressed: () {
                    //sort projects button
                  },
                  icon: const Icon(Icons.filter_list, color: Colors.white)),
            ],
          ),
        ],
      ),
      const SizedBox(height: 10),
      SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.4,
          child: const ProjectsList()),
    ]);
  }
}
