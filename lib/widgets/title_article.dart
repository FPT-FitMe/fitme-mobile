import 'dart:ui';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/plan_meal.dart';
import 'package:fitme/models/plan_workout.dart';
import 'package:fitme/models/post.dart';
import 'package:fitme/models/tag.dart';
import 'package:fitme/screens/BottomBarScreen/bottom_drawer_menu.dart';
import 'package:flutter/material.dart';

import 'package:fitme/constants/colors.dart';

class TitleArticle extends StatelessWidget {
  final List<PlanWorkout>? listPlanWorkout;
  final List<PlanMeal>? listPlanMeal;
  final List<Post>? listPost;
  final String title;

  const TitleArticle(
      {required this.title,
      this.listPlanWorkout,
      this.listPlanMeal,
      this.listPost});

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
                (listPlanWorkout != null && listPlanWorkout!.length > 1)
                    ? InkWell(
                        onTap: () => _viewAllArticle(context, listPlanMeal,
                            listPlanWorkout, listPost, title),
                        child: Text(
                          "Hiện tất cả",
                          style: TextStyle(
                              fontSize: 10, color: AppColors.grayText),
                        ),
                      )
                    : Text(""),
              ],
            ),
          ),
          if (listPlanMeal != null)
            SizedBox(
                height: 320,
                child: GridView.count(
                  physics: new NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: true,
                  padding: const EdgeInsets.fromLTRB(6, 5, 0, 5),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 0,
                  crossAxisCount: 2,
                  childAspectRatio: 10 / 8.5,
                  children: <Widget>[
                    _cardArticleMeal(context, listPlanMeal!.elementAt(0)),
                    _cardArticleMeal(context, listPlanMeal!.elementAt(1)),
                    _cardArticleMeal(context, listPlanMeal!.elementAt(2)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () => showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return BottomDrawer(
                                  tabIndex: 1,
                                  isToday: true,
                                );
                              }),
                          child: Icon(
                              CommunityMaterialIcons.plus_circle_outline,
                              size: 50),
                        ),
                        SizedBox(height: 10),
                        Text("Thêm bữa ăn"),
                      ],
                    )
                  ],
                )),
          Row(
            children: [
              if (listPlanWorkout != null)
                ...listPlanWorkout!.map((planWorkout) {
                  return Flexible(
                      fit: FlexFit.tight,
                      child: _cardArticle(
                        context,
                        planWorkout.workout.workoutID,
                        planWorkout.workout.imageUrl,
                        planWorkout.workout.isPremium,
                        planWorkout.workout.name,
                        planWorkout.workout.estimatedDuration,
                        planWorkout.workout.estimatedCalories,
                        true,
                        false,
                        planWorkout.status,
                      ));
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
                        post.name,
                        post.duration,
                        null,
                        false,
                        false,
                        null,
                      ));
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
        'listMeal': listPlanMeal,
      });
    } else if (isPost) {
      //
      Navigator.pushNamed(ctx, AppRoutes.postScreen);
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

// chuyen qua trang viewAll
  void _viewAllArticle(
      BuildContext ctx, listMeal, listExcercise, listPost, String topic) {
    Navigator.of(ctx).pushNamed(AppRoutes.viewAll, arguments: {
      'list_meal': listMeal,
      'list_exercise': listExcercise,
      'list_post': listPost,
      'topic': topic,
    });
  }

  Widget _cardArticleMeal(
    BuildContext context,
    PlanMeal planMeal,
  ) {
    //checkfavorite
    bool isSkipped = planMeal.status == "skipped";
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, AppRoutes.detailMeal, arguments: {
        'id': planMeal.meal.mealID,
        // 'listMeal': listMeal,
      }),
      child: SizedBox(
        child: Container(
          foregroundDecoration: isSkipped
              ? BoxDecoration(
                  color: Colors.grey,
                  backgroundBlendMode: BlendMode.saturation,
                )
              : BoxDecoration(),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            elevation: 0,
            margin: EdgeInsets.all(5),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Image.network(
                        planMeal.meal.imageUrl,
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    //TODO: check favorite
                    if (true)
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
                    if (planMeal.meal.isPremium)
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
                    Positioned(
                      top: 68,
                      child: Container(
                        width: 85,
                        height: 30,
                        child: planMeal.meal.tags.contains(
                                Tag(id: 4, name: "Bữa sáng", type: "meal"))
                            ? Card(
                                color: Color(0xFFFFDC5D),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text("Sáng"),
                                ),
                              )
                            : planMeal.meal.tags.contains(
                                    Tag(id: 5, name: "Bữa trưa", type: "meal"))
                                ? Card(
                                    color: Color(0xFFFFAC33),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text("Trưa"),
                                    ),
                                  )
                                : Card(
                                    color: Color(0xFF0E4DA4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              planMeal.meal.name,
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              convertDurationAndCalories(planMeal.meal.calories,
                                  planMeal.meal.cookingTime),
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black38,
                              ),
                            ),
                          ]),
                      planMeal.status == "done"
                          ? Icon(
                              Icons.check_circle,
                              color: AppColors.green500,
                              size: 17,
                            )
                          : Text(""),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardArticle(
    BuildContext context,
    int id,
    String imageUrl,
    bool isPremium,
    String name,
    int duration,
    int? cal,
    bool isWorkout,
    bool isPost,
    String? status,
  ) {
    bool isFavorite = false;
    bool isSkipped = status == "skipped";
    return GestureDetector(
      onTap: () => _selectArticle(context, id, isWorkout, false, isPost),
      child: Container(
        foregroundDecoration: isSkipped
            ? BoxDecoration(
                color: Colors.grey,
                backgroundBlendMode: BlendMode.saturation,
              )
            : BoxDecoration(),
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
                  // if (isFavorite)
                  //   Positioned(
                  //     bottom: 70,
                  //     right: 10,
                  //     child: Container(
                  //       child: Icon(
                  //         Icons.favorite,
                  //         color: Colors.white,
                  //         size: 17,
                  //       ),
                  //     ),
                  //   ),
                  //neu la meal se co tag "sang/trua/toi"
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
                        ? convertDurationAndCalories(cal, duration)
                        : convertDuration(duration),
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black38,
                    ),
                  ),
                ]),
                status == "done"
                    ? Icon(
                        Icons.check_circle,
                        color: AppColors.green500,
                        size: 17,
                      )
                    : Text("")
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

String convertDurationAndCalories(dynamic cal, int duration) {
  var d = Duration(minutes: duration);
  List<String> parts = d.toString().split(':');
  int calories = cal.toInt();
  return '${parts[0].padLeft(2, '0')} giờ ${parts[1].padLeft(2, '0')} phút - $calories cals';
}

String convertDuration(int duration) {
  var d = Duration(minutes: duration);
  List<String> parts = d.toString().split(':');
  return '${parts[0].padLeft(2, '0')} giờ ${parts[1].padLeft(2, '0')} phút';
}
