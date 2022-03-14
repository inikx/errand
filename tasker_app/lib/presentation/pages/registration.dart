import 'package:flutter/material.dart';
import 'package:tasker_app/presentation/pages/registration2.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();

    return Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 270,
              height: 50,
              child: ElevatedButton(
                  child: const Text('Продолжить',
                      style: TextStyle(fontFamily: 'Rubik', fontSize: 16)),
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationPage2()));

                    print('Успешная регистрация'); //BLOc кнопки "Продолжить"
                    // print(context.read<LogInCubit>().state);
                    // BlocProvider.of<LogInCubit>(context)
                    //     .loginUser(context.read<LogInCubit>().state.data);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff7A79CD)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )))),
            ),
          ],
        ),
        body: Scaffold(
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
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => print(
                                      'Сделать возврат к авторизации')), //сделать возворат на страницу авторизации
                            ],
                          ),
                          const Text(
                            'Errand',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 50),
                              width: 270,
                              child: TextField(
                                controller: _controller,
                                // onChanged: (String value) async {
                                //   context.read<LogInCubit>().updateUsername(value);        //Логин *влад
                                // },
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
                              child: const TextField(
                                // onChanged: (String value) async {
                                //   context.read<LogInCubit>().updateUsername(value);      //Почта *влад
                                // },
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Rubik',
                                    fontSize: 16),
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
                                  labelText: 'Почта',
                                ),
                              )),
                          Container(
                              margin: const EdgeInsets.only(top: 25),
                              width: 270,
                              child: const TextField(
                                // onChanged: (String value) async {
                                //   context.read<LogInCubit>().updatePassword(value);      // Пароль *влад
                                // },
                                obscureText: true,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Rubik',
                                    fontSize: 16),
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
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ));
  }
}
