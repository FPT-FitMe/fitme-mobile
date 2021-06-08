import 'package:fitme/models/exercise.dart';
import 'package:fitme/models/meal.dart';

import 'package:fitme/constants/colors.dart';

import 'package:flutter/material.dart';

class ViewAllScreen extends StatelessWidget {
  late List<Meal>? listMeal = null;
  late List<Exercise>? listExercise = null;

  ViewAllScreen({Key? key}) : super(key: key);

  //code xau vcl, chỉnh lại sau, check null 1 đống
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    if (routeArgs['list_meal'] != null)
      listMeal = routeArgs['list_meal'] as List<Meal>;
    if (routeArgs['list_exercise'] != null)
      listExercise = routeArgs['list_exercise'] as List<Exercise>;
    String topic = routeArgs['topic'].toString();
    if (topic.contains("ăn")) {
      topic = "đồ ăn";
    } else if (topic.contains("Bài tập") || topic.contains("Mục tiêu"))
      topic = "bài tập";
    else
      topic = "chủ đề đã hoàn thành";
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Tất cả ${topic}",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: (listMeal == null && listExercise == null)
          ? Center(
              child: Text("Trống"),
            )
          : SingleChildScrollView(
              child: Column(
                children: (listMeal != null)
                    ? listMeal!
                        .map((meal) => _cardTitle(meal.name, meal.imageUrl,
                            meal.duration, meal.cal, context, meal.id))
                        .toList()
                    : listExercise!
                        .map((exercise) => _cardTitle(
                            exercise.name,
                            exercise.imageUrl,
                            exercise.duration,
                            exercise.cal,
                            context,
                            exercise.id))
                        .toList(),
              ),
            ),
    );
  }

  Widget _cardTitle(String title, String imageUrl, int duration, int cal,
      BuildContext context, int id) {
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
          '${duration} phút - ${cal} kcals',
        ),
      ),
    );
  }

  void _selectArticle(BuildContext ctx, int id) {}
}
