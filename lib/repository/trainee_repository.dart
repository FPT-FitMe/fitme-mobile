import 'package:fitme/models/meal.dart';
import 'package:fitme/models/workout.dart';

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
      int exerciseFrequencyType);

  Future<bool> buySubscription();
  Future<List<Meal>> getFavouriteMeals();
  Future<List<Workout>> getFavouriteWorkouts();
}
