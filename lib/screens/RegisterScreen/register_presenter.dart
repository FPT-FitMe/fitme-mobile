import 'package:fitme/screens/RegisterScreen/register_view.dart';

import 'register_view.dart';

import 'package:fitme/models/user.dart';

class RegisterPresenter {
  RegisterView _registerView;

  RegisterPresenter(this._registerView) {
    //Inject auth repo
  }

  void register(User user) {
    // do register
    _registerView.registerSuccess();
  }
}
