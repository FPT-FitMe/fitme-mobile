import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
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
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: carouselPage(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitleArticle(
                title: "Huấn luyện viên",
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                CoachAvatar(
                  coachName: 'Lalisa',
                  tagName: 'Boxing, Thể hình',
                  imgURL:
                      'https://biographymask.com/wp-content/uploads/2020/03/Blackpinks-Lisa-Manoban.jpg',
                ),
                CoachAvatar(
                    coachName: 'Rose',
                    tagName: 'Yoga, Thể hình',
                    imgURL:
                        'https://s3-ap-southeast-1.amazonaws.com/cmg-f8/4eb28968-66b1-11eb-a371-f2d04e0ae674/9e91e198-e796-403c-81da-a6f904f220b0-MAN_6057.jpg'),
                CoachAvatar(
                  coachName: 'Ariana Grande',
                  tagName: 'Boxing, Thể hình',
                  imgURL:
                      'https://pbs.twimg.com/profile_images/1385463321789452288/trz65E6m.jpg',
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
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imgURL),
            radius: 40,
          ),
          SizedBox(
            width: 10,
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

CarouselController buttonCarouselController = CarouselController();

final List<String> imgList = [
  'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  'https://images.unsplash.com/photo-1579126038374-6064e9370f0f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=717&q=80',
  'https://images.unsplash.com/photo-1594737625785-a6cbdabd333c?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
  'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80'
];

Widget carouselPage() => ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CarouselSlider(
        carouselController: buttonCarouselController,
        options: CarouselOptions(
          height: 100,
          enableInfiniteScroll: true,
          reverse: false,
          enlargeCenterPage: true,
          viewportFraction: 1,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
        ),
        items: imgList.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Stack(alignment: Alignment.center, children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.postScreen);
                    },
                    child: Image.network(item, fit: BoxFit.cover, width: 1000),
                  ),
                  Positioned(
                    left: 0,
                    child: IconButton(
                      iconSize: 30,
                      color: Colors.white,
                      icon: Icon(CommunityMaterialIcons.chevron_left),
                      onPressed: () => buttonCarouselController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      iconSize: 30,
                      color: Colors.white,
                      icon: Icon(CommunityMaterialIcons.chevron_right),
                      onPressed: () => buttonCarouselController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear),
                    ),
                  ),
                ]),
              );
            },
          );
        }).toList(),
      ),
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
