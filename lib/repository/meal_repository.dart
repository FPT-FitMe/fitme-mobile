import 'package:fitme/models/meal.dart';

abstract class MealRepository {
  Future<List<Meal>> getAllMeals();
}
