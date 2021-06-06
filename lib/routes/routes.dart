import 'package:fitme/constants/routes.dart';
import 'package:fitme/screens/LoginScreen/login.dart';
import 'package:fitme/screens/RegisterScreen/register.dart';
import 'package:fitme/screens/NewUserInfoScreen/new_user_info.dart';
import 'package:fitme/screens/SettingScreen/setting.dart';
import 'package:fitme/screens/SurveyScreen/survey.dart';
import 'package:fitme/screens/UserProfileScreen/user_profile.dart';

getRoutes() {
  return {
    AppRoutes.login: (context) => LoginScreen(),
    AppRoutes.register: (context) => RegisterScreen(),
    AppRoutes.newUserInfo: (context) => NewUserInfoScreen(),
    AppRoutes.survey: (context) => SurveyScreen(),
    AppRoutes.userProfile: (context) => UserProfileScreen(),
    AppRoutes.setting: (context) => SettingScreen(),
  };
}
