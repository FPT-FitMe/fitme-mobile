import 'package:fitme/repository/auth_repository.dart';
import 'package:fitme/repository/coach_repository.dart';
import 'package:fitme/repository/exercise_repository.dart';
import 'package:fitme/repository/meal_repository.dart';
import 'package:fitme/repository/plan_repository.dart';
import 'package:fitme/repository/post_repository.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/repository/workout_repository.dart';
import 'package:fitme/services/auth_service.dart';
import 'package:fitme/services/coach_service.dart';
import 'package:fitme/services/plan_service.dart';
import 'package:fitme/services/exercise_service.dart';
import 'package:fitme/services/post_service.dart';
import 'package:fitme/services/trainee_service.dart';
import 'package:fitme/services/workout_service.dart';
import 'package:fitme/repository/image_repository.dart';
import 'package:fitme/repository/user_repository.dart';
import 'package:fitme/services/cloudinary_service.dart';
import 'package:fitme/services/user_service.dart';
import 'package:fitme/services/meal_service.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  AuthRepository get authRepository => new AuthService();

  TraineeRepository get traineeRepository => new TraineeService();

  PlanRepository get planRepository => new PlanService();

  WorkoutRepository get workoutRepository => new WorkoutService();

  UserRepository get userRepository => new UserService();

  ImageRepository get imageRepository => new CloudinaryService();

  MealRepository get mealRepository => new MealService();

  ExerciseRepository get exerciseRepository => new ExerciseService();

  CoachRepository get coachRepository => new CoachService();

  PostRepository get postRepository => new PostService();
}
