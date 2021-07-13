// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeightLog _$WeightLogFromJson(Map<String, dynamic> json) {
  return WeightLog(
    weightLogID: json['weightLogID'] as int,
    createdAt: DateTime.parse(json['createdAt'] as String),
    value: (json['value'] as num).toDouble(),
  );
}

Map<String, dynamic> _$WeightLogToJson(WeightLog instance) => <String, dynamic>{
      'weightLogID': instance.weightLogID,
      'createdAt': instance.createdAt.toIso8601String(),
      'value': instance.value,
    };
