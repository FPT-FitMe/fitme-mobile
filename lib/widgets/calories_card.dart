import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/widgets/custom_line_chart.dart';
import 'package:flutter/material.dart';

class CaloriesCard extends StatelessWidget {
  const CaloriesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      padding: EdgeInsets.fromLTRB(16, 16, 32, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide.none),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 40,
            offset: Offset.fromDirection(1, 20),
            color: Color(0xFF000A3E).withOpacity(0.1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tiến độ luyện tập",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.primary,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.log);
                    },
                    child: Text(
                      "Chi tiết",
                      style: TextStyle(color: AppColors.primary, fontSize: 12),
                    ),
                  ),
                  Icon(
                    CommunityMaterialIcons.chevron_right,
                    size: 14,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: CustomLineChart(),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text("Mục tiêu"),
              SizedBox(
                width: 15,
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[700],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text("Cân nặng"),
            ],
          )
        ],
      ),
    );
  }
}
