import 'package:fitme/constants/routes.dart';
import 'package:fitme/screens/AccountDetailScreen/account_detail.dart';
import 'package:fitme/screens/AchievementScreen/achievement.dart';
import 'package:fitme/screens/BottomBarScreen/bottom_bar.dart';
import 'package:fitme/screens/CoachScreen/coach.dart';
import 'package:fitme/screens/DetailMealScreen/detail_meal.dart';
import 'package:fitme/screens/GettingStartedScreen/getting_started.dart';
import 'package:fitme/screens/LogScreen/log.dart';
import 'package:fitme/screens/LoginScreen/login.dart';
import 'package:fitme/screens/PaymentScreen/payment.dart';
import 'package:fitme/screens/PostScreen/post_screen.dart';
import 'package:fitme/screens/PracticeScreen/practice.dart';
import 'package:fitme/screens/RegisterScreen/register.dart';
import 'package:fitme/screens/NewUserInfoScreen/new_user_info.dart';
import 'package:fitme/screens/SettingScreen/setting.dart';
import 'package:fitme/screens/SurveyScreen/survey.dart';
import 'package:fitme/screens/SurveyScreen/survey_new.dart';
import 'package:fitme/screens/UserProfileScreen/user_profile.dart';
import 'package:fitme/screens/ViewAllScreen/view_all.dart';
import 'package:flutter/material.dart';

getRoutes() {
  return {
    AppRoutes.gettingStarted: (context) => GettingStartedScreen(),
    AppRoutes.login: (context) => LoginScreen(),
    AppRoutes.register: (context) => RegisterScreen(),
    AppRoutes.newUserInfo: (context) => NewUserInfoScreen(),
    AppRoutes.survey: (context) => SurveyScreen(),
    AppRoutes.newSurvey: (context) => NewSurveyScreen(),
    AppRoutes.userProfile: (context) => UserProfileScreen(),
    AppRoutes.setting: (context) => SettingScreen(),
    AppRoutes.achievement: (context) => AchievementScreen(),
    AppRoutes.payment: (context) => PaymentScreen(),
    AppRoutes.postScreen: (context) => PostScreen(),
    AppRoutes.detailMeal: (context) => DetailMealScreen(),
    AppRoutes.mainScreen: (context) => BottomBarScreen(),
    AppRoutes.coachDetail: (context) => CoachScreen(),
    AppRoutes.viewAll: (context) => ViewAllScreen(),
    AppRoutes.practice: (context) => PracticeScreen(),
    AppRoutes.accountDetail: (context) => AccountDetailScreen(),
    AppRoutes.log: (context) => LogScreen(),
  };
}

generateRoutes(RouteSettings settings) {
  if (settings.name == AppRoutes.payment) {
    return MaterialPageRoute(
        builder: (context) => PaymentScreen(), fullscreenDialog: true);
  }
}
