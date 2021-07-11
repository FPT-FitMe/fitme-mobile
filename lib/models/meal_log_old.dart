import 'package:fitme/models/meal_old.dart';

class MealLogOld {
  int traineeId;
  Meal meal;
  DateTime date;
  String content;

  MealLogOld({
    required this.traineeId,
    required this.meal,
    required this.date,
    required this.content,
  });
}
