import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/wallpaper.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  late FixedExtentScrollController scrollController;
  bool showTaskColor = true;
  bool autoAcceptInv = true;

  int addTaskValue = 0;
  late String addTaskName = addTaskItems[addTaskValue];
  final addTaskItems = ['В начало', 'В конец'];

  int mainScreenValue = 0;
  late String mainScreenName = mainScreenItems[mainScreenValue];
  final mainScreenItems = ['Задачи', 'Проекты']; //+ projects list

  int languageValue = 0;
  late String languageName = languageItems[languageValue];
  final languageItems = ['Русский', 'English'];

  showPicker(int type) {
    return showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
              actions: [
                SizedBox(
                  height: 180,
                  child: CupertinoPicker(
                      scrollController: scrollController,
                      selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                        background: Color(0xff7A79CD).withOpacity(0.2),
                      ),
                      backgroundColor: Colors.white,
                      onSelectedItemChanged: (value) {
                        type == 1
                            ? (setState(() {
                                addTaskValue = value;
                                addTaskName = addTaskItems[value];
                              }))
                            : type == 2
                                ? (setState(() {
                                    mainScreenValue = value;
                                    mainScreenName = mainScreenItems[value];
                                  }))
                                : (setState(() {
                                    languageValue = value;
                                    languageName = languageItems[value];
                                  }));
                      },
                      itemExtent: 64,
                      children: type == 1
                          ? (addTaskItems
                              .map((item) => Center(child: Text(item)))
                              .toList())
                          : type == 2
                              ? mainScreenItems
                                  .map((item) => Center(child: Text(item)))
                                  .toList()
                              : languageItems
                                  .map((item) => Center(child: Text(item)))
                                  .toList()),
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                  child: Text(
                    "Отмена",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () => Navigator.pop(context)),
            ));
  }

  @override
  void initState() {
    super.initState();

    scrollController =
        FixedExtentScrollController(initialItem: mainScreenValue);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const Wallpaper(),
        Center(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
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
                          margin: const EdgeInsets.only(top: 14, bottom: 30),
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
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Добавление задач',
                                            style: TextStyle(
                                                color: Color(0xCCFFFFFF),
                                                fontSize: 14,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.normal),
                                          ),
                                          TextButton.icon(
                                            icon: Text(
                                              addTaskName,
                                              style: TextStyle(
                                                  color: Color(0xB3FFFFFF),
                                                  fontSize: 12,
                                                  fontFamily: 'Rubik',
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            onPressed: () {
                                              scrollController.dispose();
                                              scrollController =
                                                  FixedExtentScrollController(
                                                      initialItem:
                                                          addTaskValue);
                                              showPicker(1);
                                              //change adding tasks
                                            },
                                            label: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: Color(0xB3FFFFFF),
                                              size: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Главный экран',
                                            style: TextStyle(
                                                color: Color(0xCCFFFFFF),
                                                fontSize: 14,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.normal),
                                          ),
                                          TextButton.icon(
                                            icon: Text(
                                              mainScreenName,
                                              style: TextStyle(
                                                  color: Color(0xB3FFFFFF),
                                                  fontSize: 12,
                                                  fontFamily: 'Rubik',
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            onPressed: () {
                                              scrollController.dispose();
                                              scrollController =
                                                  FixedExtentScrollController(
                                                      initialItem:
                                                          mainScreenValue);
                                              showPicker(2);
                                              //change main screen
                                            },
                                            label: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: Color(0xB3FFFFFF),
                                              size: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Отображение цвета задач',
                                            style: TextStyle(
                                                color: Color(0xCCFFFFFF),
                                                fontSize: 14,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.normal),
                                          ),
                                          CupertinoSwitch(
                                            value: showTaskColor,
                                            onChanged: (value) {
                                              showTaskColor = value;
                                              setState(() {
                                                //change task color
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Принимать приглашения',
                                                style: TextStyle(
                                                    color: Color(0xCCFFFFFF),
                                                    fontSize: 14,
                                                    fontFamily: 'Rubik',
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              Text(
                                                'Автоматическое принятие приглашений в проекты',
                                                style: TextStyle(
                                                    color: Color(0x80FFFFFF),
                                                    fontSize: 10,
                                                    fontFamily: 'Rubik',
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                          CupertinoSwitch(
                                              value: autoAcceptInv,
                                              onChanged: (value) {
                                                autoAcceptInv = value;
                                                setState(() {
                                                  //accept inv
                                                });
                                              }),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Язык (Language)',
                                          style: TextStyle(
                                              color: Color(0xCCFFFFFF),
                                              fontSize: 14,
                                              fontFamily: 'Rubik',
                                              fontWeight: FontWeight.normal),
                                        ),
                                        TextButton.icon(
                                          icon: Text(
                                            languageName,
                                            style: TextStyle(
                                                color: Color(0xB3FFFFFF),
                                                fontSize: 12,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.normal),
                                          ),
                                          onPressed: () {
                                            scrollController.dispose();
                                            scrollController =
                                                FixedExtentScrollController(
                                                    initialItem: languageValue);
                                            showPicker(3);
                                            //change language
                                          },
                                          label: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Color(0xB3FFFFFF),
                                            size: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Column(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        //to market
                                      },
                                      child: Text(
                                        'Помощь',
                                        style: TextStyle(
                                            color: Color(0xCCFFFFFF),
                                            fontSize: 14,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        //help
                                      },
                                      child: Text(
                                        'Оценить приложение',
                                        style: TextStyle(
                                            color: Color(0xCCFFFFFF),
                                            fontSize: 14,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        //delete data
                                      },
                                      child: Text(
                                        'Удалить все данные',
                                        style: TextStyle(
                                            color: Color(0xFFD43232),
                                            fontSize: 14,
                                            fontFamily: 'Rubik',
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Errand 1.0.0",
                                    style: TextStyle(
                                        color: Color(0x80FFFFFF),
                                        fontSize: 10,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.normal)),
                                TextButton(
                                  onPressed: () {
                                    //conf
                                  },
                                  child: Text(
                                    'Политика конфиденциальности',
                                    style: TextStyle(
                                        color: Color(0x80FFFFFF),
                                        fontSize: 10,
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ],
                            )
                          ]),
                    )
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
