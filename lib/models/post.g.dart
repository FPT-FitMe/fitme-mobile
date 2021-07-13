// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    postID: json['postID'] as int?,
    creator: json['creator'] == null
        ? null
        : User.fromJson(json['creator'] as Map<String, dynamic>),
    contentBody: json['contentBody'] as String,
    contentHeader: json['contentHeader'] as String,
    imageUrl: json['imageUrl'] as String,
    readingTime: json['readingTime'] as int,
    isActive: json['isActive'] as bool?,
    name: json['name'] as String,
    coachProfile: Coach.fromJson(json['coachProfile'] as Map<String, dynamic>),
    createdDate: json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String),
    lastModifiedDate: json['lastModifiedDate'] == null
        ? null
        : DateTime.parse(json['lastModifiedDate'] as String),
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'postID': instance.postID,
      'contentHeader': instance.contentHeader,
      'contentBody': instance.contentBody,
      'coachProfile': instance.coachProfile,
      'creator': instance.creator,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'readingTime': instance.readingTime,
      'isActive': instance.isActive,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
    };
