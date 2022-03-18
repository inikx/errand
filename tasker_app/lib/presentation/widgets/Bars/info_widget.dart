import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String info;
  const InfoWidget({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
          height: 65,
          decoration: BoxDecoration(
              color: const Color(0xffFFF8EF),
              border: Border.all(
                color: const Color(0xffFBA63C),
                width: 0.5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 25),
                child: ClipOval(
                  child: Material(
                    color: const Color(0xffFBA63C), // Button color
                    child: InkWell(
                      splashColor: const Color(0xffFBA63C), // Splash color
                      onTap: () {},
                      child: const SizedBox(
                          width: 26,
                          height: 26,
                          child: Icon(
                            Icons.info,
                            size: 20,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 15, 25, 0),
                child: Column(
                  children: [
                    const SizedBox(
                      width: 200,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Необходимо подтверждение',
                          style: TextStyle(
                              color: Color(0xffE18109),
                              fontSize: 13,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      width: 200,
                      child: Text(
                        info,
                        style: TextStyle(
                            color: Color(0xffBC741A),
                            fontSize: 12,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
