import 'package:fitme/models/meal.dart';
import 'package:fitme/models/tag.dart';
import 'package:fitme/models/workout.dart';

abstract class ViewAllView {
  void loadWorkoutsByTag(List<Workout> listWorkout, Tag tag);
  void loadMealsByTag(List<Meal> listMeal, Tag tag);
  void showEmptyList(Tag tag);
}
