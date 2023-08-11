
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lighTheme = ThemeData.light().copyWith(
      primaryColor: Palette.primaryColor,
      scaffoldBackgroundColor: Palette.whiteColor,
      dialogBackgroundColor: Palette.grayColor,
      appBarTheme: AppBarTheme(
          backgroundColor: Palette.whiteColor,
          elevation: 0,
          toolbarHeight: 40),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: Palette.blackColor,
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          color: Palette.blackColor,
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
        displaySmall: TextStyle(
          //headline3
          color: Palette.blackColor,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          //headline4
          color: Palette.blackColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          //bodyText1
          color: Palette.blackColor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          //caption
          color: Palette.grayColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          //headline5
          color: Palette.blackColor,
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
      ),
      colorScheme: ColorScheme(
        error: Palette.errorColor,
        background: Palette.lightColor,
        brightness: Brightness.light,
        onBackground: Palette.grayColor,
        onError: Palette.grayColor,
        onPrimary: Palette.primaryColor,
        onSecondary: Palette.lightColor,
        onSurface: Palette.grayColor,
        primary: Palette.primaryColor,
        secondary: Palette.grayColor,
        surface: Palette.primaryColorWithOpacity,
      ));
}

class Palette {
  static Color primaryColor = const Color(0xff5877ff);
  static Color primaryColorWithOpacity = const Color(0xffD5DDFF);
  static Color accentColor = const Color(0xff00DBC9);
  static Color whiteColor =   Colors.white;
  static Color blackColor =   Colors.black;
  static Color grayColor = const Color(0xffA1A6BD);
  static Color errorColor = const Color(0xffff2a63);
  static Color yellowColor = const Color(0xffffc205);
  static Color blueColor = const Color(0xff598ef1);
  static Color greenColor = const Color(0xff59f17f);
  static Color lightColor =   Colors.white;
  static Color darkColor = const Color(0xff2D3142);
}
