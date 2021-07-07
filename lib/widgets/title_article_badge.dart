import 'package:fitme/constants/routes.dart';
import 'package:flutter/material.dart';

import 'package:badges/badges.dart';

import 'package:fitme/models/meal.dart';

import 'package:fitme/constants/colors.dart';

class TitleArticleBadge extends StatelessWidget {
  final List<Meal>? listMeal;
  final String title;

  const TitleArticleBadge({required this.title, this.listMeal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 12, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () => _viewAllArticle(context, listMeal),
                  child: listMeal != null
                      ? Badge(
                          padding: EdgeInsets.all(2.5),
                          badgeColor: AppColors.primary,
                          elevation: 0,
                          position: BadgePosition(top: -4, end: -6),
                          child: Text(
                            "Hiện tất cả",
                            style: TextStyle(
                                fontSize: 10, color: AppColors.grayText),
                          ),
                        )
                      : Text(""),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

// chuyen qua trang viewAll
  void _viewAllArticle(BuildContext ctx, listMeal) {
    Navigator.of(ctx).pushNamed(AppRoutes.viewAll, arguments: {
      'list_meal': listMeal,
    });
  }
}
