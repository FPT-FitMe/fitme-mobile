// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    userID: json['userID'] as int,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String?,
    age: json['age'] as int?,
    gender: json['gender'] as int?,
    role: json['role'] == null
        ? null
        : Role.fromJson(json['role'] as Map<String, dynamic>),
    traineeFavoriteMeals: (json['traineeFavoriteMeals'] as List<dynamic>)
        .map((e) => Meal.fromJson(e as Map<String, dynamic>))
        .toList(),
    traineeFavoriteWorkouts: (json['traineeFavoriteWorkouts'] as List<dynamic>)
        .map((e) => Workout.fromJson(e as Map<String, dynamic>))
        .toList(),
    profileImageUrl: json['profileImageUrl'] as String?,
    height: (json['height'] as num?)?.toDouble(),
    dietPreferenceType: json['dietPreferenceType'] as int?,
    exerciseFrequencyType: json['exerciseFrequencyType'] as int?,
    workoutIntensity: (json['workoutIntensity'] as num?)?.toDouble(),
    isPremium: json['isPremium'] as bool?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userID': instance.userID,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'age': instance.age,
      'gender': instance.gender,
      'role': instance.role,
      'traineeFavoriteWorkouts': instance.traineeFavoriteWorkouts,
      'traineeFavoriteMeals': instance.traineeFavoriteMeals,
      'height': instance.height,
      'dietPreferenceType': instance.dietPreferenceType,
      'exerciseFrequencyType': instance.exerciseFrequencyType,
      'workoutIntensity': instance.workoutIntensity,
      'isPremium': instance.isPremium,
      'profileImageUrl': instance.profileImageUrl,
    };
