// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target_weight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TargetWeight _$TargetWeightFromJson(Map<String, dynamic> json) {
  return TargetWeight(
    currentWeight: (json['currentWeight'] as num).toDouble(),
    targetWeight: (json['targetWeight'] as num).toDouble(),
  );
}

Map<String, dynamic> _$TargetWeightToJson(TargetWeight instance) =>
    <String, dynamic>{
      'currentWeight': instance.currentWeight,
      'targetWeight': instance.targetWeight,
    };
