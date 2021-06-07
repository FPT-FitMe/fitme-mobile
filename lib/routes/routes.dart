import 'package:fitme/constants/routes.dart';
import 'package:fitme/screens/LoginScreen/login.dart';
import 'package:fitme/screens/PostScreen/postscreen.dart';
import 'package:fitme/screens/RegisterScreen/register.dart';
import 'package:fitme/screens/DetailMealScreen/detailmeal.dart';


getRoutes() {
  return {
    AppRoutes.login: (context) => LoginScreen(),
    AppRoutes.register: (context) => RegisterScreen(),
    AppRoutes.post: (context) => PostScreen(),
    AppRoutes.detailmeal: (context) => DetailMealScreen(),
  };
}
