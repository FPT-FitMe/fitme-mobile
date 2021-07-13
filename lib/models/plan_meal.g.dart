// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanMeal _$PlanMealFromJson(Map<String, dynamic> json) {
  return PlanMeal(
    id: json['id'] as int,
    meal: Meal.fromJson(json['meal'] as Map<String, dynamic>),
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$PlanMealToJson(PlanMeal instance) => <String, dynamic>{
      'id': instance.id,
      'meal': instance.meal,
      'status': instance.status,
    };
