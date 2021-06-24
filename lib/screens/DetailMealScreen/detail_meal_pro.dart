import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:flutter/material.dart';

class DetailMealProScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 5, 10, 0),
            child: IconButton(
                iconSize: 350,
                color: AppColors.primary,
                onPressed: () {},
                icon: Icon(CommunityMaterialIcons.professional_hexagon)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 10, 5),
            child: Text('Nội dung này chỉ dành cho thành viên PRO',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: AppColors.textColor)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 10, 0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.payment);
              },
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                primary: AppColors.primary,
              ),
              child: const Text('Mua gói FitMe PRO tại đây',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
