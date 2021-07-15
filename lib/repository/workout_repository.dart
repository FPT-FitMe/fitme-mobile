import 'package:fitme/models/tag.dart';
import 'package:fitme/models/workout.dart';

abstract class WorkoutRepository {
  Future<Workout> getWorkoutByID(int id);
  Future<List<Workout>> getAllWorkout();
  Future<List<Workout>> getWorkoutsByCoach(int coachID);
  Future<List<Tag>> getListTagWorkout();
  Future<List<Workout>> getListWorkoutByTag(Tag tag);
}
