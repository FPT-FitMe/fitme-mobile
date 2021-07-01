import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/carousel_item.dart';
import 'package:flutter/material.dart';
import 'package:fitme/fake_data.dart';
import 'package:fitme/widgets/title_article.dart';

class MealExploreScreen extends StatefulWidget {
  MealExploreScreen({Key? key}) : super(key: key);

  @override
  _MealExploreScreenState createState() => _MealExploreScreenState();
}

class _MealExploreScreenState extends State<MealExploreScreen> {
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
                      listMeal: LIST_MEAL,
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

Widget _carouselPage() => CarouselSlider(
      options: CarouselOptions(
        height: 250,
        autoPlay: true,
        aspectRatio: 1,
      ),
      items: LIST_MEAL2.map((item) {
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
                            'id': item.id,
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
                    item.description,
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
