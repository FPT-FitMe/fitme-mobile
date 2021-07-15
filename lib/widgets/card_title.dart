import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/screens/DetailPracticeScreen/practice.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/tag.dart';
import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final double? calories;
  final int? id;
  final List<Tag>? tags;
  final bool isWorkout;
  final List<Meal>? listMeal;
  final bool isShowStatus;
  final bool isPost;

  CardTitle({
    this.calories,
    this.tags,
    this.listMeal,
    this.isShowStatus = true,
    required this.title,
    required this.duration,
    required this.id,
    required this.imageUrl,
    required this.isWorkout,
    required this.isPost,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectArticle(context, id),
      child: ListTile(
        // trailing: getTick(id),
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Image.network(
            imageUrl,
            width: 45,
            height: 45,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 16,
          ),
        ),
        subtitle: isWorkout
            ? Text(
                calories != null
                    ? convertDurationAndCalories(calories, duration)
                    : '$duration phút',
              )
            : Text(
                tags == null
                    ? '$duration phút - $calories kcals '
                    : tags!.contains(Tag(id: 4, name: "Bữa sáng", type: "meal"))
                        ? '$duration phút - $calories kcals - Sáng'
                        : tags!.contains(
                                Tag(id: 5, name: "Bữa trưa", type: "meal"))
                            ? '$duration phút - $calories kcals - Trưa'
                            : '$duration phút - $calories kcals - Tối',
              ),
      ),
    );
  }

  void _selectArticle(BuildContext ctx, int? id) {
    isWorkout
        ? Navigator.push(
            ctx,
            MaterialPageRoute(
              builder: (context) => PracticeScreen(
                workoutID: id,
              ),
            ))
        : isPost
            ? Navigator.pushNamed(ctx, AppRoutes.postScreen, arguments: {
                'postID': id,
              })
            : Navigator.pushNamed(ctx, AppRoutes.detailMeal, arguments: {
                'mealID': id,
              });
  }

  String convertDurationAndCalories(dynamic cal, int duration) {
    var d = Duration(minutes: duration);
    List<String> parts = d.toString().split(':');
    int calories = cal.toInt();
    if (d.inHours <= 0) {
      return '${parts[1].padLeft(2, '0')} phút - $calories cals';
    }
    return '${parts[0].padLeft(2, '0')} giờ ${parts[1].padLeft(2, '0')} phút - $calories cals';
  }
}
