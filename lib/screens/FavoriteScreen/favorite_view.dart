import 'package:fitme/models/meal.dart';
import 'package:fitme/models/workout.dart';

abstract class FavoriteView {
  void loadFavouriteMeals(List<Meal> listMeals);
  void loadFavouriteWorkouts(List<Workout> listWorkouts);
}
