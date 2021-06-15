import 'package:fitme/constants/colors.dart';
import 'package:fitme/constants/routes.dart';
import 'package:fitme/widgets/time_countdown.dart';
import 'package:flutter/material.dart';

class PracticeSetScreen extends StatefulWidget {
  const PracticeSetScreen({Key? key}) : super(key: key);

  @override
  _PracticeSetScreenState createState() => _PracticeSetScreenState();
}

class _PracticeSetScreenState extends State<PracticeSetScreen> {
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

  int _index = 0;

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        child: Column(
          children: [
            //image/video/
            Image.network(
              _setOfEx[_index]['imageUrl'].toString(),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            //content
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    _setOfEx[_index]['content'].toString(),
                    style: TextStyle(
                      fontSize: 30,
                      color: AppColors.textColor,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  (_setOfEx[_index]['numOfExercise'] as int) != 0
                      ? Text(
                          '${_setOfEx[_index]['numOfExercise']} lần',
                          style: TextStyle(
                            fontSize: 45,
                            color: AppColors.textColor,
                          ),
                        )
                      : TimeCountDown(
                          time: _setOfEx[_index]['duration'] as int),
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
                      _index != (_setOfEx.length - 1) ? "Tiếp tục" : "Kết thúc",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _nextExercise(BuildContext context) {
    //index list Ex+1
    if (_index == _setOfEx.length - 1) {
      Navigator.pushNamed(context, AppRoutes.practiceSuccess);
    }
    setState(() {
      _index += 1;
    });
  }
}
