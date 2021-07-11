// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutExercise _$WorkoutExerciseFromJson(Map<String, dynamic> json) {
  return WorkoutExercise(
    exerciseID: Exercise.fromJson(json['exerciseID'] as Map<String, dynamic>),
    exerciseOrder: json['exerciseOrder'] as int,
  );
}

Map<String, dynamic> _$WorkoutExerciseToJson(WorkoutExercise instance) =>
    <String, dynamic>{
      'exerciseID': instance.exerciseID,
      'exerciseOrder': instance.exerciseOrder,
    };
