// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) {
  return Meal(
    mealID: json['mealID'] as int,
    coachProfile: json['coachProfile'] == null
        ? null
        : Coach.fromJson(json['coachProfile'] as Map<String, dynamic>),
    calories: (json['calories'] as num).toDouble(),
    carbAmount: (json['carbAmount'] as num).toDouble(),
    cookingTime: json['cookingTime'] as int,
    description: json['description'] as String?,
    fatAmount: (json['fatAmount'] as num).toDouble(),
    isPremium: json['isPremium'] as bool,
    imageUrl: json['imageUrl'] as String,
    name: json['name'] as String,
    tags: (json['tags'] as List<dynamic>)
        .map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'mealID': instance.mealID,
      'coachProfile': instance.coachProfile,
      'calories': instance.calories,
      'carbAmount': instance.carbAmount,
      'cookingTime': instance.cookingTime,
      'description': instance.description,
      'fatAmount': instance.fatAmount,
      'imageUrl': instance.imageUrl,
      'isPremium': instance.isPremium,
      'name': instance.name,
      'tags': instance.tags,
    };
