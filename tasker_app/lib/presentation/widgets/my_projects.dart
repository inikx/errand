import 'package:flutter/material.dart';

class MyProjects extends StatelessWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Мои проекты",
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
                  icon: Icon(Icons.add, color: Colors.white)),
              IconButton(
                  onPressed: () {
                    //sort projects button
                  },
                  icon: Icon(Icons.filter_list,
                      color: Colors.white)), //mb another icon
            ],
          ),
        ],
      ),
    ]);
  }
}
