import 'package:fitme/models/plan.dart';
import 'package:fitme/models/plan_meal.dart';
import 'package:fitme/models/plan_workout.dart';

abstract class PlanRepository {
  Future<Plan> getPlan(DateTime dateTime);
  Future<PlanWorkout> updatePlanWorkoutDone(PlanWorkout planWorkout);
  Future<PlanWorkout> updatePlanWorkoutSkipped(PlanWorkout planWorkout);
  Future<PlanMeal> updatePlanMealDone(PlanMeal? planMeal);
  Future<PlanMeal> updatePlanMealSkipped(PlanMeal? planMeal);
}
