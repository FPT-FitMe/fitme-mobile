import 'package:fitme/constants/colors.dart';
import 'package:fitme/models/plan.dart';
import 'package:fitme/screens/BottomBarScreen/bottom_drawer_menu.dart';
import 'package:fitme/screens/ExploreScreen/explore_presenter.dart';
import 'package:fitme/screens/ExploreScreen/explore_view.dart';
import 'package:fitme/widgets/title_article_badge.dart';
import 'package:flutter/material.dart';
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
  bool _showEmpty = false;
  late ExplorePresenter _presenter;
  late Plan _selectedPlan;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  _ExploreScreenState() {
    _presenter = new ExplorePresenter(this);
    _presenter.loadPlan(_selectedDay);
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _presenter.loadPlan(selectedDay);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
              child: Text(
                "Chào Tùng Nguyễn,",
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
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
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
                  color: Theme.of(context).primaryColor.withOpacity(0.7),
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
            _showEmpty
                ? Center(
                    child: Text("Empty!"),
                  )
                : Container(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            _selectedPlan.planWorkouts.isNotEmpty
                                ? TitleArticle(
                                    title: "Kế hoạch tập 🎯",
                                    listPlanWorkout: _selectedPlan.planWorkouts,
                                  )
                                : Text(""),
                            TitleArticleBadge(
                              title: "Thêm hoạt động khác",
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: InkWell(
                                            onTap: () => showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder:
                                                    (BuildContext context) {
                                                  return BottomDrawer(
                                                    activityType: 1,
                                                    isToday: true,
                                                  );
                                                }),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              radius: 25,
                                              child: ClipOval(
                                                child: Image.asset(
                                                  'assets/images/diary/activity_running.png',
                                                  fit: BoxFit.fitHeight,
                                                  width: 80,
                                                  height: 25,
                                                ),
                                              ),
                                            ),
                                          ),
                                          decoration: new BoxDecoration(
                                            border: new Border.all(
                                              color: AppColors.grayText
                                                  .withOpacity(0.4),
                                              width: 1,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text("Chạy bộ"),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: InkWell(
                                            onTap: () => showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder:
                                                    (BuildContext context) {
                                                  return BottomDrawer(
                                                    activityType: 2,
                                                    isToday: true,
                                                  );
                                                }),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              radius: 25,
                                              child: ClipOval(
                                                child: Image.asset(
                                                  'assets/images/diary/activity_cycling.png',
                                                  fit: BoxFit.fitHeight,
                                                  width: 80,
                                                  height: 25,
                                                ),
                                              ),
                                            ),
                                          ),
                                          decoration: new BoxDecoration(
                                            border: new Border.all(
                                              color: AppColors.grayText
                                                  .withOpacity(0.4),
                                              width: 1,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text("Đạp xe đạp")
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        TitleArticle(
                          title: "Bữa ăn",
                          listPlanMeal: _selectedPlan.planMeals,
                        ),
                        //TODO: listHoanThanh
                        // _selectedPlan.listExercise.isNotEmpty
                        //     ? Column(
                        //         children: [
                        //           TitleArticle(
                        //             title: "Bài tập đã hoàn thành",
                        //             listExercise: _selectedPlan.listExercise,
                        //           ),
                        //           //phan tong ket
                        //           Container(
                        //             padding: EdgeInsets.symmetric(horizontal: 20),
                        //             // margin: EdgeInsets.symmetric(vertical: 15),
                        //             width: double.infinity,
                        //             child: Column(
                        //               crossAxisAlignment: CrossAxisAlignment.start,
                        //               children: [
                        //                 Text(
                        //                   "Tổng kết",
                        //                   style: TextStyle(fontWeight: FontWeight.bold),
                        //                   textAlign: TextAlign.left,
                        //                 ),
                        //                 SizedBox(
                        //                   height: 4,
                        //                 ),
                        //                 Text(
                        //                     "  - Lượng calo tiêu thụ: ${_selectedPlan.totalOfCaloOut} kcals"),
                        //                 SizedBox(
                        //                   height: 4,
                        //                 ),
                        //                 Text(
                        //                     "  - Lượng calo nạp vào: ${_selectedPlan.totalOfCaloIn} kcals"),
                        //               ],
                        //             ),
                        //           ),
                        //         ],
                        //       )
                        //     : Text(""),
                      ],
                    ),
                  ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void loadPlan(plan) {
    setState(() {
      _showEmpty = false;
      _selectedPlan = plan;
    });
  }

  @override
  void refesh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _presenter.loadPlan(_selectedDay);
    // TODO: implement refesh
  }

  @override
  void showEmptyPlan() {
    // TODO: implement showEmptyPlan
    setState(() {
      _showEmpty = true;
    });
  }

  @override
  void showFailedModal(message) {
    // TODO: implement showFailedModal
    Alert(
      context: context,
      type: AlertType.error,
      title: message,
      buttons: [],
    ).show();
  }
}
