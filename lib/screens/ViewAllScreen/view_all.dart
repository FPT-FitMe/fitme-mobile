import 'package:fitme/models/exercise.dart';
import 'package:fitme/models/meal.dart';

import 'package:fitme/constants/colors.dart';
import 'package:fitme/widgets/card_title.dart';

import 'package:flutter/material.dart';

class ViewAllScreen extends StatelessWidget {
  late List<Meal>? listMeal;
  late List<Exercise>? listExercise;

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
          "Tất cả $topic",
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
                    ? listMeal! //dang le chi can truyen id la duoc roi
                        .map((meal) => CardTitle(
                              title: meal.name,
                              imageUrl: meal.imageUrl,
                              duration: meal.duration,
                              cal: meal.cal,
                              id: meal.id,
                              isExercise: false,
                            ))
                        .toList()
                    : listExercise!
                        .map((exercise) => CardTitle(
                              title: exercise.name,
                              imageUrl: exercise.imageUrl,
                              duration: exercise.duration,
                              cal: exercise.cal,
                              id: exercise.id,
                              isExercise: true,
                            ))
                        .toList(),
              ),
            ),
    );
  }
}
