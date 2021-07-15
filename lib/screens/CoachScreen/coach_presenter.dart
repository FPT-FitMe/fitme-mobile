import 'package:fitme/di/injection.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/post.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/repository/meal_repository.dart';
import 'package:fitme/repository/post_repository.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/repository/workout_repository.dart';
import 'package:fitme/screens/CoachScreen/coach_view.dart';

class CoachPresenter {
  CoachExploreView _coachExploreView;
  late WorkoutRepository _workoutRepository;
  late PostRepository _postRepository;
  late MealRepository _mealRepository;
  late TraineeRepository _traineeRepository;

  CoachPresenter(this._coachExploreView) {
    _workoutRepository = new Injector().workoutRepository;
    _postRepository = new Injector().postRepository;
    _mealRepository = new Injector().mealRepository;
    _traineeRepository = new Injector().traineeRepository;
  }

  Future<void> getMealsByCoach(int coachID) async {
    try {
      List<Meal> list = await _mealRepository.getAllMealsByCoach(coachID);
      _coachExploreView.loadAllMealByCoach(list);
    } catch (e) {
      _coachExploreView.showEmptyList();
      print(e);
    }
  }

  Future<void> getPostsByCoach(int coachID) async {
    try {
      List<Post> list = await _postRepository.getAllPostsByCoach(coachID);
      _coachExploreView.loadAllPostByCoach(list);
    } catch (e) {
      _coachExploreView.showEmptyList();
      print(e);
    }
  }

  Future<void> getWorkoutsByCoach(int coachID) async {
    try {
      List<Workout> list = await _workoutRepository.getWorkoutsByCoach(coachID);
      _coachExploreView.loadAllWorkoutByCoach(list);
    } catch (e) {
      _coachExploreView.showEmptyList();
      print(e);
    }
  }

  void loadFavouriteMeals() async {
    try {
      List<Meal> listMeals = await _traineeRepository.getFavouriteMeals();
      _coachExploreView.loadFavouriteMeals(listMeals);
    } catch (e) {
      print(e);
    }
  }

  void loadFavouriteWorkouts() async {
    try {
      List<Workout> listWorkouts =
          await _traineeRepository.getFavouriteWorkouts();
      _coachExploreView.loadFavouriteWorkouts(listWorkouts);
    } catch (e) {
      print(e);
    }
  }
}
