import 'package:fitme/models/workout.dart';

abstract class WorkoutRepository {
  Future<Workout> getWorkoutByID(int id);
  Future<List<Workout>> getAllWorkout();
}
