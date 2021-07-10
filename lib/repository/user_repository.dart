import 'package:fitme/models/user.dart';

abstract class UserRepository {
  Future<User> getUserByID(int id);
  Future<User> updateUser(User user);
}
