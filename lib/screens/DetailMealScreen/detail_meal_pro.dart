import 'package:fitme/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';

class DetailMealProScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HexagonWidget.pointy(
            width: 200,
            color: AppColors.primary,
            child: Text('PRO',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 80,
                    color: Colors.white)),
          ),
          SizedBox(height: 20),
          Text('Nội dung này chỉ dành cho thành viên PRO',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              primary: AppColors.primary,
            ),
            child: const Text('Mua gói FitMe PRO tại đây',
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
