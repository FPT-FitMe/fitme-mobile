import 'package:dio/dio.dart';
import 'package:fitme/configs/http_service.dart';
import 'package:fitme/models/plan.dart';
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
}
