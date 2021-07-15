import 'package:fitme/models/coach.dart';
import 'package:fitme/models/tag.dart';
import 'package:json_annotation/json_annotation.dart';
part 'meal.g.dart';

@JsonSerializable()
class Meal {
  int mealID;
  Coach? coachProfile;
  double calories;
  double carbAmount;
  int cookingTime;
  String description;
  double fatAmount;
  String imageUrl;
  bool isPremium;
  String name;
  List<Tag> tags;

  Meal({
    required this.mealID,
    this.coachProfile,
    required this.calories,
    required this.carbAmount,
    required this.cookingTime,
    required this.description,
    required this.fatAmount,
    required this.isPremium,
    required this.imageUrl,
    required this.name,
    required this.tags,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
  Map<String, dynamic> toJson() => _$MealToJson(this);
}
