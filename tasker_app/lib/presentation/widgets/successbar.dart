import 'package:flutter/material.dart';

class SuccessBar extends StatelessWidget {
  const SuccessBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 375,
        height: 68,
        decoration: BoxDecoration(
            color: const Color(0xffDCF3EB),
            border: Border.all(
              color: const Color(0xff34A770),
              width: 1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
      ),
    );
  }
}
