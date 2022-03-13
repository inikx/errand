import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/bloc/login/login_cubit.dart';
import 'package:tasker_app/constants/strings.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogInCubit, LogInState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case LoggedIn:
            Navigator.pop(context);
            Navigator.pushNamed(context, HOME);
        }
      },
      child: Scaffold(
          body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/wall.png"), fit: BoxFit.cover),
          ),
          child: SafeArea(
              child: Container(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Center(
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(top: 75),
                  child: const Text(
                    'Errand',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: 270,
                  child: const Text(
                      'Планируй задачи для большей продуктивности уже сейчас.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Color(0x80FFFFFF),
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                ),
                Container(
                    margin: EdgeInsets.only(top: 29),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, REGISTER);
                      },
                      child: const Text('Создать аккаунт',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            color: Color(0xff908FEC),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.underline,
                          )),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 100),
                    width: 270,
                    child: TextField(
                      onChanged: (String value) async {
                        context.read<LogInCubit>().updateUsername(value);
                      },
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Rubik',
                          fontSize: 14),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
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
                    margin: const EdgeInsets.only(top: 25),
                    width: 270,
                    child: TextField(
                      onChanged: (String value) async {
                        context.read<LogInCubit>().updatePassword(value);
                      },
                      obscureText: true,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Rubik',
                          fontSize: 14),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
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
                  margin: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                      child: const Text('Войти',
                          style: TextStyle(fontFamily: 'Rubik', fontSize: 17)),
                      onPressed: () async {
                        print(context.read<LogInCubit>().state);
                        BlocProvider.of<LogInCubit>(context)
                            .loginUser(context.read<LogInCubit>().state.data);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff7A79CD)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )))),
                )
              ]),
            ),
          )),
        ),
      )),
    );
  }
}
