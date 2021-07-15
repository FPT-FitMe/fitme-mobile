import 'dart:io';

import 'package:duration_picker/duration_picker.dart';
import 'package:fitme/constants/colors.dart';
import 'package:fitme/models/target_weight.dart';
import 'package:fitme/screens/BottomBarScreen/bottom_drawer_form_presenter.dart';
import 'package:fitme/screens/BottomBarScreen/bottom_drawer_form_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ActivityLogForm extends StatefulWidget {
  final bool? hasDistanceField;
  final bool? showInputDate;

  ActivityLogForm({Key? key, this.hasDistanceField, this.showInputDate})
      : super(key: key);

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
            color: Colors.white, borderRadius: BorderRadius.circular(10)));
    if (pickedDuration != null) {
      String pickedDurationString = pickedDuration.toString();
      int separatorIndex = pickedDurationString.indexOf(":", 0);
      int hours = int.parse(pickedDurationString.substring(0, separatorIndex));
      int minutes = int.parse(pickedDurationString.substring(
          separatorIndex + 1, separatorIndex + 3));

      setState(() {
        _durationController.text =
            hours == 0 ? "$minutes phút" : "$hours giờ $minutes phút";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool showDistanceField = false;
    if (widget.hasDistanceField != null) {
      showDistanceField = widget.hasDistanceField!;
    }
    bool showDateField = false;
    if (widget.showInputDate != null) {
      showDateField = widget.showInputDate!;
    }
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          showDateField
              ? TextFormField(
                  onTap: () => _selectDate(),
                  readOnly: true,
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: "Ngày thực hiện",
                  ),
                )
              : Container(),
          SizedBox(
            height: 20,
          ),
          showDistanceField
              ? TextFormField(
                  controller: _distanceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Khoảng cách", suffixText: "km"),
                )
              : Container(),
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
              onPressed: () {},
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

class _WeightLogFormState extends State<WeightLogForm>
    implements BottomDrawerFormView {
  final _formKey = GlobalKey<FormState>();
  late BottomDrawerFormPresenter _presenter;

  // TextEditingController _weightController = TextEditingController();
  double latestWeight = 55.2;

  _WeightLogFormState() {
    _presenter = new BottomDrawerFormPresenter(this);
    _presenter.loadTargetWeight();
  }

  void increaseLogWeightValue() {
    setState(() {
      latestWeight += 0.1;
    });
  }

  void decreaseLogWeightValue() {
    setState(() {
      latestWeight -= 0.1;
    });
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: decreaseLogWeightValue,
                icon: Icon(Icons.remove_circle_outline_sharp),
                iconSize: 40,
                color: AppColors.primary,
              ),
              Text(
                latestWeight.toStringAsFixed(1) + " KG",
                style: TextStyle(fontSize: 50),
              ),
              IconButton(
                  onPressed: increaseLogWeightValue,
                  icon: Icon(Icons.add_circle_outline_sharp),
                  iconSize: 40,
                  color: AppColors.primary)
            ],
          ),
          SizedBox(
            height: 80,
          ),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                _presenter.logWeight(latestWeight);
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
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void showToast(message) {
    Fluttertoast.showToast(msg: message);
  }

  @override
  void loadTargetWeight(TargetWeight? targetWeight) {
    if (targetWeight != null) {
      setState(() {
        this.latestWeight = targetWeight.currentWeight;
      });
    }
  }
}

class MealLogForm extends StatefulWidget {
  final bool? showInputDate;

  MealLogForm({Key? key, this.showInputDate}) : super(key: key);

  @override
  _MealLogFormState createState() => _MealLogFormState();
}

class _MealLogFormState extends State<MealLogForm> {
  final _formKey = GlobalKey<FormState>();
  var _mealImage;

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _mealNameController = TextEditingController();
  TextEditingController _caloriesController = TextEditingController();

  Future<void> _selectDate() async {
    DateTime currentDate = DateTime.now();
    final dateFormat = new DateFormat('dd-MM-yyyy');
    _dateController.text = dateFormat.format(currentDate).toString();
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2020),
        lastDate: currentDate);
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        _dateController.text = dateFormat.format(pickedDate).toString();
      });
  }

  Future<void> _selectTime() async {
    TimeOfDay currentTime = TimeOfDay.now();
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
      initialTime: currentTime,
    );
    if (pickedTime != null && pickedTime != currentTime)
      setState(() {
        currentTime = pickedTime;
        _timeController.text = pickedTime.toString().substring(10, 15);
      });
  }

  @override
  Widget build(BuildContext context) {
    bool showDateField = false;
    if (widget.showInputDate != null) {
      showDateField = widget.showInputDate!;
    }
    TimeOfDay currentTime = TimeOfDay.now();
    _timeController.text = currentTime.toString().substring(10, 15);
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Center(
            child: GestureDetector(
              onTap: () {
                _showImagePicker();
              },
              child: CircleAvatar(
                radius: 40,
                child: _mealImage != null
                    ? Image.file(_mealImage)
                    : Icon(Icons.add_a_photo),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: _mealNameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Tên món ăn",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _caloriesController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Calories ước lượng", suffixText: "calo"),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            onTap: () => _selectTime(),
            readOnly: true,
            controller: _timeController,
            decoration: InputDecoration(
              labelText: "Lúc",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          showDateField
              ? TextFormField(
                  onTap: () => _selectDate(),
                  readOnly: true,
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: "Ngày",
                  ),
                )
              : Container(),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                "Thêm bữa ăn vào nhật ký",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  void _showImagePicker() async {
    PickedFile? image =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (image != null) {
      File selectedImage = File(image.path);
      setState(() {
        _mealImage = selectedImage;
      });
    }
  }
}
