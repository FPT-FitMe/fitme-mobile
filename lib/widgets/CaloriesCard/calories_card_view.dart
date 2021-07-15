import 'package:fitme/models/target_weight.dart';
import 'package:fitme/models/weight_log.dart';

abstract class CaloriesCardView {
  void loadAllWeightLog(List<WeightLog> listWeightLogs);
  void loadTargetWeight(TargetWeight? targetWeight);
}
