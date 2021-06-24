import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/carousel_item.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:community_material_icon/community_material_icon.dart';

import 'package:fitme/widgets/title_article.dart';

import 'package:fitme/fake_data.dart';

class PraticeExploreScreen extends StatefulWidget {
  PraticeExploreScreen({Key? key}) : super(key: key);

  @override
  _PraticeExploreScreenState createState() => _PraticeExploreScreenState();
}

class _PraticeExploreScreenState extends State<PraticeExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                carouselPage(),
                TitleArticle(
                  title: "Huấn luyện viên",
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  CoachAvatar(
                    coachName: 'Lalisa',
                    tagName: 'Boxing, Thể hình',
                    imgURL: 'https://i.imgur.com/r0aISaS.jpeg',
                  ),
                  CoachAvatar(
                      coachName: 'Rose',
                      tagName: 'Yoga, Thể hình',
                      imgURL: 'https://i.imgur.com/zCiPWRn.jpeg'),
                  CoachAvatar(
                    coachName: 'Ariana Grande',
                    tagName: 'Boxing, Thể hình',
                    imgURL:
                        'https://images.unsplash.com/photo-1592621385612-4d7129426394?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
                  ),
                ]),
                TitleArticle(
                  title: "Loại hình",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: tagSection(),
                ),
                TitleArticle(
                  title: "Bài tập",
                  listExercise: LIST_EXERCISE2,
                ),
                TitleArticle(
                  title: "Bài viết",
                  listPost: LIST_POST,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CoachAvatar extends StatelessWidget {
  final String coachName;
  final String tagName;
  final String imgURL;

  const CoachAvatar(
      {required this.coachName, required this.tagName, required this.imgURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.coachDetail);
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(imgURL),
              radius: 40,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            coachName,
            style: TextStyle(
              color: Color(0xff263238),
              fontSize: 10,
              fontFamily: "SF Pro Display",
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            tagName,
            style: TextStyle(
              color: Color(0xff5e5e5e),
              fontSize: 8,
              fontFamily: "SF Pro Display",
              fontWeight: FontWeight.w500,
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
          "https://images.unsplash.com/photo-1581009137042-c552e485697a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      title: "Luyện cơ",
      description: "10 phút - 50 cal"),
  CarouselItem(
      image:
          "https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80",
      title: "Tập cơ trước",
      description: "20 phút - 150 cal"),
  CarouselItem(
      image:
          "https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80",
      title: "Tập chân",
      description: "15 phút - 60 cal")
];
CarouselController buttonCarouselController = CarouselController();

Widget carouselPage() => CarouselSlider(
      carouselController: buttonCarouselController,
      options: CarouselOptions(
        height: 250,
        autoPlay: true,
        aspectRatio: 1,
      ),
      items: itemList.map((item) {
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
                      Navigator.pushNamed(context, AppRoutes.postScreen);
                    },
                    child: Image.network(item.image,
                        fit: BoxFit.cover, width: 1000),
                  ),
                ),
                SizedBox(
                  height: 10,
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
        _createCustomChip(title: "Yoga"),
        SizedBox(
          width: 10,
        ),
        _createCustomChip(title: 'Thể hình'),
        SizedBox(
          width: 10,
        ),
        _createCustomChip(title: 'TDNĐ'),
        SizedBox(
          width: 10,
        ),
      ],
    );
