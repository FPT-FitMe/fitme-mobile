import 'configs/themes.dart';
import 'constants/routes.dart';
import 'routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitMe',
      theme: AppThemes.defaultTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('vi', ''), // Vietnam, no country code
      ],
      initialRoute: AppRoutes.mainScreen,
      routes: getRoutes(),
      onGenerateRoute: (settings) {
        generateRoutes(settings);
      },
    );
  }
}
