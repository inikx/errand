import 'package:flutter/material.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
      child: SizedBox(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                //open project
              },
              child: Stack(children: [
                Ink(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          colors: [
                            Color(0xFF908FEC),
                            Color(0xFF3A49F9),
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(0.0, 1.0),
                          tileMode: TileMode.clamp)),
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Диплом", //project title
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                  fontFamily: 'Rubik',
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text("7/9", //project task count
                                  style: TextStyle(
                                      fontFamily: 'Rubik',
                                      color: Colors.white,
                                      fontSize: 43,
                                      fontWeight: FontWeight.w100)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 60,
                  top: 90,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0x13242736),
                    ),
                    height: 150,
                    width: 150,
                  ),
                ),
                Positioned(
                  left: 60,
                  bottom: 80,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0x13242736),
                    ),
                    height: 150,
                    width: 150,
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
