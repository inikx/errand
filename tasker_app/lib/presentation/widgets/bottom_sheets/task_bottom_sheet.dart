import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

import 'package:tasker_app/bloc/add%20task/add_task_cubit.dart';
import 'package:tasker_app/bloc/task/task_cubit.dart';
import 'package:tasker_app/constants/locator.dart';
import 'package:tasker_app/data/services/task/network_service.dart';
import 'package:tasker_app/data/services/task/repository.dart';
import 'package:tasker_app/presentation/widgets/snackbars/exception_widget.dart';
import 'package:tasker_app/presentation/widgets/snackbars/success_widget.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

Future<dynamic> AddTaskBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => BlocProvider(
      create: (context) =>
          AddTaskCubit(getIt<TaskRepository>(), getIt<TaskCubit>()),
      child: BottomSheet(),
    ),
  );
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case AddingTaskSuccess:
            showTopSnackBar(
              context,
              const SuccessSnackbar(info: "Задача успешно добавлена!"),
            );
            return;
          case AddingTaskError:
            showTopSnackBar(
              context,
              const ErrorSnackbar(info: "Не удалось добавить задачу"),
            );
            return;
        }
      },
      child: Container(
        height: MediaQuery.of(context).copyWith().size.height * (3 / 4),
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
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
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
            BlocBuilder<AddTaskCubit, AddTaskState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case AddingTask:
                    return CircularProgressIndicator();
                  default:
                    return Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 30),
                            decoration: BoxDecoration(
                                color:
                                    const Color(0xffC4C4C4).withOpacity(0.15),
                                borderRadius: BorderRadius.circular(8)),
                            width: 330,
                            height: 55,
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 4, 20, 5),
                                child: TextField(
                                  onChanged: (String value) async {
                                    context
                                        .read<AddTaskCubit>()
                                        .updateTitle(value);
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
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.only(top: 30),
                            decoration: BoxDecoration(
                                color:
                                    const Color(0xffC4C4C4).withOpacity(0.15),
                                borderRadius: BorderRadius.circular(8)),
                            width: 330,
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 4, 20, 5),
                              child: TextField(
                                onChanged: (String value) async {
                                  context
                                      .read<AddTaskCubit>()
                                      .updateDescription(value);
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
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  icon: const Icon(
                                    Icons.calendar_today_rounded,
                                    size: 35,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () => print('Календарь работает')),
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
                                  onPressed: () => print('Заливка работает')),
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
                                BlocProvider.of<AddTaskCubit>(context).addTask(
                                    context.read<AddTaskCubit>().state.task);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xff7A79CD)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )))),
                        ),
                      ],
                    );
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
