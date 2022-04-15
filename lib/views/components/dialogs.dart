import 'package:flutter/material.dart';

abstract class Dialogs{
  static Future showRateDialog(){
    return showDialog(context: context, builder: builder)
  }
}