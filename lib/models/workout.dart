import 'package:fitme/models/coach.dart';
import 'package:fitme/models/tag.dart';
import 'package:fitme/models/workout_exercise.dart';
import 'package:json_annotation/json_annotation.dart';
part 'workout.g.dart';

@JsonSerializable()
class Workout {
  int workoutID;
  String description;
  int estimatedCalories;
  int estimatedDuration;
  String imageUrl;
  bool isPremium;
  int level;
  String name;
  Coach? coachProfile;
  List<Tag> tags;
  List<WorkoutExercise> workoutExercises;
  DateTime? createdDate;
  DateTime? lastModifiedDate;

  Workout({
    required this.workoutID,
    required this.description,
    required this.estimatedCalories,
    required this.estimatedDuration,
    required this.imageUrl,
    required this.isPremium,
    required this.level,
    required this.name,
    this.coachProfile,
    required this.tags,
    required this.workoutExercises,
    this.createdDate,
    this.lastModifiedDate,
  });

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
}
