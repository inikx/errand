import 'dart:math';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/bloc/task/task_cubit.dart';
import 'package:tasker_app/data/services/project/repository.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'package:tasker_app/bloc/add_project_task/add_project_task_cubit.dart';
import 'package:tasker_app/bloc/project_tasks/project_tasks_cubit.dart';
import 'package:tasker_app/data/services/task/repository.dart';
import 'package:tasker_app/presentation/widgets/snackbars/exception_widget.dart';
import 'package:tasker_app/presentation/widgets/snackbars/success_widget.dart';

import '../../../constants/locator.dart';

Future<dynamic> AddProjectTaskBottomSheet(
    BuildContext context, int project_id) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => BlocProvider(
      create: (context) => AddProjectTaskCubit(
          getIt<TaskRepository>(),
          getIt<ProjectRepository>(),
          getIt<ProjectTasksCubit>(),
          getIt<TaskCubit>()),
      child: BottomSheet(
        project_id: project_id,
      ),
    ),
  );
}

class BottomSheet extends StatelessWidget {
  final int project_id;
  const BottomSheet({
    Key? key,
    required this.project_id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AddProjectTaskCubit>().getProjectUsers(project_id);
    final controller = ScrollController();
    return BlocListener<AddProjectTaskCubit, AddProjectTaskState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case AddProjectTaskSuccess:
            showTopSnackBar(
              context,
              const SuccessSnackbar(info: "Задача успешно добавлена!"),
            );
            return;
          case AddProjectTaskError:
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
            BlocBuilder<AddProjectTaskCubit, AddProjectTaskState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case AddProjectTask:
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
                                        .read<AddProjectTaskCubit>()
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
                                      .read<AddProjectTaskCubit>()
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
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       IconButton(
                        //           icon: const Icon(
                        //             Icons.calendar_today_rounded,
                        //             size: 35,
                        //             color: Colors.grey,
                        //           ),
                        //           onPressed: () => print('Календарь работает')),
                        //       IconButton(
                        //           icon: const Icon(
                        //             Icons.notification_add_rounded,
                        //             size: 35,
                        //             color: Colors.grey,
                        //           ),
                        //           onPressed: () =>
                        //               print('Уведомления работают')),
                        //       IconButton(
                        //           icon: const Icon(
                        //             Icons.format_color_fill_rounded,
                        //             size: 35,
                        //             color: Colors.grey,
                        //           ),
                        //           onPressed: () => print('Заливка работает')),
                        //     ],
                        //   ),
                        // ),
                        SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            padding: Pad(horizontal: 30, top: 20),
                            controller: controller,
                            child: Row(
                                children: state.users
                                    .map((user) => Padding(
                                          padding: const Pad(horizontal: 5),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      state.task.user_id == user.id
                                                          ? MaterialStateProperty.all(
                                                              const Color(
                                                                  0xff7A79CD))
                                                          : MaterialStateProperty.all(
                                                              Colors.white),
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ))),
                                              onPressed: () {
                                                context
                                                    .read<AddProjectTaskCubit>()
                                                    .updateUser(user.id);
                                              },
                                              child: Text(user.username,
                                                  style: TextStyle(
                                                      fontFamily: 'Rubik',
                                                      color: state.task.user_id == user.id
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontSize:
                                                          state.task.user_id == user.id
                                                              ? 12
                                                              : 10,
                                                      fontWeight: state.task.user_id == user.id
                                                          ? FontWeight.bold
                                                          : FontWeight.normal))),
                                        ))
                                    .toList())),
                        Container(
                          width: 270,
                          height: 50,
                          margin: const EdgeInsets.only(top: 30),
                          child: ElevatedButton(
                              child: const Text('Создать задачу',
                                  style: TextStyle(
                                      fontFamily: 'Rubik', fontSize: 16)),
                              onPressed: () async {
                                if (context
                                    .read<AddProjectTaskCubit>()
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
                                  var task = context
                                      .read<AddProjectTaskCubit>()
                                      .state
                                      .task
                                      .copyWith(project_id: project_id);
                                  BlocProvider.of<AddProjectTaskCubit>(context)
                                      .addTask(task);
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
