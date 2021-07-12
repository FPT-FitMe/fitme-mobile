import 'package:fitme/models/user_lazy.dart';
import 'package:fitme/models/workout.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_log.g.dart';

@JsonSerializable()
class WorkoutLog {
  final int workoutLogID;
  final User trainee;
  final Workout workout;
  final int duration;
  final int totalCalories;
  final DateTime createdAt;
  final int? difficultFeedback;
  final int? experienceFeedback;

  WorkoutLog({
    required this.workoutLogID,
    required this.trainee,
    required this.workout,
    required this.duration,
    required this.totalCalories,
    required this.createdAt,
    this.difficultFeedback,
    this.experienceFeedback,
  });

  factory WorkoutLog.fromJson(Map<String, dynamic> json) =>
      _$WorkoutLogFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutLogToJson(this);
}
