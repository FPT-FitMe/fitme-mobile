import 'package:fitme/di/injection.dart';
import 'package:fitme/models/meal_log.dart';
import 'package:fitme/models/workout_log.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/screens/LogScreen/log_view.dart';

class LogPresenter {
  LogView _logView;
  late TraineeRepository _traineeRepository;

  LogPresenter(this._logView) {
    _traineeRepository = new Injector().traineeRepository;
  }

  void loadMealLogs(DateTime date) async {
    try {
      List<MealLog> listMeals = await _traineeRepository.getMealLogs(date);
      _logView.loadMealLogs(listMeals);
    } catch (e) {
      print(e);
      _logView.loadMealLogs([]);
    }
  }

  void loadWorkoutLogs(DateTime date) async {
    try {
      List<WorkoutLog> listWorkouts =
          await _traineeRepository.getWorkoutLogs(date);
      _logView.loadWorkoutLogs(listWorkouts);
    } catch (e) {
      print(e);
      _logView.loadWorkoutLogs([]);
    }
  }
}
