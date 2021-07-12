import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/screens/FeedBackScreen/feedback_presenter.dart';
import 'package:fitme/screens/FeedBackScreen/feedback_view.dart';
import 'package:fitme/widgets/set_of_feedback.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FeedBackScreen extends StatelessWidget implements FeedbackView {
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
  late FeedbackPresenter _presenter;
  late BuildContext _context;
  FeedBackScreen() {
    _presenter = new FeedbackPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Duration _realDurationWorkout =
        parseDuration(routeArgs['realDurationWorkout'].toString());
    final Workout workout = routeArgs['workout'] as Workout;
    final _setOfFeedback = SetOfFeedback(listIconFeedBack);
    final _setOfFeedbackFavorite = SetOfFeedback(listIconFavorite);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => _backToMainScreen(workout, _realDurationWorkout),
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
                  _sendFeedback(
                      workout,
                      _realDurationWorkout,
                      _setOfFeedback.indexChoice,
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

  //backToMain nhung van phai log Workout
  void _backToMainScreen(Workout workout, Duration realDuration) {
    _presenter.logWorkout(workout, realDuration);
  }

  //log Workout voi feedback
  //hai index để lấy phản hồi
  void _sendFeedback(Workout workout, Duration realDuration, int indexFeedback,
      int indexFavorite) {
    _presenter.logWorkoutWithFeedBack(
        workout, realDuration, indexFeedback, indexFavorite);
  }

  @override
  void feedBackFailed() {
    Fluttertoast.showToast(msg: "Gửi đánh giá thất bại");
  }

  @override
  void feedBackSuccess() {
    Fluttertoast.showToast(msg: "Cảm ơn đánh giá của bạn");
    //log thanh cong xong check xem co trong plan khong -> co thi set status -> khong thi thoi
    Navigator.pushNamedAndRemoveUntil(
      _context,
      AppRoutes.mainScreen,
      (route) => false,
    );
  }

  @override
  void logWorkoutFailed() {
    Fluttertoast.showToast(msg: "Log Workout thất bại");
  }

  @override
  void logWorkoutSuccess() {
    Fluttertoast.showToast(msg: "Log Workout thành công");
    //log thanh cong xong check xem co trong plan khong -> co thi set status -> khong thi thoi
    Navigator.pushNamedAndRemoveUntil(
      _context,
      AppRoutes.mainScreen,
      (route) => false,
    );
  }

  Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }
}
