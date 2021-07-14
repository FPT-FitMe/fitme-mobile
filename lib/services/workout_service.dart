import 'package:dio/dio.dart';
import 'package:fitme/configs/http_service.dart';
import 'package:fitme/models/tag.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/repository/workout_repository.dart';

class WorkoutService implements WorkoutRepository {
  Dio dio = new HttpService().dio;

  @override
  Future<Workout> getWorkoutByID(int id) async {
    //  /workouts/4
    final response = await dio.get("/workouts/$id");
    return Workout.fromJson(response.data);
  }

  @override
  Future<List<Workout>> getAllWorkout() async {
    final response = await dio.get("/workouts");
    return (response.data as List)
        .map((workout) => Workout.fromJson(workout))
        .toList();
  }

  @override
  Future<List<Workout>> getWorkoutsByCoach(int coachID) async {
    final response = await dio.get("/workouts?coachID=$coachID");
    return (response.data as List)
        .map((workout) => Workout.fromJson(workout))
        .toList();
  }

  @override
  Future<List<Tag>> getListTagWorkout() async {
    final response = await dio.get("/tags?tagType=exercise");
    return (response.data as List).map((tag) => Tag.fromJson(tag)).toList();
  }

  @override
  Future<List<Workout>> getListWorkoutByTag(Tag tag) async {
    final int id = tag.id;
    final response = await dio.get("/workouts?tagID=$id");
    return (response.data as List)
        .map((workout) => Workout.fromJson(workout))
        .toList();
  }
}
