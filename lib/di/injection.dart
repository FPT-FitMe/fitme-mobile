import 'package:fitme/repository/auth_repository.dart';
import 'package:fitme/repository/coach_repository.dart';
import 'package:fitme/repository/exercise_repository.dart';
import 'package:fitme/repository/meal_repository.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/services/auth_service.dart';
import 'package:fitme/services/exercise_service.dart';
import 'package:fitme/services/trainee_service.dart';
import 'package:fitme/services/coach_service.dart';
import 'package:fitme/services/meal_service.dart';

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

  MealRepository get mealRepository => new MealService();

  ExerciseRepository get exerciseRepository => new ExerciseService();

  CoachRepository get coachRepository => new CoachService();
}
