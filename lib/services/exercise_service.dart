import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitme/configs/http_service.dart';
import 'package:fitme/models/exercise.dart';
import 'package:fitme/repository/exercise_repository.dart';

class ExerciseService implements ExerciseRepository {
  Dio dio = new HttpService().dio;

  @override
  Future<List<Exercise>> getAllExercises() async {
    final response = await dio.get("/exercises");
    return (response.data as List)
        .map((exercise) => Exercise.fromJson(exercise))
        .toList();
  }
}
