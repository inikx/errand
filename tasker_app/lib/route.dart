import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/bloc/login/login_cubit.dart';
import 'package:tasker_app/bloc/register/register_cubit.dart';
import 'package:tasker_app/constants/strings.dart';
import 'package:tasker_app/data/services/login/network_service.dart';
import 'package:tasker_app/data/services/login/repository.dart';
import 'package:tasker_app/data/services/register/network_service.dart';
import 'package:tasker_app/data/services/register/repository.dart';
import 'package:tasker_app/presentation/pages/home.dart';
import 'package:tasker_app/presentation/pages/login.dart';
import 'package:tasker_app/presentation/pages/registration.dart';
import 'package:tasker_app/presentation/pages/registration2.dart';

class AppRouter {
  late LoginRepository loginRepository;
  late RegisterRepository registerRepository;

  AppRouter() {
    loginRepository = LoginRepository(networkService: LoginNetworkService());
    registerRepository =
        RegisterRepository(networkService: RegisterNetworkService());
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LogInCubit(repository: loginRepository),
            child: const LogInPage(),
          ),
        );
      case HOME:
        return CupertinoPageRoute(
          builder: (_) => const HomePage(),
        );
      case REGISTER:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(repository: registerRepository),
            child: const RegistrationPage(),
          ),
        );
      case REGISTER_2ND:
        return CupertinoPageRoute(
          builder: (_) => const RegistrationPage2(),
        );
      default:
        return null;
    }
  }
}
