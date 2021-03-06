// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan _$PlanFromJson(Map<String, dynamic> json) {
  return Plan(
    planID: json['planID'] as int,
    target: Target.fromJson(json['target'] as Map<String, dynamic>),
    planMeals: (json['planMeals'] as Map<String, dynamic>).map(
      (k, e) =>
          MapEntry(int.parse(k), PlanMeal.fromJson(e as Map<String, dynamic>)),
    ),
    planWorkouts: (json['planWorkouts'] as List<dynamic>)
        .map((e) => PlanWorkout.fromJson(e as Map<String, dynamic>))
        .toList(),
    date: DateTime.parse(json['date'] as String),
  );
}

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'planID': instance.planID,
      'target': instance.target,
      'planMeals': instance.planMeals.map((k, e) => MapEntry(k.toString(), e)),
      'planWorkouts': instance.planWorkouts,
      'date': instance.date.toIso8601String(),
    };
