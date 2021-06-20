import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewUserInfoCompletedScreen extends StatelessWidget {
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
                    "Kế hoạch cho bạn đã sẵn sàng",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nỗ lực để đạt mục tiêu của mình nhé",
                          style: TextStyle(fontSize: 20, color: AppColors.grayText)),
                    ],
                  ),
                  SvgPicture.asset("assets/images/Date picker-pana.svg",
                      height: 350,
                      width: 350,
                      fit: BoxFit.contain),
                  SizedBox(
                    height: 75,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.mainScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        "Tuyệt vời",
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