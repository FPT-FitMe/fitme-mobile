import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewUserInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.survey);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Text(
              "Bắt đầu",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  "Xin chào Tùng,",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "Để bắt đầu, chúng tôi cần một số thông tin của bạn",
                  style: TextStyle(fontSize: 16, color: AppColors.grayText),
                ),
                SizedBox(height: 20),
                SvgPicture.asset(
                  "assets/images/new_user_info.svg",
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
