import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/post.dart';
import 'package:fitme/screens/BottomBarScreen/bottom_drawer_menu.dart';
import 'package:flutter/material.dart';

import 'package:fitme/models/exercise_old.dart';
import 'package:fitme/models/meal_old.dart';

class TitleArticleNoViewAll extends StatelessWidget {
  final List<Exercise>? listExercise;
  final List<Meal>? listMeal;
  final List<Post>? listPost;
  final String title;

  const TitleArticleNoViewAll(
      {required this.title, this.listExercise, this.listMeal, this.listPost});

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
              ],
            ),
          ),
          Row(
            children: [
              if (listExercise != null)
                ...listExercise!.map((exerciser) {
                  return Flexible(
                      fit: FlexFit.tight,
                      child: _cardArticle(
                          context,
                          exerciser.id,
                          exerciser.imageUrl,
                          exerciser.isFavorite,
                          exerciser.isPremium,
                          exerciser.name,
                          exerciser.duration,
                          exerciser.cal,
                          true,
                          false,
                          false,
                          null));
                }),
              if (listPost != null)
                ...listPost!.map((post) {
                  return Flexible(
                      fit: FlexFit.tight,
                      child: _cardArticle(
                          context,
                          post.id,
                          post.imageUrl,
                          false,
                          false,
                          post.name,
                          post.duration,
                          null,
                          false,
                          false,
                          true,
                          null));
                }),
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
                          false,
                          true,
                          false,
                          meal.tag));
                }),
            ],
          ),
        ],
      ),
    );
  }

  // chuyen qua trang detail cua exercise/meal
  void _selectArticle(
      BuildContext ctx, int id, bool isWorkout, bool isMeal, bool isPost) {
    // Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: id);
    if (isWorkout) {
      Navigator.of(ctx).pushNamed(AppRoutes.detailPractice, arguments: {
        'id': id,
      });
    } else if (isMeal) {
      // Them field isButton check xem phai nut chuc nang k roi goi method tao log
      //_onLogMealTapped(ctx);
      Navigator.pushNamed(ctx, AppRoutes.detailMeal, arguments: {
        'id': id,
      });
    } else if (isPost) {
      //
      Navigator.pushNamed(ctx, AppRoutes.postScreen, arguments: {
        'id': id,
      });
    }
  }

  void _onLogMealTapped(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return BottomDrawer(
            tabIndex: 1,
          );
        });
  }

  // XAI CAI NAY CHO ACTIVITY
  void _onLogActivityTapped(BuildContext ctx, int type) {
    showModalBottomSheet(
        context: ctx,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return BottomDrawer(
            activityType: type,
          );
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
      bool isWorkout,
      bool isMeal,
      bool isPost,
      List<String>? tag) {
    return GestureDetector(
      onTap: () => _selectArticle(context, id, isWorkout, isMeal, isPost),
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
                //neu la meal se co tag "sang/trua/toi"
                if (isMeal)
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
