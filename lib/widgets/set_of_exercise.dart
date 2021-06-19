import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/widgets/time_countdown.dart';
import 'package:flutter/material.dart';

class SetOfExercise extends StatefulWidget {
  // chua biet cai list kia ra sao, co gi chinh lai kieu du lieu
  final List<Map<String, Object>> setOfEx;
  final DateTime startTime;
  SetOfExercise({Key? key, required this.setOfEx, required this.startTime})
      : super(key: key);

  @override
  _SetOfExerciseState createState() => _SetOfExerciseState();
}

class _SetOfExerciseState extends State<SetOfExercise> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //image/video/
          Image.network(
            widget.setOfEx[_index]['imageUrl'].toString(),
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
                  widget.setOfEx[_index]['content'].toString(),
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.textColor,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                (widget.setOfEx[_index]['numOfExercise'] as int) != 0
                    ? Text(
                        '${widget.setOfEx[_index]['numOfExercise']} lần',
                        style: TextStyle(
                          fontSize: 45,
                          color: AppColors.textColor,
                        ),
                      )
                    : TimeCountDown(
                        time: widget.setOfEx[_index]['duration'] as int),
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

  void _nextExercise(BuildContext context) {
    //index list Ex+1
    if (_index == widget.setOfEx.length - 1) {
      //Khoang thoi gian tap tu bai dau toi bai cuoi
      Duration _realDurationWorkout =
          widget.startTime.difference(DateTime.now());
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.practiceSuccess, (route) => false,
          arguments: {
            'realDurationWorkout': _realDurationWorkout,
          });
    } else {
      setState(() {
        _index += 1;
      });
    }
  }
}
