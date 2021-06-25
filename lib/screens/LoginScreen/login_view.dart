import 'package:fitme/models/user.dart';

abstract class LoginView {
  void loginSuccess(User user);
  void loginFail(String errorMessage);
}
