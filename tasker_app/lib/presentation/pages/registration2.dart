import 'package:flutter/material.dart';
import 'package:tasker_app/constants/strings.dart';
import 'package:tasker_app/presentation/widgets/wallpaper.dart';

class RegistrationPage2 extends StatelessWidget {
  const RegistrationPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    return Scaffold(
        body: Stack(
      children: [
        const Wallpaper(),
        Container(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.pop(
                                context)), //сделать возворат на страницу авторизации
                      ],
                    ),
                    ClipOval(
                      child: Material(
                        color: Colors.grey, // Button color
                        child: InkWell(
                          splashColor: const Color(0xff7A79CD), // Splash color
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
                        child: const TextField(
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
                            labelText: 'Имя',
                          ),
                        )),
                    ElevatedButton(
                        child: const Text('Продолжить',
                            style:
                                TextStyle(fontFamily: 'Rubik', fontSize: 16)),
                        onPressed: () async {
                          Navigator.pushNamed(context, LOGIN);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff7A79CD)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )))),
                  ],
                ),
              ),
            )),
      ],
    ));
  }
}
