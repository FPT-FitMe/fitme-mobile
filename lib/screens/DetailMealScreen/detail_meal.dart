import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/plan_meal.dart';
import 'package:fitme/models/tag.dart';
import 'package:fitme/screens/CoachScreen/coach.dart';
import 'package:fitme/screens/DetailMealScreen/detail_meal_presenter.dart';
import 'package:fitme/screens/DetailMealScreen/detail_meal_view.dart';
import 'package:fitme/screens/LoadingScreen/loading.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DetailMealScreen extends StatefulWidget {
  DetailMealScreen({Key? key}) : super(key: key);

  @override
  _DetailMealScreenState createState() => _DetailMealScreenState();
}

class _DetailMealScreenState extends State<DetailMealScreen>
    implements DetailMealView {
  late DetailMealPresenter _presenter;
  bool _isLoading = true;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  var isSelected = [false, false];
  late bool isFavorite;
  late final map;
  late Meal? _meal;
  late int? _mealID;
  PlanMeal? _planMeal;
  bool _isFavorite = false;
  DateTime? dateTimeMeal;
  _DetailMealScreenState() {
    _presenter = new DetailMealPresenter(this);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    map = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _mealID = map["mealID"] as int;
    if (map["planMeal"] != null) _planMeal = map["planMeal"] as PlanMeal;
    if (map["dateTimeMeal"] != null)
      dateTimeMeal = map["dateTimeMeal"] as DateTime;
    _presenter.loadMealByID(_mealID!);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // PlanMeal? planMeal;
    // final routeArgs =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // if (routeArgs['planMeal'] != null)
    //   planMeal = routeArgs['planMeal'] as PlanMeal;
    bool isShow = true;
    if (dateTimeMeal != null) {
      if (dateTimeMeal!.day < DateTime.now().day) {
        isShow = false;
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Quay lại",
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              _isFavorite
                  ? GestureDetector(
                      onTap: () => _unFavorite(),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.primary,
                      ),
                    )
                  : GestureDetector(
                      onTap: () => _addToFavorite(),
                      child: Icon(Icons.favorite_outline))
            ],
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
                      _meal!.imageUrl,
                      fit: BoxFit.cover,
                      width: 600,
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                      child: titleSection(title: _meal!.name),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: GestureDetector(
                        child: authorSection(_meal!),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CoachScreen(
                                  coach: _meal!.coachProfile,
                                ),
                              ));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: tagSection(_meal!.tags),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: timeSection(_meal!.cookingTime.toString(),
                          _meal!.calories.toString()),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                    //   child: ingredientSection(meal.ingredients),
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: textSection(_meal!),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: (_planMeal != null && isShow)
          ? Padding(
              padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
              child: Container(
                alignment: Alignment.topCenter,
                height: 40,
                padding: EdgeInsets.all(3.5),
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: ToggleButtons(
                  children: <Widget>[
                    Text(
                      "Bỏ qua",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "Hoàn tất",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                  onPressed: (int index) {
                    if (index == 0) {
                      _skippedMeal(_planMeal);
                    } else {
                      _logMeal(_planMeal);
                    }
                    setState(() {
                      for (int buttonIndex = 0;
                          buttonIndex < isSelected.length;
                          buttonIndex++) {
                        if (buttonIndex == index) {
                          isSelected[buttonIndex] = true;
                        } else {
                          isSelected[buttonIndex] = false;
                        }
                      }
                    });
                  },
                  color: AppColors.primary,
                  selectedColor: Colors.white,
                  fillColor: AppColors.primary,
                  isSelected: isSelected,
                  borderColor: AppColors.primary,
                  selectedBorderColor: AppColors.primary,
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  constraints: BoxConstraints.tightFor(
                    width: 100,
                    height: 30,
                  ),
                ),
              ),
            )
          : SizedBox(
              height: 10,
            ),
    );
  }

  void _unFavorite() {
    setState(() {
      this._isFavorite = false;
    });
    _presenter.unFavorite(_meal!);
  }

  void _addToFavorite() {
    setState(() {
      this._isFavorite = true;
    });
    _presenter.addFavorite(_meal!);
  }

  @override
  void addFavoriteFailed(String message) {}

  @override
  void addFavoriteSuccess() {
    Fluttertoast.showToast(msg: "Đã thêm vào list yêu thích");
  }

  @override
  void loadMealDetail(Meal meal, bool isFavorite) {
    setState(() {
      _isLoading = false;
      this._meal = meal;
      this._isFavorite = isFavorite;
      if (_planMeal != null) {
        _presenter.loadPlanMeal(_planMeal!);
      }
    });
  }

  @override
  void logMealFailed() {
    Fluttertoast.showToast(msg: "Log Meal thất bại");
  }

  @override
  void logMealSuccess() {
    Fluttertoast.showToast(msg: "Log Meal thành công");
  }

  @override
  Future<void> refresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _presenter.loadMealByID(_mealID!);
    _refreshController.refreshCompleted();
  }

  @override
  void showEmpty() {
    setState(() {
      _isLoading = false;
    });
    _refreshController.refreshCompleted();
  }

  @override
  void showFailedModal(String message) {
    setState(() {
      _isLoading = false;
    });
    Alert(
      context: context,
      type: AlertType.error,
      title: message,
      buttons: [],
    ).show();
  }

  @override
  void unFavoriteFailed(String message) {}

  @override
  void unFavoriteSuccess() {
    Fluttertoast.showToast(msg: "Đã xóa khỏi list yêu thích");
  }

  void _logMeal(PlanMeal? planMeal) {
    _presenter.logMeal(planMeal!);
  }

  void _skippedMeal(PlanMeal? planMeal) {
    _presenter.setStatusUpdatePlanSkipped(planMeal!);
  }

  @override
  void skipMealFailed() {
    Fluttertoast.showToast(msg: "Bỏ qua bữa ăn lỗi");
  }

  @override
  void skipMealSuccess() {
    Fluttertoast.showToast(msg: "Đã bỏ qua bữa ăn");
  }

  @override
  void loadPlanMeal(PlanMeal planMeal) {
    setState(() {
      this._planMeal = planMeal;
      if (_planMeal!.status != null) {
        _planMeal!.status == "done"
            ? this.isSelected = [false, true]
            : this.isSelected = [true, false];
      } else {
        this.isSelected = [false, false];
      }
    });
  }
}

Widget authorSection(Meal meal) => Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(meal.coachProfile!.imageUrl),
            radius: 22,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Công thức viết bởi"),
              SizedBox(
                height: 5,
              ),
              Text("${meal.coachProfile!.name}",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );

Widget titleSection({title: String}) => Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        softWrap: true,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );

Widget _createCustomChip({title: String}) => Chip(
      label: Text(title),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.grayText, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
    );

Widget tagSection(List<Tag> tags) => Builder(builder: (BuildContext context) {
      return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: tags
              .map((item) => Row(
                    children: [
                      _createCustomChip(title: item.name),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ))
              .toList());
    });

Widget timeSection(String duration, String cal) => Container(
      child: Row(
        children: [
          Icon(
            CommunityMaterialIcons.clock_time_four_outline,
            color: AppColors.textColor,
            size: 30,
          ),
          SizedBox(width: 5),
          Text(
            duration + ' phút',
            softWrap: true,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(width: 10),
          Icon(
            CommunityMaterialIcons.bread_slice_outline,
            color: AppColors.textColor,
            size: 30,
          ),
          SizedBox(width: 5),
          Text(
            cal + ' cals',
            softWrap: true,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );

Widget textSection(Meal meal) => Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cách làm",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            meal.description,
            softWrap: true,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
