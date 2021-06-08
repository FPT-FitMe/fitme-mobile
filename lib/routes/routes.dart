import 'package:fitme/constants/routes.dart';
<<<<<<< HEAD
import 'package:fitme/screens/LoginScreen/login.dart';
import 'package:fitme/screens/PostScreen/postscreen.dart';
import 'package:fitme/screens/RegisterScreen/register.dart';
import 'package:fitme/screens/DetailMealScreen/detailmeal.dart';

=======
import 'package:fitme/screens/AchievementScreen/achievement.dart';
import 'package:fitme/screens/BottomBarScreen/bottom_bar.dart';
import 'package:fitme/screens/LoginScreen/login.dart';
import 'package:fitme/screens/PaymentScreen/payment.dart';
import 'package:fitme/screens/RegisterScreen/register.dart';
import 'package:fitme/screens/NewUserInfoScreen/new_user_info.dart';
import 'package:fitme/screens/SettingScreen/setting.dart';
import 'package:fitme/screens/SurveyScreen/survey.dart';
import 'package:fitme/screens/UserProfileScreen/user_profile.dart';
import 'package:flutter/material.dart';
>>>>>>> fde812eb00b604d2d685102929a11c6ee98afbae

getRoutes() {
  return {
    AppRoutes.login: (context) => LoginScreen(),
    AppRoutes.register: (context) => RegisterScreen(),
<<<<<<< HEAD
    AppRoutes.post: (context) => PostScreen(),
    AppRoutes.detailmeal: (context) => DetailMealScreen(),
  };
}
=======
    AppRoutes.newUserInfo: (context) => NewUserInfoScreen(),
    AppRoutes.survey: (context) => SurveyScreen(),
    AppRoutes.userProfile: (context) => UserProfileScreen(),
    AppRoutes.setting: (context) => SettingScreen(),
    AppRoutes.achievement: (context) => AchievementScreen(),
    AppRoutes.payment: (context) => PaymentScreen(),
    AppRoutes.mainScreen: (context) => BottomBarScreen(),
  };
}

generateRoutes(RouteSettings settings) {
  if (settings.name == AppRoutes.payment) {
    return MaterialPageRoute(
        builder: (context) => PaymentScreen(), fullscreenDialog: true);
  }
}
>>>>>>> fde812eb00b604d2d685102929a11c6ee98afbae
