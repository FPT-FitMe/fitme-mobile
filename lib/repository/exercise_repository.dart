import 'package:fitme/models/exercise.dart';

abstract class ExerciseRepository {
  Future<List<Exercise>> getAllExercises();
}
