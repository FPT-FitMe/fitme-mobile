import 'package:fitme/di/injection.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/repository/workout_repository.dart';
import 'package:fitme/screens/DetailPracticeScreen/detailt_practice_view.dart';

class DetailPracticePresenter {
  DetailPracticeView _detailPracticeView;
  late WorkoutRepository _workoutRepository;
  late TraineeRepository _traineeRepository;

  DetailPracticePresenter(this._detailPracticeView) {
    _workoutRepository = new Injector().workoutRepository;
    _traineeRepository = new Injector().traineeRepository;
  }

  Future<void> loadWorkoutByID(int id) async {
    try {
      bool isFavorite = false;
      Workout workout = await _workoutRepository.getWorkoutByID(id);
      List<Workout> list = await _traineeRepository.getFavouriteWorkouts();
      if (list.isNotEmpty) {
        list.contains(workout) ? isFavorite = true : isFavorite = false;
      }
      _detailPracticeView.loadWorkoutDetail(workout, isFavorite);
    } catch (e) {
      _detailPracticeView.showEmptyList();
      print(e);
    }
  }

  Future<void> addFavorite(int workoutID) async {
    try {
      bool result = await _traineeRepository.addFavoriteWorkout(workoutID);
      if (result) {
        _detailPracticeView.addFavoriteSuccess();
      }
    } catch (e) {
      _detailPracticeView
          .addFavoriteFailed("Thêm vào list yêu thích không thành công!");
      print(e);
    }
  }

  Future<void> unFavorite(int workoutID) async {
    try {
      bool result = await _traineeRepository.unFavoriteWorkout(workoutID);
      if (result) {
        _detailPracticeView.unFavoriteSuccess();
      }
    } catch (e) {
      _detailPracticeView
          .unFavoriteFailed("Xóa khỏi list yêu thích không thành công!");
      print(e);
    }
  }
}
