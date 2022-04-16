

import 'dart:js';

import 'package:flutter/material.dart';

abstract class Dialogs{
  static Future ShowRateDialog(context){
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Rate us'),
          content: Text('Content')));
  }
  //static Future ShowErrorDialog(){return showDialog(context: context, builder: builder)}
}