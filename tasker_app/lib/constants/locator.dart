import 'package:get_it/get_it.dart';
import 'package:tasker_app/bloc/add_task/add_task_cubit.dart';
import 'package:tasker_app/bloc/authentication/authentication_cubit.dart';
import 'package:tasker_app/bloc/login/login_cubit.dart';
import 'package:tasker_app/bloc/project%20creating/project_creating_cubit.dart';
import 'package:tasker_app/bloc/projects/projects_cubit.dart';
import 'package:tasker_app/bloc/register/register_cubit.dart';
import 'package:tasker_app/bloc/task/task_cubit.dart';
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

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // LogIn
  getIt.registerSingleton(LoginNetworkService());
  getIt.registerSingleton(LoginRepository(getIt<LoginNetworkService>()));
  getIt.registerSingleton(LogInCubit(getIt<LoginRepository>()));

  // Registration
  getIt.registerSingleton(RegisterNetworkService());
  getIt.registerSingleton(RegisterRepository(getIt<RegisterNetworkService>()));
  getIt.registerSingleton(RegisterCubit(getIt<RegisterRepository>()));

  // Authentication
  getIt.registerSingleton(AuthenticationNetworkService());
  getIt.registerSingleton(
      AuthenticationRepository(getIt<AuthenticationNetworkService>()));
  getIt.registerSingleton(
      AuthenticationCubit(getIt<AuthenticationRepository>()));

  // Tasks
  getIt.registerSingleton(TaskNetworkService());
  getIt.registerSingleton(TaskRepository(getIt<TaskNetworkService>()));
  getIt.registerSingleton(TaskCubit(getIt<TaskRepository>()));

  //Add Task
  getIt.registerSingleton(
      AddTaskCubit(getIt<TaskRepository>(), getIt<TaskCubit>()));

  // Projects
  getIt.registerSingleton(ProjectNetworkService());
  getIt.registerSingleton(ProjectRepository(getIt<ProjectNetworkService>()));
  getIt.registerSingleton(ProjectsCubit(getIt<ProjectRepository>()));

  // Create Project
  getIt.registerSingleton(
      ProjectCreatingCubit(getIt<ProjectRepository>(), getIt<ProjectsCubit>()));
}
