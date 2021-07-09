import 'package:fitme/models/exercise_old.dart';
import 'package:fitme/models/meal_old.dart';
import 'package:fitme/widgets/card_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../fake_data.dart';

class Search extends SearchDelegate {
  final bool isEx;
  final bool isMeal;
  //result

  Search(this.isEx, this.isMeal);

  @override
  String? get searchFieldLabel => "Bạn đang tìm kiếm gì?";

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context).copyWith(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Exercise> exercistList = [];
    List<Meal> mealList = [];
    //cai nay dang le lam trong api
    isEx
        ? exercistList.addAll(
            LIST_EXERCISE.where((element) => element.name.contains(query)))
        : mealList
            .addAll(LIST_MEAL.where((element) => element.name.contains(query)));
    return isEx //neu nhu la ex thi list ex
        ? (exercistList.isEmpty
            ? _buildNotFoundScreen()
            : ListView(
                children: exercistList
                    .map((exercise) => CardTitle(
                        title: exercise.name,
                        imageUrl: exercise.imageUrl,
                        duration: exercise.duration,
                        cal: exercise.cal,
                        id: exercise.id,
                        isExercise: true))
                    .toList(),
              ))
        : (mealList.isEmpty
            ? _buildNotFoundScreen()
            : ListView(
                children: mealList
                    .map((meal) => CardTitle(
                          title: meal.name,
                          imageUrl: meal.imageUrl,
                          duration: meal.duration,
                          cal: meal.cal,
                          id: meal.id,
                          isExercise: false,
                        ))
                    .toList(),
              ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: [],
    );
  }

  _buildNotFoundScreen() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
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
        ],
      ),
    );
  }
}
