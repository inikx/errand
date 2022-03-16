import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
            child: const Center(child: Text("home"))));
  }
}
