import 'package:fitme/di/injection.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/repository/workout_repository.dart';
import 'package:fitme/screens/PraticeExploreScreen/practicle_explore_view.dart';

class PracticalExplorePresenter {
  PracticalExploreView _practicalExploreView;
  late WorkoutRepository _workoutRepository;

  PracticalExplorePresenter(this._practicalExploreView) {
    _workoutRepository = new Injector().workoutRepository;
  }

  Future<void> getAllWorkout() async {
    try {
      List<Workout> listWorkout = await _workoutRepository.getAllWorkout();
      _practicalExploreView.loadAllWorkout(listWorkout);
    } catch (e) {
      _practicalExploreView.showEmptyList();
      print(e);
    }
  }
}
