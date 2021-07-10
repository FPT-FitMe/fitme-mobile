import 'package:fitme/screens/BottomBarScreen/bottom_bar.dart';
import 'package:fitme/screens/GettingStartedScreen/getting_started.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'configs/themes.dart';
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
      home: FutureBuilder(
        future: _checkUserLogin(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return BottomBarScreen();
          } else {
            return GettingStartedScreen();
          }
        },
      ),
      routes: getRoutes(),
      onGenerateRoute: (settings) {
        generateRoutes(settings);
      },
    );
  }

  Future<String?> _checkUserLogin() async {
    FlutterSecureStorage _storage = new FlutterSecureStorage();
    var userToken = await _storage.read(key: "userToken");
    return userToken;
  }
}
