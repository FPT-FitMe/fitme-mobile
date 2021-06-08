import 'package:fitme/constants/routes.dart';
import 'package:fitme/screens/ViewAllScreen/view_all.dart';
import 'package:flutter/material.dart';

import 'package:fitme/models/exercise.dart';
import 'package:fitme/models/meal.dart';

import 'package:fitme/constants/colors.dart';

class TitleArticle extends StatelessWidget {
  final List<Exercise>? listExercise;
  final List<Meal>? listMeal;
  final String title;
  final String name = "Yoga buổi sáng";
  final int cal = 15;
  final String imageUrl =
      "https://mk0mydrtest3eri40dsq.kinstacdn.com/wp-content/uploads/2019/02/AdobeStock_316584335-1-scaled-1210x700.jpg";
  final int duration = 10;
  final bool isFavorite = true;
  final bool isPremium = true;

  const TitleArticle({required this.title, this.listExercise, this.listMeal});

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
                  onTap: () =>
                      _viewAllArticle(context, listMeal, listExercise, title),
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
                          false));
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
                          true));
                }),
            ],
          ),
        ],
      ),
    );
  }

  // chuyen qua trang detail cua exercise/meal
  void _selectArticle(BuildContext ctx, int id, bool isWorkout, bool isMeal) {
    // Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: id);
    if (isWorkout) {
      Navigator.of(ctx).pushNamed(AppRoutes.practice, arguments: {
        'id': id,
      });
    }
  }

// chuyen qua trang viewAll
  void _viewAllArticle(
      BuildContext ctx, listMeal, listExcercise, String topic) {
    Navigator.of(ctx).pushNamed(AppRoutes.view_all, arguments: {
      'list_meal': listMeal,
      'list_exercise': listExcercise,
      'topic': topic,
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
      int cal,
      bool isWorkout,
      bool isMeal) {
    return GestureDetector(
      onTap: () => _selectArticle(context, id, isWorkout, isMeal),
      // focusColor: Colors.white,
      // hoverColor: Colors.white,
      // splashColor: Colors.white,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 0,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
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
                  )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.topLeft,
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.topLeft,
              child: Text(
                '${duration} phút - ${cal} kcals',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black38,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
