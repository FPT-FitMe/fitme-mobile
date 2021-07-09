import 'package:fitme/constants/colors.dart';
import 'package:fitme/fake_data.dart';
import 'package:fitme/models/exercise_old.dart';
import 'package:fitme/models/meal_old.dart';
import 'package:fitme/widgets/card_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  int segmentedControlValue = 0;

  @override
  Widget build(BuildContext context) {
    List<Meal> listMeal =
        LIST_MEAL.where((meal) => meal.isFavorite == true).toList();
    List<Exercise> listExercise =
        LIST_EXERCISE.where((exercise) => exercise.isFavorite == true).toList();
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
            height: 10,
          ),
          Column(
            children: (segmentedControlValue == 1)
                ? (listMeal.isNotEmpty)
                    ? listMeal //dang le chi can truyen id la duoc roi
                        .map((meal) => CardTitle(
                              title: meal.name,
                              imageUrl: meal.imageUrl,
                              duration: meal.duration,
                              cal: meal.cal,
                              id: meal.id,
                              isExercise: false,
                            ))
                        .toList()
                    : _buildNotFoundScreen()
                : (listExercise.isNotEmpty)
                    ? listExercise
                        .map((exercise) => CardTitle(
                              title: exercise.name,
                              imageUrl: exercise.imageUrl,
                              duration: exercise.duration,
                              cal: exercise.cal,
                              id: exercise.id,
                              isExercise: true,
                            ))
                        .toList()
                    : _buildNotFoundScreen(),
          ),
        ],
      ),
    );
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
}
