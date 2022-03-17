import 'package:flutter/material.dart';
import 'dart:math' as math;

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            child: Column(
              children: [
                Stack(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
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
                          'Профиль',
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
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ClipOval(
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
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    'Владик',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: const Text(
                    'bigboyvlad@kreml.ru',
                    style: TextStyle(
                        color: Color(0xff80ffffff),
                        fontSize: 16,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: const Text(
                      'Параметры аккаунта',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: const Text(
                            'Личная информация',
                            style: TextStyle(
                                color: Color(0xCCFFFFFF),
                                fontSize: 14,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        const Text(
                          'Редактировать информацию о себе',
                          style: TextStyle(
                              color: Color(0x4DFFFFFF),
                              fontSize: 12,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          onPressed: () => print(
                              'Настройки профиля - page ')), //to do settings info
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: const Text(
                      'Параметры приложения',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: const Text(
                            'Настройки приложения',
                            style: TextStyle(
                                color: Color(0xCCFFFFFF),
                                fontSize: 14,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          onPressed: () => print(
                              'Настройки приложения - page ')), //to do settings info
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: const Text(
                            'Уведомления',
                            style: TextStyle(
                                color: Color(0xCCFFFFFF),
                                fontSize: 14,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          onPressed: () => print(
                              'Настройки уведомлений - page ')), //to do settings info
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        margin: const EdgeInsets.only(top: 80),
                        child: GestureDetector(
                          child: const Text(
                            'Выйти',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontFamily: 'Rubik',
                            ),
                          ),
                          onTap: () => print('Выйти'),
                        ))),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
