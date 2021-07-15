import 'package:fitme/models/exercise_old.dart';
import 'package:fitme/models/meal_old.dart';
import 'package:fitme/models/post_old.dart';

class Plan {
  final int id;
  final List<Exercise> listExercise;
  final List<Meal> listMeal;
  final List<Exercise> listGoal; //cai nay de tam thoi
  final List<Post> listPost;
  final int totalOfCaloOut;
  final int totalOfCaloIn;

  const Plan({
    required this.id,
    required this.listExercise,
    required this.listMeal,
    required this.listPost,
    required this.totalOfCaloIn,
    required this.totalOfCaloOut,
    required this.listGoal,
  });
}
