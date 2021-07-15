import 'package:fitme/models/meal.dart';
import 'package:fitme/models/tag.dart';

abstract class MealRepository {
  Future<List<Meal>> getAllMeals();
  Future<List<Meal>> getAllMealsByCoach(int coachID);
  Future<Meal> getMealById(int mealID);
  Future<List<Tag>> getListTagMeal();
  Future<List<Meal>> getListMealByTag(Tag tag);
}
