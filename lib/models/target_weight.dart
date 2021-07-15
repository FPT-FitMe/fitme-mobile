import 'package:json_annotation/json_annotation.dart';
part 'target_weight.g.dart';

@JsonSerializable()
class TargetWeight {
  double currentWeight;
  double targetWeight;

  TargetWeight({required this.currentWeight, required this.targetWeight});
  factory TargetWeight.fromJson(Map<String, dynamic> json) =>
      _$TargetWeightFromJson(json);
  Map<String, dynamic> toJson() => _$TargetWeightToJson(this);
}
