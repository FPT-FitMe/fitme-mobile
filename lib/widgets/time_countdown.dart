import 'package:fitme/constants/colors.dart';
import 'package:flutter/material.dart';

class TimeCountDown extends StatefulWidget {
  final int time;
  TimeCountDown({Key? key, required this.time}) : super(key: key);

  @override
  _TimeCountDownState createState() => _TimeCountDownState();
}

class _TimeCountDownState extends State<TimeCountDown>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.time),
    );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Countdown(
      animation: StepTween(
        begin: widget.time,
        end: 0,
      ).animate(controller),
    );
  }
}

// ignore: must_be_immutable
class Countdown extends AnimatedWidget {
  Countdown({Key? key, required this.animation})
      : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    return Text(
      "$timerText",
      style: TextStyle(
        fontSize: 45,
        color: AppColors.textColor,
      ),
    );
  }
}
