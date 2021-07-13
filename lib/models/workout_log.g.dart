// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutLog _$WorkoutLogFromJson(Map<String, dynamic> json) {
  return WorkoutLog(
    workoutLogID: json['workoutLogID'] as int,
    workout: Workout.fromJson(json['workout'] as Map<String, dynamic>),
    duration: json['duration'] as int,
    totalCalories: json['totalCalories'] as int,
    createdAt: DateTime.parse(json['createdAt'] as String),
    difficultFeedback: json['difficultFeedback'] as int,
    experienceFeedback: json['experienceFeedback'] as int,
  );
}

Map<String, dynamic> _$WorkoutLogToJson(WorkoutLog instance) =>
    <String, dynamic>{
      'workoutLogID': instance.workoutLogID,
      'workout': instance.workout,
      'duration': instance.duration,
      'totalCalories': instance.totalCalories,
      'createdAt': instance.createdAt.toIso8601String(),
      'difficultFeedback': instance.difficultFeedback,
      'experienceFeedback': instance.experienceFeedback,
    };
