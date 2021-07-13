import 'package:fitme/constants/colors.dart';
import 'package:fitme/models/workout.dart';
import 'package:fitme/widgets/set_of_exercise.dart';
import 'package:flutter/material.dart';

class PracticeSetScreen extends StatelessWidget {
  PracticeSetScreen({Key? key}) : super(key: key);
  late DateTime _startTime;

  @override
  Widget build(BuildContext context) {
    //getListExercise o day
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _startTime = DateTime.parse(routeArgs['startTime'].toString());
    final Workout workout = routeArgs['workout'] as Workout;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Quay lại",
          style: TextStyle(
            color: AppColors.textColor,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SetOfExercise(
        setOfEx: workout.workoutExercises,
        startTime: _startTime,
        workout: workout,
      ),
    );
  }
}
