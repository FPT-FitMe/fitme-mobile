import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/tag.dart';
import 'package:flutter/material.dart';

import 'package:fitme/models/meal.dart';

import 'package:fitme/constants/colors.dart';

class TitleArticleMeal extends StatelessWidget {
  final List<Meal> listMeal;
  final List<Meal> listFavoriteMeal;
  final String title;

  const TitleArticleMeal(
      {required this.title,
      required this.listMeal,
      required this.listFavoriteMeal});

  @override
  Widget build(BuildContext context) {
    int indexMaxListMeal = 0;
    if (listMeal.isNotEmpty) {
      indexMaxListMeal = listMeal.length;
      if (indexMaxListMeal > 2) {
        indexMaxListMeal = 2;
      }
    }
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
              ...listMeal.sublist(0, indexMaxListMeal).map((meal) {
                return Flexible(
                    fit: FlexFit.tight,
                    child: _cardArticle(
                        context,
                        meal.mealID,
                        meal.imageUrl,
                        meal.isPremium,
                        meal.name,
                        meal.cookingTime,
                        meal.calories,
                        meal.tags));
              }),
            ],
          ),
        ],
      ),
    );
  }

  // chuyen qua trang detail cua meal
  void _selectArticle(BuildContext ctx, int? id) {
    Navigator.pushNamed(ctx, AppRoutes.detailMeal, arguments: {
      'mealID': id,
      // 'listMeal': listMeal,
    });
  }

// chuyen qua trang viewAll
  void _viewAllArticle(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(AppRoutes.viewAll, arguments: {
      'list_meal': listMeal,
      'topic': "ăn",
    });
  }

  Widget _cardArticle(BuildContext context, int? id, String imageUrl,
      bool isPremium, String name, int duration, double? cal, List<Tag>? tags) {
    bool isFavorite = false;
    if (listFavoriteMeal.isNotEmpty) {
      var containt =
          listFavoriteMeal.where((element) => element.mealID == id).toList();
      if (containt.isNotEmpty) {
        isFavorite = true;
      }
    }
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
                if (isFavorite)
                  Positioned(
                    bottom: 70,
                    right: 10,
                    child: Container(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                  ),
                if (isPremium)
                  Positioned(
                    bottom: 70,
                    left: 10,
                    child: Container(
                      child: Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                  ),
                Positioned(
                  top: 68,
                  child: Container(
                    width: 85,
                    height: 30,
                    child: tags!.contains(
                            Tag(id: 4, name: "Bữa sáng", type: "meal"))
                        ? Card(
                            color: Color(0xFFFFDC5D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                              child: Text("Sáng"),
                            ),
                          )
                        : tags.contains(
                                Tag(id: 5, name: "Bữa trưa", type: "meal"))
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
                  cal != null ? '$duration phút - $cal cals' : '$duration phút',
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
