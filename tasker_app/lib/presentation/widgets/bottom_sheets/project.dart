import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/bloc/project%20creating/project_creating_cubit.dart';
import 'package:tasker_app/data/services/project/network_service.dart';
import 'package:tasker_app/data/services/project/repository.dart';

class AddProjectBottomSheet extends StatelessWidget {
  const AddProjectBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProjectCreatingCubit(
          repository:
              ProjectRepository(networkService: ProjectNetworkService())),
      child: BottomSheet(),
    );
  }
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectCreatingCubit, ProjectCreatingState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case ProjectCreated:
            Navigator.pop(context);
        }
      },
      child: SingleChildScrollView(
        reverse: true,
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
              borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
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
                'Создать проект',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                      color: const Color(0xffC4C4C4).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8)),
                  width: 330,
                  height: 55,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 4, 20, 5),
                      child: TextField(
                        onChanged: (String value) async {
                          context
                              .read<ProjectCreatingCubit>()
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
                            hintText: 'Введите название проекта',
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                  )),
              // Container(
              //     margin: const EdgeInsets.only(top: 30),
              //     decoration: BoxDecoration(
              //         color: const Color(0xffC4C4C4).withOpacity(0.15),
              //         borderRadius: BorderRadius.circular(8)),
              //     width: 330,
              //     height: 100,
              //     child: Padding(
              //       padding: const EdgeInsets.fromLTRB(20, 4, 20, 5),
              //       child: TextField(
              //         onChanged: (String value) async {
              //           //описаниезадачи
              //         },
              //         style: const TextStyle(
              //             color: Colors.white, fontFamily: 'Rubik', fontSize: 14),
              //         cursorColor: Colors.white,
              //         decoration: const InputDecoration(
              //             border: InputBorder.none,
              //             labelStyle: TextStyle(
              //               color: Color(0x80FFFFFF),
              //               fontFamily: 'Rubik',
              //             ),
              //             hintText: 'Введите описание',
              //             hintStyle: TextStyle(color: Colors.grey)),
              //       ),
              //     )),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.only(top: 14),
                        child: const Text(
                          'Участники',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.add,
                            size: 20, color: Colors.white),
                        onPressed: () {
                          print('Добавление участника успешно работает!');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const PersonToProject(),
              Container(
                width: 270,
                height: 50,
                margin: const EdgeInsets.only(top: 80),
                child: ElevatedButton(
                    child: const Text('Создать проект',
                        style: TextStyle(fontFamily: 'Rubik', fontSize: 16)),
                    onPressed: () async {
                      BlocProvider.of<ProjectCreatingCubit>(context)
                          .createProject(context
                              .read<ProjectCreatingCubit>()
                              .state
                              .data
                              .title);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff7A79CD)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )))),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class PersonToProject extends StatelessWidget {
  const PersonToProject({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipOval(
              child: Material(
                color: Colors.green, // Button color
                child: InkWell(
                  splashColor: const Color(0xff7A79CD), // Splash color
                  onTap: () {},
                  child: const SizedBox(
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.person_add_alt_1_rounded,
                        size: 20,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 70),
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Владик',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    // margin: const EdgeInsets.only(top: 17),
                    child: const Text(
                      'bigboyvladick@gmail.com',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.highlight_remove_outlined,
                  size: 25, color: Colors.red),
              onPressed: () {
                print('Удаление участника успешно работает!');
              },
            )
          ]),
    );
  }
}
