import 'package:flutter/material.dart';
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

class _ExploreScreenState extends State<ExploreScreen> {
  final _daysOfWeek = ['Hai', 'Ba', 'Tư', 'Năm', 'Sáu', 'Bảy', 'CN'];
  final _textStyleForCalendar = const TextStyle(
    color: const Color(0xFF263238),
    fontSize: 16.0,
  );
  // Plan _getPlansForDay() {}
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  //cai nay phai tinh
  double _spendingTimeOfTotal = 0.5;
  int numOfdatePractice = 10;

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    // if (!isSameDay(_selectedDay, selectedDay)) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      _rangeStart = null; // Important to clean those
      _rangeEnd = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;
    });

    // _selectedEvents.value = _getEventsForDay(selectedDay);
    // }
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
            // rangeStartDay: _rangeStart,
            // rangeEndDay: _rangeEnd,
            calendarFormat: CalendarFormat.week,
            headerVisible: false,
            // rangeSelectionMode: _rangeSelectionMode,
            // eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              todayTextStyle: _textStyleForCalendar,
              weekendTextStyle: _textStyleForCalendar,
              defaultTextStyle: _textStyleForCalendar,
              defaultDecoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              weekendDecoration: BoxDecoration(
                color: Colors.grey[100],
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
                    border:
                        Border.all(color: Colors.grey, width: double.infinity),
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
                listExercise: ['a'],
              ),
              TitleArticle(
                title: "Đồ ăn (sáng/trưa/chiều)",
                listMeal: ['a', 'b'],
              ),
              TitleArticle(
                title: "Hoàn thành",
                listExercise: ['a', 'b'],
              ),
            ],
          )
        ],
      ),
    );
  }
}
