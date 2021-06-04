import 'package:fitme/repository/auth_repository.dart';
import 'package:fitme/services/auth_service.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  AuthRepository get authRepository {
    return new AuthService();
  }
}
