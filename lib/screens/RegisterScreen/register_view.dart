import 'package:fitme/models/user.dart';

abstract class RegisterView {
  void registerSuccess(User user);
  void registerFail(String errorrMessage);
}
