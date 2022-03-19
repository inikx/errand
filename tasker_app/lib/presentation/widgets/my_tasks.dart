import 'package:flutter/material.dart';
import 'package:tasker_app/data/models/task.dart';
import 'package:tasker_app/presentation/widgets/tasks_list.dart';
import 'dart:math';

class MyTasks extends StatelessWidget {
  const MyTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sheet = 0;
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
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => Container(
                        height: MediaQuery.of(context).copyWith().size.height *
                            (3 / 4),
                        //height: 600,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xff252934),
                                  Color.fromARGB(255, 17, 17, 17),
                                ],
                                begin: FractionalOffset(0.0, 0.0),
                                end: FractionalOffset(0.0, 0.9),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(40))),
                        child: Center(
                          child: Column(children: [
                            Transform.rotate(
                              angle: 90 * pi / 180,
                              child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () => Navigator.pop(context)),
                            ),
                            const Text(
                              'Создать задачу',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 30),
                                decoration: BoxDecoration(
                                    color: const Color(0xffC4C4C4)
                                        .withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(8)),
                                width: 330,
                                height: 55,
                                child: Center(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 4, 20, 5),
                                    child: TextField(
                                      onChanged: (String value) async {
                                        //название задачи
                                      },
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Rubik',
                                          fontSize: 14),
                                      cursorColor: Colors.white,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          labelStyle: TextStyle(
                                            color: Color(0x80FFFFFF),
                                            fontFamily: 'Rubik',
                                          ),
                                          hintText: 'Введите название задачи',
                                          hintStyle:
                                              TextStyle(color: Colors.grey)),
                                    ),
                                  ),
                                )),
                            Container(
                                margin: const EdgeInsets.only(top: 30),
                                decoration: BoxDecoration(
                                    color: const Color(0xffC4C4C4)
                                        .withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(8)),
                                width: 330,
                                height: 100,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 4, 20, 5),
                                  child: TextField(
                                    onChanged: (String value) async {
                                      //описаниезадачи
                                    },
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Rubik',
                                        fontSize: 14),
                                    cursorColor: Colors.white,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        labelStyle: TextStyle(
                                          color: Color(0x80FFFFFF),
                                          fontFamily: 'Rubik',
                                        ),
                                        hintText: 'Введите описание',
                                        hintStyle:
                                            TextStyle(color: Colors.grey)),
                                  ),
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 30, 30, 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      icon: const Icon(
                                        Icons.calendar_today_rounded,
                                        size: 35,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () =>
                                          print('Календарь работает')),
                                  IconButton( 
                                      icon: const Icon(
                                        Icons.notification_add_rounded,
                                        size: 35,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () =>
                                          print('Уведомления работают')),
                                          IconButton(
                                      icon: const Icon(
                                        Icons.format_color_fill_rounded,
                                        size: 35,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () =>
                                          print('Заливка работает')),
                                ],
                              ),
                            ),
                            Container(
                              width: 270,
                              height: 50,
                              margin: const EdgeInsets.only(top: 30),
                              child: ElevatedButton(
                                  child: const Text('Создать задачу',
                                      style: TextStyle(
                                          fontFamily: 'Rubik', fontSize: 16)),
                                  onPressed: () async {
                                    print('Создать задачу');
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0xff7A79CD)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      )))),
                            ),
                          ]),
                        ),
                      ),
                    );
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
          child: TasksList(tasks: [
            Task(
                date: DateTime.now(),
                title: "поиграть с мамой игоря",
                status: 0),
            Task(date: DateTime.now(), title: "подарить илье ручку", status: 0),
            Task(
                date: DateTime.now(),
                title:
                    "Собрать весь assdosers и ываолдывл аорывлоралыовр аолрыfdddddddddddddddваолрsddddd",
                status: 0),
          ], doneTasks: [
            Task(date: DateTime.now(), title: "done task", status: 1),
          ])),
    ]);
  }
}
