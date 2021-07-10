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
}
