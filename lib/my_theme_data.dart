import 'package:flutter/material.dart';
import 'package:islamiapp/app_colors.dart';

class MyThemeData {
  static ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.transparentColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.blackColor,
        iconTheme: IconThemeData(
          color: AppColors.primaryColor,

        ),
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.blackColor,
        showSelectedLabels: true,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.whiteColor,
        ),
        titleMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor,
        ),
      ));
}
