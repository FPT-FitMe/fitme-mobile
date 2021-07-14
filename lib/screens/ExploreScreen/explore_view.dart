import 'package:fitme/models/meal.dart';
import 'package:fitme/models/meal_log.dart';
import 'package:fitme/models/plan.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/models/workout_log.dart';

abstract class ExploreView {
  void loadPlan(Plan plan);
  void loadWorkoutComplete(
      List<WorkoutLog> listWorkoutLog, List<Workout> listWorkout);
  void loadMealLog(List<MealLog> listMealLog);
  void refesh();
  void showFailedModal(String message);
  void showEmptyPlan();
  void showEmptyWorkout();
  void loadFavouriteMeals(List<Meal> listMeals);
  void loadFavouriteWorkouts(List<Workout> listWorkouts);
}
