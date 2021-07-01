import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/fake_data.dart';
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
                    id: 0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildAchievementCard(
                    id: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildAchievementCard(
                    id: 2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildAchievementCard(
                    id: 3,
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
  final int id;

  const buildAchievementCard({required this.id});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Image.network(
            LIST_ACHIVEMENT[id].imageUrl,
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
              LIST_ACHIVEMENT[id].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              LIST_ACHIVEMENT[id].name,
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
