import 'package:fitme/models/meal.dart';

class MealLog {
  int traineeId;
  Meal meal;
  DateTime date;
  String content;

  MealLog({
    required this.traineeId,
    required this.meal,
    required this.date,
    required this.content,
  });
}