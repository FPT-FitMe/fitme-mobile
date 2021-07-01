import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/exercise.dart';
import 'package:fitme/screens/BottomBarScreen/bottom_drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:fitme/widgets/title_article.dart';
import 'package:fitme/models/plan.dart';

import 'package:fitme/fake_data.dart';

final nowDate = DateTime.now();
final firstDay = DateTime(nowDate.year, nowDate.month - 3, nowDate.day);
final lastDay = DateTime(nowDate.year, nowDate.month + 3, nowDate.day);

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final _daysOfWeek = ['Hai', 'Ba', 'Tư', 'Năm', 'Sáu', 'Bảy', 'CN'];
  final _textStyleForCalendar = const TextStyle(
    color: const Color.fromRGBO(38, 50, 56, 1),
    fontSize: 16.0,
  );
  late Plan _selectedPlan;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  //cai nay phai tinh
  double _spendingTimeOfTotal = 0.5;
  int numOfdatePractice = 10;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedPlan = _getPlansForDay(_selectedDay!.day);
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedPlan = _getPlansForDay(selectedDay.day);
      });
    }
  }

  //cai nay phai viet get data Plan
  Plan _getPlansForDay(int day) {
    if (day < DateTime.now().day - 1 || day > DateTime.now().day)
      day = DateTime.now().day;
    return LIST_PLAN.where((plan) => plan.id == day).first;
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
              // onRangeSelected: _onRangeSelected,
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
            //cai thanh bar voi ngay luyen
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 10,
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(196, 196, 196, 1),
                        width: double.infinity,
                      ),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: _spendingTimeOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.topLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$numOfdatePractice',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    TextSpan(
                        text: '/30 ngày luyện tập',
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //phan muc tieu bai tap do an
            Column(
              children: [
                //check xem da hoan thanh chua
                !_checkFinish(_selectedPlan.listGoal)
                    ? TitleArticle(
                        title: "Hôm nay tập gì 🎯",
                        listExercise: _selectedPlan.listGoal,
                      )
                    : Column(
                        children: [
                          Container(
                            width: double.infinity,
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Hôm nay tập gì 🎯",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/images/winning.svg",
                            fit: BoxFit.cover,
                            height: 100,
                          ),
                          Text("Bạn đã hoàn tất mục tiêu hôm nay")
                        ],
                      ),
                SizedBox(
                  height: 10,
                ),
                TitleArticle(
                  title: "Thêm hoạt động khác",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return BottomDrawer();
                              }),
                          child: CircleAvatar(
                            // radius: 100,
                            // backgroundImage: AssetImage('assets/images/diary/activity_cycling.png'),
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
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () => showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return BottomDrawer();
                              }),
                          child: CircleAvatar(
                            // radius: 100,
                            // backgroundImage: AssetImage('assets/images/diary/activity_cycling.png'),
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
            TitleArticle(
              title: "Bữa ăn",
            ),
            SizedBox(
                height: 350,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 0,
                  crossAxisCount: 2,
                  children: <Widget>[
                    _cardArticle(context, 0),
                    _cardArticle(context, 1),
                    _cardArticle(context, 2),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                          onTap: () => showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return BottomDrawer(tabIndex: 1);
                              }),
                          child: Icon(
                              CommunityMaterialIcons.plus_circle_outline,
                              size: 50),
                        ),
                        SizedBox(height: 10),
                        Text("Thêm bữa ăn"),
                      ],
                    )
                  ],
                )),
            TitleArticle(
              title: "Bài tập đã hoàn thành",
              listExercise: _selectedPlan.listExercise,
            ),
            //phan tong ket
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              // margin: EdgeInsets.symmetric(vertical: 15),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tổng kết",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                      "  - Lượng calo tiêu thụ: ${_selectedPlan.totalOfCaloOut} kcals"),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                      "  - Lượng calo nạp vào: ${_selectedPlan.totalOfCaloIn} kcals"),
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

  bool _checkFinish(List<Exercise> listGoal) {
    if (listGoal.isEmpty) return true;
    return false;
  }

  Widget _cardArticle(
    BuildContext context,
    int id,
  ) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, AppRoutes.detailMeal, arguments: {
        'id': id + 1,
      }),
      child: SizedBox(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.network(
                      LIST_MEAL1[id].imageUrl,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (LIST_MEAL1[id].isFavorite)
                    Positioned(
                      bottom: 70,
                      right: 10,
                      child: Container(
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                    ),
                  if (LIST_MEAL1[id].isPremium)
                    Positioned(
                      bottom: 70,
                      left: 10,
                      child: Container(
                        child: Icon(
                          Icons.lock,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                    ),
                  //neu la meal se co tag "sang/trua/toi"
                  Positioned(
                    top: 68,
                    child: Container(
                      width: 85,
                      height: 30,
                      child: LIST_MEAL1[id].tag.contains("Sáng")
                          ? Card(
                              color: Color(0xFFFFDC5D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text("Sáng"),
                              ),
                            )
                          : LIST_MEAL1[id].tag.contains("Trưa")
                              ? Card(
                                  color: Color(0xFFFFAC33),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text("Trưa"),
                                  ),
                                )
                              : Card(
                                  color: Color(0xFF0E4DA4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Tối",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    LIST_MEAL1[id].name,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    LIST_MEAL1[id].cal != null
                        ? LIST_MEAL1[id].duration.toString() +
                            ' phút - ' +
                            LIST_MEAL1[id].cal.toString() +
                            ' cal'
                        : LIST_MEAL1[id].duration.toString() + ' phút',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black38,
                    ),
                  ),
                ]),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
