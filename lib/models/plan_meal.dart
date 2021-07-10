import 'package:fitme/models/meal.dart';
import 'package:json_annotation/json_annotation.dart';
part 'plan_meal.g.dart';

@JsonSerializable()
class PlanMeal {
  final int id;
  final Meal meal;
  final String status;

  PlanMeal({
    required this.id,
    required this.meal,
    required this.status,
  });

  factory PlanMeal.fromJson(Map<String, dynamic> json) =>
      _$PlanMealFromJson(json);
  Map<String, dynamic> toJson() => _$PlanMealToJson(this);
}
