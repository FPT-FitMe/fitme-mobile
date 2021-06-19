import 'package:fitme/constants/routes.dart';
import 'package:fitme/screens/AchievementScreen/achievement.dart';
import 'package:fitme/screens/BottomBarScreen/bottom_bar.dart';
import 'package:fitme/screens/LoginScreen/login.dart';
import 'package:fitme/screens/PaymentScreen/payment.dart';
import 'package:fitme/screens/PraticeExploreScreen/pratice_explore.dart';
import 'package:fitme/screens/RegisterScreen/register.dart';
import 'package:fitme/screens/NewUserInfoScreen/new_user_info.dart';
import 'package:fitme/screens/SettingScreen/setting.dart';
import 'package:fitme/screens/SurveyScreen/survey.dart';
import 'package:fitme/screens/PostScreen/post_screen.dart';
import 'package:fitme/screens/DetailMealScreen/detail_meal.dart';
import 'package:fitme/screens/UserProfileScreen/user_profile.dart';
import 'package:flutter/material.dart';

getRoutes() {
  return {
    AppRoutes.login: (context) => LoginScreen(),
    AppRoutes.register: (context) => RegisterScreen(),
    AppRoutes.newUserInfo: (context) => NewUserInfoScreen(),
    AppRoutes.survey: (context) => SurveyScreen(),
    AppRoutes.userProfile: (context) => UserProfileScreen(),
    AppRoutes.setting: (context) => SettingScreen(),
    AppRoutes.achievement: (context) => AchievementScreen(),
    AppRoutes.payment: (context) => PaymentScreen(),
    AppRoutes.postScreen: (context) => PostScreen(),
    AppRoutes.detailMeal: (context) => DetailMealScreen(),
    AppRoutes.mainScreen: (context) => BottomBarScreen(),
    AppRoutes.feedPratice: (context) => PraticeExploreScreen(),
  };
}

generateRoutes(RouteSettings settings) {
  if (settings.name == AppRoutes.payment) {
    return MaterialPageRoute(
        builder: (context) => PaymentScreen(), fullscreenDialog: true);
  }
}
