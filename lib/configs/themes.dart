import 'package:fitme/constants/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData get defaultTheme {
    return ThemeData(
        primaryColor: AppColors.primary,
        primarySwatch: Colors.orange,
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: AppColors.textColor,
        ),
        fontFamily: 'SF-Pro-Display',
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(fontSize: 18, color: AppColors.grayText),
          contentPadding:
              new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: AppColors.primary)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(primary: AppColors.primary)),
        buttonTheme: ButtonThemeData(buttonColor: AppColors.primary));
  }
}
