import 'package:fitme/models/exercise.dart';
import 'package:json_annotation/json_annotation.dart';
part 'workout_exercise.g.dart';

@JsonSerializable()
class WorkoutExercise {
  Exercise exerciseID;
  int exerciseOrder;

  WorkoutExercise({
    required this.exerciseID,
    required this.exerciseOrder,
  });

  factory WorkoutExercise.fromJson(Map<String, dynamic> json) =>
      _$WorkoutExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutExerciseToJson(this);
}
