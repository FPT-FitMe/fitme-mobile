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
      int exerciseFrequencyType);

  Future<List<WorkoutLog>> getWorkoutLog(DateTime dateTime);
}
