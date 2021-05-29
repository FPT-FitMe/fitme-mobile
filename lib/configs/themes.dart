import 'package:fitme/constants/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData get defaultTheme {
    return ThemeData(
        primaryColor: AppColors.PRIMARY_COLOR,
        primarySwatch: Colors.orange,
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: AppColors.TEXT_COLOR,
        ),
        fontFamily: 'SF-Pro-Display',
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(primary: AppColors.PRIMARY_COLOR)),
        buttonTheme: ButtonThemeData(buttonColor: AppColors.PRIMARY_COLOR));
  }
}
