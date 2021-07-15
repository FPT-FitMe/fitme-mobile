import 'package:fitme/di/injection.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/meal_log.dart';
import 'package:fitme/models/plan.dart';
import 'package:fitme/models/user.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/models/workout_log.dart';
import 'package:fitme/repository/plan_repository.dart';
import 'package:fitme/repository/trainee_repository.dart';
import 'package:fitme/repository/user_repository.dart';
import 'package:fitme/screens/ExploreScreen/explore_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExplorePresenter {
  ExploreView _exploreView;
  late PlanRepository _planRepository;
  late TraineeRepository _traineeRepository;
  late UserRepository _userRepository;

  ExplorePresenter(this._exploreView) {
    _planRepository = new Injector().planRepository;
    _traineeRepository = new Injector().traineeRepository;
    _userRepository = new Injector().userRepository;
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

  Future<void> getMealLog(DateTime dateTime) async {
    try {
      List<MealLog> listMealLog =
          await _traineeRepository.getMealLogs(dateTime);
      _exploreView.loadMealLog(listMealLog);
    } catch (e) {
      print(e);
    }
  }

  void loadFavouriteMeals() async {
    try {
      List<Meal> listMeals = await _traineeRepository.getFavouriteMeals();
      _exploreView.loadFavouriteMeals(listMeals);
    } catch (e) {
      print(e);
    }
  }

  void loadFavouriteWorkouts() async {
    try {
      List<Workout> listWorkouts =
          await _traineeRepository.getFavouriteWorkouts();
      _exploreView.loadFavouriteWorkouts(listWorkouts);
    } catch (e) {
      print(e);
    }
  }

   void loadUserProfile() async {
    try {
      SharedPreferences _preferences = await SharedPreferences.getInstance();
      int? userID = _preferences.getInt("userID");
      User user = await _userRepository.getUserByID(userID!);
      _exploreView.loadUserInform(user);
    } catch (e) {
      print(e);
    }
  }
}
