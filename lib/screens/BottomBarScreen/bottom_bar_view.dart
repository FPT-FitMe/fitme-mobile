import 'package:fitme/models/meal.dart';
import 'package:fitme/models/workout.dart';

abstract class BottomBarView {
  void loadWorkouts(List<Workout> listWorkout);
  void loadMeals(List<Meal> listMeal);
  void showEmptyList();
}
