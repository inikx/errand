import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: const Text('Создать аккаунт',
                      //вставить ссылку на другую страницу
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Color(0xff908FEC),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
                      ))),
              Container(
                  margin: const EdgeInsets.only(top: 100),
                  width: 270,
                  child: const TextField(
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Rubik', fontSize: 14),
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
                    obscureText: true,
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Rubik', fontSize: 14),
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
                    onPressed: () => print('Вход выполнен успешно!'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff7A79CD)),
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
    ));
  }
}
