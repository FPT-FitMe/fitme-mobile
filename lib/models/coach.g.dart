// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coach _$CoachFromJson(Map<String, dynamic> json) {
  return Coach(
    coachID: json['coachID'] as int,
    name: json['name'] as String,
    contact: json['contact'] as String,
    introduction: json['introduction'] as String,
    imageUrl: json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$CoachToJson(Coach instance) => <String, dynamic>{
      'coachID': instance.coachID,
      'name': instance.name,
      'contact': instance.contact,
      'introduction': instance.introduction,
      'imageUrl': instance.imageUrl,
    };
