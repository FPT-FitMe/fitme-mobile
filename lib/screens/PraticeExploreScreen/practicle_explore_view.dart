import 'package:fitme/models/workout.dart';

abstract class PracticalExploreView {
  void loadAllWorkout(List<Workout> listWorkout);
  void refesh();
  void showFailedModal(String message);
  void showEmptyList();
}
