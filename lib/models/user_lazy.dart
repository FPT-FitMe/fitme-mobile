import 'package:json_annotation/json_annotation.dart';
part 'user_lazy.g.dart';

@JsonSerializable()
class User {
  final int userID;
  final String email;

  User({
    required this.userID,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
