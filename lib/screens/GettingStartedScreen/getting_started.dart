import 'package:fitme/constants/routes.dart';
import 'package:fitme/widgets/carousel_with_indicator.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  "assets/images/getting_started/diet.svg",
  "assets/images/getting_started/fitness_tracker.svg",
  "assets/images/getting_started/pro_image.svg",
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
            imageList: imgList,
          ),
          Padding(
            padding: EdgeInsets.all(25.0),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.login);
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
