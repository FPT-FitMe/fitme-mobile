import 'package:fitme/di/injection.dart';
import 'package:fitme/repository/auth_repository.dart';
import 'package:fitme/screens/LoginScreen/login_view.dart';

class LoginPresenter {
  LoginView _loginView;
  late AuthRepository _authRepository;

  LoginPresenter(this._loginView) {
    _authRepository = new Injector().authRepository;
  }

  void login(String email, String password) {
    if (email.isNotEmpty) {
      _authRepository
          .login(email, password)
          .then((user) => {_loginView.loginSuccess()})
          .catchError((error) {
        _loginView.loginFail(error);
      });
    }
  }
}
