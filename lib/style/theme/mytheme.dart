import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = Color(0xff39A552);
  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )),
        backgroundColor: primaryColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
      ),
      drawerTheme: DrawerThemeData(
        scrimColor: primaryColor,
      ),
      textTheme: TextTheme(
          bodyMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      )));
}
