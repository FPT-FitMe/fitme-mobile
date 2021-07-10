import 'package:fitme/models/coach.dart';
import 'package:fitme/models/exercise.dart';
import 'package:fitme/repository/coach_repository.dart';
import 'package:fitme/repository/exercise_repository.dart';
import 'package:fitme/di/injection.dart';
import 'package:fitme/screens/PraticeExploreScreen/pratice_explore_view.dart';

class ExerciseExplorePresenter {
  PraticeExploreView _exerciseExploreView;
  late CoachRepository _coachRepository;
  late ExerciseRepository _exerciseRepository;

  ExerciseExplorePresenter(this._exerciseExploreView) {
    _exerciseRepository = new Injector().exerciseRepository;
  }

  void loadAllExercise() async {
    try {
      List<Exercise> listExercise = await _exerciseRepository.getAllExercises();
      _exerciseExploreView.loadAllExercise(listExercise);
    } catch (e) {
      _exerciseExploreView.showEmptyList();
      print(e);
    }
  }

  void loadAllCoaches() async {
    try {
      List<Coach> listCoaches = await _coachRepository.getAllCoaches();
      _exerciseExploreView.loadAllCoaches(listCoaches);
    } catch (e) {
      print(e);
    }
  }
}
