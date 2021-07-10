import 'package:json_annotation/json_annotation.dart';
part 'auth_user.g.dart';

@JsonSerializable()
class AuthUser {
  final int? id;
  final String email;
  final String firstName;
  final String lastName;
  final String? gender;
  final String role;
  final String? phoneNumber;
  final String? profileImageUrl;
  final bool? premium;

  AuthUser({
    this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.gender,
    required this.role,
    this.phoneNumber,
    this.profileImageUrl,
    this.premium,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
  Map<String, dynamic> toJson() => _$AuthUserToJson(this);
}
