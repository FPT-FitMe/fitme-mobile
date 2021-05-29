import '/models/user.dart';

abstract class AuthRepository {
  Future<User> login();
}
