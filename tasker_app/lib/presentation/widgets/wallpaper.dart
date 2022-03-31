import 'package:flutter/material.dart';

class Wallpaper extends StatelessWidget {
  const Wallpaper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
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
    );
  }
}
