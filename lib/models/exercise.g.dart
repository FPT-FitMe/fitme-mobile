// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return Exercise(
    exerciseID: json['exerciseID'] as int?,
    baseDuration: json['baseDuration'] as int,
    baseKcal: json['baseKcal'] as int,
    baseRepPerRound: json['baseRepPerRound'] as int,
    description: json['description'] as String,
    exerciseOrder: json['exerciseOrder'] as int?,
    imageUrl: json['imageUrl'] as String,
    name: json['name'] as String,
    videoUrl: json['videoUrl'] as String,
    tags: (json['tags'] as List<dynamic>)
        .map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    createdDate: json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String),
    lastModifiedDate: json['lastModifiedDate'] == null
        ? null
        : DateTime.parse(json['lastModifiedDate'] as String),
    isChecked: json['isChecked'] as bool?,
  );
}

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'exerciseID': instance.exerciseID,
      'baseDuration': instance.baseDuration,
      'baseRepPerRound': instance.baseRepPerRound,
      'baseKcal': instance.baseKcal,
      'description': instance.description,
      'exerciseOrder': instance.exerciseOrder,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'videoUrl': instance.videoUrl,
      'isChecked': instance.isChecked,
      'tags': instance.tags,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
    };
