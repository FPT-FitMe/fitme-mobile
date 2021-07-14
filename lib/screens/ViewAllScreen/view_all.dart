import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/coach.dart';
import 'package:fitme/models/post.dart';
import 'package:fitme/models/tag.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/screens/CoachScreen/coach.dart';
import 'package:fitme/screens/ViewAllScreen/view_all_presenter.dart';
import 'package:fitme/screens/ViewAllScreen/view_all_view.dart';

import 'package:fitme/widgets/card_title.dart';

import 'package:flutter/material.dart';

class ViewAllScreen extends StatelessWidget implements ViewAllView {
  // ViewAllScreen({Key? key}) : super(key: key);
  late BuildContext _context;
  late ViewAllPresenter _presenter;
  List<Meal> listMeal = [];
  List<Workout> listWorkout = [];
  List<Post> listPost = [];
  List<Coach> listCoach = [];
  List<Tag> listTag = [];

  ViewAllScreen() {
    _presenter = new ViewAllPresenter(this);
  }

  //code xau vcl, chỉnh lại sau, check null 1 đống
  @override
  Widget build(BuildContext context) {
    this._context = context;
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    if (routeArgs['list_meal'] != null)
      listMeal = routeArgs['list_meal'] as List<Meal>;
    if (routeArgs['listWorkout'] != null)
      listWorkout = routeArgs['listWorkout'] as List<Workout>;
    if (routeArgs['list_post'] != null)
      listPost = routeArgs['list_post'] as List<Post>;
    if (routeArgs['list_coach'] != null)
      listCoach = routeArgs['list_coach'] as List<Coach>;
    if (routeArgs['list_tag'] != null)
      listTag = routeArgs['list_tag'] as List<Tag>;
    String topic = routeArgs['topic'].toString();
    if (topic.contains("tag")) {
      topic = topic;
    } else if (topic.contains("ăn")) {
      topic = "đồ ăn";
    } else if (topic.contains("Bài tập") || topic.contains("Mục tiêu")) {
      topic = "bài tập";
    } else if (topic.contains("Bài viết")) {
      topic = "bài viết";
    } else if (topic.contains("Huấn luyện viên")) {
      topic = "huấn luyện viên";
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
      body: (listMeal.isEmpty &&
              listWorkout.isEmpty &&
              listPost.isEmpty &&
              listCoach.isEmpty &&
              listTag.isEmpty)
          ? Center(
              child: Text("Trống"),
            )
          : SingleChildScrollView(
              child: Column(
                children: (listMeal.isNotEmpty)
                    ? listMeal //dang le chi can truyen id la duoc roi
                        .map((meal) => CardTitle(
                              title: meal.name,
                              imageUrl: meal.imageUrl,
                              duration: meal.cookingTime,
                              calories: meal.calories,
                              id: meal.mealID,
                              isWorkout: false,
                              listMeal: listMeal,
                            ))
                        .toList()
                    : (listWorkout.isNotEmpty)
                        ? listWorkout
                            .map((workout) => CardTitle(
                                  title: workout.name,
                                  imageUrl: workout.imageUrl,
                                  duration: int.parse(
                                      workout.estimatedDuration.toString()),
                                  calories: double.parse(
                                      workout.estimatedCalories.toString()),
                                  id: int.parse(workout.workoutID.toString()),
                                  isWorkout: true,
                                ))
                            .toList()
                        : (listPost.isNotEmpty)
                            ? listPost
                                .map((post) => CardTitle(
                                      title: post.name,
                                      imageUrl: post.imageUrl,
                                      duration: post.readingTime,
                                      id: int.parse(post.postID.toString()),
                                      isWorkout: false,
                                    ))
                                .toList()
                            : (listCoach.isNotEmpty)
                                ? listCoach
                                    .map((coach) => _cardCoach(context, coach))
                                    .toList()
                                : listTag
                                    .map((tag) => _cardTag(context, tag))
                                    .toList(),
              ),
            ),
    );
  }

  @override
  void loadMealsByTag(List<Meal> listMeal, Tag tag) {
    Navigator.of(_context).pushNamed(AppRoutes.viewAll, arguments: {
      'list_meal': listMeal,
      'topic': "đồ ăn tag " + tag.name,
    });
  }

  @override
  void loadWorkoutsByTag(List<Workout> listWorkout, Tag tag) {
    Navigator.of(_context).pushNamed(AppRoutes.viewAll, arguments: {
      'listWorkout': listWorkout,
      'topic': "bài tập tag " + tag.name,
    });
  }

  @override
  void showEmptyList(tag) {
    if (tag.type == "exercise") {
      List<Workout> list = [];
      Navigator.of(_context).pushNamed(AppRoutes.viewAll, arguments: {
        'listWorkout': list,
        'topic': "bài tập tag " + tag.name,
      });
    } else {
      List<Meal> list = [];
      Navigator.of(_context).pushNamed(AppRoutes.viewAll, arguments: {
        'list_meal': list,
        'topic': "đồ ăn tag " + tag.name,
      });
    }
  }

  Widget _cardTag(BuildContext context, Tag tag) {
    return InkWell(
      onTap: () => _selectTag(context, tag),
      child: ListTile(
        title: Text(
          tag.name,
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  _selectTag(BuildContext context, Tag tag) {
    if (tag.type == "exercise") {
      _presenter.loadWorkouts(tag);
    } else {
      _presenter.loadMeals(tag);
    }
  }
}

Widget _cardCoach(BuildContext context, Coach coach) {
  return InkWell(
    onTap: () => _selectCoach(context, coach),
    child: ListTile(
        // trailing: getTick(id),
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Image.network(
            coach.imageUrl,
            width: 45,
            height: 45,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          coach.name,
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 16,
          ),
        ),
        subtitle: Text(coach.contact)),
  );
}

_selectCoach(BuildContext context, Coach coach) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CoachScreen(
          coach: coach,
        ),
      ));
}
