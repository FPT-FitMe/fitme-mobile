// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealLog _$MealLogFromJson(Map<String, dynamic> json) {
  return MealLog(
    mealLogID: json['mealLogID'] as int,
    meal: Meal.fromJson(json['meal'] as Map<String, dynamic>),
    createdAt: DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$MealLogToJson(MealLog instance) => <String, dynamic>{
      'mealLogID': instance.mealLogID,
      'meal': instance.meal,
      'createdAt': instance.createdAt.toIso8601String(),
    };
