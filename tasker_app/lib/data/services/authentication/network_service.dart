import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tasker_app/constants/storage.dart';
import 'package:tasker_app/constants/strings.dart';

class AuthenticationNetworkService {
  auth() async {
    String? token = await storage.read(key: 'token');
    final response = await http.get(Uri.parse('$BASE_URL/api/authentication'),
        headers: {"Content-Type": "application/json"});
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
