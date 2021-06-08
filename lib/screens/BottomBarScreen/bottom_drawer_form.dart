import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityLogForm extends StatefulWidget {
  final bool hasDistanceField;

  ActivityLogForm ({  Key ?key, required this.hasDistanceField }): super(key: key);

  @override
  _ActivityLogFormState createState() => _ActivityLogFormState();
}

class _ActivityLogFormState extends State<ActivityLogForm> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController _dateController = TextEditingController();
  TextEditingController _distanceController = TextEditingController();
  TextEditingController _durationController = TextEditingController();

  Future<void> _selectDate() async {
    DateTime currentDate = DateTime.now();
    final dateFormat = new DateFormat('dd-MM-yyyy');
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2020),
        lastDate: DateTime(2022));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        _dateController.text = dateFormat.format(pickedDate).toString();
      });
  }

  Future<void> _selectDuration() async {

    final Duration? pickedDuration = await showDurationPicker(
      context: context,
      initialTime: Duration(minutes: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      )
    );
    if (pickedDuration != null) {
      String pickedDurationString = pickedDuration.toString();
      int separatorIndex = pickedDurationString.indexOf(":", 0);
      int hours = int.parse(pickedDurationString.substring(0, separatorIndex));
      int minutes = int.parse(pickedDurationString.substring(separatorIndex + 1, separatorIndex + 3));

      setState(() {
        _durationController.text = hours == 0 ? "$minutes phút" : "$hours giờ $minutes phút";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          TextFormField(
            onTap: () => _selectDate(),
            readOnly: true,
            controller: _dateController,
            decoration: InputDecoration(
              labelText: "Ngày thực hiện",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          widget.hasDistanceField ? TextFormField(
            controller: _distanceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Khoảng cách",
              suffixText: "km"
            ),
          ) : Container(),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            onTap: () => _selectDuration(),
            controller: _durationController,
            readOnly: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Thời gian",
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                "Thêm vào nhật ký",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WeightLogForm extends StatefulWidget {
  @override
  _WeightLogFormState createState() => _WeightLogFormState();
}

class _WeightLogFormState extends State<WeightLogForm> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: _weightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              suffixText: "kg"
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                "Cập nhật cân nặng",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
