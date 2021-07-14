import 'package:fitme/models/coach.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/models/post.dart';
import 'package:fitme/screens/CoachScreen/coach_presenter.dart';
import 'package:fitme/screens/CoachScreen/coach_view.dart';
import 'package:fitme/widgets/title_article.dart';
import 'package:fitme/widgets/title_article_meal.dart';
import 'package:flutter/material.dart';

class CoachScreen extends StatelessWidget implements CoachExploreView {
  final Coach? coach;
  // const CoachScreen({Key? key, this.coach}) : super(key: key);
  List<Meal> listMeal = [];
  List<Workout> listWorkout = [];
  List<Post> listPost = [];
  late CoachPresenter _coachPresenter;

  CoachScreen({this.coach}) {
    _coachPresenter = new CoachPresenter(this);
    _coachPresenter.getMealsByCoach(coach!.coachID);
    _coachPresenter.getPostsByCoach(coach!.coachID);
    _coachPresenter.getWorkoutsByCoach(coach!.coachID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quay lại",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              coach!.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coach!.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(coach!.introduction),
                ],
              ),
            ),
            //phan bai tap va bua an
            Column(
              children: [
                listWorkout.isNotEmpty
                    ? TitleArticle(
                        title: "Bài tập",
                        listWorkout: listWorkout,
                      )
                    : Text(""),
                listMeal.isNotEmpty
                    ? TitleArticleMeal(
                        title: "Bữa ăn",
                        listMeal: listMeal,
                      )
                    : Text(""),
                listPost.isNotEmpty
                    ? TitleArticle(
                        title: "Bài viết",
                        listPost: listPost,
                      )
                    : Text(""),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void loadAllMealByCoach(List<Meal> listMeal) {
    this.listMeal = listMeal;
  }

  @override
  void loadAllPostByCoach(List<Post> listPost) {
    this.listPost = listPost;
  }

  @override
  void loadAllWorkoutByCoach(List<Workout> listWorkout) {
    this.listWorkout = listWorkout;
  }

  @override
  void showEmptyList() {
    // TODO: implement showEmptyList
  }
}
