import 'package:fitme/constants/colors.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/screens/FavoriteScreen/favorite_presenter.dart';
import 'package:fitme/screens/FavoriteScreen/favorite_view.dart';
import 'package:fitme/screens/LoadingScreen/loading.dart';
import 'package:fitme/widgets/card_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    implements FavoriteView {
  late FavoritePresenter _presenter;
  bool _isLoading = true;
  int segmentedControlValue = 0;
  List<Meal> listMeals = [];
  List<Workout> listWorkouts = [];

  _FavoriteScreenState() {
    _presenter = new FavoritePresenter(this);
    _presenter.loadFavouriteMeals();
    _presenter.loadFavouriteWorkouts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Yêu thích"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          segmentedControl(),
          SizedBox(
            height: 15,
          ),
          _isLoading == true
              ? LoadingScreen()
              : Column(children: showSelectedScreen()),
        ],
      ),
    );
  }

  List<Widget> showSelectedScreen() {
    if (segmentedControlValue == 1) {
      return listMeals.isNotEmpty
          ? listMeals //dang le chi can truyen id la duoc roi
              .map(
                (meal) => CardTitle(
                  title: meal.name,
                  imageUrl: meal.imageUrl,
                  duration: meal.cookingTime,
                  cal: double.parse("${meal.calories}"),
                  id: int.parse(meal.mealID.toString()),
                  isWorkout: false,
                  isShowStatus: false,
                ),
              )
              .toList()
          : _buildNotFoundScreen();
    } else {
      return listWorkouts.isNotEmpty
          ? listWorkouts
              .map(
                (workout) => CardTitle(
                  title: workout.name,
                  imageUrl: workout.imageUrl,
                  duration: int.parse(workout.estimatedDuration.toString()),
                  cal: double.parse("${workout.estimatedCalories}"),
                  id: int.parse(workout.workoutID.toString()),
                  isWorkout: true,
                  isShowStatus: false,
                ),
              )
              .toList()
          : _buildNotFoundScreen();
    }
  }

  Widget segmentedControl() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl(
          groupValue: segmentedControlValue,
          backgroundColor: Colors.grey.shade100,
          children: <int, Widget>{
            0: Text(
              'Bài tập',
              style: TextStyle(
                  color: segmentedControlValue == 0
                      ? AppColors.primary
                      : Colors.grey[400]),
            ),
            1: Text(
              'Bữa ăn',
              style: TextStyle(
                  color: segmentedControlValue == 1
                      ? AppColors.primary
                      : Colors.grey[400]),
            ),
          },
          onValueChanged: (value) {
            setState(() {
              segmentedControlValue = value as int;
            });
          }),
    );
  }

  List<Widget> _buildNotFoundScreen() {
    return [
      SizedBox(height: 50),
      SvgPicture.asset(
        "assets/images/no_data.svg",
        fit: BoxFit.cover,
        height: 250,
      ),
      SizedBox(
        height: 30,
      ),
      Text(
        "Không tìm thấy thông tin",
        style: TextStyle(
          fontSize: 18,
        ),
      )
    ];
  }

  @override
  void loadFavouriteMeals(List<Meal> listMeals) {
    setState(() {
      this.listMeals = listMeals;
      _isLoading = false;
    });
  }

  @override
  void loadFavouriteWorkouts(List<Workout> listWorkouts) {
    setState(() {
      this.listWorkouts = listWorkouts;
      _isLoading = false;
    });
  }
}
