import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/screens/DetailPracticeScreen/practice.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AchievementScreen extends StatelessWidget {
  const AchievementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("Thành tựu"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: CircularPercentIndicator(
                  radius: 200.0,
                  lineWidth: 20.0,
                  animation: true,
                  percent: 0.2,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "5",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Text(
                        "/ 20",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: AppColors.primary,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  buildAchievementCard(
                    title: 'Biceps workout',
                    name: 'Tập luyện cơ trước',
                    imgURL:
                        'https://images.unsplash.com/photo-1532384816664-01b8b7238c8d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=334&q=80',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildAchievementCard(
                    title: 'Triceps workout',
                    name: 'Tập luyện cơ sau',
                    imgURL:
                        'https://images.unsplash.com/photo-1507398941214-572c25f4b1dc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=666&q=80',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildAchievementCard(
                    title: 'Superset legs',
                    name: 'Tập luyện toàn chân',
                    imgURL:
                        'https://images.unsplash.com/photo-1508215885820-4585e56135c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=667&q=80',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildAchievementCard(
                    title: 'Upper body',
                    name: 'Tập luyện cơ trên',
                    imgURL:
                        'https://images.unsplash.com/photo-1526506118085-60ce8714f8c5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildAchievementCard(
                    title: 'Endurance training',
                    name: 'Tập luyện sức bền',
                    imgURL:
                        'https://images.unsplash.com/photo-1535743686920-55e4145369b9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=889&q=80',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class buildAchievementCard extends StatelessWidget {
  final String title;
  final String name;
  final String imgURL;

  const buildAchievementCard(
      {required this.title, required this.name, required this.imgURL});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Image.network(
            imgURL,
            width: 45,
            height: 45,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              name,
              style: TextStyle(color: AppColors.grayText),
            ),
          ],
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(
              CommunityMaterialIcons.check_circle,
              color: AppColors.green500,
            ),
          ),
        )
      ],
    );
  }
}
