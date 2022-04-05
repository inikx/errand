import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/bloc/add_project_task/add_project_task_cubit.dart';
import 'dart:math';

import 'package:tasker_app/bloc/add_task/add_task_cubit.dart';
import 'package:tasker_app/bloc/project_tasks/project_tasks_cubit.dart';
import 'package:tasker_app/bloc/task/task_cubit.dart';
import 'package:tasker_app/constants/locator.dart';
import 'package:tasker_app/data/services/project/repository.dart';
import 'package:tasker_app/data/services/task/network_service.dart';
import 'package:tasker_app/data/services/task/repository.dart';
import 'package:tasker_app/presentation/widgets/bottom_sheets/select_project_bottom_sheet.dart';
import 'package:tasker_app/presentation/widgets/snackbars/exception_widget.dart';
import 'package:tasker_app/presentation/widgets/snackbars/success_widget.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

Future<dynamic> AddTaskBottomSheet(BuildContext context) {
  if (getIt.isRegistered<AddTaskCubit>()) {
    getIt.unregister<AddTaskCubit>();
  }
  getIt.registerSingleton(
      AddTaskCubit(getIt<TaskRepository>(), getIt<TaskCubit>()));
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => BlocProvider(
      create: (context) => getIt<AddTaskCubit>(),
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
                          padding: const Pad(top: 20, horizontal: 30),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            state.task.project_id != null
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
                                    onPressed: () async {
                                      var taskProject =
                                          await SelectProjectBottomSheet(
                                              context);
                                      context
                                          .read<AddTaskCubit>()
                                          .updateProject(taskProject);
                                    },
                                    child: Text(
                                        state.task.project_title ?? "Проект",
                                        style: TextStyle(
                                            fontFamily: 'Rubik',
                                            color: state.task.project_id != null
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: state.task.project_id != null
                                                ? 12
                                                : 10,
                                            fontWeight:
                                                state.task.project_id != null
                                                    ? FontWeight.bold
                                                    : FontWeight.normal))),
                                TextButton(
                                    onPressed: () {
                                      context
                                          .read<AddTaskCubit>()
                                          .dropProject();
                                    },
                                    child: Text(
                                      "Cбросить",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 245, 136, 128)),
                                    ))
                              ]),
                        ),
                        Container(
                          width: 270,
                          height: 50,
                          margin: const EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                              child: const Text('Создать задачу',
                                  style: TextStyle(
                                      fontFamily: 'Rubik', fontSize: 16)),
                              onPressed: () async {
                                if (context
                                    .read<AddTaskCubit>()
                                    .state
                                    .task
                                    .title
                                    .isEmpty) {
                                  showTopSnackBar(
                                      context,
                                      const ErrorSnackbar(
                                          info:
                                              "Название не может быть пустым!"));
                                } else {
                                  BlocProvider.of<AddTaskCubit>(context)
                                      .addTask(context
                                          .read<AddTaskCubit>()
                                          .state
                                          .task);
                                  Navigator.pop(context);
                                }
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
