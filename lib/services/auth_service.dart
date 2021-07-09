import 'package:dio/dio.dart';
import 'package:fitme/configs/http_service.dart';
import 'package:fitme/models/auth_user.dart';
import 'package:fitme/models/errors/AuthUserException.dart';
import 'package:fitme/models/user.dart';
import 'package:fitme/repository/auth_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService implements AuthRepository {
  Dio dio = new HttpService().dio;
  FlutterSecureStorage _storage = new FlutterSecureStorage();

  @override
  Future<AuthUser> login(String email, String password) async {
    final response = await dio.post('/authentication/login', data: {
      'email': email,
      'password': password,
    });
    final AuthUser user = AuthUser.fromJson(response.data["user"]);
    if (user.role != "ROLE_MEMBER") {
      throw new AuthUserException(
        message: "Tài khoản không phải của user. Vui lòng đăng nhập lại",
      );
    }
    await _storage.write(key: "userToken", value: response.data["jwtToken"]);
    return user;
  }

  @override
  Future<User> register(
      String email, String password, String firstName, String lastName) async {
    final response = await dio.post('/authentication/register', data: {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
    });
    final User user = User.fromJson(response.data);
    return user;
  }

  @override
  Future<String?> refreshToken() async {
    final response = await dio.get('/authentication/refreshToken');
    await _storage.write(key: "userToken", value: response.data["jwt"]);
    return response.data["jwt"];
  }
}
