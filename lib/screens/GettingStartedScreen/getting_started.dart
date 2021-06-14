import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/carousel_item.dart';
import 'package:fitme/widgets/carousel_with_indicator.dart';
import 'package:flutter/material.dart';

final List<CarouselItem> imgList = [
  CarouselItem(
    image: "assets/images/getting_started/fitness_tracker.svg",
    title: "HUẤN LUYỆN VIÊN CỦA RIÊNG BẠN",
    description:
        "Chúng tôi sẽ đề xuất chế độ luyện tập tốt nhất dành riêng cho bạn",
  ),
  CarouselItem(
    image: "assets/images/getting_started/eating_healthy.svg",
    title: "BỮA ĂN KHOA HỌC",
    description:
        "Bạn không biết nên ăn gì là tốt nhất ? FitMe sẽ giúp bạn trong chuyện đó",
  ),
  CarouselItem(
    image: "assets/images/getting_started/diet.svg",
    title: "BÀI TẬP ĐA DẠNG",
    description: "Đa dạng bài tập, phù hợp cho mọi nhu cầu của các bạn",
  ),
];

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CarouselWithIndicator(
            itemList: imgList,
          ),
          Padding(
            padding: EdgeInsets.all(25.0),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.login, (routes) => false);
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
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
