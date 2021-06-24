import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final int? cal;
  final int id;
  final List<String>? tag;
  final bool isExercise;

  CardTitle({
    this.cal,
    this.tag,
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
        subtitle: isExercise
            ? Text(
                cal != null ? '$duration phút - $cal kcals' : '$duration phút',
              )
            : Text(
                tag!.contains("Sáng")
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
        : Navigator.pushNamed(ctx, AppRoutes.detailMeal);
  }
}
