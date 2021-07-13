// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUser _$AuthUserFromJson(Map<String, dynamic> json) {
  return AuthUser(
    id: json['id'] as int?,
    email: json['email'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    gender: json['gender'] as String?,
    role: json['role'] as String,
    phoneNumber: json['phoneNumber'] as String?,
    profileImageUrl: json['profileImageUrl'] as String?,
    premium: json['premium'] as bool?,
  );
}

Map<String, dynamic> _$AuthUserToJson(AuthUser instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'role': instance.role,
      'phoneNumber': instance.phoneNumber,
      'profileImageUrl': instance.profileImageUrl,
      'premium': instance.premium,
    };
