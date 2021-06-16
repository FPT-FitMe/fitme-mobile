import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/widgets/set_of_feedback.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FeedBackScreen extends StatelessWidget {
  static const listIconFeedBack = [
    {
      'icon': "😎",
      'nameIcon': "Dễ",
    },
    {
      'icon': "🤗",
      'nameIcon': "Tuyệt vời",
    },
    {
      'icon': "😥",
      'nameIcon': "Khó",
    },
  ];

  static const listIconFavorite = [
    {
      'icon': "😖",
      'nameIcon': "Không",
    },
    {
      'icon': "😄",
      'nameIcon': "Cũng được",
    },
    {
      'icon': "😍",
      'nameIcon': "Rất thích",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final _setOfFeedback = SetOfFeedback(listIconFeedBack);
    final _setOfFeedbackFavorite = SetOfFeedback(listIconFavorite);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => _backToMainScreen(context),
              child: const Text(
                "Bỏ qua",
                style: TextStyle(
                  color: AppColors.textColor,
                ),
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //content
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Text(
                  "Vui lòng để lại đánh giá của bạn",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "Chúng tôi sẽ sử dụng đánh giá của bạn để cải ",
                  style: TextStyle(
                    color: AppColors.grayText,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  " thiện những bài tập tiếp theo",
                  style: TextStyle(
                    color: AppColors.grayText,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: 1,
                ),
              ],
            ),
          ),
          //danh gia bai tap de/kho/tuyetvoi
          Container(
            child: Column(
              children: [
                Text(
                  "Bạn đánh giá bài tập hôm nay thế nào?",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                _setOfFeedback,
                SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: 1,
                ),
              ],
            ),
          ),
          //thich bai tap hay khong
          Container(
            child: Column(
              children: [
                Text(
                  "Bạn thích bài tập hôm nay không?",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                _setOfFeedbackFavorite,
              ],
            ),
          ),
          //button
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 170,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  _sendFeedback(context, _setOfFeedback.indexChoice,
                      _setOfFeedbackFavorite.indexChoice);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  "Gửi đánh giá",
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

  void _backToMainScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.mainScreen,
      (route) => false,
    );
  }

  //hai index để lấy phản hồi
  void _sendFeedback(
      BuildContext context, int indexFeedback, int indexFavorite) {
    print(listIconFeedBack[indexFeedback]['nameIcon']);
    print(listIconFavorite[indexFavorite]['nameIcon']);
    Fluttertoast.showToast(msg: "Cảm ơn đánh giá của bạn");
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.mainScreen,
      (route) => false,
    );
  }
}
