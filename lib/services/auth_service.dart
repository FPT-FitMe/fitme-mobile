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
    final response = await dio.post('/authentication/login', data: {
      'username': email,
      'password': password,
    });
    await _storage.write(key: "userToken", value: response.data["jwt"]);
    // TODO: should return user in response
    return User();
  }
}
