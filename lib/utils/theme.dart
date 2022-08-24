import 'package:flutter/material.dart';

class AppTheme {
  final Color primaryColor = Colors.redAccent;

  final Color lightThemeColor = Colors.white;
  final Color darkThemeColor = Colors.black;

  TextTheme customTheme({required Color? color}) {
    return TextTheme(
      headline1:
          TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: 32.0),
      headline2:
          TextStyle(color: color, fontWeight: FontWeight.w400, fontSize: 16.0),
    );

    ThemeData lightTheme() {
      return ThemeData(
        primaryColor: primaryColor,
        backgroundColor: lightThemeColor,
      );
    }
  }
}
