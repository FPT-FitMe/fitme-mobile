import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/carousel_item.dart';
import 'package:fitme/models/coach.dart';
import 'package:fitme/models/exercise.dart';
import 'package:fitme/models/post.dart';
import 'package:fitme/screens/PraticeExploreScreen/pratice_explore_presenter.dart';
import 'package:fitme/screens/PraticeExploreScreen/pratice_explore_view.dart';
import 'package:fitme/widgets/title_article_badge.dart';
import 'package:fitme/widgets/title_article_pratice.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:fitme/fake_data.dart';

class PraticeExploreScreen extends StatefulWidget {
  PraticeExploreScreen({Key? key}) : super(key: key);

  @override
  _PraticeExploreScreenState createState() => _PraticeExploreScreenState();
}

class _PraticeExploreScreenState extends State<PraticeExploreScreen>
    implements PraticeExploreView {
  late PraticePresenter _presenter;
  List<Exercise> listExercise = [];
  List<Exercise> listExercise2 = [];
  List<Coach> listCoaches = [];
  List<Post> listPosts = [];

  _PraticeExploreScreenState() {
    _presenter = new PraticePresenter(this);
    _presenter.loadAllExercise();
    _presenter.loadAllCoaches();
    _presenter.loadAllPosts();
  }

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
                carouselPage(listExercise),
                TitleArticleBadge(
                  title: "Huấn luyện viên",
                ),
                listCoaches.isEmpty
                    ? SizedBox(height: 10)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                            CoachAvatar(context, listCoaches[0]),
                            // CoachAvatar(context, listCoaches[1]),
                            // CoachAvatar(context, listCoaches[2]),
                          ]),
                TitleArticleBadge(
                  title: "Loại hình",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: tagSection(),
                ),
                TitleArticlePratice(
                  title: "Bài tập",
                  listExercise: LIST_EXERCISE,
                ),
                TitleArticlePratice(
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

  @override
  void loadAllExercise(List<Exercise> listExercise) {
    setState(() {
      this.listExercise = listExercise;
      listExercise2 = [
        listExercise[0],
        listExercise[1],
      ];
    });
  }

  @override
  void showEmptyList() {
    // TODO: implement showEmptyList
  }

  @override
  void loadAllCoaches(List<Coach> listCoaches) {
    setState(() {
      this.listCoaches = listCoaches;
    });
  }

  @override
  void loadPosts(List<Post> listPosts) {
    setState(() {
      this.listPosts = listPosts;
    });
  }
}

Widget CoachAvatar(BuildContext context, Coach coach) => Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.coachDetail, arguments: {
                "id": coach.coachID,
              });
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(coach.imageUrl),
              radius: 40,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            coach.name,
            style: TextStyle(
              color: Color(0xff263238),
              fontSize: 10,
              fontFamily: "SF Pro Display",
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            coach.introduction,
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

Widget carouselPage(List<Exercise> listExercise) => CarouselSlider(
      carouselController: buttonCarouselController,
      options: CarouselOptions(
        height: 250,
        autoPlay: true,
        aspectRatio: 1,
      ),
      items: listExercise.map((item) {
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
                      Navigator.pushNamed(context, AppRoutes.detailPractice);
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
                    '${item.baseDuration} phút - ${item.baseKcal} cals',
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
