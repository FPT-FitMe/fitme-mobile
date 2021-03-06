import 'package:fitme/models/meal.dart';
import 'package:fitme/models/post.dart';
import 'package:fitme/models/workout.dart';

abstract class CoachExploreView {
  void loadAllWorkoutByCoach(List<Workout> listWorkout);
  void loadAllPostByCoach(List<Post> listPost);
  void loadAllMealByCoach(List<Meal> listMeal);
  void showEmptyList();
  void refresh();
  void loadFavouriteMeals(List<Meal> listMeals);
  void loadFavouriteWorkouts(List<Workout> listWorkouts);
}
