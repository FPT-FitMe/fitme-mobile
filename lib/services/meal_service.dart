import 'package:dio/dio.dart';
import 'package:fitme/configs/http_service.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/tag.dart';
import 'package:fitme/repository/meal_repository.dart';

class MealService implements MealRepository {
  Dio dio = new HttpService().dio;

  @override
  Future<List<Meal>> getAllMeals() async {
    final response = await dio.get("/meals");
    return (response.data as List).map((meal) => Meal.fromJson(meal)).toList();
  }

  @override
  Future<List<Meal>> getAllMealsByCoach(int coachID) async {
    final response = await dio.get("/meals?coachID=$coachID");
    return (response.data as List)
        .map((workout) => Meal.fromJson(workout))
        .toList();
  }

  @override
  Future<Meal> getMealById(int mealID) async {
    final response = await dio.get("/meals/$mealID");
    return Meal.fromJson(response.data);
  }

  @override
  Future<List<Meal>> getListMealByTag(Tag tag) async {
    final int id = tag.id;
    final response = await dio.get("/meals?tagID=$id");
    return (response.data as List)
        .map((workout) => Meal.fromJson(workout))
        .toList();
  }

  @override
  Future<List<Tag>> getListTagMeal() async {
    final response = await dio.get("/tags?tagType=meal");
    return (response.data as List).map((tag) => Tag.fromJson(tag)).toList();
  }
}
