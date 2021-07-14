import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/tag.dart';
import 'package:fitme/screens/LoadingScreen/loading.dart';
import 'package:fitme/screens/MealExploreScreen/meal_explore_presenter.dart';
import 'package:fitme/screens/MealExploreScreen/meal_explore_view.dart';
import 'package:fitme/widgets/title_article_meal.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

const int MAX_TAG = 3;

class MealExploreScreen extends StatefulWidget {
  MealExploreScreen({Key? key}) : super(key: key);

  @override
  _MealExploreScreenState createState() => _MealExploreScreenState();
}

class _MealExploreScreenState extends State<MealExploreScreen>
    implements MealExploreView {
  late MealPresenter _presenter;
  bool _isLoading = true;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Meal> listMeal = [];
  List<Tag> listTags = [];

  _MealExploreScreenState() {
    _presenter = new MealPresenter(this);
    _presenter.loadAllMeals();
    _presenter.loadAllTags();
  }

  @override
  Widget build(BuildContext context) {
    int maxListTag = 0;
    if (listTags.isNotEmpty) {
      maxListTag = listTags.length;
      if (maxListTag > MAX_TAG) {
        maxListTag = MAX_TAG;
      }
    }
    return _isLoading == true
        ? LoadingScreen()
        : SmartRefresher(
            controller: _refreshController,
            onRefresh: refesh,
            child: SingleChildScrollView(
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
                            listTags.isEmpty
                                ? SizedBox(height: 10)
                                : Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Bạn muốn ăn",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          listTags.length > 4
                                              ? InkWell(
                                                  onTap: () => _viewAllTags(
                                                      context, listTags),
                                                  child: Text(
                                                    "Hiện tất cả",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color:
                                                            AppColors.grayText),
                                                  ),
                                                )
                                              : Text(""),
                                        ],
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ...listTags
                                                .sublist(0, maxListTag)
                                                .map((tag) {
                                              return Row(
                                                children: [
                                                  _createCustomChip(tag: tag),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              );
                                            }),
                                          ]),
                                    ],
                                  ),
                            TitleArticleMeal(
                              title: "Gợi ý dành cho bạn",
                              listMeal: listMeal,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  @override
  void loadAllMeals(List<Meal> listMeal) {
    setState(() {
      _isLoading = false;
      this.listMeal = listMeal;
    });
  }

  @override
  void showEmptyList() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void loadAllTag(List<Tag> listTag) {
    setState(() {
      _isLoading = false;
      this.listTags = listTag;
    });
  }

  @override
  void loadMealsByTag(List<Meal> listMeal, Tag tag) {
    Navigator.of(context).pushNamed(AppRoutes.viewAll, arguments: {
      'list_meal': listMeal,
      'topic': "đồ ăn tag " + tag.name,
    });
  }

  @override
  Future<void> refesh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _presenter.loadAllMeals();
    _presenter.loadAllTags();
    _refreshController.refreshCompleted();
  }

  @override
  void showEmptyListMealTag(Tag tag) {
    List<Meal> list = [];
    Navigator.of(context).pushNamed(AppRoutes.viewAll, arguments: {
      'list_meal': list,
      'topic': "đồ ăn tag " + tag.name,
    });
  }

  Widget _createCustomChip({tag: Tag}) => GestureDetector(
        onTap: () => _selectTag(tag),
        child: Chip(
          label: Text(tag.name),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.grayText, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

  _selectTag(tag) {
    _presenter.loadMealsByTag(tag);
  }

  _viewAllTags(BuildContext context, List<Tag> listTags) {
    Navigator.of(context).pushNamed(AppRoutes.viewAll, arguments: {
      'list_tag': listTags,
      'topic': "tag",
    });
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
                    onTap: () => Navigator.pushNamed(
                        context, AppRoutes.detailMeal,
                        arguments: {
                          'mealID': item.mealID,
                          // 'listMeal': listMeal,
                        }),
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
