import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/widgets/calories_card.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 30),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildUserStats(context),
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
                  'https://images.unsplash.com/photo-1587986174328-47e12c4d1e60?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=537&q=80',
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
                  'https://images.unsplash.com/photo-1587652990204-1671eeaac77e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=533&q=80',
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
                  'https://images.unsplash.com/photo-1587653559430-aadd3ac46e3f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=519&q=80',
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
                  'https://images.unsplash.com/photo-1587567711116-272a3a927415?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=531&q=80',
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Test dialog",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Alert(
                        context: context,
                        style: AlertStyle(
                          animationType: AnimationType.grow,
                          isButtonVisible: false,
                          titleStyle: TextStyle(
                            color: AppColors.lightGreen400,
                          ),
                        ),
                        content: Column(
                          children: [
                            Icon(
                              CommunityMaterialIcons.check_circle_outline,
                              color: AppColors.lightGreen400,
                              size: 160,
                            ),
                          ],
                        ),
                        title: "Lưu thành công",
                      ).show();
                    },
                    child: Text(
                      "Success Dialog",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Alert(
                        context: context,
                        style: AlertStyle(
                          animationType: AnimationType.grow,
                          isButtonVisible: false,
                          titleStyle: TextStyle(
                            color: AppColors.red400,
                          ),
                        ),
                        content: Column(
                          children: [
                            Icon(
                              CommunityMaterialIcons.close_circle_outline,
                              color: AppColors.red400,
                              size: 160,
                            ),
                          ],
                        ),
                        title: "Lưu thất bại",
                      ).show();
                    },
                    child: Text(
                      "Fail Dialog",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Alert(
                          context: context,
                          style: AlertStyle(
                            animationType: AnimationType.grow,
                            titleStyle: TextStyle(
                              color: AppColors.primary,
                            ),
                            descStyle: TextStyle(
                              color: AppColors.grayText,
                              fontSize: 14,
                            ),
                          ),
                          content: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Image.asset(
                                    "assets/images/confetti.png",
                                    height: 180,
                                  ),
                                  CircleAvatar(
                                    radius: 60,
                                    backgroundImage: NetworkImage(
                                      'https://cdnmedia.thethaovanhoa.vn/Upload/YSu1TgnVnIyxx9zisEumA/files/2020/01/0601/00216016.jpg',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Khởi đầu mới mẻ",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          title: "Tuyệt vời",
                          desc: "Bạn vừa đạt được thành tựu",
                          buttons: [
                            DialogButton(
                              onPressed: () {},
                              child: Text(
                                "Chia sẻ với bạn bè ngay  🙌",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              color: AppColors.primary,
                            )
                          ]).show();
                    },
                    child: Text(
                      "Achievement dialog",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }

  Widget _buildUserStats(BuildContext context) {
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
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.achievement);
                  },
                  child: _buildStatBlock(title: "12", subtitle: "Thành tựu"))
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
