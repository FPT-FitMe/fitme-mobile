import 'package:fitme/models/meal.dart';
import 'package:fitme/models/tag.dart';

abstract class MealExploreView {
  void loadAllMeals(List<Meal> listMeal);
  void loadAllTag(List<Tag> listTag);
  void loadMealsByTag(List<Meal> listMeal, Tag tag);
  void refesh();
  void showEmptyList();
  void showEmptyListMealTag(Tag tag);
}
