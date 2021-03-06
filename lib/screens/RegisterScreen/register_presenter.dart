import 'package:dio/dio.dart';
import 'package:fitme/di/injection.dart';
import 'package:fitme/models/auth_user.dart';
import 'package:fitme/repository/auth_repository.dart';
import 'package:fitme/screens/RegisterScreen/register_view.dart';

import 'register_view.dart';

class RegisterPresenter {
  RegisterView _registerView;
  late AuthRepository _authRepository;

  RegisterPresenter(this._registerView) {
    //Inject auth repo
    _authRepository = new Injector().authRepository;
  }

  Future<void> register(
      String email, String password, String firstName, String lastName) async {
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          firstName.isNotEmpty &&
          lastName.isNotEmpty) {
        await _authRepository.register(email, password, firstName, lastName);
        AuthUser user = await _authRepository.login(email, password);
        _registerView.registerSuccess(user);
      }
    } on DioError {
      _registerView.registerFail("Email đã tồn tại");
    } catch (e) {
      print(e);
      _registerView.registerFail("Lỗi không xác định");
    }
  }
}
