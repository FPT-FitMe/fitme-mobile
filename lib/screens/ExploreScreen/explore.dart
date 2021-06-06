import 'package:flutter/material.dart';
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
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
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
    ;
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
    return SingleChildScrollView(
      child: Column(
        children: [
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
            margin: EdgeInsets.symmetric(vertical: 5),
            height: 10,
            width: 340,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(196, 196, 196, 1),
                        width: double.infinity),
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
                    text: '${numOfdatePractice}',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  TextSpan(
                      text: '/30 ngày luyện tập',
                      style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
          //phan muc tieu bai tap do an
          Column(
            children: [
              TitleArticle(
                title: "Mục tiêu hôm nay",
                listExercise: _selectedPlan.listGoal,
              ),
              TitleArticle(
                title: "Đồ ăn (sáng/trưa/chiều)",
                listMeal: _selectedPlan.listMeal,
              ),
              TitleArticle(
                title: "Hoàn thành",
                listExercise: _selectedPlan.listExercise,
              ),
            ],
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
                    "  - Lượng calo tiêu thụ: ${_selectedPlan.totolOfCaloOut} kcals"),
                SizedBox(
                  height: 4,
                ),
                Text(
                    "  - Lượng calo nạp vào: ${_selectedPlan.totalOfCaloIn} kcals"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
