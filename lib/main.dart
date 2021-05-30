import 'configs/themes.dart';
import 'constants/routes.dart';
import 'routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemes.defaultTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      routes: getRoutes(),
    );
  }
}
