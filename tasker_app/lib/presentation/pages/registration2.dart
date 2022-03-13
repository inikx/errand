import 'package:flutter/material.dart';

class RegistrationPage2 extends StatelessWidget {
  const RegistrationPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    return Scaffold(
        body: SafeArea(
      child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF151B2B),
                  Color(0xFF22282E),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(0.0, 0.9),
                stops: [0.0, 1.0],
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
                      ClipOval(
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
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: const Text(
                          'Загрузить фото',
                          style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 100),
                          width: 270,
                          child: TextField(
                            //controller: _controller,
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
                              labelText: 'Имя',
                            ),
                          )),
                      Container(
                        width: 270,
                        height: 50,
                        margin: const EdgeInsets.only(top: 80),
                        child: ElevatedButton(
                            child: const Text('Продолжить',
                                style: TextStyle(
                                    fontFamily: 'Rubik', fontSize: 16)),
                            onPressed: () async {
                              print(
                                  'Успешная регистрация №2'); //BLOc кнопки "Продолжить"

                              // print(context.read<LogInCubit>().state);
                              // BlocProvider.of<LogInCubit>(context)
                              //     .loginUser(context.read<LogInCubit>().state.data);
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
              ))),
    ));
  }
}
