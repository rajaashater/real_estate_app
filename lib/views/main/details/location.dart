import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
            children: [
        Row(
        children: [
        Icon(Icons.location_on_outlined),
        SizedBox(width: 5,),
        Text('Malki'.tr(),style:  Theme.of(context).textTheme.headline3,),
        ],
      ),
        SizedBox(height: 20,),
      ]
    ),
    ),
    );
  }
}
