// import 'dart:js';

import 'package:fitme/constants/routes.dart';
import 'package:fitme/screens/BottomBarScreen/bottom_bar.dart';
import 'package:fitme/screens/LoginScreen/login.dart';
import 'package:fitme/screens/RegisterScreen/register.dart';
import 'package:fitme/screens/NewUserInfoScreen/new_user_info.dart';
import 'package:fitme/screens/SurveyScreen/survey.dart';

getRoutes() {
  return {
    AppRoutes.login: (context) => LoginScreen(),
    AppRoutes.register: (context) => RegisterScreen(),
    AppRoutes.newUserInfo: (context) => NewUserInfoScreen(),
    AppRoutes.survey: (context) => SurveyScreen(),
    AppRoutes.bottom_bar: (context) => BottomBarScreen(),
  };
}
