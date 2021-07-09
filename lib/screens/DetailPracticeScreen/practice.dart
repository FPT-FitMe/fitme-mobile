import 'package:community_material_icon/community_material_icon.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/fake_data.dart';
import 'package:fitme/models/exercise_old.dart';
import 'package:flutter/material.dart';

//hard code
const imageUrl1 =
    "https://images.unsplash.com/flagged/photo-1566063900259-8ee0cb283b3b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80";
const imageUrl2 =
    "https://images.unsplash.com/photo-1616803824305-a07cfbc8ea60?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
const imageUrl3 =
    "https://nhathuocphuongchinh.com/images/uploaded/New-2020/Bicycle-crunch.jpg";
const imageUrl4 =
    "https://images.unsplash.com/photo-1566241142559-40e1dab266c6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final routeArgs =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // final id = routeArgs['id'] as int;
    final id = 2;
    final Exercise exercise =
        LIST_EXERCISE.where((element) => element.id == id).first;
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
              // TODO: add to favorite list
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
                      _smallExercise("Lunges", imageUrl1, 16, null),
                      _smallExercise("Gập bụng", imageUrl2, 16, null),
                      _smallExercise("Đạp xe đạp", imageUrl3, 16, null),
                      _smallExercise("Plank", imageUrl4, 1, 90)
                    ],
                  ),
                ),
              ),
            ),
            //nut Bat dau
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 150,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    _startExercise(context);
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
      ),
    );
  }

  void _startExercise(BuildContext ctx) {
    //truyen list bai tap nho vo trong day
    //thời gian lúc bắt đầu bài tap
    DateTime _startTime = DateTime.now();
    Navigator.pushNamed(ctx, AppRoutes.practiceSet, arguments: {
      'startTime': _startTime,
    });
  }

  Widget _smallExercise(
      String title, String imageUrl, int numOfDoExercise, int? duration) {
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
            numOfDoExercise == 1
                ? Text('${duration} giây')
                : Text('x${numOfDoExercise} lần'),
          ],
        ),
      ),
    );
  }
}
