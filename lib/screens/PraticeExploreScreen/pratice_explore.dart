import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/coach.dart';
import 'package:fitme/models/post.dart';
import 'package:fitme/models/tag.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/screens/CoachScreen/coach.dart';
import 'package:fitme/screens/DetailPracticeScreen/practice.dart';
import 'package:fitme/screens/LoadingScreen/loading.dart';
import 'package:fitme/screens/PraticeExploreScreen/pratice_explore_presenter.dart';
import 'package:fitme/screens/PraticeExploreScreen/pratice_explore_view.dart';
import 'package:fitme/utils/user_utils.dart';
import 'package:fitme/widgets/title_article.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

const int MAX_COACH = 3;
const int MAX_TAG = 3;

class PraticeExploreScreen extends StatefulWidget {
  PraticeExploreScreen({Key? key}) : super(key: key);

  @override
  _PraticeExploreScreenState createState() => _PraticeExploreScreenState();
}

class _PraticeExploreScreenState extends State<PraticeExploreScreen>
    implements PraticeExploreView {
  late PraticePresenter _presenter;
  bool _isLoading = true;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Workout> listWorkout = [];
  List<Coach> listCoaches = [];
  List<Post> listPosts = [];
  List<Tag> listTags = [];
  List<Workout> listFavoriteWorkout = [];
  bool _isPremiumUser = false;

  _PraticeExploreScreenState() {
    _presenter = new PraticePresenter(this);
    _presenter.getAllWorkouts();
    _presenter.loadAllCoaches();
    _presenter.loadAllPosts();
    _presenter.loadAllTags();
    _presenter.loadFavouriteWorkouts();
    checkIfUserIsPremium();
  }

  void checkIfUserIsPremium() async {
    bool isUserPremium = await UserUtils.checkIfUserIsPremium();
    if (isUserPremium)
      setState(() {
        _isPremiumUser = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    int maxListCoach = 0;
    if (listCoaches.isNotEmpty) {
      maxListCoach = listCoaches.length;
      if (maxListCoach > MAX_COACH) {
        maxListCoach = MAX_COACH;
      }
    }
    int maxListTag = 0;
    if (listTags.isNotEmpty) {
      maxListTag = listTags.length;
      if (maxListTag > MAX_TAG) {
        maxListTag = MAX_TAG;
      }
    }
    return _isLoading == true
        ? LoadingScreen()
        : SmartRefresher(
            controller: _refreshController,
            onRefresh: refesh,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        carouselPage(listWorkout, this._isPremiumUser),
                        listCoaches.isEmpty
                            ? SizedBox(height: 10)
                            : Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Huấn luyện viên",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      listCoaches.length > 3
                                          ? InkWell(
                                              onTap: () => _viewAllCoach(
                                                  context, listCoaches),
                                              child: Text(
                                                "Hiện tất cả",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: AppColors.grayText),
                                              ),
                                            )
                                          : Text(""),
                                    ],
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ...listCoaches
                                            .sublist(0, maxListCoach)
                                            .map((coach) {
                                          return coachAvatar(context, coach);
                                        }),
                                      ]),
                                ],
                              ),
                        listTags.isEmpty
                            ? SizedBox(height: 10)
                            : Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Loại hình",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      listTags.length > 4
                                          ? InkWell(
                                              onTap: () => _viewAllTags(
                                                  context, listTags),
                                              child: Text(
                                                "Hiện tất cả",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: AppColors.grayText),
                                              ),
                                            )
                                          : Text(""),
                                    ],
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ...listTags
                                            .sublist(0, maxListTag)
                                            .map((tag) {
                                          return Row(
                                            children: [
                                              _createCustomChip(tag: tag),
                                              SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          );
                                        }),
                                      ]),
                                ],
                              ),
                        listWorkout.isNotEmpty
                            ? TitleArticle(
                                title: "Bài tập",
                                listWorkout: listWorkout,
                                listFavoriteWorkout: listFavoriteWorkout,
                                isPremiumUser: _isPremiumUser,
                              )
                            : Text(""),
                        listPosts.isNotEmpty
                            ? TitleArticle(
                                title: "Bài viết",
                                listPost: listPosts,
                                isPremiumUser: _isPremiumUser,
                              )
                            : Text(""),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  @override
  void showEmptyList() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void loadAllCoaches(List<Coach> listCoaches) {
    setState(() {
      _isLoading = false;
      this.listCoaches = listCoaches;
    });
  }

  @override
  void loadPosts(List<Post> listPosts) {
    setState(() {
      _isLoading = false;
      this.listPosts = listPosts;
    });
  }

  @override
  void loadAllWorkout(List<Workout> listWorkout) {
    setState(() {
      _isLoading = false;
      this.listWorkout = listWorkout;
    });
  }

  @override
  Future<void> refesh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _presenter.getAllWorkouts();
    _presenter.loadAllCoaches();
    _presenter.loadAllPosts();
    _presenter.loadAllTags();
    _presenter.loadFavouriteWorkouts();
    _refreshController.refreshCompleted();
  }

  @override
  void showFailedModal(String message) {
    // TODO: implement showFailedModal
  }

  _viewAllCoach(BuildContext context, List<Coach> listCoaches) {
    Navigator.of(context).pushNamed(AppRoutes.viewAll, arguments: {
      'list_coach': listCoaches,
      'topic': "Huấn luyện viên",
      'isPremiumUser': this._isPremiumUser,
    });
  }

  @override
  void loadAllTag(List<Tag> listTag) {
    setState(() {
      _isLoading = false;
      this.listTags = listTag;
    });
  }

  _viewAllTags(BuildContext context, List<Tag> listTags) {
    Navigator.of(context).pushNamed(AppRoutes.viewAll, arguments: {
      'list_tag': listTags,
      'topic': "tag",
      'isPremiumUser': this._isPremiumUser,
    });
  }

  @override
  void loadWorkoutsByTag(List<Workout> listWorkout, Tag tag) {
    Navigator.of(context).pushNamed(AppRoutes.viewAll, arguments: {
      'listWorkout': listWorkout,
      'topic': "bài tập tag " + tag.name,
      'isPremiumUser': this._isPremiumUser,
    });
  }

  Widget _createCustomChip({tag: Tag}) => GestureDetector(
        onTap: () => _selectTag(tag),
        child: Chip(
          label: Text(tag.name),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.grayText, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

  _selectTag(tag) {
    _presenter.loadWorkouts(tag);
  }

  @override
  void showEmptyListWorkoutTag(Tag tag) {
    List<Workout> list = [];
    Navigator.of(context).pushNamed(AppRoutes.viewAll, arguments: {
      'listWorkout': list,
      'topic': "bài tập tag " + tag.name,
      'isPremiumUser': this._isPremiumUser,
    });
  }

  @override
  void loadFavouriteWorkouts(List<Workout> listWorkouts) {
    setState(() {
      _isLoading = false;
      this.listFavoriteWorkout = listWorkouts;
    });
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

Widget carouselPage(List<Workout> listWorkout, bool isPremiumUser) =>
    CarouselSlider(
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
                      (item.isPremium && isPremiumUser) || !item.isPremium
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PracticeScreen(
                                  workoutID: item.workoutID,
                                ),
                              ))
                          : Fluttertoast.showToast(
                              msg: "Bạn không phải là thành viên pro");
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
  if (d.inHours <= 0) {
    return '${parts[1].padLeft(2, '0')} phút - $calories cals';
  }
  return '${parts[0].padLeft(2, '0')} giờ ${parts[1].padLeft(2, '0')} phút - $calories cals';
}
