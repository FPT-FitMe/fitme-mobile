import 'package:fitme/models/meal.dart';
import 'package:json_annotation/json_annotation.dart';
part 'meal_log.g.dart';

@JsonSerializable()
class MealLog {
  final int mealLogID;
  final Meal meal;
  final DateTime createdAt;

  MealLog({
    required this.mealLogID,
    required this.meal,
    required this.createdAt,
  });

  factory MealLog.fromJson(Map<String, dynamic> json) =>
      _$MealLogFromJson(json);
  Map<String, dynamic> toJson() => _$MealLogToJson(this);
}
