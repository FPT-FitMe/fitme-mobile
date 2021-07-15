import 'package:fitme/constants/colors.dart';
import 'package:fitme/models/meal.dart';
import 'package:fitme/models/meal_log.dart';
import 'package:fitme/models/plan.dart';
import 'package:fitme/models/user.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/models/workout_log.dart';
import 'package:fitme/screens/BottomBarScreen/bottom_drawer_menu.dart';
import 'package:fitme/screens/ExploreScreen/explore_presenter.dart';
import 'package:fitme/screens/ExploreScreen/explore_view.dart';
import 'package:fitme/screens/LoadingScreen/loading.dart';
import 'package:fitme/widgets/title_article_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:fitme/widgets/title_article.dart';

final nowDate = DateTime.now();
final firstDay = DateTime(nowDate.year, nowDate.month - 3, nowDate.day);
final lastDay = DateTime(nowDate.year, nowDate.month + 3, nowDate.day);

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> implements ExploreView {
  final _daysOfWeek = ['Hai', 'Ba', 'Tư', 'Năm', 'Sáu', 'Bảy', 'CN'];
  final _textStyleForCalendar = const TextStyle(
    color: const Color.fromRGBO(38, 50, 56, 1),
    fontSize: 16.0,
  );
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  bool _showEmpty = false;
  bool _isLoading = true;
  late ExplorePresenter _presenter;
  Plan? _selectedPlan;
  List<WorkoutLog> listWorkoutLog = [];
  List<MealLog> listMeallog = [];
  List<Workout> listWorkout = [];
  List<Workout> listFavoriteWorkout = [];
  List<Meal> listFavoriteMeal = [];
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  int totalIn = 0;
  int totalOut = 0;
  String _userName = "";
  bool _isPremiumUser = false;

  _ExploreScreenState() {
    _presenter = new ExplorePresenter(this);
    _presenter.getListWorkoutComplete(_selectedDay);
    _presenter.getMealLog(_selectedDay);
    _presenter.getPlan(_selectedDay);
    _presenter.loadFavouriteMeals();
    _presenter.loadFavouriteWorkouts();
    _presenter.loadUserProfile();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _presenter.getPlan(selectedDay);
        _presenter.getListWorkoutComplete(_selectedDay);
        _presenter.getMealLog(_selectedDay);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading == true
        ? LoadingScreen()
        : SmartRefresher(
            controller: _refreshController,
            onRefresh: refesh,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                      child: Text(
                        "Chào " + _userName + ",",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TableCalendar(
                      rowHeight: 50,
                      daysOfWeekVisible: false,
                      firstDay: firstDay,
                      lastDay: lastDay,
                      focusedDay: _focusedDay,
                      selectedDayPredicate: (day) =>
                          isSameDay(_selectedDay, day),
                      calendarFormat: CalendarFormat.week,
                      headerVisible: false,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      calendarStyle: CalendarStyle(
                        todayTextStyle: _textStyleForCalendar,
                        weekendTextStyle: _textStyleForCalendar,
                        defaultTextStyle: _textStyleForCalendar,
                        defaultDecoration: BoxDecoration(
                          color: Color.fromRGBO(196, 196, 196, 0.2),
                          shape: BoxShape.circle,
                        ),
                        weekendDecoration: BoxDecoration(
                          color: Color.fromRGBO(196, 196, 196, 0.2),
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                        todayDecoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.7),
                          shape: BoxShape.circle,
                        ),
                      ),
                      onDaySelected: _onDaySelected,
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (var i = 0; i < _daysOfWeek.length; i++)
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              _daysOfWeek[i].toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
                    //phan muc tieu bai tap do an
                    _showEmpty || _selectedPlan == null
                        ? _buildNotFoundScreen()
                        : Container(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    _selectedPlan!.planWorkouts.isNotEmpty
                                        ? TitleArticle(
                                            title: "Kế hoạch tập 🎯",
                                            listPlanWorkout:
                                                _selectedPlan!.planWorkouts,
                                            listFavoriteWorkout:
                                                listFavoriteWorkout,
                                            dateTimeNow: _selectedDay,
                                            isPremiumUser: _isPremiumUser,
                                          )
                                        : Text(""),
                                    // TitleArticleBadge(
                                    //   title: "Thêm hoạt động khác",
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.fromLTRB(
                                    //       20, 5, 10, 5),
                                    //   child: Container(
                                    //     child: Row(
                                    //       mainAxisAlignment:
                                    //           MainAxisAlignment.start,
                                    //       children: [
                                    //         Column(
                                    //           mainAxisAlignment:
                                    //               MainAxisAlignment.center,
                                    //           children: [
                                    //             Container(
                                    //               child: InkWell(
                                    //                 onTap: () =>
                                    //                     showModalBottomSheet(
                                    //                         context: context,
                                    //                         isScrollControlled:
                                    //                             true,
                                    //                         builder:
                                    //                             (BuildContext
                                    //                                 context) {
                                    //                           return BottomDrawer(
                                    //                             activityType: 1,
                                    //                             isToday: true,
                                    //                           );
                                    //                         }),
                                    //                 child: CircleAvatar(
                                    //                   backgroundColor:
                                    //                       Colors.transparent,
                                    //                   radius: 25,
                                    //                   child: ClipOval(
                                    //                     child: Image.asset(
                                    //                       'assets/images/diary/activity_running.png',
                                    //                       fit: BoxFit.fitHeight,
                                    //                       width: 80,
                                    //                       height: 25,
                                    //                     ),
                                    //                   ),
                                    //                 ),
                                    //               ),
                                    //               decoration: new BoxDecoration(
                                    //                 border: new Border.all(
                                    //                   color: AppColors.grayText
                                    //                       .withOpacity(0.4),
                                    //                   width: 1,
                                    //                 ),
                                    //                 shape: BoxShape.circle,
                                    //               ),
                                    //             ),
                                    //             SizedBox(height: 5),
                                    //             Text("Chạy bộ"),
                                    //           ],
                                    //         ),
                                    //         SizedBox(
                                    //           width: 20,
                                    //         ),
                                    //         Column(
                                    //           mainAxisAlignment:
                                    //               MainAxisAlignment.center,
                                    //           children: [
                                    //             Container(
                                    //               child: InkWell(
                                    //                 onTap: () =>
                                    //                     showModalBottomSheet(
                                    //                         context: context,
                                    //                         isScrollControlled:
                                    //                             true,
                                    //                         builder:
                                    //                             (BuildContext
                                    //                                 context) {
                                    //                           return BottomDrawer(
                                    //                             activityType: 2,
                                    //                             isToday: true,
                                    //                           );
                                    //                         }),
                                    //                 child: CircleAvatar(
                                    //                   backgroundColor:
                                    //                       Colors.transparent,
                                    //                   radius: 25,
                                    //                   child: ClipOval(
                                    //                     child: Image.asset(
                                    //                       'assets/images/diary/activity_cycling.png',
                                    //                       fit: BoxFit.fitHeight,
                                    //                       width: 80,
                                    //                       height: 25,
                                    //                     ),
                                    //                   ),
                                    //                 ),
                                    //               ),
                                    //               decoration: new BoxDecoration(
                                    //                 border: new Border.all(
                                    //                   color: AppColors.grayText
                                    //                       .withOpacity(0.4),
                                    //                   width: 1,
                                    //                 ),
                                    //                 shape: BoxShape.circle,
                                    //               ),
                                    //             ),
                                    //             SizedBox(height: 5),
                                    //             Text("Đạp xe đạp")
                                    //           ],
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                TitleArticle(
                                  title: "Bữa ăn",
                                  listPlanMeal: _selectedPlan!.planMeals,
                                  listFavoriteMeal: listFavoriteMeal,
                                  dateTimeNow: _selectedDay,
                                  isPremiumUser: _isPremiumUser,
                                ),
                                listWorkoutLog.isNotEmpty
                                    ? TitleArticle(
                                        title: "Bài tập đã hoàn thành",
                                        listWorkout: listWorkout,
                                        listFavoriteWorkout:
                                            listFavoriteWorkout,
                                        isPremiumUser: _isPremiumUser,
                                      )
                                    : Text(""),
                                _selectedDay.day <= DateTime.now().day
                                    ? Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        // margin: EdgeInsets.symmetric(vertical: 15),
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tổng kết",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                                "  - Lượng calo tiêu thụ: ${totalOut} cals"),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                                "  - Lượng calo nạp vào: ${totalIn} cals"),
                                          ],
                                        ),
                                      )
                                    : Text(""),
                              ],
                            ),
                          ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  int getTotalCalOut(List<WorkoutLog> list) {
    int sum = 0;
    for (WorkoutLog wl in list) {
      sum = sum + wl.totalCalories;
    }
    return sum;
  }

  int getTotalCalIn(List<MealLog> list) {
    double sum = 0;
    for (MealLog ml in list) {
      sum = sum + ml.meal.calories;
    }
    return sum.toInt();
  }

  Widget _buildNotFoundScreen() {
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

  @override
  void loadPlan(plan) {
    setState(() {
      _isLoading = false;
      _showEmpty = false;
      this._selectedPlan = plan;
    });
  }

  @override
  void refesh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _presenter.getPlan(_selectedDay);
    _presenter.getMealLog(_selectedDay);
    _presenter.getListWorkoutComplete(_selectedDay);
    _refreshController.refreshCompleted();
  }

  @override
  void showEmptyPlan() {
    setState(() {
      _isLoading = false;
      _showEmpty = true;
    });
    _refreshController.refreshCompleted();
  }

  @override
  void showFailedModal(message) {
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
  void loadWorkoutComplete(
      List<WorkoutLog> listWorkoutLog, List<Workout> listWorkout) {
    setState(() {
      _isLoading = false;
      this.listWorkoutLog = listWorkoutLog;
      this.listWorkout = listWorkout;
      this.totalOut = getTotalCalOut(listWorkoutLog);
    });
  }

  @override
  void showEmptyWorkout() {
    setState(() {
      _isLoading = false;
      this.listWorkoutLog = [];
      this.listWorkout = [];
    });
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

  @override
  void loadMealLog(List<MealLog> listMealLog) {
    setState(() {
      _isLoading = false;
      this.listMeallog = listMealLog;
      this.totalIn = getTotalCalIn(listMealLog);
    });
  }

  @override
  void loadUserInform(User user) {
    setState(() {
      _isLoading = false;
      this._userName = user.firstName + " " + user.lastName;
      this._isPremiumUser = user.isPremium!;
    });
  }
}
