import 'package:fitme/models/auth_user.dart';
import 'package:fitme/models/user.dart';

abstract class AuthRepository {
  Future<AuthUser> login(String email, String password);
  Future<User> register(
      String email, String password, String firstName, String lastName);
  Future<String?> refreshToken();
}
