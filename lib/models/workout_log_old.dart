import 'package:fitme/models/exercise_old.dart';

class WorkoutLogOld {
  int traineeId;
  Exercise exercise;
  DateTime date;
  String content;

  WorkoutLogOld({
    required this.traineeId,
    required this.exercise,
    required this.date,
    required this.content,
  });
}
