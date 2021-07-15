import 'package:json_annotation/json_annotation.dart';

part 'weight_log.g.dart';

@JsonSerializable()
class WeightLog {
  int weightLogID;
  DateTime createdAt;
  double value;

  WeightLog({
    required this.weightLogID,
    required this.createdAt,
    required this.value,
  });

  factory WeightLog.fromJson(Map<String, dynamic> json) =>
      _$WeightLogFromJson(json);
  Map<String, dynamic> toJson() => _$WeightLogToJson(this);
}
