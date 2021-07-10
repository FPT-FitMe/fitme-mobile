import 'package:fitme/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'target.g.dart';

@JsonSerializable()
class Target {
  final int id;
  final User trainee;
  final DateTime startDate;
  final DateTime completeDate;
  final double startingBMI;
  final double targetBMI;
  final bool hasFinished;

  Target({
    required this.id,
    required this.trainee,
    required this.startDate,
    required this.completeDate,
    required this.startingBMI,
    required this.targetBMI,
    required this.hasFinished,
  });

  factory Target.fromJson(Map<String, dynamic> json) => _$TargetFromJson(json);
  Map<String, dynamic> toJson() => _$TargetToJson(this);
}
