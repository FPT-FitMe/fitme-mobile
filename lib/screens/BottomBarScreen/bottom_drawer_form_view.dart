import 'package:fitme/models/target_weight.dart';

abstract class BottomDrawerFormView {
  void showToast(message);

  void loadTargetWeight(TargetWeight? targetWeight) {}
}
