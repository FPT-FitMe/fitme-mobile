import 'package:dio/dio.dart';
import 'package:fitme/di/injection.dart';
import 'package:fitme/models/user.dart';
import 'package:fitme/repository/auth_repository.dart';
import 'package:fitme/screens/LoginScreen/login_view.dart';

class LoginPresenter {
  LoginView _loginView;
  late AuthRepository _authRepository;

  LoginPresenter(this._loginView) {
    _authRepository = new Injector().authRepository;
  }

  void login(String email, String password) async {
    try {
      if (email.isNotEmpty) {
        User user = await _authRepository.login(email, password);
        _loginView.loginSuccess(user);
      }
    } on DioError catch (e) {
      _loginView.loginFail("Email hoặc password không hợp lệ");
    } catch (e) {
      _loginView.loginFail("Unexpected errors");
    }
  }
}
