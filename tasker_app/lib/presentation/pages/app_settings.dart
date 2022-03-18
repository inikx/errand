import 'package:flutter/material.dart';
import 'package:tasker_app/presentation/widgets/Bars/info_widget.dart';

import '../widgets/Bars/success_widget.dart';
import '../widgets/wallpaper.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const Wallpaper(),
        SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.pop(context)),
                        Container(
                          margin: const EdgeInsets.only(top: 14),
                          child: const Align(
                            child: Text(
                              'Настройки профиля',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        //const InfoWidget(info: "Подтвердите вашу почту"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ClipOval(
                        child: Material(
                          color: Colors.grey, // Button color
                          child: InkWell(
                            splashColor:
                                const Color(0xff7A79CD), // Splash color
                            onTap: () {},
                            child: const SizedBox(
                                width: 150,
                                height: 150,
                                child: Icon(
                                  Icons.person_add_alt_1_rounded,
                                  size: 50,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 50),
                        width: 270,
                        child: TextField(
                          onChanged: (String value) async {
                            //context.read<LogInCubit>().updateUsername(value);
                          },
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Rubik',
                              fontSize: 16),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                            labelStyle: TextStyle(
                              color: Color(0x80FFFFFF),
                              fontFamily: 'Rubik',
                            ),
                            labelText: 'Имя пользователя',
                          ),
                        )),
                    Container(
                        margin: const EdgeInsets.only(top: 50),
                        width: 270,
                        child: TextField(
                          onChanged: (String value) async {
                            //context.read<LogInCubit>().updateUsername(value);
                          },
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Rubik',
                              fontSize: 16),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                            labelStyle: TextStyle(
                              color: Color(0x80FFFFFF),
                              fontFamily: 'Rubik',
                            ),
                            labelText: 'Почта',
                          ),
                        )),
                    Container(
                        margin: const EdgeInsets.only(top: 50),
                        width: 270,
                        child: TextField(
                          onChanged: (String value) async {
                            //context.read<LogInCubit>().updatePassword(value);
                          },
                          obscureText: true,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Rubik',
                              fontSize: 16),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                            labelStyle: TextStyle(
                                color: Color(0x80FFFFFF),
                                fontFamily: 'Rubik',
                                fontSize: 16),
                            labelText: 'Пароль',
                          ),
                        )),
                    Container(
                      width: 270,
                      height: 50,
                      margin: const EdgeInsets.only(top: 90),
                      child: ElevatedButton(
                          child: const Text('Применить',
                              style:
                                  TextStyle(fontFamily: 'Rubik', fontSize: 16)),
                          onPressed: () async {
                            // BlocProvider.of<LogInCubit>(context).loginUser(
                            //     context.read<LogInCubit>().state.data);
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
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
