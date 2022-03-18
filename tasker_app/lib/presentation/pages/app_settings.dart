import 'package:flutter/material.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import '../widgets/wallpaper.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    double sheet = 0;
    return Scaffold(
        body: Stack(
      children: [
        const Wallpaper(),
        Center(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Center(
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
                            onPressed: () => Navigator.pop(context)),
                        Container(
                          margin: const EdgeInsets.only(top: 14),
                          child: const Align(
                            child: Text(
                              'Настройки приложения',
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
                      width: 270,
                      height: 50,
                      margin: const EdgeInsets.only(top: 300),
                      child: ElevatedButton(
                          child: const Text('Применить',
                              style:
                                  TextStyle(fontFamily: 'Rubik', fontSize: 16)),
                          onPressed: () async {
                            
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
      ],
    ));
  }

}


