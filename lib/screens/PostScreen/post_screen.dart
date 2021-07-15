import 'package:fitme/constants/routes.dart';
import 'package:fitme/fake_data.dart';
import 'package:fitme/models/post.dart';
import 'package:fitme/models/coach.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/models/tag.dart';
import 'package:fitme/screens/PraticeExploreScreen/pratice_explore_presenter.dart';
import 'package:fitme/screens/PraticeExploreScreen/pratice_explore_view.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> implements PraticeExploreView {
  List<Post> listPosts = [];
  late PraticePresenter _presenter;

  _PostScreenState() {
    _presenter = new PraticePresenter(this);
    _presenter.loadAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    final map =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final postID = map["postID"];
    final Post post =
        listPosts.where((element) => element.postID == postID).first;
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 0,
          title: Text(
            "Quay lại",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: (listPosts.isEmpty)
            ? Text("")
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      post.imageUrl,
                      fit: BoxFit.cover,
                      width: 600,
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                      child: titleSection(post.name),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: GestureDetector(
                        child: authorSection(post.coachProfile.name.toString(),
                            post.coachProfile.imageUrl.toString()),
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.coachDetail);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: timeSection(post.readingTime),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: headLineSection(post.contentHeader),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: textSection(post.contentBody),
                    ),
                  ],
                ),
              ));
  }

  Widget authorSection(String name, String imgURL) => Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imgURL),
              radius: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Công thức viết bởi"),
                SizedBox(height: 5.0),
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      );

  Widget titleSection(String name) => Container(
        alignment: Alignment.centerLeft,
        child: Text(
          name,
          softWrap: true,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      );

  Widget timeSection(int duration) => Container(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Icon(
              Icons.access_time,
              color: Colors.grey,
            ),
            SizedBox(width: 10),
            Text(
              duration.toString() + ' phút',
              softWrap: true,
            ),
          ],
        ),
      );

  Widget headLineSection(String headline) => Container(
        alignment: Alignment.centerLeft,
        child: Text(headline,
            softWrap: true,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      );

  Widget textSection(String content) => Container(
        alignment: Alignment.centerLeft,
        child: Text(
          content,
          softWrap: true,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 15),
        ),
      );

  @override
  void loadAllCoaches(List<Coach> listCoach) {
    // TODO: implement loadAllCoaches
  }

  @override
  void loadAllTag(List<Tag> listTag) {
    // TODO: implement loadAllTag
  }

  @override
  void loadAllWorkout(List<Workout> listWorkout) {
    // TODO: implement loadAllWorkout
  }

  @override
  void loadFavouriteWorkouts(List<Workout> listWorkouts) {
    // TODO: implement loadFavouriteWorkouts
  }

  @override
  void loadPosts(List<Post> listPosts) {
    setState(() {
      this.listPosts = listPosts;
    });
  }

  @override
  void loadWorkoutsByTag(List<Workout> listWorkout, Tag tag) {
    // TODO: implement loadWorkoutsByTag
  }

  @override
  void refesh() {
    // TODO: implement refesh
  }

  @override
  void showEmptyList() {
    // TODO: implement showEmptyList
  }

  @override
  void showEmptyListWorkoutTag(Tag tag) {
    // TODO: implement showEmptyListWorkoutTag
  }

  @override
  void showFailedModal(String message) {
    // TODO: implement showFailedModal
  }
}
