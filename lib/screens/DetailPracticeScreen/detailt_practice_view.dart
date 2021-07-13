import 'package:fitme/models/workout.dart';

abstract class DetailPracticeView {
  void loadWorkoutDetail(Workout workout);
  void refresh();
  void showFailedModal(String message);
  void showEmptyList();
}
