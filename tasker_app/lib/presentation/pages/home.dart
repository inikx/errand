import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tasker_app/presentation/pages/profile.dart';
import 'package:tasker_app/presentation/widgets/my_projects.dart';
import 'package:tasker_app/presentation/widgets/my_tasks.dart';

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
    dateFormat = new DateFormat.yMMMMd('ru');
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
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color(0xFF151B2B).withOpacity(0.8),
                    const Color(0xFF1B1E21),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.0, 0.9),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: SafeArea(
                child: Container(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 50),
                                        child: Row(
                                          children: [
                                            const Text(
                                              'Привет, ',
                                              style: TextStyle(
                                                fontFamily: 'Rubik',
                                                color: Colors.white,
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Text(
                                              'Человек',
                                              style: const TextStyle(
                                                  fontFamily: 'Rubik',
                                                  color: Colors.white,
                                                  fontSize: 28,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ), //add profile name
                                            const Text(
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
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    const Profile()));
                                        //rebuild button to profile.dart *vladICK
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
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                            fontSize:
                                                _ProjectsIsPressed ? 12 : 10,
                                            fontWeight: _ProjectsIsPressed
                                                ? FontWeight.bold
                                                : FontWeight.normal))),
                              ),
                            ],
                          ),
                          _TasksIsPressed
                              ? const MyTasks()
                              : const MyProjects(),
                        ])))));
  }
}
