import 'package:http/http.dart';
import 'package:tasker_app/data/services/authentication/network_service.dart';

class AuthenticationRepository {
  final AuthenticationNetworkService networkService;
  AuthenticationRepository({required this.networkService});

  Future<bool> auth() async {
    return await networkService.auth();
  }
}
