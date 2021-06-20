import 'package:fitme/constants/colors.dart';
import 'package:fitme/widgets/set_of_exercise.dart';
import 'package:flutter/material.dart';

class PracticeSetScreen extends StatelessWidget {
  PracticeSetScreen({Key? key}) : super(key: key);

//hardcode
  final _setOfEx = [
    {
      'imageUrl': "http://cdn.thehinh.com/2016/03/Bai-tap-gap-bung-co-ban.gif",
      'content': "Gập bụng",
      'numOfExercise': 10,
      'duration': 0,
    },
    {
      'imageUrl': "http://cdn.thehinh.com/2016/03/Bai-tap-gap-bung-xe-dap.gif",
      'content': "Đạp xe đạp",
      'numOfExercise': 10,
      'duration': 0,
    },
    {
      'imageUrl':
          "https://s.meta.com.vn/img/thumb.ashx/Data/image/2020/05/28/plank-dung-cach-lon.jpg",
      'content': "Plank",
      'numOfExercise': 0,
      'duration': 120,
    },
  ];

  late DateTime _startTime;

  @override
  Widget build(BuildContext context) {
    //getListExercise o day
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _startTime = DateTime.parse(routeArgs['startTime'].toString());
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
        setOfEx: _setOfEx,
        startTime: _startTime,
      ),
    );
  }
}
