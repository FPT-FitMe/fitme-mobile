import 'package:fitme/repository/auth_repository.dart';
import 'package:fitme/repository/image_repository.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/repository/user_repository.dart';
import 'package:fitme/services/auth_service.dart';
import 'package:fitme/services/cloudinary_service.dart';
import 'package:fitme/services/trainee_service.dart';
import 'package:fitme/services/user_service.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  AuthRepository get authRepository => new AuthService();

  TraineeRepository get traineeRepository => new TraineeService();

  UserRepository get userRepository => new UserService();

  ImageRepository get imageRepository => new CloudinaryService();
}
