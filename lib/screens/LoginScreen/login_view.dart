import 'package:dio/dio.dart';

abstract class LoginView {
  void loginSuccess();
  void loginFail(DioError error);
}
