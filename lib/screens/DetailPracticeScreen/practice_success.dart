import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PracticeSuccessScreen extends StatelessWidget {
  const PracticeSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Duration _realDurationWorkout =
        parseDuration(routeArgs['realDurationWorkout'].toString());
    final Workout workout = routeArgs['workout'] as Workout;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => _backToMainScreen(context),
          child: Icon(Icons.delete_outline),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Column(children: [
                SvgPicture.asset(
                  "assets/images/fire.svg",
                  height: 187,
                  width: 168,
                ),
                SizedBox(
                  height: 15,
                ),
                const Text(
                  "Bạn thật tuyệt vời!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //hardcode
                    //bai tap
                    _setOfResult(
                        (workout.workoutExercises.length + 1).toString(),
                        "Bài tập"),
                    //kcals
                    _setOfResult(workout.estimatedCalories.toString(), "cals"),
                    //luyen tap time
                    _setOfResult(
                        '${_realDurationWorkout.inMinutes.remainder(60).toString().padLeft(2, '0')}:${_realDurationWorkout.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                        "Luyện tập"),
                  ],
                )
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 170,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  _feedbackExercise(context, _realDurationWorkout, workout);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  "Lưu lại và tiếp tục",
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

  Widget _setOfResult(String result, String nameResult) {
    return Container(
      child: Column(
        children: [
          Text(
            result,
            style: TextStyle(
                color: AppColors.textColor, fontWeight: FontWeight.bold),
          ),
          Text(
            nameResult,
            style: TextStyle(
                color: AppColors.textColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
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

  void _backToMainScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.mainScreen,
      (route) => false,
    );
  }

  void _feedbackExercise(
      BuildContext context, Duration realDurationWorkout, Workout workout) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.feedback,
      (route) => false,
      arguments: {
        'realDurationWorkout': realDurationWorkout,
        'workout': workout
      },
    );
  }
}
