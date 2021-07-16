import 'package:fitme/models/meal.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/widgets/card_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Search extends SearchDelegate {
  final bool isEx;
  final bool isMeal;
  final bool isPremiumUser;
  List<Workout> listWorkout = [];
  List<Meal> listMeal = [];
  //result

  Search({
    required this.isEx,
    required this.isMeal,
    required this.listMeal,
    required this.listWorkout,
    required this.isPremiumUser,
  });

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
    List<Workout> resultWorkout = [];
    List<Meal> resultMeal = [];
    isEx
        ? resultWorkout.addAll(
            listWorkout.where((element) => element.name.toLowerCase().contains(query.toLowerCase())))
        : resultMeal
            .addAll(listMeal.where((element) => element.name.toLowerCase().contains(query.toLowerCase())));
    return isEx //neu nhu la ex thi list ex
        ? (resultWorkout.isEmpty
            ? _buildNotFoundScreen()
            : ListView(
                children: resultWorkout
                    .map((workout) => CardTitle(
                          isPost: false,
                          title: workout.name,
                          imageUrl: workout.imageUrl,
                          duration: workout.estimatedDuration,
                          calories: double.parse(
                              workout.estimatedCalories.toString()),
                          id: int.parse(workout.workoutID.toString()),
                          isWorkout: true,
                          isPremiumContent: workout.isPremium,
                          isUserPremium: isPremiumUser,
                        ))
                    .toList(),
              ))
        : (resultMeal.isEmpty
            ? _buildNotFoundScreen()
            : ListView(
                children: resultMeal
                    .map((meal) => CardTitle(
                          title: meal.name,
                          imageUrl: meal.imageUrl,
                          duration: meal.cookingTime,
                          calories: meal.calories,
                          id: meal.mealID,
                          isWorkout: false,
                          isPost: false,
                          listMeal: listMeal,
                          isPremiumContent: meal.isPremium,
                          isUserPremium: isPremiumUser,
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
