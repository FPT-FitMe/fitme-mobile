import 'package:flutter/material.dart';

import 'package:fitme/models/exercise.dart';
import 'package:fitme/models/meal.dart';

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
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
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
                          exerciser.cal));
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
                          meal.cal));
                }),
            ],
          ),
        ],
      ),
    );
  }
}

// chuyen qua trang detail cua exercise/meal
void _selectArticle(BuildContext ctx, int id) {
  // Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: id);
}

Widget _cardArticle(BuildContext context, int id, String imageUrl,
    bool isFavorite, bool isPremium, String name, int duration, int cal) {
  return InkWell(
    onTap: () => _selectArticle(context, id),
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
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.topLeft,
            child: Text(
              name,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.topLeft,
            child: Text(
              '${duration} phút - ${cal} cal',
              style: TextStyle(
                fontSize: 8,
                color: Colors.black38,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
