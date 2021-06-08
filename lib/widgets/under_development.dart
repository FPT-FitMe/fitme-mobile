import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UnderDevelopmentPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "Tính năng đang phát triển, xin lỗi bạn vì bất tiện này",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Container(
            height: 300,
            child: SvgPicture.asset("assets/images/under_development.svg",
                fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
