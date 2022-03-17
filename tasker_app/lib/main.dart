import 'package:flutter/material.dart';
import 'package:tasker_app/route.dart';

void main() {
  Paint.enableDithering = true;
  runApp(ErrandApp(router: AppRouter()));
}

class ErrandApp extends StatelessWidget {
  final AppRouter router;
  const ErrandApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Errand',
      theme: ThemeData(
        fontFamily: 'Rubik',
      ),
      onGenerateRoute: router.generateRoute,
    );
  }
}
