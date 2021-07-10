import 'package:fitme/models/workout.dart';
import 'package:json_annotation/json_annotation.dart';
part 'plan_workout.g.dart';

@JsonSerializable()
class PlanWorkout {
  final int id;
  final Workout workout;
  final String status;

  PlanWorkout({
    required this.id,
    required this.workout,
    required this.status,
  });

  factory PlanWorkout.fromJson(Map<String, dynamic> json) =>
      _$PlanWorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$PlanWorkoutToJson(this);
}
