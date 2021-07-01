import 'package:fitme/models/exercise.dart';
import 'package:fitme/models/meal.dart';

class PersonalTrainer {
  final int id;
  final String name;
  final String fullname;
  final String imageUrl;
  final String tagName;
  final String information;
  final List<Exercise> listExcersice;
  final List<Meal> listMeal;

  const PersonalTrainer({
    required this.id,
    required this.name,
    required this.fullname,
    required this.imageUrl,
    required this.tagName,
    required this.information,
    required this.listExcersice,
    required this.listMeal,
  });
}
