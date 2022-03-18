import 'package:flutter/material.dart';
import 'package:tasker_app/presentation/widgets/successbar.dart';

class MyProjects extends StatelessWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Мои проекты",
              style: TextStyle(
                  fontFamily: 'Rubik',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
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
                  icon: const Icon(Icons.filter_list,
                      color: Colors.white)), //mb another icon
            ],
          ),
        ],
      ),
    ]);
  }
}
