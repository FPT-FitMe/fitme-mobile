import '/constants/routes.dart';
import '/screens/LoginScreen/login.dart';
import '/screens/RegisterScreen/register.dart';

getRoutes() {
  return {
    AppRoutes.login: (context) => LoginScreen(),
    AppRoutes.register: (context) => RegisterScreen(),
  };
}
