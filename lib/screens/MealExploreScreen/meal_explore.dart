import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/screens/MealExploreScreen/meal_explore_presenter.dart';
import 'package:fitme/screens/MealExploreScreen/meal_explore_view.dart';
import 'package:fitme/widgets/title_article_badge.dart';
import 'package:fitme/widgets/title_article_meal.dart';
import 'package:flutter/material.dart';

class MealExploreScreen extends StatefulWidget {
  MealExploreScreen({Key? key}) : super(key: key);

  @override
  _MealExploreScreenState createState() => _MealExploreScreenState();
}

class _MealExploreScreenState extends State<MealExploreScreen>
    implements MealExploreView {
  late MealPresenter _presenter;
  bool _isLoading = true;
  List<Meal> listMeal = [];
  List<Meal> listRecommended = [];

  _MealExploreScreenState() {
    _presenter = new MealPresenter(this);
    _presenter.loadAllMeals();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _carouselPage(listMeal),
                Column(
                  children: [
                    TitleArticleBadge(
                      title: "Bạn muốn ăn ?",
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: tagSection(),
                    ),
                    TitleArticleMeal(
                      title: "Gợi ý dành cho bạn",
                      listMeal: listRecommended,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void loadAllMeals(List<Meal> listMeal) {
    setState(() {
      _isLoading = false;
      this.listMeal = listMeal;
      listRecommended = [listMeal[1], listMeal[2]];
    });
  }

  @override
  void showEmptyList() {
    // TODO: implement showEmptyList
  }
}

Widget _carouselPage(List<Meal> listMeal) => CarouselSlider(
      options: CarouselOptions(
        height: 250,
        autoPlay: true,
        aspectRatio: 1,
      ),
      items: listMeal.map((item) {
        return Builder(builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.detailMeal,
                          arguments: {
                            'id': item.mealID,
                            'listMeal': listMeal,
                          });
                    },
                    child: Image.network(item.imageUrl,
                        fit: BoxFit.cover, width: 1000),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    '${item.cookingTime} phút - ${item.calories} cals',
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      }).toList(),
    );

Widget _createCustomChip({title: String}) => Chip(
      label: Text(title),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.grayText, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
    );

Widget tagSection() => Row(
      children: [
        _createCustomChip(title: "Sáng"),
        SizedBox(
          width: 10,
        ),
        _createCustomChip(title: 'Trưa'),
        SizedBox(
          width: 10,
        ),
        _createCustomChip(title: 'Tối'),
        SizedBox(
          width: 10,
        ),
        _createCustomChip(title: 'Vặt'),
        SizedBox(
          width: 10,
        ),
      ],
    );
