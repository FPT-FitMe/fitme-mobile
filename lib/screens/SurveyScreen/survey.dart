import 'package:flutter/material.dart';

import 'package:fitme/constants/colors.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SurveyScreen extends StatefulWidget {
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  int questionIndex = 0;
  int numberOfQuestions = 5;
  bool userHasAnsweredCurrentQuestion = true;

  int selectedGender = 0;
  int selectedExerciseFrequency = 0; // 0. null 1.A 2.B 3.C 4.D
  int selectedBodyType = 0; // 0 1 2 3
  int selectedTargetBodyType = 0;

  int? inputAge;
  double? inputHeight;
  double? inputWeight;

  @override
  Widget build(BuildContext context) {
    final Size logicalSize = MediaQuery.of(context).size;
    final double _width = logicalSize.width;
    print(userHasAnsweredCurrentQuestion);
    userHasAnsweredCurrentQuestion = true;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              getCurrentPage(_width),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios), onPressed: onBackButtonPressed),
        centerTitle: true,
        title: Text("${(questionIndex + 1).toString()} / $numberOfQuestions"),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed:
                userHasAnsweredCurrentQuestion ? onNextButtonPressed : null,
          ),
        ],
      ),
    );
  }

  void onBackButtonPressed() {
    if (questionIndex > 0) {
      setState(() {
        questionIndex--;
      });
    }
  }

  void onNextButtonPressed() {
    if (questionIndex < numberOfQuestions - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      //handle complete survey
    }
  }

  void submitForm() {
    inputAge = int.parse(_ageController.text);
    inputHeight = double.parse(_heightController.text);
    inputWeight = double.parse(_weightController.text);
    if (_formKey.currentState!.validate()) {
      setState(() {
        onNextButtonPressed();
      });
    }
  }

  Widget getCurrentPage(double _width) {
    Widget selectedPage = getSelectGenderPage();
    switch (questionIndex) {
      case 0:
        if (selectedGender == 0) {
          userHasAnsweredCurrentQuestion = false;
        }
        selectedPage = getSelectGenderPage();
        break;
      case 1:
        if (inputAge == null || inputHeight == null || inputWeight == null) {
          userHasAnsweredCurrentQuestion = false;
        }
        selectedPage = getBodyInfoFormPage();
        break;
      case 2:
        if (selectedExerciseFrequency == 0) {
          userHasAnsweredCurrentQuestion = false;
        }
        selectedPage = getSelectExerciseFrequencyPage();
        break;
      case 3:
        if (selectedBodyType == 0) {
          userHasAnsweredCurrentQuestion = false;
        }
        selectedPage = getSelectBodyTypePage();
        break;
      case 4:
        if (selectedTargetBodyType == 0) {
          userHasAnsweredCurrentQuestion = false;
        }
        selectedPage = getSelectTargetBodyTypePage();
        break;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(left: 12, right: 12),
          child: selectedPage,
        )
      ],
    );
  }

  Widget getSelectGenderPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 70,
        ),
        Center(
          child: Text("Giới tính của bạn",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 70,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              height: 140,
              child: ElevatedButton(
                  onPressed: () {
                    selectedGender = 1;
                    onNextButtonPressed();
                  },
                  style: selectedGender == 1
                      ? ElevatedButton.styleFrom(
                          primary: AppColors.primary,
                        )
                      : ElevatedButton.styleFrom(primary: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.male,
                        color:
                            selectedGender == 1 ? Colors.white : Colors.black,
                        size: 50,
                      ),
                      Text("Nam",
                          style: selectedGender == 1
                              ? TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 24)
                              : TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 24)),
                    ],
                  )),
            ),
            SizedBox(width: 30),
            SizedBox(
              width: 140,
              height: 140,
              child: ElevatedButton(
                onPressed: () {
                  selectedGender = 2;
                  onNextButtonPressed();
                },
                style: selectedGender == 2
                    ? ElevatedButton.styleFrom(primary: AppColors.primary)
                    : ElevatedButton.styleFrom(primary: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.female,
                      color: selectedGender == 2 ? Colors.white : Colors.black,
                      size: 50,
                    ),
                    Text("Nữ",
                        style: selectedGender == 2
                            ? TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 24)
                            : TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 24)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getSelectExerciseFrequencyPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [],
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: Text("Tần suất tập của bạn ?",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 20,
        ),
        Form(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    selectedExerciseFrequency = 1;
                    onNextButtonPressed();
                  },
                  style: selectedExerciseFrequency == 1
                      ? ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: AppColors.primary)
                      : ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: Colors.white),
                  child: Text(
                    "A.     3 ngày / tuần",
                    style: selectedExerciseFrequency == 1
                        ? TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16)
                        : TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    selectedExerciseFrequency = 2;
                    onNextButtonPressed();
                  },
                  style: selectedExerciseFrequency == 2
                      ? ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: AppColors.primary)
                      : ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: Colors.white),
                  child: Text(
                    "B.     4 ngày / tuần",
                    style: selectedExerciseFrequency == 2
                        ? TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16)
                        : TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    selectedExerciseFrequency = 3;
                    onNextButtonPressed();
                  },
                  style: selectedExerciseFrequency == 3
                      ? ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: AppColors.primary)
                      : ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: Colors.white),
                  child: Text(
                    "C.     5 ngày / tuần",
                    style: selectedExerciseFrequency == 3
                        ? TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16)
                        : TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    selectedExerciseFrequency = 4;
                    onNextButtonPressed();
                  },
                  style: selectedExerciseFrequency == 4
                      ? ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: AppColors.primary)
                      : ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: Colors.white),
                  child: Text(
                    "D.     6 ngày / tuần",
                    style: selectedExerciseFrequency == 4
                        ? TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16)
                        : TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getSelectBodyTypePage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [],
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: Text("Cơ thể hiện tại của bạn?",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 20,
        ),
        Form(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 100,
                child: ElevatedButton(
                    onPressed: () {
                      selectedBodyType = 1;
                      onNextButtonPressed();
                    },
                    style: selectedBodyType == 1
                        ? ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: AppColors.primary)
                        : ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Gầy",
                          style: selectedBodyType == 1
                              ? TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26)
                              : TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26),
                        ),
                        Image.asset("assets/images/skinnyBodyType.png"),
                      ],
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: ElevatedButton(
                    onPressed: () {
                      selectedBodyType = 2;
                      onNextButtonPressed();
                    },
                    style: selectedBodyType == 2
                        ? ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: AppColors.primary)
                        : ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Cân đối",
                          style: selectedBodyType == 2
                              ? TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26)
                              : TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26),
                        ),
                        Image.asset("assets/images/averageBodyType.png"),
                      ],
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: ElevatedButton(
                    onPressed: () {
                      selectedBodyType = 3;
                      onNextButtonPressed();
                    },
                    style: selectedBodyType == 3
                        ? ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: AppColors.primary)
                        : ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Thừa cân",
                          style: selectedBodyType == 3
                              ? TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26)
                              : TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26),
                        ),
                        Image.asset(selectedGender == 1
                            ? "assets/images/extraBodyType.png"
                            : "assets/images/extraFemaleBodyType.png"),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getSelectTargetBodyTypePage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [],
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: Text("Bạn muốn cơ thể nào?",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 20,
        ),
        Form(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 100,
                child: ElevatedButton(
                    onPressed: () {
                      selectedTargetBodyType = 1;
                      onNextButtonPressed();
                    },
                    style: selectedTargetBodyType == 1
                        ? ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: AppColors.primary)
                        : ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Cắt cơ",
                          style: selectedTargetBodyType == 1
                              ? TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26)
                              : TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26),
                        ),
                        Image.asset("assets/images/cutBodyType.png"),
                      ],
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: ElevatedButton(
                    onPressed: () {
                      selectedTargetBodyType = 2;
                      onNextButtonPressed();
                    },
                    style: selectedTargetBodyType == 2
                        ? ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: AppColors.primary)
                        : ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Cân đối",
                          style: selectedTargetBodyType == 2
                              ? TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26)
                              : TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26),
                        ),
                        Image.asset("assets/images/averageBodyType.png"),
                      ],
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: ElevatedButton(
                    onPressed: () {
                      selectedTargetBodyType = 3;
                      onNextButtonPressed();
                    },
                    style: selectedTargetBodyType == 3
                        ? ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: AppColors.primary)
                        : ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Thừa cân",
                          style: selectedTargetBodyType == 3
                              ? TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26)
                              : TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 26),
                        ),
                        Image.asset(selectedGender == 1
                            ? "assets/images/extraBodyType.png"
                            : "assets/images/extraFemaleBodyType.png"),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getBodyInfoFormPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Text("Thông tin cơ bản",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Tuổi",
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "* Bắt buộc"),
                    RangeValidator(
                        min: 14,
                        max: 99,
                        errorText: "Vui lòng nhập tuổi hợp lệ")
                  ])),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Chiều cao", suffixText: "cm"),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "* Bắt buộc"),
                    RangeValidator(
                        min: 50,
                        max: 300,
                        errorText: "Vui lòng nhập chiều cao hợp lệ")
                  ])),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Cân nặng", suffixText: "kg"),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "* Bắt buộc"),
                    RangeValidator(
                        min: 25,
                        max: 300,
                        errorText: "Vui lòng nhập cân nặng hợp lệ")
                  ])),
              SizedBox(
                height: 35,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    submitForm();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "Tiếp theo",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
