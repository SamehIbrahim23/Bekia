import 'package:flutter/material.dart';
import 'package:test_project/ui/themes/font.dart';
import 'app_color.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColor.bodyPrimaryColor,
  secondaryHeaderColor: AppColor.bodySecondaryColor,
  scaffoldBackgroundColor: AppColor.bodyPrimaryColor,
  primaryColorLight: AppColor.buttonBackgroundColor,
  cardColor: AppColor.externalColor,
  hintColor: AppColor.textColor,
  textTheme: TextTheme(
    headlineLarge:
        TextStyle(color: Colors.white, fontSize: 34, fontFamily: Font.bold),
    headlineMedium:
        TextStyle(color: Colors.white, fontSize: 16, fontFamily: Font.semiBold),
    headlineSmall:
        TextStyle(color: Colors.white, fontSize: 14, fontFamily: Font.regular),
    bodyLarge:
        TextStyle(color: Colors.grey[700], fontSize: 16, fontFamily: Font.bold),
    bodyMedium: TextStyle(
        color: Colors.grey[700], fontSize: 12, fontFamily: Font.semiBold),
    bodySmall: TextStyle(
        color: Colors.grey[500], fontSize: 12, fontFamily: Font.regular),
  ),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    buttonColor: AppColor.buttonBackgroundColor,
  ),
);
