import 'package:fitme/models/plan.dart';

abstract class ExploreView {
  void loadPlan(Plan plan);
  void refesh();
  void showFailedModal(String message);
  void showEmptyPlan();
}
