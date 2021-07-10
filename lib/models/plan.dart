import 'dart:collection';

import 'package:fitme/models/plan_meal.dart';
import 'package:fitme/models/plan_workout.dart';
import 'package:fitme/models/target.dart';
import 'package:json_annotation/json_annotation.dart';
part 'plan.g.dart';

@JsonSerializable()
class Plan {
  final int planID;
  final Target target;
  final Map<int, PlanMeal> planMeals;
  final List<PlanWorkout> planWorkouts;
  final DateTime date;

  Plan({
    required this.planID,
    required this.target,
    required this.planMeals,
    required this.planWorkouts,
    required this.date,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
  Map<String, dynamic> toJson() => _$PlanToJson(this);
}
