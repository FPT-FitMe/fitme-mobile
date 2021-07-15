import 'package:fitme/models/tag.dart';
import 'package:json_annotation/json_annotation.dart';
part 'exercise.g.dart';

@JsonSerializable()
class Exercise {
  int exerciseID;
  int baseDuration;
  int baseRepPerRound;
  int baseKcal;
  String description;
  int? exerciseOrder;
  String imageUrl;
  String name;
  String videoUrl;
  bool? isChecked; // fe params
  List<Tag> tags;
  DateTime? createdDate;
  DateTime? lastModifiedDate;

  Exercise({
    required this.exerciseID,
    required this.baseDuration,
    required this.baseKcal,
    required this.baseRepPerRound,
    required this.description,
    this.exerciseOrder,
    required this.imageUrl,
    required this.name,
    required this.videoUrl,
    required this.tags,
    this.createdDate,
    this.lastModifiedDate,
    this.isChecked = false,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
