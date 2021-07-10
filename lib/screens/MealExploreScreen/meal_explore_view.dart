import 'package:fitme/models/meal.dart';

abstract class MealExploreView {
  void loadAllMeals(List<Meal> listMeal);
  void showEmptyList();
}
