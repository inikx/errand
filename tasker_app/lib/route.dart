import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/bloc/login/login_cubit.dart';
import 'package:tasker_app/constants/strings.dart';
import 'package:tasker_app/data/services/login/network_service.dart';
import 'package:tasker_app/data/services/login/repository.dart';
import 'package:tasker_app/presentation/pages/home.dart';
import 'package:tasker_app/presentation/pages/login.dart';
import 'package:tasker_app/presentation/pages/registration.dart';
import 'package:tasker_app/presentation/pages/registration2.dart';

class AppRouter {
  late LoginRepository loginRepository;

  AppRouter() {
    loginRepository = LoginRepository(networkService: LoginNetworkService());
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LogInCubit(repository: loginRepository),
            child: LogInPage(),
          ),
        );
      case HOME:
        return CupertinoPageRoute(
          builder: (_) => HomePage(),
        );
      case REGISTER:
        return CupertinoPageRoute(
          builder: (_) => RegistrationPage(),
        );
      case REGISTER_2ND:
      return CupertinoPageRoute(
          builder: (_) => RegistrationPage2(),
        );
      default:
        return null;
    }
  }
}
