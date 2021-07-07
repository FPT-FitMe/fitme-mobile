import 'package:fitme/constants/routes.dart';
import 'package:flutter/material.dart';

import 'package:fitme/models/meal.dart';

import 'package:fitme/constants/colors.dart';

class TitleArticleMeal extends StatelessWidget {
  final List<Meal>? listMeal;
  final String title;

  const TitleArticleMeal({required this.title, this.listMeal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () => _viewAllArticle(context),
                  child: Text(
                    "Hiện tất cả",
                    style: TextStyle(fontSize: 10, color: AppColors.grayText),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              if (listMeal != null)
                ...listMeal!.map((meal) {
                  return Flexible(
                      fit: FlexFit.tight,
                      child: _cardArticle(
                          context,
                          meal.id,
                          meal.imageUrl,
                          meal.isFavorite,
                          meal.isPremium,
                          meal.name,
                          meal.duration,
                          meal.cal,
                          meal.tag));
                }),
            ],
          ),
        ],
      ),
    );
  }

  // chuyen qua trang detail cua meal
  void _selectArticle(BuildContext ctx, int id) {
    Navigator.pushNamed(ctx, AppRoutes.detailMeal, arguments: {
      'id': id,
      'listMeal': listMeal,
    });
  }

// chuyen qua trang viewAll
  void _viewAllArticle(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(AppRoutes.viewAll, arguments: {
      'list_meal': listMeal,
    });
  }

  Widget _cardArticle(
      BuildContext context,
      int id,
      String imageUrl,
      bool isFavorite,
      bool isPremium,
      String name,
      int duration,
      int? cal,
      List<String>? tag) {
    return GestureDetector(
      onTap: () => _selectArticle(context, id),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 0,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image.network(
                    imageUrl,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 68,
                  child: Container(
                    width: 85,
                    height: 30,
                    child: tag!.contains("Sáng")
                        ? Card(
                            color: Color(0xFFFFDC5D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                              child: Text("Sáng"),
                            ),
                          )
                        : tag.contains("Trưa")
                            ? Card(
                                color: Color(0xFFFFAC33),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Center(
                                  child: Text("Trưa"),
                                ),
                              )
                            : Card(
                                color: Color(0xFF0E4DA4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Center(
                                  child: Text(
                                    "Tối",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                Text(
                  cal != null
                      ? '$duration phút - $cal kcals'
                      : '$duration phút',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black38,
                  ),
                ),
              ]),
            ]),
          ],
        ),
      ),
    );
  }
}