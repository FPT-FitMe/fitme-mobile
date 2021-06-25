import 'package:dio/dio.dart';
import 'package:fitme/configs/http_service.dart';
import 'package:fitme/models/user.dart';
import 'package:fitme/repository/auth_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService implements AuthRepository {
  Dio dio = new HttpService().dio;
  FlutterSecureStorage _storage = new FlutterSecureStorage();

  @override
  Future<User> login(String email, String password) async {
    // TODO: should return user in response
    final response = await dio.post('/authentication/login', data: {
      'username': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      await _storage.write(key: "userToken", value: response.data["jwt"]);
      return User();
    } else if (response.statusCode == 403) {
      throw Exception("Wrong username or password");
    } else {
      throw Exception('Failed to login user');
    }
  }
}
