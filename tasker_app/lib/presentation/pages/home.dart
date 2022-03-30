import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:tasker_app/constants/strings.dart';
import 'package:tasker_app/presentation/widgets/project/my_projects.dart';
import 'package:tasker_app/presentation/widgets/task/my_tasks.dart';

import '../widgets/wallpaper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _TasksIsPressed = true;
  bool _ProjectsIsPressed = false;
  late DateFormat dateFormat;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('ru');
  }

  void _myCallback() {
    setState(() {
      _TasksIsPressed = !_TasksIsPressed;
      _ProjectsIsPressed = !_ProjectsIsPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    var dateTime = new DateTime.now();
    return Scaffold(
        body: Stack(
      children: [
        const Wallpaper(),
        SafeArea(
            child: Container(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    //margin: const EdgeInsets.only(top: 50),
                                    child: Row(
                                      children: const [
                                        Text(
                                          'Привет, ',
                                          style: TextStyle(
                                            fontFamily: 'Rubik',
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'ВладЫк',
                                          style: TextStyle(
                                              fontFamily: 'Rubik',
                                              color: Color(0xff7A79CD),
                                              fontSize: 28,
                                              fontWeight: FontWeight.w300),
                                        ), //add profile name
                                        Text(
                                          '!',
                                          style: TextStyle(
                                            fontFamily: 'Rubik',
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text('Хорошего дня.',
                                      style: TextStyle(
                                          fontFamily: 'Rubik',
                                          color: Color(0x80FFFFFF),
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal)),
                                ]),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  shape: BoxShape.circle),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, PROFILE);
                                  },
                                  icon: const Icon(Icons.person,
                                      size: 30, color: Colors.white)),
                            ) //add profile image
                          ],
                        ),
                      ),
                      Text(dateFormat.format(dateTime),
                          style: const TextStyle(
                              fontFamily: 'Rubik',
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: _TasksIsPressed
                                        ? MaterialStateProperty.all(
                                            const Color(0xff7A79CD))
                                        : MaterialStateProperty.all(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ))),
                                onPressed: _TasksIsPressed == false
                                    ? _myCallback
                                    : null,
                                child: Text("Задачи",
                                    style: TextStyle(
                                        fontFamily: 'Rubik',
                                        color: _TasksIsPressed
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: _TasksIsPressed ? 12 : 10,
                                        fontWeight: _TasksIsPressed
                                            ? FontWeight.bold
                                            : FontWeight.normal))),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: _ProjectsIsPressed
                                        ? MaterialStateProperty.all(
                                            const Color(0xff7A79CD))
                                        : MaterialStateProperty.all(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ))),
                                onPressed: _ProjectsIsPressed == false
                                    ? _myCallback
                                    : null,
                                child: Text("Проекты",
                                    style: TextStyle(
                                        fontFamily: 'Rubik',
                                        color: _ProjectsIsPressed
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: _ProjectsIsPressed ? 12 : 10,
                                        fontWeight: _ProjectsIsPressed
                                            ? FontWeight.bold
                                            : FontWeight.normal))),
                          ),
                        ],
                      ),
                      _TasksIsPressed
                          ? MyTasks(project_id: -1)
                          : const MyProjects(),
                    ]))),
      ],
    ));
  }
}
