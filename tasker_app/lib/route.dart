import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/constants/strings.dart';
import 'package:tasker_app/presentation/pages/home.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      default:
        return null;
    }
  }
}
