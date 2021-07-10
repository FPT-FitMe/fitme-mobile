// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanWorkout _$PlanWorkoutFromJson(Map<String, dynamic> json) {
  return PlanWorkout(
    id: json['id'] as int,
    workout: Workout.fromJson(json['workout'] as Map<String, dynamic>),
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$PlanWorkoutToJson(PlanWorkout instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workout': instance.workout,
      'status': instance.status,
    };
