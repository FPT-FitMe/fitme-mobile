import 'package:fitme/di/injection.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/tag.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/repository/meal_repository.dart';
import 'package:fitme/repository/workout_repository.dart';
import 'package:fitme/screens/ViewAllScreen/view_all_view.dart';

class ViewAllPresenter {
  ViewAllView _viewAllView;
  late WorkoutRepository _workoutRepository;
  late MealRepository _mealRepository;

  ViewAllPresenter(this._viewAllView) {
    _workoutRepository = new Injector().workoutRepository;
    _mealRepository = new Injector().mealRepository;
  }

  Future<void> loadWorkouts(Tag tag) async {
    try {
      List<Workout> list = await _workoutRepository.getListWorkoutByTag(tag);
      _viewAllView.loadWorkoutsByTag(list, tag);
    } catch (e) {
      print(e);
      _viewAllView.showEmptyList(tag);
    }
  }

  Future<void> loadMeals(Tag tag) async {
    try {
      List<Meal> list = await _mealRepository.getListMealByTag(tag);
      _viewAllView.loadMealsByTag(list, tag);
    } catch (e) {
      print(e);
      _viewAllView.showEmptyList(tag);
    }
  }
}
