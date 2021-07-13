import 'package:fitme/di/injection.dart';
import 'package:fitme/models/plan.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/models/workout_log.dart';
import 'package:fitme/repository/plan_repository.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/screens/ExploreScreen/explore_view.dart';

class ExplorePresenter {
  ExploreView _exploreView;
  late PlanRepository _planRepository;
  late TraineeRepository _traineeRepository;

  ExplorePresenter(this._exploreView) {
    _planRepository = new Injector().planRepository;
    _traineeRepository = new Injector().traineeRepository;
  }

  Future<void> getPlan(DateTime dateTime) async {
    try {
      Plan plan = await _planRepository.getPlan(dateTime);
      _exploreView.loadPlan(plan);
    } catch (e) {
      _exploreView.showEmptyPlan();
      print(e);
    }
  }

  Future<void> getListWorkoutComplete(DateTime dateTime) async {
    try {
      List<WorkoutLog> listWorkoutLog =
          await _traineeRepository.getWorkoutLogs(dateTime);
      List<Workout> listWorkout = [];
      for (WorkoutLog wL in listWorkoutLog) {
        listWorkout.add(wL.workout);
      }
      _exploreView.loadWorkoutComplete(listWorkoutLog, listWorkout);
    } catch (e) {
      _exploreView.showEmptyWorkout();
      print(e);
    }
  }
}
