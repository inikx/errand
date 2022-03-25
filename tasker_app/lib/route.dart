import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/bloc/authentication/authentication_cubit.dart';
import 'package:tasker_app/bloc/login/login_cubit.dart';
import 'package:tasker_app/bloc/register/register_cubit.dart';
import 'package:tasker_app/bloc/task/task_cubit.dart';
import 'package:tasker_app/constants/strings.dart';
import 'package:tasker_app/data/services/authentication/network_service.dart';
import 'package:tasker_app/data/services/authentication/repository.dart';
import 'package:tasker_app/data/services/login/network_service.dart';
import 'package:tasker_app/data/services/login/repository.dart';
import 'package:tasker_app/data/services/register/network_service.dart';
import 'package:tasker_app/data/services/register/repository.dart';
import 'package:tasker_app/data/services/task/network_service.dart';
import 'package:tasker_app/data/services/task/repository.dart';
import 'package:tasker_app/presentation/pages/authentication.dart';
import 'package:tasker_app/presentation/pages/home.dart';
import 'package:tasker_app/presentation/pages/login.dart';
import 'package:tasker_app/presentation/pages/profile.dart';
import 'package:tasker_app/presentation/pages/registration.dart';

class AppRouter {
  late LoginRepository loginRepository;
  late RegisterRepository registerRepository;
  late TaskRepository taskRepository;
  late AuthenticationRepository authecticationRepository;

  AppRouter() {
    loginRepository = LoginRepository(networkService: LoginNetworkService());
    registerRepository =
        RegisterRepository(networkService: RegisterNetworkService());
    taskRepository = TaskRepository(networkService: TaskNetworkService());
    authecticationRepository = AuthenticationRepository(
        networkService: AuthenticationNetworkService());
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AUTH:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AuthenticationCubit(repository: authecticationRepository)..auth(),
            child: AuthenticationPage(),
          ),
        );
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
