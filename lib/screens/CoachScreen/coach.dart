import 'package:fitme/models/personal_trainer.dart';
import 'package:fitme/widgets/title_article.dart';
import 'package:flutter/material.dart';
import 'package:fitme/fake_data.dart';

class CoachScreen extends StatelessWidget {
  const CoachScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final routeArgs =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // final coachId = routeArgs['id'] as int;
    final coachId = 2;
    final PersonalTrainer pt = LIST_COACH.where((pt) {
      return pt.id == coachId;
    }).first;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quay lại",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              pt.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pt.fullname,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(pt.information),
                ],
              ),
            ),
            //phan bai tap va bua an
            Column(
              children: [
                TitleArticle(
                  title: "Bài tập",
                  listExercise: pt.listExcersice,
                ),
                TitleArticle(
                  title: "Bữa ăn",
                  listMeal: pt.listMeal,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
