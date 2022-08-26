import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/bloc/login/login_cubit.dart';
import 'package:tasker_app/constants/strings.dart';
import 'package:tasker_app/presentation/widgets/snackbars/exception_widget.dart';
import 'package:tasker_app/presentation/widgets/snackbars/success_widget.dart';
import 'package:tasker_app/presentation/widgets/wallpaper.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    bool isPasswordVisible = false;
    return BlocListener<LogInCubit, LogInState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case LoggedIn:
            showTopSnackBar(
              context,
              const SuccessSnackbar(info: "Вы успешно авторизовались!"),
            );
            Navigator.pushNamedAndRemoveUntil(context, HOME, (r) => false);
            return;
          case LogInError:
            showTopSnackBar(context,
                const ErrorSnackbar(info: "Ошибка входа, попробуйте позже"));
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            const Wallpaper(),
            SafeArea(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: Center(
                    child: Column(children: [
                      // if (!isKeyboard)
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 50),
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
                          const SizedBox(
                            width: 270,
                            child: Text(
                                'Планируй задачи для большей продуктивности уже сейчас.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Rubik',
                                    color: Color(0x80FFFFFF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal)),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 40),
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
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 50),
                          width: 270,
                          child: TextField(
                            onChanged: (String value) async {
                              context.read<LogInCubit>().updateUsername(value);
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
                          margin: const EdgeInsets.only(top: 25),
                          width: 270,
                          child: TextField(
                            onChanged: (String value) async {
                              context.read<LogInCubit>().updatePassword(value);
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
                            child: const Text('Войти',
                                style: TextStyle(
                                    fontFamily: 'Rubik', fontSize: 16)),
                            onPressed: () async {
                              BlocProvider.of<LogInCubit>(context).loginUser(
                                  context.read<LogInCubit>().state.data);
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
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
