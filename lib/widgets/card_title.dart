import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final int cal;
  final int id;
  final bool isExercise;

  CardTitle({
    required this.cal,
    required this.title,
    required this.duration,
    required this.id,
    required this.imageUrl,
    required this.isExercise,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectArticle(context, id),
      child: ListTile(
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
        subtitle: Text(
          '$duration phút - $cal kcals',
        ),
      ),
    );
  }

  void _selectArticle(BuildContext ctx, int id) {
    isExercise
        ? Navigator.pushNamed(ctx, AppRoutes.detailPractice)
        : Navigator.pushNamed(ctx, AppRoutes.detailMeal);
  }
}
