import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewUserInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Text("Để bắt đầu, chúng tôi cần một số thông tin của bạn",
                      style: TextStyle(fontSize: 16, color: AppColors.grayText)),
                  SizedBox(height: 40),
                  SvgPicture.asset("assets/images/newUserInfo.svg",
                      height: 350,
                      width: 350,
                      fit: BoxFit.contain),
                  SizedBox(height: 75),
                  SizedBox(
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
                ],
              ),
            ),
          ),
      )
    );
  }
}
