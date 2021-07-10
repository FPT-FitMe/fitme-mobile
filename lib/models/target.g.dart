// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Target _$TargetFromJson(Map<String, dynamic> json) {
  return Target(
    id: json['id'] as int,
    trainee: User.fromJson(json['trainee'] as Map<String, dynamic>),
    startDate: DateTime.parse(json['startDate'] as String),
    completeDate: DateTime.parse(json['completeDate'] as String),
    startingBMI: (json['startingBMI'] as num).toDouble(),
    targetBMI: (json['targetBMI'] as num).toDouble(),
    hasFinished: json['hasFinished'] as bool,
  );
}

Map<String, dynamic> _$TargetToJson(Target instance) => <String, dynamic>{
      'id': instance.id,
      'trainee': instance.trainee,
      'startDate': instance.startDate.toIso8601String(),
      'completeDate': instance.completeDate.toIso8601String(),
      'startingBMI': instance.startingBMI,
      'targetBMI': instance.targetBMI,
      'hasFinished': instance.hasFinished,
    };
