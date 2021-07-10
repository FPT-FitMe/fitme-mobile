// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return Workout(
    workoutID: json['workoutID'] as int,
    description: json['description'] as String,
    estimatedCalories: json['estimatedCalories'] as int,
    estimatedDuration: json['estimatedDuration'] as int,
    imageUrl: json['imageUrl'] as String,
    isPremium: json['isPremium'] as bool,
    level: json['level'] as int,
    name: json['name'] as String,
    coachProfile: json['coachProfile'] == null
        ? null
        : Coach.fromJson(json['coachProfile'] as Map<String, dynamic>),
    tags: (json['tags'] as List<dynamic>)
        .map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    workoutExercises: (json['workoutExercises'] as List<dynamic>)
        .map((e) => WorkoutExercise.fromJson(e as Map<String, dynamic>))
        .toList(),
    createdDate: json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String),
    lastModifiedDate: json['lastModifiedDate'] == null
        ? null
        : DateTime.parse(json['lastModifiedDate'] as String),
  );
}

Map<String, dynamic> _$WorkoutToJson(Workout instance) => <String, dynamic>{
      'workoutID': instance.workoutID,
      'description': instance.description,
      'estimatedCalories': instance.estimatedCalories,
      'estimatedDuration': instance.estimatedDuration,
      'imageUrl': instance.imageUrl,
      'isPremium': instance.isPremium,
      'level': instance.level,
      'name': instance.name,
      'coachProfile': instance.coachProfile,
      'tags': instance.tags,
      'workoutExercises': instance.workoutExercises,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
    };
