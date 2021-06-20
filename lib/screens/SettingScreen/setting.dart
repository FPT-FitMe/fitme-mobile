import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Cài đặt",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          child: Container(
            height: 1,
            color: Color(0xFFE8E8E8),
          ),
          preferredSize: Size.fromHeight(4.0),
        ),
      ),
      bottomSheet: GestureDetector(
        onTap: () {
          // TODO: handle logout here
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.login, (route) => false);
        },
        child: Container(
          child: ListTile(
            leading: Icon(
              CommunityMaterialIcons.history,
              color: AppColors.primary,
            ),
            title: Text(
              'Đăng xuất',
              style: TextStyle(color: AppColors.primary),
            ),
          ),
          decoration: BoxDecoration(
            border: new Border(
              top: BorderSide(
                color: Color(0xFFE8E8E8),
                width: 1,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.accountDetail);
            },
            leading: Icon(
              CommunityMaterialIcons.account_edit_outline,
              color: AppColors.textColor,
            ),
            title: Text(
              'Hồ sơ người dùng',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.log);
            },
            leading: Icon(
              CommunityMaterialIcons.history,
              color: AppColors.textColor,
            ),
            title: Text('Lịch sử hoạt động'),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.favorite);
            },
            leading: Icon(
              CommunityMaterialIcons.bookmark_outline,
              color: AppColors.textColor,
            ),
            title: Text('Yêu thích'),
          ),
        ],
      ),
    );
  }
}
