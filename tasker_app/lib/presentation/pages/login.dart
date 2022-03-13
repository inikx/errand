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
    var _controller = TextEditingController();
    return BlocListener<LogInCubit, LogInState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case LoggedIn:
            Navigator.pop(context);
            Navigator.pushNamed(context, HOME);
        }
      },
      child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton:
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              width: 270,
              height: 50,
              margin: const EdgeInsets.only(top: 40),
              child: ElevatedButton(
                  child: const Text('Войти',
                      style: TextStyle(fontFamily: 'Rubik', fontSize: 16)),
                  onPressed: () async {
                    print(context.read<LogInCubit>().state);
                    BlocProvider.of<LogInCubit>(context)
                        .loginUser(context.read<LogInCubit>().state.data);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff7A79CD)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )))),
            ),
          ]),
          body: SafeArea(
            child: Container(
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
                        margin: const EdgeInsets.only(top: 29),
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
                          controller: _controller,
                          onChanged: (String value) async {
                            context.read<LogInCubit>().updateUsername(value);
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
                  ]),
                ),
              )),
            ),
          )),
    );
  }
}
