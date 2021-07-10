import 'package:fitme/models/plan.dart';

abstract class PlanRepository {
  Future<Plan> getPlan(DateTime dateTime);
}
