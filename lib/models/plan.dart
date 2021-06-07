import 'package:fitme/models/exercise.dart';
import 'package:fitme/models/meal.dart';

class Plan {
  final int id;
  final List<Exercise> listExercise;
  final List<Meal> listMeal;
  final List<Exercise> listGoal; //cai nay de tam thoi
  final int totalOfCaloOut;
  final int totalOfCaloIn;

  const Plan({
    required this.id,
    required this.listExercise,
    required this.listMeal,
    required this.totalOfCaloIn,
    required this.totalOfCaloOut,
    required this.listGoal,
  });
}
