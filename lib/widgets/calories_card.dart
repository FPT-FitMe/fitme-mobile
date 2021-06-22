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
      height: 250,
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
                "Năng lượng tiêu hao",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.primary),
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
            height: 6,
          ),
          Row(
            children: [
              Text(
                "260",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                " kcal",
              )
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "Tương đương lượng calo của 1,5 chén cơm",
            style: TextStyle(
              fontSize: 11,
              color: AppColors.grayText,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: CustomLineChart(),
          ),
        ],
      ),
    );
  }
}
