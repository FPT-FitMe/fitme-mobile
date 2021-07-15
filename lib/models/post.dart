import 'package:fitme/models/coach.dart';
import 'package:fitme/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';

@JsonSerializable()
class Post {
  final int? postID;
  final String contentHeader;
  final String contentBody;
  final Coach coachProfile;
  final User? creator;
  final String imageUrl;
  final String name;
  final int readingTime;
  final bool? isActive;
  final DateTime? createdDate;
  final DateTime? lastModifiedDate;

  Post({
    this.postID,
    this.creator,
    required this.contentBody,
    required this.contentHeader,
    required this.imageUrl,
    required this.readingTime,
    this.isActive,
    required this.name,
    required this.coachProfile,
    this.createdDate,
    this.lastModifiedDate,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
