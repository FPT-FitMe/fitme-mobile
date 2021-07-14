import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/coach.dart';
import 'package:fitme/models/post.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/screens/CoachScreen/coach.dart';
import 'package:fitme/screens/DetailPracticeScreen/practice.dart';
import 'package:fitme/screens/PraticeExploreScreen/pratice_explore_presenter.dart';
import 'package:fitme/screens/PraticeExploreScreen/pratice_explore_view.dart';
import 'package:fitme/widgets/title_article.dart';
import 'package:fitme/widgets/title_article_badge.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PraticeExploreScreen extends StatefulWidget {
  PraticeExploreScreen({Key? key}) : super(key: key);

  @override
  _PraticeExploreScreenState createState() => _PraticeExploreScreenState();
}

class _PraticeExploreScreenState extends State<PraticeExploreScreen>
    implements PraticeExploreView {
  late PraticePresenter _presenter;
  List<Workout> listWorkout = [];
  List<Coach> listCoaches = [];
  List<Post> listPosts = [];

  _PraticeExploreScreenState() {
    _presenter = new PraticePresenter(this);
    _presenter.getAllWorkouts();
    _presenter.loadAllCoaches();
    _presenter.loadAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    int maxListCoach = 0;
    if (listCoaches.isNotEmpty) {
      maxListCoach = listCoaches.length;
      if (maxListCoach > 3) {
        maxListCoach = 3;
      }
    }
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                carouselPage(listWorkout),
                TitleArticleBadge(
                  title: "Huấn luyện viên",
                ),
                listCoaches.isEmpty
                    ? SizedBox(height: 10)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                            ...listCoaches.map((coach) {
                              return coachAvatar(context, coach);
                            }),
                          ]),
                TitleArticleBadge(
                  title: "Loại hình",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: tagSection(),
                ),
                listWorkout.isNotEmpty
                    ? TitleArticle(
                        title: "Bài tập",
                        listWorkout: listWorkout,
                      )
                    : Text(""),
                listPosts.isNotEmpty
                    ? TitleArticle(
                        title: "Bài viết",
                        listPost: listPosts,
                      )
                    : Text(""),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void showEmptyList() {
    setState(() {
      this.listWorkout = [];
    });
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

  @override
  void loadAllWorkout(List<Workout> listWorkout) {
    setState(() {
      this.listWorkout = listWorkout;
    });
  }

  @override
  void refesh() {
    // TODO: implement refesh
  }

  @override
  void showFailedModal(String message) {
    // TODO: implement showFailedModal
  }
}

Widget coachAvatar(BuildContext context, Coach coach) => Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CoachScreen(
                      coach: coach,
                    ),
                  ));
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

CarouselController buttonCarouselController = CarouselController();

Widget carouselPage(List<Workout> listWorkout) => CarouselSlider(
      carouselController: buttonCarouselController,
      options: CarouselOptions(
        height: 250,
        autoPlay: true,
        aspectRatio: 1,
      ),
      items: listWorkout.map((item) {
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PracticeScreen(
                              workoutID: item.workoutID,
                            ),
                          ));
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
                    convertDurationAndCalories(
                        item.estimatedCalories, item.estimatedDuration),
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

String convertDurationAndCalories(dynamic cal, int duration) {
  var d = Duration(minutes: duration);
  List<String> parts = d.toString().split(':');
  int calories = cal.toInt();
  return '${parts[0].padLeft(2, '0')} giờ ${parts[1].padLeft(2, '0')} phút - $calories cals';
}

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
