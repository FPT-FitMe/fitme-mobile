import 'package:fitme/models/meal.dart';
import 'package:fitme/models/meal_log.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/models/workout_log.dart';

abstract class TraineeRepository {
  Future<bool> doSurvey(
    //success=true
    int gender,
    int age,
    double heightInCm,
    double weightInKg,
    int dietPreferenceType,
    int targetWeightInKg,
    int durationInDays,
    int exerciseFrequencyType,
  );
  Future<bool> buySubscription();
  Future<List<Meal>> getFavouriteMeals();
  Future<List<Workout>> getFavouriteWorkouts();
  Future<List<WorkoutLog>> getWorkoutLogs(DateTime date);
  Future<List<MealLog>> getMealLogs(DateTime date);
  Future<WorkoutLog> logWorkout(Workout workout, int duration,
      int? difficultFeedback, int? experienceFeedback);
  Future<MealLog> logMeal(Meal meal);
  Future<bool> addFavoriteWorkout(int workoutID);
  Future<bool> unFavoriteWorkout(int workoutID);
  Future<bool> addFavoriteMeal(Meal meal);
  Future<bool> unFavoriteMeal(Meal meal);
}
