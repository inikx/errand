import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/bloc/register/register_cubit.dart';
import 'package:tasker_app/constants/strings.dart';
import 'package:tasker_app/presentation/widgets/snackbars/exception_widget.dart';
import 'package:tasker_app/presentation/widgets/snackbars/success_widget.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../widgets/wallpaper.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case UserRegistered:
            showTopSnackBar(
              context,
              const SuccessSnackbar(info: "Вы успешно зарегистрировались!"),
            );
            Navigator.pushNamed(context, LOGIN);
            return;
          case RegisterError:
            showTopSnackBar(
                context, const ErrorSnackbar(info: "Попробуйте еще раз"));
            return;
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
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
                                onPressed: () => Navigator.pop(
                                    context)), //сделать возворат на страницу авторизации

                            Container(
                              margin: const EdgeInsets.only(top: 14),
                              child: const Align(
                                child: Text(
                                  'Регистрация',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 50),
                            width: 270,
                            child: TextField(
                              controller: _controller,
                              onChanged: (String value) {
                                context
                                    .read<RegisterCubit>()
                                    .updateUsername(value);
                              },
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Rubik',
                                  fontSize: 16),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.clear, size: 16),
                                  color: Colors.white,
                                  onPressed: _controller.clear,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1.0,
                                      style: BorderStyle.solid),
                                ),
                                labelStyle: const TextStyle(
                                  color: Color(0x80FFFFFF),
                                  fontFamily: 'Rubik',
                                ),
                                labelText: 'Логин',
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.only(top: 30),
                            width: 270,
                            child: TextField(
                              onChanged: (String value) {
                                context
                                    .read<RegisterCubit>()
                                    .updateEmail(value);
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
                            margin: const EdgeInsets.only(top: 25),
                            width: 270,
                            child: TextField(
                              onChanged: (String value) {
                                context
                                    .read<RegisterCubit>()
                                    .updatePassword(value);
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
                              child: const Text('Продолжить',
                                  style: TextStyle(
                                      fontFamily: 'Rubik', fontSize: 16)),
                              onPressed: () async {
                                BlocProvider.of<RegisterCubit>(context)
                                    .registerUser(context
                                        .read<RegisterCubit>()
                                        .state
                                        .data);
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
          ),
        ],
      )),
    );
  }
}
