import 'package:fitme/models/meal_log.dart';
import 'package:fitme/models/workout_log.dart';

abstract class LogView {
  void loadMealLogs(List<MealLog> listMealLogs);
  void loadWorkoutLogs(List<WorkoutLog> listWorkoutLogs);
}
