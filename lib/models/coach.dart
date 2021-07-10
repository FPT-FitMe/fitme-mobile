import 'package:json_annotation/json_annotation.dart';
part 'coach.g.dart';

@JsonSerializable()
class Coach {
  int? coachID;
  String name;
  String contact;
  String introduction;
  String imageUrl;

  Coach({
    this.coachID,
    required this.name,
    required this.contact,
    required this.introduction,
    required this.imageUrl,
  });

  factory Coach.fromJson(Map<String, dynamic> json) => _$CoachFromJson(json);
  Map<String, dynamic> toJson() => _$CoachToJson(this);
}
