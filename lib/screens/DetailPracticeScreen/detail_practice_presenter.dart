import 'package:fitme/di/injection.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/repository/workout_repository.dart';
import 'package:fitme/screens/DetailPracticeScreen/detailt_practice_view.dart';

class DetailPracticePresenter {
  DetailPracticeView _detailPracticeView;
  late WorkoutRepository _workoutRepository;

  DetailPracticePresenter(this._detailPracticeView) {
    _workoutRepository = new Injector().workoutRepository;
  }

  Future<void> loadWorkoutByID(int id) async {
    try {
      Workout workout = await _workoutRepository.getWorkoutByID(id);
      _detailPracticeView.loadWorkoutDetail(workout);
    } catch (e) {
      _detailPracticeView.showEmptyList();
      print(e);
    }
  }
}
