import 'package:dio/dio.dart';
import 'package:fitme/configs/http_service.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/models/workout_log.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:intl/intl.dart';

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
  Future<List<WorkoutLog>> getWorkoutLog(DateTime dateTime) async {
    // /trainee/log/workout/09-07-2021
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    String date = formatter.format(dateTime);
    final response = await dio.get("/trainee/log/workout/$date");
    return (response.data as List)
        .map((workoutLog) => WorkoutLog.fromJson(workoutLog))
        .toList();
  }

  @override
  Future<WorkoutLog> logWorkout(Workout workout, int duration,
      int? difficultFeedback, int? experienceFeedback) async {
    // TODO: implement logWorkout
    final id = workout.workoutID;
    final response = await dio.post("/trainee/logWorkout/$id", data: {
      "duration": duration,
      "totalCalories": workout.estimatedCalories,
      "difficultFeedback": difficultFeedback,
      "experienceFeedback": experienceFeedback
    });
    return WorkoutLog.fromJson(response.data);
  }
}
