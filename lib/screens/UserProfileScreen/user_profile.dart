import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/user.dart';
import 'package:fitme/screens/LoadingScreen/loading.dart';
import 'package:fitme/screens/UserProfileScreen/user_profile_presenter.dart';
import 'package:fitme/screens/UserProfileScreen/user_profile_view.dart';
import 'package:fitme/widgets/CaloriesCard/calories_card.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    implements UserProfileView {
  User? user;
  late UserProfilePresenter _presenter;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  _UserProfileScreenState() {
    _presenter = new UserProfilePresenter(this);
    _presenter.loadUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return LoadingScreen();
    } else {
      return SmartRefresher(
        controller: _refreshController,
        onRefresh: refresh,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 30),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _buildUserStats(user!),
              SizedBox(
                height: 20,
              ),
              if (user!.isPremium == false)
                Center(
                  child: SizedBox(
                    width: 250,
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
                        "Mua g??i FitMe PRO",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Ho???t ?????ng c???a b???n",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              CaloriesCard(user: this.user!),
              SizedBox(
                height: 30,
              ),
              //   GestureDetector(
              //     onTap: () {
              //       Navigator.pushNamed(context, AppRoutes.achievement);
              //     },
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           "Th??nh t???u c???a b???n",
              //           style:
              //               TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              //         ),
              //         Text(
              //           "Hi???n t???t c???",
              //           style: TextStyle(fontSize: 10, color: AppColors.grayText),
              //         )
              //       ],
              //     ),
              //   ),
              //   SizedBox(
              //     height: 10,
              //   ),
              //   Row(
              //     children: [
              //       ClipRRect(
              //         borderRadius: BorderRadius.all(Radius.circular(8)),
              //         child: Image.network(
              //           'https://images.unsplash.com/photo-1587986174328-47e12c4d1e60?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=537&q=80',
              //           width: 45,
              //           height: 45,
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       ClipRRect(
              //         borderRadius: BorderRadius.all(Radius.circular(8)),
              //         child: Image.network(
              //           'https://images.unsplash.com/photo-1587652990204-1671eeaac77e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=533&q=80',
              //           width: 45,
              //           height: 45,
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       ClipRRect(
              //         borderRadius: BorderRadius.all(Radius.circular(8)),
              //         child: Image.network(
              //           'https://images.unsplash.com/photo-1587653559430-aadd3ac46e3f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=519&q=80',
              //           width: 45,
              //           height: 45,
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       ClipRRect(
              //         borderRadius: BorderRadius.all(Radius.circular(8)),
              //         child: Image.network(
              //           'https://images.unsplash.com/photo-1587567711116-272a3a927415?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=531&q=80',
              //           width: 45,
              //           height: 45,
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     ],
              //   ),
              //   SizedBox(
              //     height: 20,
              //   ),
            ]),
          ),
        ),
      );
    }
  }

  Widget _buildUserStats(User user) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.profileImageUrl == null
                ? "https://karateinthewoodlands.com/wp-content/uploads/2017/09/default-user-image.png"
                : user.profileImageUrl.toString()),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (user.isPremium == true)
                Icon(CommunityMaterialIcons.professional_hexagon),
              SizedBox(
                width: 15,
              ),
              Text(
                "${user.firstName} ${user.lastName}",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void refresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _presenter.loadUserProfile();
    _refreshController.refreshCompleted();
  }

  _showSuccessModal(BuildContext context) {
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
      title: "L??u th??nh c??ng",
    ).show();
  }

  _showFailedModal(BuildContext context) {
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
      title: "L??u th???t b???i",
    ).show();
  }

  _showSuccessAchievementModal(BuildContext context) {
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
              "Kh???i ?????u m???i m???",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        title: "Tuy???t v???i",
        desc: "B???n v???a ?????t ???????c th??nh t???u",
        buttons: [
          DialogButton(
            onPressed: () {},
            child: Text(
              "Chia s??? v???i b???n b?? ngay  ????",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            color: AppColors.primary,
          )
        ]).show();
  }

  @override
  void loadUser(User user) {
    setState(() {
      this.user = user;
    });
  }
}
