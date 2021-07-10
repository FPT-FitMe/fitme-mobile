import 'package:fitme/repository/auth_repository.dart';
import 'package:fitme/repository/plan_repository.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/repository/workout_repository.dart';
import 'package:fitme/services/auth_service.dart';
import 'package:fitme/services/plan_service.dart';
import 'package:fitme/services/trainee_service.dart';
import 'package:fitme/services/workout_service.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  AuthRepository get authRepository {
    return new AuthService();
  }

  TraineeRepository get traineeRepository => new TraineeService();

  PlanRepository get planRepository => new PlanService();

  WorkoutRepository get workoutRepository => new WorkoutService();
}
