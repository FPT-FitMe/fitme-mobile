import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/fake_data.dart';
import 'package:fitme/models/exercise.dart';
import 'package:flutter/material.dart';

//hard code
const imageUrl1 =
    "https://www.thethaothientruong.vn/uploads/contents/gap-bung-dung-cach.jpg";
const imageUrl2 =
    "http://nailzone.vn/wp-content/uploads/2016/09/Screen-Shot-2014-07-15-at-4.26.13-PM.png";
const imageUrl3 =
    "http://nailzone.vn/wp-content/uploads/2016/09/NC-NP908-Step-3.jpg";
const imageUrl4 = "http://nailzone.vn/wp-content/uploads/2016/09/ex2.jpg";

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // final id = routeArgs['id'] as int;
    final id = 2;
    final Exercise exercise =
        LIST_EXERCISE.where((element) => element.id == id).first as Exercise;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Quay lại",
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              // hình ảnh hiện tại chỉ mang tính chất tượng trưng
              Icon(Icons.favorite_outline),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            // hình và tiêu đề
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(90)),
                    child: Image.network(
                      exercise.imageUrl,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    exercise.name,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //hard code
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "với Thảo Võ",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(CommunityMaterialIcons.clock_time_three_outline),
                          Text(
                            '${exercise.duration} phút',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(CommunityMaterialIcons.arm_flex_outline),
                          Text(
                            '${exercise.cal} kcals',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            //cac buoc tap
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    children: [
                      //hardcode
                      _smallExercise("Xoay cổ tay cổ chân", imageUrl2, 16),
                      _smallExercise("Căng vai", imageUrl3, 16),
                      _smallExercise("Gập người", imageUrl4, 16),
                      _smallExercise("Gập bụng", imageUrl1, 16)
                    ],
                  ),
                ),
              ),
            ),
            //nut Bat dau
            SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 100,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  _startExercise();
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
          ],
        ),
      ),
    );
  }

  void _startExercise() {}

  Widget _smallExercise(String title, String imageUrl, int numOfDoExercise) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Image.network(
            imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 16,
              ),
            ),
            Text('x${numOfDoExercise}'),
          ],
        ),
      ),
    );
  }
}
