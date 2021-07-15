import 'package:fitme/models/coach.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/models/post.dart';
import 'package:fitme/screens/CoachScreen/coach_presenter.dart';
import 'package:fitme/screens/CoachScreen/coach_view.dart';
import 'package:fitme/screens/LoadingScreen/loading.dart';
import 'package:fitme/utils/user_utils.dart';
import 'package:fitme/widgets/title_article.dart';
import 'package:fitme/widgets/title_article_meal.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CoachScreen extends StatefulWidget {
  final Coach? coach;
  const CoachScreen({Key? key, this.coach}) : super(key: key);
  @override
  _CoachScreenState createState() => _CoachScreenState();
}

class _CoachScreenState extends State<CoachScreen> implements CoachExploreView {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  bool _isLoading = true;
  late CoachPresenter _coachPresenter;
  List<Meal> listMeal = [];
  List<Workout> listWorkout = [];
  List<Post> listPost = [];
  List<Workout> listFavoriteWorkout = [];
  List<Meal> listFavoriteMeal = [];
  bool _isPremiumUser = false;
  late Coach? _coach;

  _CoachScreenState() {
    _coachPresenter = new CoachPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _coach = widget.coach;
    _coachPresenter.getMealsByCoach(_coach!.coachID);
    _coachPresenter.getPostsByCoach(_coach!.coachID);
    _coachPresenter.getWorkoutsByCoach(_coach!.coachID);
    _coachPresenter.loadFavouriteMeals();
    _coachPresenter.loadFavouriteWorkouts();
    checkIfUserIsPremium();
  }

  void checkIfUserIsPremium() async {
    bool isUserPremium = await UserUtils.checkIfUserIsPremium();
    if (isUserPremium)
      setState(() {
        _isPremiumUser = true;
      });
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
      body: _isLoading == true
          ? LoadingScreen()
          : SmartRefresher(
              controller: _refreshController,
              onRefresh: refresh,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      widget.coach!.imageUrl,
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
                            widget.coach!.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(widget.coach!.introduction),
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
                                listFavoriteWorkout: listFavoriteWorkout,
                                isPremiumUser: _isPremiumUser,
                              )
                            : Text(""),
                        listMeal.isNotEmpty
                            ? TitleArticleMeal(
                                title: "Bữa ăn",
                                listMeal: listMeal,
                                listFavoriteMeal: listFavoriteMeal,
                                isPremiumUser: _isPremiumUser,
                              )
                            : Text(""),
                        listPost.isNotEmpty
                            ? TitleArticle(
                                title: "Bài viết",
                                listPost: listPost,
                                isPremiumUser: _isPremiumUser,
                              )
                            : Text(""),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  void loadAllMealByCoach(List<Meal> listMeal) {
    setState(() {
      _isLoading = false;
      this.listMeal = listMeal;
    });
  }

  @override
  void loadAllPostByCoach(List<Post> listPost) {
    setState(() {
      _isLoading = false;
      this.listPost = listPost;
    });
  }

  @override
  void loadAllWorkoutByCoach(List<Workout> listWorkout) {
    setState(() {
      _isLoading = false;
      this.listWorkout = listWorkout;
    });
  }

  @override
  void showEmptyList() {
    setState(() {
      _isLoading = false;
    });
    _refreshController.refreshCompleted();
  }

  @override
  Future<void> refresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _coachPresenter.getMealsByCoach(_coach!.coachID);
    _coachPresenter.getPostsByCoach(_coach!.coachID);
    _coachPresenter.getWorkoutsByCoach(_coach!.coachID);
    _refreshController.refreshCompleted();
  }

  @override
  void loadFavouriteMeals(List<Meal> listMeals) {
    setState(() {
      _isLoading = false;
      this.listFavoriteMeal = listMeals;
    });
  }

  @override
  void loadFavouriteWorkouts(List<Workout> listWorkouts) {
    setState(() {
      _isLoading = false;
      this.listFavoriteWorkout = listWorkouts;
    });
  }
}
