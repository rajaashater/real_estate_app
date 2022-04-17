import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/app_utils.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: AppUtils.createMaterialColor(AppColors.primary),
    fontFamily:'TwCenClassMTStd',
    textSelectionTheme: TextSelectionThemeData(cursorColor: AppColors.secondary, selectionColor: AppColors.secondary, selectionHandleColor: AppColors.secondary.withOpacity(0.6)),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.normal,
        color:Colors.white,
        ),
      headline2: TextStyle(
          fontSize: 45.0,
          fontWeight: FontWeight.normal,
          color:AppColors.secondary,
          ),
      headline3: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.normal,
          color:Colors.white,
         ),
      headline4: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.normal,
        color:AppColors.secondary,
      ),


      subtitle1: TextStyle(
        color:Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.secondary),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)))
      )
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.white))
    ),
    iconTheme: const IconThemeData(
        color:AppColors.secondary),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.secondary,
      labelStyle: const TextStyle(color: Colors.white),
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(24)),
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
    sliderTheme: SliderThemeData(
        thumbColor: AppColors.secondary,
        activeTrackColor: AppColors.secondary,
        inactiveTrackColor: Colors.white,
    ),
    chipTheme: ChipThemeData(selectedColor: AppColors.secondary),
  );
  //textTheme: TextStyle(
  //fontFamily: 'TwCenClassMTStd-Regular.otf');
}