import 'package:fitme/constants/routes.dart';
import 'package:fitme/constants/values.dart';
import 'package:fitme/fake_data.dart';
import 'package:fitme/models/survey.dart';
import 'package:fitme/screens/SurveyScreen/survey_presenter.dart';
import 'package:fitme/screens/SurveyScreen/survey_view.dart';
import 'package:flutter/material.dart';

import 'package:fitme/constants/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SurveyScreen extends StatefulWidget {
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> implements SurveyView {
  final _formKey = GlobalKey<FormState>();
  late SurveyPresenter _presenter;
  TextEditingController _ageController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  List<Survey> surveys = listSurveys;

  int questionIndex = 0;
  int numberOfQuestions = 2 + listSurveys.length;
  bool userHasAnsweredCurrentQuestion = true;

  int selectedGender = 2;
  int selectedExerciseFrequency = 0; // 0. null 1.A 2.B 3.C 4.D
  int selectedBodyType = 0; // 0 1 2 3
  int selectedTargetBodyType = 0;

  int? inputAge;
  double? inputHeight;
  double? inputWeight;
  int inputTargetWeight = 0;
  double? inputTargetTime;
  double? gaugeInput;

  double currentBMI = Values.maxNormalBMI;
  double recommendedBMI = Values.maxNormalBMI;
  late double recommendedTargetWeight;
  late double minDefaultTargetWeight;
  late double maxDefaultTargetWeight;
  late double minHealthyWeight;
  late double maxHealthyWeight;
  late double maxOverweightWeight;
  late RichText advice;
  late Color currentBMIColor;

  _SurveyScreenState() {
    _presenter = new SurveyPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    final Size logicalSize = MediaQuery.of(context).size;
    final double _width = logicalSize.width;
    print(userHasAnsweredCurrentQuestion);
    userHasAnsweredCurrentQuestion = true;
    print(gaugeInput);
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
      bottomNavigationBar: questionIndex == 3
          ? Padding(
              padding: const EdgeInsets.only(bottom: 25, right: 5, left: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "* FitMe ??p d???ng BMI c???a IDI & WPRO v???i m???c c??n ?????i l?? 18.5 - 22.9",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20),
            ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.chevron_left), onPressed: onBackButtonPressed),
        centerTitle: true,
        title: Text("${(questionIndex + 1).toString()} / $numberOfQuestions"),
        actions: [
          IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: userHasAnsweredCurrentQuestion
                ? ((questionIndex == 1) ? submitForm : onNextButtonPressed)
                : null,
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
    } else {
      Navigator.of(context).pop();
    }
  }

  void onNextButtonPressed() {
    if (questionIndex < numberOfQuestions - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      int gender = selectedGender;
      int age = int.parse(_ageController.text);
      double heightInCm = double.parse(_heightController.text);
      double weightInKg = double.parse(_weightController.text);
      int dietPreferenceType = surveys[0].selectedIndex;
      int targetWeightInKg = inputTargetWeight;
      int durationInDays = surveys[3].selectedIndex == 0
          ? 30
          : surveys[3].selectedIndex == 1
              ? (30 * 3)
              : surveys[3].selectedIndex == 2
                  ? 30 * 6
                  : 365;
      int exerciseFrequencyType = surveys[4].selectedIndex;
      _presenter.doSurvey(
          gender,
          age,
          heightInCm,
          weightInKg,
          dietPreferenceType,
          targetWeightInKg,
          durationInDays,
          exerciseFrequencyType);
    }
  }

  void unlockNextButton() {
    setState(() {
      userHasAnsweredCurrentQuestion = true;
    });
  }

  void submitForm() {
    inputAge = int.parse(_ageController.text);
    inputHeight = double.parse(_heightController.text) / 100;
    inputWeight = double.parse(_weightController.text);
    if (_formKey.currentState!.validate()) {
      setState(() {
        currentBMI = calculateBMI(inputHeight!, inputWeight!);
        updateInfo();
        onNextButtonPressed();
      });
    }
  }

  Widget getCurrentPage(double _width) {
    Widget selectedPage;
    switch (questionIndex) {
      case 0:
        if (selectedGender == 2) {
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
      case 3:
        selectedPage = getCurrentWeightInfoPage();
        break;
      case 4:
        selectedPage = getNumberPickerPage();
        break;
      default:
        if (surveys[questionIndex - 2].selectedIndex < 0) {
          userHasAnsweredCurrentQuestion = false;
        }
        if (questionIndex == 5 || questionIndex == 6) {
          selectedPage = createSurvey(surveys[questionIndex - 2], 2);
        } else {
          selectedPage = createSurvey(surveys[questionIndex - 2], null);
        }

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
          child: Text("Gi???i t??nh c???a b???n",
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
                    selectedGender = 0;
                    unlockNextButton();
                  },
                  style: selectedGender == 0
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
                            selectedGender == 0 ? Colors.white : Colors.black,
                        size: 50,
                      ),
                      Text("Nam",
                          style: selectedGender == 0
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
                  selectedGender = 1;
                  onNextButtonPressed();
                },
                style: selectedGender == 1
                    ? ElevatedButton.styleFrom(primary: AppColors.primary)
                    : ElevatedButton.styleFrom(primary: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.female,
                      color: selectedGender == 1 ? Colors.white : Colors.black,
                      size: 50,
                    ),
                    Text("N???",
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
                ),
              ),
            ),
          ],
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
        Text("Th??ng tin c?? b???n",
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
                      labelText: "Tu???i",
                      hintText: "*",
                      suffixText: ("      "),
                      hintTextDirection: TextDirection.rtl,
                      hintStyle: TextStyle(color: Colors.red)),
                  validator: MultiValidator([
                    RangeValidator(
                        min: 14,
                        max: 99,
                        errorText: "Vui l??ng nh???p tu???i h???p l???"),
                    RequiredValidator(errorText: "* B???t bu???c"),
                  ])),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Chi???u cao",
                      suffixText: "cm",
                      hintText: "*",
                      hintTextDirection: TextDirection.rtl,
                      hintStyle: TextStyle(color: Colors.red),
                      suffixStyle: TextStyle(color: Colors.black)),
                  validator: MultiValidator([
                    RangeValidator(
                        min: 50,
                        max: 300,
                        errorText: "Vui l??ng nh???p chi???u cao h???p l???"),
                    RequiredValidator(errorText: "* B???t bu???c"),
                  ])),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "C??n n???ng",
                      suffixText: " kg",
                      hintText: "*",
                      hintTextDirection: TextDirection.rtl,
                      hintStyle: TextStyle(color: Colors.red),
                      suffixStyle: TextStyle(color: Colors.black)),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "* B???t bu???c"),
                    RangeValidator(
                        min: 25,
                        max: 300,
                        errorText: "Vui l??ng nh???p c??n n???ng h???p l???")
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
                    "Ti???p theo",
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

  Widget getCurrentWeightInfoPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text("Th??? ch???t hi???n t???i c???a b???n",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 80,
        ),
        Center(
          child: Text("BMI",
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Text(currentBMI.toStringAsFixed(1),
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: currentBMIColor)),
        ),
        SizedBox(
          height: 80,
        ),
        advice,
        SizedBox(
          height: 200,
        ),
      ],
    );
  }

  Widget getNumberPickerPage() {
    final Brightness _brightness = Theme.of(context).brightness;
    userHasAnsweredCurrentQuestion = true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text("Trong t????ng lai, b???n mu???n c??n n???ng c???a m??nh l?? ?",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 100,
          child: Text(
            inputTargetWeight.toString() + "kg",
            style: TextStyle(fontSize: 60),
          ),
        ),
        Container(
          child: SfLinearGauge(
            axisTrackStyle: const LinearAxisTrackStyle(thickness: 24),
            minimum: minDefaultTargetWeight.roundToDouble(),
            maximum: maxDefaultTargetWeight.roundToDouble(),
            animateAxis: true,
            ranges: <LinearGaugeRange>[
              LinearGaugeRange(
                startValue: minDefaultTargetWeight.roundToDouble(),
                endValue: minHealthyWeight.roundToDouble(),
                startWidth: 40,
                midWidth: 40,
                endWidth: 40,
                child: Container(color: AppColors.primary),
              ),
              LinearGaugeRange(
                startValue: minHealthyWeight.roundToDouble(),
                endValue: maxHealthyWeight.roundToDouble(),
                startWidth: 40,
                midWidth: 40,
                endWidth: 40,
                child: Container(color: AppColors.green500),
              ),
              LinearGaugeRange(
                startValue: maxHealthyWeight.roundToDouble(),
                endValue: maxDefaultTargetWeight.roundToDouble(),
                startWidth: 40,
                midWidth: 40,
                endWidth: 40,
                child: Container(color: AppColors.red400),
              ),
              LinearGaugeRange(
                startValue: minDefaultTargetWeight.roundToDouble(),
                endValue: minHealthyWeight.roundToDouble(),
                startWidth: 40,
                endWidth: 40,
                color: Colors.transparent,
                child: RotatedBox(
                    quarterTurns: true ? 0 : 3,
                    child: Container(
                        height: 20,
                        child: const Center(
                            child: Text(
                          'Thi???u c??n',
                          style: TextStyle(
                              fontFamily: 'Roboto-Medium',
                              fontWeight: FontWeight.w500,
                              color: Color(0xff191A1B)),
                        )))),
              ),
              LinearGaugeRange(
                startValue: minHealthyWeight.roundToDouble(),
                endValue: maxHealthyWeight.roundToDouble(),
                startWidth: 40,
                endWidth: 40,
                color: Colors.transparent,
                child: RotatedBox(
                    quarterTurns: true ? 0 : 3,
                    child: Container(
                        height: 20,
                        child: const Center(
                            child: Text(
                          'C??n ?????i',
                          style: TextStyle(
                              fontFamily: 'Roboto-Medium',
                              fontWeight: FontWeight.w500,
                              color: Color(0xff191A1B)),
                        )))),
              ),
              LinearGaugeRange(
                startValue: maxHealthyWeight.roundToDouble(),
                endValue: maxDefaultTargetWeight.roundToDouble(),
                startWidth: 40,
                endWidth: 40,
                color: Colors.transparent,
                child: RotatedBox(
                    quarterTurns: true ? 0 : 3,
                    child: Container(
                        height: 20,
                        child: const Center(
                            child: Text(
                          'Th???a c??n',
                          style: TextStyle(
                              fontFamily: 'Roboto-Medium',
                              fontWeight: FontWeight.w500,
                              color: Color(0xff191A1B)),
                        )))),
              ),
            ],
            markerPointers: <LinearMarkerPointer>[
              LinearWidgetPointer(
                value: inputWeight!,
                offset: 40,
                position: LinearElementPosition.outside,
                child: Container(
                    width: 45,
                    height: 45,
                    child: Center(
                        child: Text(
                      "Hi???n t???i",
                      style: TextStyle(color: currentBMIColor, fontSize: 14),
                    ))),
              ),
              LinearShapePointer(
                offset: 40,
                value: inputWeight!,
                color: currentBMIColor,
              ),
              LinearWidgetPointer(
                value: gaugeInput!,
                position: LinearElementPosition.cross,
                onValueChanged: (value) {
                  setState(() {
                    inputTargetWeight = gaugeInput!.round();
                    gaugeInput = value as double;
                  });
                },
                child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        color: _brightness == Brightness.dark
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xff06589C),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: _brightness == Brightness.light
                                ? Colors.grey
                                : Colors.black54,
                            offset: const Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        shape: BoxShape.circle),
                    child: Center(
                        child: Text(gaugeInput!.toStringAsFixed(0),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _brightness == Brightness.light
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xffF45656),
                            )))),
              )
            ],
          ),
        ),
        SizedBox(
          height: 200,
        ),
      ],
    );
  }

  Widget createSurvey(Survey survey, int? mostSelectedIndex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(survey.question,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 30,
        ),
        Form(
          child: Column(
            children: <Widget>[
              for (int i = 0; i < survey.answers.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Column(
                    children: [
                      (mostSelectedIndex != null && i == mostSelectedIndex)
                          ? Row(
                              children: [
                                Text(
                                  "*????? xu???t cho b???n",
                                  style: TextStyle(color: AppColors.primary),
                                )
                              ],
                            )
                          : Container(),
                      SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            survey.selectedIndex = i;
                            unlockNextButton();
                          },
                          style: survey.selectedIndex == i
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
                              Text(survey.answers[i],
                                  style: TextStyle(
                                      color: survey.selectedIndex == i
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  double calculateBMI(double heightInMeter, double weightInKg) {
    return weightInKg / (heightInMeter * heightInMeter);
  }

  void updateInfo() {
    minHealthyWeight = (Values.minNormalBMI * inputHeight! * inputHeight!);
    maxHealthyWeight = (Values.maxNormalBMI * inputHeight! * inputHeight!);
    maxOverweightWeight =
        (Values.maxOverweightBMI * inputHeight! * inputHeight!);
    if (currentBMI - Values.maxNormalBMI > 0) {
      recommendedTargetWeight = maxHealthyWeight;
      minDefaultTargetWeight = minHealthyWeight;
      maxDefaultTargetWeight = inputWeight! * 1.05;
      currentBMIColor = AppColors.red400;
      advice = RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "Th??? ch???t c???a b???n ??ang ??? m???c ",
              style: TextStyle(color: Colors.black, fontSize: 16)),
          TextSpan(
              text: "th???a c??n",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: currentBMIColor,
                  fontSize: 16)),
          TextSpan(
              text: " so v???i ch??? s??? BMI khuy???n ngh???. FitMe ????? xu???t b???n h??y ",
              style: TextStyle(color: Colors.black, fontSize: 16)),
          TextSpan(
              text: "gi???m c??n ??t nh???t l?? " +
                  (inputWeight! - recommendedTargetWeight)
                      .roundToDouble()
                      .toString() +
                  "kg",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.green500,
                  fontSize: 16)),
        ]),
      );
    } else if ((currentBMI - Values.maxNormalBMI).floor() == 0 &&
        currentBMI > Values.maxNormalBMI) {
      recommendedTargetWeight =
          minHealthyWeight + (maxHealthyWeight - minHealthyWeight) / 2;
      minDefaultTargetWeight = minHealthyWeight;
      maxDefaultTargetWeight = inputWeight! * 1.05;
      currentBMIColor = AppColors.red400;
      advice = RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "Th??? ch???t c???a b???n ??ang ??? m???c ",
              style: TextStyle(color: Colors.black, fontSize: 16)),
          TextSpan(
              text: "th???a c??n",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: currentBMIColor,
                  fontSize: 16)),
          TextSpan(
              text: " so v???i ch??? s??? BMI khuy???n ngh???. FitMe ????? xu???t b???n h??y ",
              style: TextStyle(color: Colors.black, fontSize: 16)),
          TextSpan(
              text: "gi???m " +
                  (inputWeight! - recommendedTargetWeight)
                      .roundToDouble()
                      .toString() +
                  "kg",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.green500,
                  fontSize: 16)),
        ]),
      );
    } else if (currentBMI >= Values.minNormalBMI &&
        currentBMI <= Values.maxNormalBMI) {
      recommendedTargetWeight =
          minHealthyWeight + (maxHealthyWeight - minHealthyWeight) / 2;
      minDefaultTargetWeight = minHealthyWeight * 0.86;
      maxDefaultTargetWeight = maxHealthyWeight * 1.12;
      currentBMIColor = AppColors.green500;
      advice = RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "Ch??c m???ng b???n ???? c?? th??n h??nh ",
              style: TextStyle(color: Colors.black, fontSize: 16)),
          TextSpan(
              text: "c??n ?????i",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: currentBMIColor,
                  fontSize: 16)),
          TextSpan(
              text: " so v???i ch??? s??? BMI khuy???n ngh???. FitMe ????? xu???t b???n h??y ",
              style: TextStyle(color: Colors.black, fontSize: 16)),
          TextSpan(
              text: "duy tr?? th??? ch???t.",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.green500,
                  fontSize: 16)),
        ]),
      );
    } else if ((currentBMI - Values.minNormalBMI).ceil() == 0 &&
        currentBMI < Values.minNormalBMI) {
      recommendedTargetWeight =
          minHealthyWeight + (maxHealthyWeight - minHealthyWeight) / 2;
      minDefaultTargetWeight = inputWeight! * 0.86;
      maxOverweightWeight = maxHealthyWeight;
      maxDefaultTargetWeight = maxHealthyWeight;
      currentBMIColor = AppColors.primary;
      advice = RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "Th??? ch???t c???a b???n ??ang ??? m???c ",
              style: TextStyle(color: Colors.black, fontSize: 16)),
          TextSpan(
              text: "thi???u c??n",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: currentBMIColor,
                  fontSize: 16)),
          TextSpan(
              text: " so v???i ch??? s??? BMI khuy???n ngh???. FitMe ????? xu???t b???n h??y ",
              style: TextStyle(color: Colors.black, fontSize: 16)),
          TextSpan(
              text: "t??ng " +
                  (recommendedTargetWeight - inputWeight!)
                      .roundToDouble()
                      .toString() +
                  "kg",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.green500,
                  fontSize: 16)),
        ]),
      );
    } else {
      minDefaultTargetWeight = inputWeight! * 0.9;
      recommendedTargetWeight = minHealthyWeight;
      maxOverweightWeight = maxHealthyWeight;
      maxDefaultTargetWeight = maxHealthyWeight;
      currentBMIColor = AppColors.primary;
      advice = RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "Th??? ch???t c???a b???n ??ang ??? m???c ",
              style: TextStyle(color: Colors.black, fontSize: 16)),
          TextSpan(
              text: "thi???u c??n",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: currentBMIColor,
                  fontSize: 16)),
          TextSpan(
              text: " so v???i ch??? s??? BMI khuy???n ngh???. FitMe ????? xu???t b???n h??y ",
              style: TextStyle(color: Colors.black, fontSize: 16)),
          TextSpan(
              text: "t??ng ??t nh???t l?? " +
                  (recommendedTargetWeight - inputWeight!)
                      .roundToDouble()
                      .toString() +
                  "kg",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.green500,
                  fontSize: 16)),
        ]),
      );
    }
    if (gaugeInput == null) {
      gaugeInput = recommendedTargetWeight;
      inputTargetWeight = recommendedTargetWeight.round();
    }
  }

  @override
  void doSurveyFail(String errorMessage) {
    Fluttertoast.showToast(msg: errorMessage);
  }

  @override
  void doSurveySuccess() {
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.newUserInfoCompleted, (route) => false);
  }
}
