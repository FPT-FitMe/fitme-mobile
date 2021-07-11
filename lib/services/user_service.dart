import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitme/configs/http_service.dart';
import 'package:fitme/models/user.dart';
import 'package:fitme/repository/user_repository.dart';

class UserService implements UserRepository {
  Dio dio = new HttpService().dio;

  @override
  Future<User> getUserByID(int id) async {
    final response = await dio.get("/users/$id");
    return User.fromJson(response.data);
  }

  @override
  Future<User> updateUser(User user) async {
    final response =
        await dio.put("/users/${user.userID}", data: jsonEncode(user));
    return User.fromJson(response.data);
  }
}
