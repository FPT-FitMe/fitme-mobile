import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/widgets/calories_card.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Lalisa Manoban",
          style: TextStyle(fontSize: 16),
        ),
        leading: Row(
          children: [
            SizedBox(width: 15),
            Icon(CommunityMaterialIcons.professional_hexagon),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.setting);
            },
            child: Icon(CommunityMaterialIcons.cog),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildUserStats(),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.payment);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                "Mua gói FitMe PRO",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Hoạt động của bạn",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          CaloriesCard(),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.achievement);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Thành tựu của bạn",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Hiện tất cả",
                  style: TextStyle(fontSize: 10, color: AppColors.grayText),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image.network(
                  'https://cdnmedia.thethaovanhoa.vn/Upload/YSu1TgnVnIyxx9zisEumA/files/2020/01/0601/00216016.jpg',
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image.network(
                  'https://cdnmedia.thethaovanhoa.vn/Upload/YSu1TgnVnIyxx9zisEumA/files/2020/01/0601/00216016.jpg',
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  Widget _buildUserStats() {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
            'https://cdnmedia.thethaovanhoa.vn/Upload/YSu1TgnVnIyxx9zisEumA/files/2020/01/0601/00216016.jpg',
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildStatBlock(title: "15", subtitle: "Bài tập"),
              _buildStatBlock(title: "+4kg", subtitle: "Cân nặng"),
              _buildStatBlock(title: "12", subtitle: "Thành tựu")
            ],
          ),
        )
      ],
    );
  }

  Widget _buildStatBlock({
    title: String,
    subtitle: String,
  }) {
    return Column(children: [
      Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 2,
      ),
      Text(
        subtitle,
        style: TextStyle(color: AppColors.grayText),
      ),
    ]);
  }
}
