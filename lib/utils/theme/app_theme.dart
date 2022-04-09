import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/utils.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: AppUtils.createMaterialColor(AppColors.primary),
    secondaryHeaderColor: AppUtils.createMaterialColor(AppColors.secondary),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.normal,
        color:Colors.white,
        fontFamily:'TwCenClassMTStd-Regular.otf',),

      headline2: TextStyle(
          fontSize: 57.0,
          fontWeight: FontWeight.normal,
          color:AppColors.secondary,
          fontFamily:'TwCenClassMTStd-Regular.otf'),

      headline3: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.normal,
          color:Colors.white,
          fontFamily:'TwCenClassMTStd-Regular.otf'),),

    iconTheme: const IconThemeData(
        color:AppColors.secondary),
    //prefixIconTheme: PrefixIconThemeData(color: AppColors.secondary ),

    accentColor: AppColors.secondary,

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 380.0 ),
          borderRadius: BorderRadius.circular(24))
    ),

  );
  //textTheme: TextStyle(
  //fontFamily: 'TwCenClassMTStd-Regular.otf');
}