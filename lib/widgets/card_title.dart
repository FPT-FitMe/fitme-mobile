import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/meal_status.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/fake_data.dart';
<<<<<<< HEAD
import 'package:fitme/models/meal_old.dart';
import 'package:fitme/screens/DetailPracticeScreen/practice.dart';
=======
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/tag.dart';
>>>>>>> 96c2e29cbcfe8c911f02a3a404d2cef89017d7e6
import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
<<<<<<< HEAD
  final double? cal;
  final int id;
  final List<String>? tag;
  final bool isWorkout;
=======
  final double? calories;
  final int? id;
  final List<Tag>? tags;
  final bool isExercise;
>>>>>>> 96c2e29cbcfe8c911f02a3a404d2cef89017d7e6
  final List<Meal>? listMeal;
  final bool isShowStatus;

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
  });
  // Widget getTick(id) {
  //   if (LIST_MEAL1[id].status == MealStatus.complete) {
  //     return Icon(
  //       Icons.check_circle,
  //       color: AppColors.green500,
  //       size: 17,
  //     );
  //   } else if (LIST_MEAL1[id].status == MealStatus.skip) {
  //     return Icon(
  //       CommunityMaterialIcons.minus_circle_outline,
  //       color: AppColors.grayText,
  //       size: 17,
  //     );
  //   }
  //   return Icon(
  //     CommunityMaterialIcons.minus_circle_outline,
  //     color: Colors.transparent,
  //     size: 17,
  //   );
  // }

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
<<<<<<< HEAD
                cal != null
                    ? convertDurationAndCalories(cal, duration)
                    : '$duration phút',
              )
            : Text(
                tag == null
                    ? '$duration phút - $cal kcals '
                    : tag!.contains("Sáng")
                        ? '$duration phút - $cal kcals - Sáng'
                        : tag!.contains("Trưa")
                            ? '$duration phút - $cal kcals - Trưa'
                            : '$duration phút - $cal kcals - Tối',
=======
                calories != null
                    ? '$duration phút - $calories cals'
                    : '$duration phút',
              )
            : Text(
                tags!.contains("Sáng")
                    ? '$duration phút - $calories cals - Sáng'
                    : tags!.contains("Trưa")
                        ? '$duration phút - $calories cals - Trưa'
                        : '$duration phút - $calories cals - Tối',
>>>>>>> 96c2e29cbcfe8c911f02a3a404d2cef89017d7e6
              ),
      ),
    );
  }

  void _selectArticle(BuildContext ctx, int? id) {
<<<<<<< HEAD
    isWorkout
        ? Navigator.push(
            ctx,
            MaterialPageRoute(
              builder: (context) => PracticeScreen(
                workoutID: id,
              ),
            ))
=======
    isExercise
        ? Navigator.pushNamed(ctx, AppRoutes.detailPractice)
>>>>>>> 96c2e29cbcfe8c911f02a3a404d2cef89017d7e6
        : Navigator.pushNamed(ctx, AppRoutes.detailMeal, arguments: {
            'id': id,
            'listMeal': listMeal,
          });
  }

  String convertDurationAndCalories(dynamic cal, int duration) {
    var d = Duration(minutes: duration);
    List<String> parts = d.toString().split(':');
    int calories = cal.toInt();
    return '${parts[0].padLeft(2, '0')} giờ ${parts[1].padLeft(2, '0')} phút - $calories cals';
  }
}
