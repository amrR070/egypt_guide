import 'package:flutter/material.dart';
import 'AppColors.dart';
class AppStyle{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    textTheme: TextTheme(
      labelSmall: TextStyle(
        fontSize: 16,
        color: AppColors.lableColor
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        color: Colors.black
      ),
      bodySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.lightBackgroundColor
      )
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
      primary: AppColors.lightPrimaryColor
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightBackgroundColor,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.white,
            size: 27
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 30
      ),
      selectedIconTheme: IconThemeData(
        color: Colors.black,
        size: 30
      ),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      backgroundColor: AppColors.lightBackgroundColor,
    ),
    useMaterial3: true,
  );
}