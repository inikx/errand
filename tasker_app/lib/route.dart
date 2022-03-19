import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/bloc/login/login_cubit.dart';
import 'package:tasker_app/bloc/register/register_cubit.dart';
import 'package:tasker_app/bloc/task/task_cubit.dart';
import 'package:tasker_app/constants/strings.dart';
import 'package:tasker_app/data/services/login/network_service.dart';
import 'package:tasker_app/data/services/login/repository.dart';
import 'package:tasker_app/data/services/register/network_service.dart';
import 'package:tasker_app/data/services/register/repository.dart';
import 'package:tasker_app/data/services/task/network_service.dart';
import 'package:tasker_app/data/services/task/repository.dart';
import 'package:tasker_app/presentation/pages/home.dart';
import 'package:tasker_app/presentation/pages/login.dart';
import 'package:tasker_app/presentation/pages/profile.dart';
import 'package:tasker_app/presentation/pages/registration.dart';

class AppRouter {
  late LoginRepository loginRepository;
  late RegisterRepository registerRepository;
  late TaskRepository taskRepository;

  AppRouter() {
    loginRepository = LoginRepository(networkService: LoginNetworkService());
    registerRepository =
        RegisterRepository(networkService: RegisterNetworkService());
    taskRepository = TaskRepository(networkService: TaskNetworkService());
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
          builder: (_) => BlocProvider(
            create: (context) => TaskCubit(repository: taskRepository),
            child: HomePage(),
          ),
        );
      case REGISTER:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(repository: registerRepository),
            child: const RegistrationPage(),
          ),
        );
      case PROFILE:
        return CupertinoPageRoute(
          builder: (_) => const Profile(),
        );
      default:
        return null;
    }
  }
}
