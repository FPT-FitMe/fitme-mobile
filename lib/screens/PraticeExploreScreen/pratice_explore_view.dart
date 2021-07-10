import 'package:fitme/models/coach.dart';
import 'package:fitme/models/exercise.dart';

abstract class PraticeExploreView {
  void loadAllExercise(List<Exercise> listExercise);
  void loadAllCoaches(List<Coach> listCoach);
  void showEmptyList();
}
