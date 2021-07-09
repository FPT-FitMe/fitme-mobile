import 'package:fitme/models/auth_user.dart';

abstract class LoginView {
  void loginSuccess(AuthUser user);
  void loginFail(String errorMessage);
}
