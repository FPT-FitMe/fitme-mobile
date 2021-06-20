import 'package:fitme/constants/routes.dart';
import 'package:fitme/screens/AccountDetailScreen/account_detail.dart';
import 'package:fitme/screens/AchievementScreen/achievement.dart';
import 'package:fitme/screens/BottomBarScreen/bottom_bar.dart';
import 'package:fitme/screens/CoachScreen/coach.dart';
import 'package:fitme/screens/DetailMealScreen/detail_meal.dart';
import 'package:fitme/screens/FavoriteScreen/favorite.dart';
import 'package:fitme/screens/FeedBackScreen/feedback.dart';
import 'package:fitme/screens/GettingStartedScreen/getting_started.dart';
import 'package:fitme/screens/LogScreen/log.dart';
import 'package:fitme/screens/LoginScreen/login.dart';
import 'package:fitme/screens/MealExploreScreen/meal_explore.dart';
import 'package:fitme/screens/PaymentScreen/payment.dart';
import 'package:fitme/screens/PraticeExploreScreen/pratice_explore.dart';
import 'package:fitme/screens/NewUserInfoScreen/new_user_info_completed.dart';
import 'package:fitme/screens/PostScreen/post_screen.dart';
import 'package:fitme/screens/DetailPracticeScreen/practice.dart';
import 'package:fitme/screens/DetailPracticeScreen/practice_set.dart';
import 'package:fitme/screens/DetailPracticeScreen/practice_success.dart';
import 'package:fitme/screens/RegisterScreen/register.dart';
import 'package:fitme/screens/NewUserInfoScreen/new_user_info.dart';
import 'package:fitme/screens/SearchScreen/search.dart';
import 'package:fitme/screens/SettingScreen/setting.dart';
import 'package:fitme/screens/SurveyScreen/survey.dart';
import 'package:fitme/screens/UserProfileScreen/user_profile.dart';
import 'package:fitme/screens/ViewAllScreen/view_all.dart';
import 'package:flutter/material.dart';

getRoutes() {
  return {
    AppRoutes.gettingStarted: (context) => GettingStartedScreen(),
    AppRoutes.login: (context) => LoginScreen(),
    AppRoutes.register: (context) => RegisterScreen(),
    AppRoutes.newUserInfo: (context) => NewUserInfoScreen(),
    AppRoutes.newUserInfoCompleted: (context) => NewUserInfoCompletedScreen(),
    AppRoutes.survey: (context) => SurveyScreen(),
    AppRoutes.userProfile: (context) => UserProfileScreen(),
    AppRoutes.setting: (context) => SettingScreen(),
    AppRoutes.achievement: (context) => AchievementScreen(),
    AppRoutes.payment: (context) => PaymentScreen(),
    AppRoutes.postScreen: (context) => PostScreen(),
    AppRoutes.detailMeal: (context) => DetailMealScreen(),
    AppRoutes.mainScreen: (context) => BottomBarScreen(),
    AppRoutes.feedPratice: (context) => PraticeExploreScreen(),
    AppRoutes.coachDetail: (context) => CoachScreen(),
    AppRoutes.viewAll: (context) => ViewAllScreen(),
    AppRoutes.detailPractice: (context) => PracticeScreen(),
    AppRoutes.practiceSet: (context) => PracticeSetScreen(),
    AppRoutes.practiceSuccess: (context) => PracticeSuccessScreen(),
    AppRoutes.feedback: (context) => FeedBackScreen(),
    AppRoutes.accountDetail: (context) => AccountDetailScreen(),
    AppRoutes.log: (context) => LogScreen(),
    AppRoutes.search: (context) => SearchScreen(),
    AppRoutes.favorite: (context) => FavoriteScreen(),
  };
}

generateRoutes(RouteSettings settings) {
  if (settings.name == AppRoutes.payment) {
    return MaterialPageRoute(
        builder: (context) => PaymentScreen(), fullscreenDialog: true);
  }
}
