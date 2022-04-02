import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/bloc/authentication/authentication_cubit.dart';
import 'package:tasker_app/bloc/login/login_cubit.dart';
import 'package:tasker_app/bloc/project_tasks/project_tasks_cubit.dart';
import 'package:tasker_app/bloc/projects/projects_cubit.dart';
import 'package:tasker_app/bloc/register/register_cubit.dart';
import 'package:tasker_app/bloc/task/task_cubit.dart';
import 'package:tasker_app/constants/locator.dart';
import 'package:tasker_app/constants/strings.dart';
import 'package:tasker_app/data/services/authentication/network_service.dart';
import 'package:tasker_app/data/services/authentication/repository.dart';
import 'package:tasker_app/data/services/login/network_service.dart';
import 'package:tasker_app/data/services/login/repository.dart';
import 'package:tasker_app/data/services/project/network_service.dart';
import 'package:tasker_app/data/services/project/repository.dart';
import 'package:tasker_app/data/services/register/network_service.dart';
import 'package:tasker_app/data/services/register/repository.dart';
import 'package:tasker_app/data/services/task/network_service.dart';
import 'package:tasker_app/data/services/task/repository.dart';
import 'package:tasker_app/presentation/pages/authentication.dart';
import 'package:tasker_app/presentation/pages/home.dart';
import 'package:tasker_app/presentation/pages/login.dart';
import 'package:tasker_app/presentation/pages/profile.dart';
import 'package:tasker_app/presentation/pages/project_details.dart';
import 'package:tasker_app/presentation/pages/registration.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AUTH:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AuthenticationCubit(getIt<AuthenticationRepository>())..auth(),
            child: AuthenticationPage(),
          ),
        );
      case LOGIN:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LogInCubit(getIt<LoginRepository>()),
            child: const LogInPage(),
          ),
        );
      case HOME:
        getIt.unregister<TaskCubit>();
        getIt.unregister<ProjectsCubit>();
        getIt.registerSingleton(TaskCubit(getIt<TaskRepository>()));
        getIt.registerSingleton(ProjectsCubit(getIt<ProjectRepository>()));
        return CupertinoPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<TaskCubit>()..fetchTasks(),
              ),
              BlocProvider(
                create: (context) => getIt<ProjectsCubit>()..fetchProjects(),
              )
            ],
            child: HomePage(),
          ),
        );
      case REGISTER:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(getIt<RegisterRepository>()),
            child: const RegistrationPage(),
          ),
        );
      case PROJECT_DETAILS:
        if (getIt.isRegistered<ProjectTasksCubit>()) {
          getIt.unregister<ProjectTasksCubit>();
        }
        getIt.registerSingleton(
            ProjectTasksCubit(getIt<TaskRepository>(), getIt<TaskCubit>()));
        final args = settings.arguments as ProjectDetailsScreenArguments;
        return CupertinoPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ProjectTasksCubit>(),
              ),
            ],
            child: ProjectDetails(id: args.id, title: args.title),
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

class ProjectDetailsScreenArguments {
  final int id;
  final String title;

  ProjectDetailsScreenArguments(this.id, this.title);
}
