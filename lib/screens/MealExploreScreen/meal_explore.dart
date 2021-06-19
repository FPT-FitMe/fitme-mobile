import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/models/carousel_item.dart';
import 'package:fitme/models/plan.dart';
import 'package:flutter/material.dart';
import 'package:fitme/fake_data.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fitme/widgets/title_article.dart';

class MealExploreScreen extends StatefulWidget {
  MealExploreScreen({Key? key}) : super(key: key);

  @override
  _MealExploreScreenState createState() => _MealExploreScreenState();
}

class _MealExploreScreenState extends State<MealExploreScreen> {
  late Plan _selectedPlan;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedPlan = _getPlansForDay(_selectedDay.day);
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _carouselPage(),
                Column(
                  children: [
                    TitleArticle(
                      title: "Bạn muốn ăn ?",
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: tagSection(),
                    ),
                    TitleArticle(
                      title: "Gợi ý dành cho bạn",
                      listMeal: _selectedPlan.listMeal,
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
}

final List<CarouselItem> itemList = [
  CarouselItem(
      image:
          "https://images.unsplash.com/photo-1563379926898-05f4575a45d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
      title: "Pasta hải sản",
      description: "10 phút - 50 cal"),
  CarouselItem(
      image:
          "https://images.unsplash.com/photo-1568096889942-6eedde686635?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80",
      title: "Phở bò",
      description: "20 phút - 150 cal"),
  CarouselItem(
      image:
          "https://images.unsplash.com/photo-1533622597524-a1215e26c0a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80",
      title: "Salad thập cẩm",
      description: "10 phút - 60 cal")
];

Widget _carouselPage() => CarouselSlider(
      options: CarouselOptions(
        height: 250,
        autoPlay: true,
        aspectRatio: 1,
      ),
      items: itemList.map((item) {
        return Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Image.network(
                  item.image,
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
              ),
              Flexible(
                child: Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  item.description,
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ),
            ],
          ),
        );
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
