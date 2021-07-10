import 'package:fitme/models/exercise_old.dart';

class WorkoutLog {
  int traineeId;
  Exercise exercise;
  DateTime date;
  String content;

  WorkoutLog({
    required this.traineeId,
    required this.exercise,
    required this.date,
    required this.content,
  });
}
