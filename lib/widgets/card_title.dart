import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/meal_status.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/fake_data.dart';
import 'package:fitme/models/meal_old.dart';
import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final double? cal;
  final int id;
  final List<String>? tag;
  final bool isExercise;
  final List<Meal>? listMeal;
  final bool isShowStatus;

  CardTitle({
    this.cal,
    this.tag,
    this.listMeal,
    this.isShowStatus = true,
    required this.title,
    required this.duration,
    required this.id,
    required this.imageUrl,
    required this.isExercise,
  });
  Widget getTick(id) {
    if (LIST_MEAL1[id].status == MealStatus.complete) {
      return Icon(
        Icons.check_circle,
        color: AppColors.green500,
        size: 17,
      );
    } else if (LIST_MEAL1[id].status == MealStatus.skip) {
      return Icon(
        CommunityMaterialIcons.minus_circle_outline,
        color: AppColors.grayText,
        size: 17,
      );
    }
    return Icon(
      CommunityMaterialIcons.minus_circle_outline,
      color: Colors.transparent,
      size: 17,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectArticle(context, id),
      child: ListTile(
        trailing: isShowStatus ? getTick(id) : null,
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
                cal != null ? '$duration phút - $cal kcals' : '$duration phút',
              )
            : Text(
                tag == null
                    ? '$duration phút - $cal kcals '
                    : tag!.contains("Sáng")
                        ? '$duration phút - $cal kcals - Sáng'
                        : tag!.contains("Trưa")
                            ? '$duration phút - $cal kcals - Trưa'
                            : '$duration phút - $cal kcals - Tối',
              ),
      ),
    );
  }

  void _selectArticle(BuildContext ctx, int id) {
    isExercise
        ? Navigator.pushNamed(ctx, AppRoutes.detailPractice)
        : Navigator.pushNamed(ctx, AppRoutes.detailMeal, arguments: {
            'id': id,
            'listMeal': listMeal,
          });
  }
}
