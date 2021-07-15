import 'package:fitme/di/injection.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/repository/meal_repository.dart';
import 'package:fitme/repository/workout_repository.dart';
import 'package:fitme/screens/BottomBarScreen/bottom_bar_view.dart';

class BottomBarPresenter {
  BottomBarView _bottomBarView;
  late WorkoutRepository _workoutRepository;
  late MealRepository _mealRepository;

  BottomBarPresenter(this._bottomBarView) {
    _workoutRepository = new Injector().workoutRepository;
    _mealRepository = new Injector().mealRepository;
  }

  Future<void> loadWorkouts() async {
    try {
      List<Workout> list = await _workoutRepository.getAllWorkout();
      _bottomBarView.loadWorkouts(list);
    } catch (e) {
      print(e);
      _bottomBarView.showEmptyList();
    }
  }

  Future<void> loadMeals() async {
    try {
      List<Meal> list = await _mealRepository.getAllMeals();
      _bottomBarView.loadMeals(list);
    } catch (e) {
      print(e);
      _bottomBarView.showEmptyList();
    }
  }
}
