import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/utils.dart';

abstract class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: AppUtils.createMaterialColor(AppColors.primary),
    fontFamily:'TwCenClassMTStd',
    textSelectionTheme: TextSelectionThemeData(cursorColor: AppColors.secondary, selectionColor: AppColors.secondary, selectionHandleColor: AppColors.secondary.withOpacity(0.6)),
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
         ),

      headline4: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.normal,
        color:Colors.white,
      ),
      subtitle1: TextStyle(
        color:Colors.white,
      ),
    ),


    iconTheme: const IconThemeData(
        color:AppColors.secondary),
    //prefixIconTheme: PrefixIconThemeData(color: AppColors.secondary ),



    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.secondary,
      labelStyle: const TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(24)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(24)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          borderRadius: BorderRadius.circular(24)),
    ),

  );
  //textTheme: TextStyle(
  //fontFamily: 'TwCenClassMTStd-Regular.otf');
}