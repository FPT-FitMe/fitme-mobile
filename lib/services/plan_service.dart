import 'package:dio/dio.dart';
import 'package:fitme/configs/http_service.dart';
import 'package:fitme/models/plan.dart';
import 'package:fitme/models/plan_meal.dart';
import 'package:fitme/models/plan_workout.dart';
import 'package:fitme/repository/plan_repository.dart';
import 'package:intl/intl.dart';

class PlanService implements PlanRepository {
  Dio dio = new HttpService().dio;

  @override
  Future<Plan> getPlan(DateTime dateTime) async {
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    String date = formatter.format(dateTime);
    final response = await dio.get("/trainee/dailyPlan/$date");
    return Plan.fromJson(response.data);
  }

  @override
  Future<PlanWorkout> updatePlanWorkoutDone(PlanWorkout planWorkout) async {
    final id = planWorkout.id;
    final response = await dio.post("/trainee/updatePlanWorkout/$id", data: {
      "status": "done",
    });
    return PlanWorkout.fromJson(response.data);
  }

  @override
  Future<PlanMeal> updatePlanMealDone(PlanMeal? planMeal) async {
    final id = planMeal!.id;
    final response = await dio.post("/trainee/updatePlanMeal/$id", data: {
      "status": "done",
    });
    return PlanMeal.fromJson(response.data);
  }

  @override
  Future<PlanMeal> updatePlanMealSkipped(PlanMeal? planMeal) async {
    final id = planMeal!.id;
    final response = await dio.post("/trainee/updatePlanMeal/$id", data: {
      "status": "skipped",
    });
    return PlanMeal.fromJson(response.data);
  }

  @override
  Future<PlanWorkout> updatePlanWorkoutSkipped(PlanWorkout planWorkout) async {
    final id = planWorkout.id;
    final response = await dio.post("/trainee/updatePlanWorkout/$id", data: {
      "status": "skipped",
    });
    return PlanWorkout.fromJson(response.data);
  }
}
