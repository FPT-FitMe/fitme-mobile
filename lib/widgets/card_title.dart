import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/meal_status.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/fake_data.dart';
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
  final bool isExercise;
  final List<Meal>? listMeal;

  CardTitle({
    this.calories,
    this.tags,
    this.listMeal,
    required this.title,
    required this.duration,
    required this.id,
    required this.imageUrl,
    required this.isExercise,
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
        subtitle: isExercise
            ? Text(
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
              ),
      ),
    );
  }

  void _selectArticle(BuildContext ctx, int? id) {
    isExercise
        ? Navigator.pushNamed(ctx, AppRoutes.detailPractice)
        : Navigator.pushNamed(ctx, AppRoutes.detailMeal, arguments: {
            'id': id,
            'listMeal': listMeal,
          });
  }
}
