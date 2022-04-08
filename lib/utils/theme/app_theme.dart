import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/utils.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: AppUtils.createMaterialColor(AppColors.primary),
    // fontFamily: 'Schyler'
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(24))
    )
  );
}