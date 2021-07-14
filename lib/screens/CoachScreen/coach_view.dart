import 'package:fitme/models/coach.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/post.dart';
import 'package:fitme/models/workout.dart';

abstract class CoachExploreView {
  void loadAllWorkoutByCoach(List<Workout> listWorkout);
  void loadAllPostByCoach(List<Post> listPost);
  void loadAllMealByCoach(List<Meal> listMeal);
  void showEmptyList();
}
