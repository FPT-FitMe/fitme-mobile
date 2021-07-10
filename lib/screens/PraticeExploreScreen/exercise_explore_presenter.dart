import 'package:fitme/models/coach.dart';
import 'package:fitme/models/exercise.dart';
import 'package:fitme/repository/coach_repository.dart';
import 'package:fitme/repository/exercise_repository.dart';
import 'package:fitme/di/injection.dart';
import 'package:fitme/screens/PraticeExploreScreen/pratice_explore_view.dart';

class PraticePresenter {
  PraticeExploreView _praticeExploreView;
  late CoachRepository _coachRepository;
  late ExerciseRepository _exerciseRepository;

  PraticePresenter(this._praticeExploreView) {
    _exerciseRepository = new Injector().exerciseRepository;
  }

  void loadAllExercise() async {
    try {
      List<Exercise> listExercise = await _exerciseRepository.getAllExercises();
      _praticeExploreView.loadAllExercise(listExercise);
    } catch (e) {
      _praticeExploreView.showEmptyList();
      print(e);
    }
  }

  void loadAllCoaches() async {
    try {
      List<Coach> listCoaches = await _coachRepository.getAllCoaches();
      _praticeExploreView.loadAllCoaches(listCoaches);
    } catch (e) {
      print(e);
    }
  }
}
