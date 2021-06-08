<<<<<<< HEAD
import 'package:fitme/screens/LoginScreen/login_presenter.dart';

import 'register_view.dart';
import 'package:fitme/di/injection.dart';
=======
import 'package:fitme/screens/RegisterScreen/register_view.dart';

import 'register_view.dart';
>>>>>>> fde812eb00b604d2d685102929a11c6ee98afbae

import 'package:fitme/models/user.dart';

class RegisterPresenter {
  RegisterView _registerView;

  RegisterPresenter(this._registerView) {
    //Inject auth repo
  }

  void register(User user) {
    // do register
<<<<<<< HEAD
  }
}
=======
    _registerView.registerSuccess();
  }
}
>>>>>>> fde812eb00b604d2d685102929a11c6ee98afbae
