import 'package:fitme/constants/routes.dart';
import 'package:fitme/screens/LoginScreen/login.dart';
import 'package:fitme/screens/RegisterScreen/register.dart';

getRoutes() {
  return {
    AppRoutes.login: (context) => LoginScreen(),
    AppRoutes.register: (context) => RegisterScreen(),
  };
}
