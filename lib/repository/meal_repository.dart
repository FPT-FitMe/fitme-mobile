import 'package:fitme/models/meal.dart';

abstract class MealRepository {
  Future<List<Meal>> getAllMeals();
  Future<List<Meal>> getAllMealsByCoach(int coachID);
  Future<Meal> getMealById(int mealID);
}
