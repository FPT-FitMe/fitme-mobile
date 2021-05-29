import 'dart:convert';

import '/models/user.dart';
import '/repository/auth_repository.dart';
import 'package:http/http.dart' as http;

class AuthService implements AuthRepository {
  static const url = "https://jsonplaceholder.typicode.com/users/1";

  @override
  Future<User> login() async {
    // TODO: implement login
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login user');
    }
  }
}
