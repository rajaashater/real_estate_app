import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/utils.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData(
    primarySwatch: AppUtils.createMaterialColor(AppColors.primary),
    secondaryHeaderColor: AppUtils.createMaterialColor(AppColors.secondary),
    fontFamily:'TwCenClassMTStd-Regular',
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.normal,
        color:Colors.white,
        ),

      headline2: TextStyle(
          fontSize: 57.0,
          fontWeight: FontWeight.normal,
          color:AppColors.secondary,
          ),

      headline3: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.normal,
          color:Colors.white,
         ),),

    iconTheme: const IconThemeData(
        color:AppColors.secondary),
    //prefixIconTheme: PrefixIconThemeData(color: AppColors.secondary ),



    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 3.0 ),
          borderRadius: BorderRadius.circular(24))
    ),

  );
  //textTheme: TextStyle(
  //fontFamily: 'TwCenClassMTStd-Regular.otf');
}