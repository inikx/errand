import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasker_app/constants/storage.dart';
import 'package:tasker_app/constants/strings.dart';
import 'dart:math' as math;

import 'package:tasker_app/presentation/pages/app_settings.dart';
import 'package:tasker_app/presentation/pages/profile_settings.dart';
import 'package:tasker_app/presentation/widgets/wallpaper.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Wallpaper(),
          SafeArea(
              child: Container(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
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
                  FutureBuilder(
                      future: getUserInfo(1),
                      builder: (context, snapshot) {
                        return snapshot.data == null
                            ? CircularProgressIndicator()
                            : Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: Text(
                                  snapshot.data.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.normal),
                                ),
                              );
                      }),
                  FutureBuilder(
                      future: getUserInfo(2),
                      builder: (context, snapshot) {
                        return snapshot.data == null
                            ? CircularProgressIndicator()
                            : Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: Text(
                                  snapshot.data.toString(),
                                  style: TextStyle(
                                      color: Color(0xff80ffffff),
                                      fontSize: 16,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.normal),
                                ),
                              );
                      }),
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          const ProfileSettings()));
                            }), //to do settings info
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
                            onPressed: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        const AppSettings()))), //to do settings info
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
                ],
              ),
            ),
          )),
          Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: GestureDetector(
                  child: const Text(
                    'Выйти',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontFamily: 'Rubik',
                    ),
                  ),
                  onTap: () async {
                    await storage.deleteAll();
                    Navigator.pushNamedAndRemoveUntil(
                        context, LOGIN, (r) => false);
                  },
                ),
              )),
        ],
      ),
    );
  }
}

Future<String?> getUserInfo(int n) async {
  String? username = await storage.read(key: 'username');
  String? email = await storage.read(key: 'email');

  return n == 1 ? username : email;
}
