import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/models/workout_exercise.dart';
import 'package:fitme/widgets/time_countdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SetOfExercise extends StatefulWidget {
  // chua biet cai list kia ra sao, co gi chinh lai kieu du lieu
  final List<WorkoutExercise> setOfEx;
  final Workout workout;
  final DateTime startTime;
  SetOfExercise(
      {Key? key,
      required this.setOfEx,
      required this.startTime,
      required this.workout})
      : super(key: key);

  @override
  _SetOfExerciseState createState() => _SetOfExerciseState();
}

class _SetOfExerciseState extends State<SetOfExercise> {
  int _index = 0;
  bool isBreak = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: isBreak
          ? breakScreen(context)
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //image/video/
                Image.network(
                  widget.setOfEx[_index].exerciseID.videoUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                //content
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        widget.setOfEx[_index].exerciseID.name,
                        style: TextStyle(
                          fontSize: 30,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      (widget.setOfEx[_index].exerciseID.baseRepPerRound) != 0
                          ? Text(
                              '${widget.setOfEx[_index].exerciseID.baseRepPerRound} lần',
                              style: TextStyle(
                                fontSize: 45,
                                color: AppColors.textColor,
                              ),
                            )
                          : TimeCountDown(
                              time: widget
                                  .setOfEx[_index].exerciseID.baseDuration),
                    ],
                  ),
                ),
                //button
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                      width: 150,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          (_index != widget.setOfEx.length - 1)
                              ? setState(() {
                                  isBreak = true;
                                })
                              : _nextExercise(context);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          _index != (widget.setOfEx.length - 1)
                              ? "Tiếp tục"
                              : "Kết thúc",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      )),
                ),
              ],
            ),
    );
  }

  Widget breakScreen(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/images/break_between_reps.svg",
            height: 250,
            fit: BoxFit.fill,
          ),
          //content
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Text(
                  "Nghỉ giữa hiệp",
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.textColor,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TimeCountDown(time: 15),
              ],
            ),
          ),
          //button
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
                width: 150,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    _nextExercise(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "Tiếp tục",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  void _nextExercise(BuildContext context) {
    //index list Ex+1
    if (_index == widget.setOfEx.length - 1) {
      //Khoang thoi gian tap tu bai dau toi bai cuoi
      Duration _realDurationWorkout =
          widget.startTime.difference(DateTime.now());
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.practiceSuccess, (route) => false, arguments: {
        'realDurationWorkout': _realDurationWorkout,
        'workout': widget.workout
      });
    } else {
      setState(() {
        _index += 1;
        isBreak = false;
      });
    }
  }
}
