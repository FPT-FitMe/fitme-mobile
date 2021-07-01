import 'package:fitme/constants/routes.dart';
import 'package:fitme/fake_data.dart';
import 'package:fitme/models/post.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final map =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final id = map["id"];
    final Post post = LIST_POST.where((element) => element.id == id).first;
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
      body: SingleChildScrollView(
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
              child: titleSection(post.id),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: GestureDetector(
                child: authorSection(post.authorID),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.coachDetail);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: timeSection(post.duration),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: headLineSection(post.id),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: textSection(post.id),
            ),
          ],
        ),
      ),
    );
  }

  Widget authorSection(int id) => Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage(LIST_COACH[LIST_POST[id].authorID].imageUrl),
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
                Text(LIST_COACH[LIST_POST[id].authorID].fullname,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      );

  Widget titleSection(int id) => Container(
        alignment: Alignment.centerLeft,
        child: Text(
          LIST_POST[id].name,
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

  Widget headLineSection(int id) => Container(
        alignment: Alignment.centerLeft,
        child: Text(LIST_POST[id].headline,
            softWrap: true,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      );

  Widget textSection(int id) => Container(
        alignment: Alignment.centerLeft,
        child: Text(
          LIST_POST[id].content,
          softWrap: true,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 15),
        ),
      );
}
