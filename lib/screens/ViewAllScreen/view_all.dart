import 'package:fitme/models/meal_old.dart';
import 'package:fitme/models/workout.dart';

import 'package:fitme/widgets/card_title.dart';
import 'package:fitme/models/post.dart';

import 'package:flutter/material.dart';

class ViewAllScreen extends StatelessWidget {
  ViewAllScreen({Key? key}) : super(key: key);

  //code xau vcl, chỉnh lại sau, check null 1 đống
  @override
  Widget build(BuildContext context) {
    List<Meal>? listMeal;
    List<Workout>? listWorkout;
    List<Post>? listPost;
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    if (routeArgs['list_meal'] != null)
      listMeal = routeArgs['list_meal'] as List<Meal>;
    if (routeArgs['listWorkout'] != null)
      listWorkout = routeArgs['listWorkout'] as List<Workout>;
    if (routeArgs['list_post'] != null)
      listPost = routeArgs['list_post'] as List<Post>;
    String topic = routeArgs['topic'].toString();
    if (topic.contains("ăn")) {
      topic = "đồ ăn";
    } else if (topic.contains("Bài tập") || topic.contains("Mục tiêu")) {
      topic = "bài tập";
    } else if (topic.contains("Bài viết")) {
      topic = "bài viết";
    } else
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
      body: (listMeal == null && listWorkout == null && listPost == null)
          ? Center(
              child: Text("Trống"),
            )
          : SingleChildScrollView(
              child: Column(
                children: (listMeal != null)
                    ? listMeal //dang le chi can truyen id la duoc roi
                        .map((meal) => CardTitle(
                              title: meal.name,
                              imageUrl: meal.imageUrl,
                              duration: meal.duration,
                              cal: double.parse(meal.cal.toString()),
                              id: meal.id,
                              isWorkout: false,
                              tag: meal.tag,
                              listMeal: listMeal,
                            ))
                        .toList()
                    : (listWorkout != null)
                        ? listWorkout
                            .map((workout) => CardTitle(
                                  title: workout.name,
                                  imageUrl: workout.imageUrl,
                                  duration: int.parse(
                                      workout.estimatedDuration.toString()),
                                  cal: double.parse(
                                      workout.estimatedCalories.toString()),
                                  id: int.parse(workout.workoutID.toString()),
                                  isWorkout: true,
                                ))
                            .toList()
                        : listPost!
                            .map((post) => CardTitle(
                                  title: post.name,
                                  imageUrl: post.imageUrl,
                                  duration: post.duration,
                                  id: post.id,
                                  isWorkout: false,
                                ))
                            .toList(),
              ),
            ),
    );
  }
}
