import 'package:fitme/constants/colors.dart';
import 'package:flutter/material.dart';

class SetOfFeedback extends StatefulWidget {
  late List<Map<String, String>> listIconName;
  late int indexChoice;
  List<int> colorBorder = [0, 0, 0];

  SetOfFeedback(this.listIconName);

  @override
  _SetOfFeedbackState createState() => _SetOfFeedbackState();
}

class _SetOfFeedbackState extends State<SetOfFeedback> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buttonCircle(0),
        _buttonCircle(1),
        _buttonCircle(2),
      ],
    );
  }

  Widget _buttonCircle(
    int index,
  ) {
    return Column(
      children: [
        RawMaterialButton(
          onPressed: () => _setIndex(index),
          fillColor: Color.fromRGBO(254, 221, 201, 1),
          child: Text(
            widget.listIconName[index]['icon'].toString(),
            style: TextStyle(fontSize: 20),
          ),
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(
              side: BorderSide(
            color: widget.colorBorder[index] == 1
                ? AppColors.primary
                : Color.fromRGBO(254, 221, 201, 1),
          )),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          widget.listIconName[index]['nameIcon'].toString(),
          style: TextStyle(
              color: widget.colorBorder[index] == 1
                  ? AppColors.primary
                  : AppColors.textColor),
        ),
      ],
    );
  }

  void _setIndex(int index) {
    setState(() {
      widget.indexChoice = index;
      widget.colorBorder = [0, 0, 0];
      widget.colorBorder[index] = 1;
    });
  }
}
