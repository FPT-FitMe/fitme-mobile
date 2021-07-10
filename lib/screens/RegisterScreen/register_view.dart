import 'package:fitme/models/auth_user.dart';

abstract class RegisterView {
  void registerSuccess(AuthUser user);
  void registerFail(String errorrMessage);
}
