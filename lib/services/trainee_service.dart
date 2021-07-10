import 'package:dio/dio.dart';
import 'package:fitme/configs/http_service.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/repository/trainee_repository.dart';

class TraineeService implements TraineeRepository {
  Dio dio = new HttpService().dio;

  @override
  Future<bool> doSurvey(
      int gender,
      int age,
      double heightInCm,
      double weightInKg,
      int dietPreferenceType,
      int targetWeightInKg,
      int durationInDays,
      int exerciseFrequencyType) async {
    final response = await dio.post("/trainee/completeSurvey", data: {
      "gender": gender,
      "age": age,
      "heightInCm": heightInCm,
      "weightInKg": weightInKg,
      "dietPreferenceType": dietPreferenceType,
      "targetWeightInKg": targetWeightInKg,
      "durationInDays": durationInDays,
      "exerciseFrequencyType": exerciseFrequencyType,
    });
    return response.statusCode == 200 ? true : false;
  }

  @override
  Future<bool> buySubscription() async {
    final response = await dio.post("/trainee/buySubscription");
    return response.statusCode == 200 ? true : false;
  }

  @override
  Future<List<Meal>> getFavouriteMeals() async {
    final response = await dio.get("/trainee/favorite/meal");
    return (response.data as List).map((meal) => Meal.fromJson(meal)).toList();
  }

  @override
  Future<List<Workout>> getFavouriteWorkouts() async {
    final response = await dio.get("/trainee/favorite/workout");
    return (response.data as List)
        .map((workout) => Workout.fromJson(workout))
        .toList();
  }
}
