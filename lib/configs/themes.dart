import 'package:fitme/constants/colors.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/services.dart';
=======
>>>>>>> fde812eb00b604d2d685102929a11c6ee98afbae

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
<<<<<<< HEAD
          contentPadding: new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
=======
          contentPadding:
              new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
>>>>>>> fde812eb00b604d2d685102929a11c6ee98afbae
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
