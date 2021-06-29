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
                        "4",
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
                    title: 'First workout',
                    name: 'Hoàn thành bài tâp đầu tiên',
                    imgURL:
                        'https://images.unsplash.com/photo-1555848960-c881e30379c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildAchievementCard(
                    title: 'Full body challenge',
                    name: 'Hoàn thành thử thách tập fullbody',
                    imgURL:
                        'https://images.unsplash.com/photo-1555848960-c881e30379c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildAchievementCard(
                    title: 'First Running Workout',
                    name: 'Hoàn thành bài chạy bộ đầu tiên',
                    imgURL:
                        'https://images.unsplash.com/photo-1555848960-c881e30379c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildAchievementCard(
                    title: '7-Workout Week',
                    name: 'Hoàn thành 7 ngày tập liên tiếp',
                    imgURL:
                        'https://images.unsplash.com/photo-1555848960-c881e30379c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80',
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
