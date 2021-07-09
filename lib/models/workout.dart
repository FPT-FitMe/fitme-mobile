import 'package:fitme/models/coach.dart';
import 'package:fitme/models/exercise.dart';
import 'package:json_annotation/json_annotation.dart';
part 'workout.g.dart';

@JsonSerializable()
class Workout {
  int workoutID;
  String description;
  double estimatedCalories;
  int estimatedDuration;
  String imageUrl;
  bool isPremium;
  int level;
  String name;
  Coach coach;
  List<Exercise> exercises;

  Workout({
    required this.workoutID,
    required this.description,
    required this.estimatedCalories,
    required this.estimatedDuration,
    this.imageUrl =
        'https://images.unsplash.com/photo-1569913486515-b74bf7751574?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=635&q=80',
    required this.isPremium,
    required this.level,
    required this.name,
    required this.coach,
    required this.exercises,
  });

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
}
