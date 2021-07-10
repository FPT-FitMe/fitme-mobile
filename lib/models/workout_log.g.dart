// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutLog _$WorkoutLogFromJson(Map<String, dynamic> json) {
  return WorkoutLog(
    id: json['id'] as int,
    trainee: User.fromJson(json['trainee'] as Map<String, dynamic>),
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
      'id': instance.id,
      'trainee': instance.trainee,
      'workout': instance.workout,
      'duration': instance.duration,
      'totalCalories': instance.totalCalories,
      'createdAt': instance.createdAt.toIso8601String(),
      'difficultFeedback': instance.difficultFeedback,
      'experienceFeedback': instance.experienceFeedback,
    };
