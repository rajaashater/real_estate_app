import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

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
              Icon(Icons.local_police_outlined),
              SizedBox(width: 5,),
              Text('security'.tr(),style:  Theme.of(context).textTheme.headline3,),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.wifi),
              SizedBox(width: 5,),
              Text('internet'.tr(),style:  Theme.of(context).textTheme.headline3,),
            ],
          ),
          SizedBox(height: 20,),

          Row(
            children: [
              Icon(Icons.local_parking),
              SizedBox(width: 5,),
              Text('parking'.tr(),style:  Theme.of(context).textTheme.headline3,),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.shopping_cart),
              SizedBox(width: 5,),
              Text('supermarket'.tr(),style:  Theme.of(context).textTheme.headline3,),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.mosque),
              SizedBox(width: 5,),
              Text('mosque'.tr(),style:  Theme.of(context).textTheme.headline3,),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.sports_basketball_rounded),
              SizedBox(width: 5,),
              Text('playground'.tr(),style:  Theme.of(context).textTheme.headline3,),
            ],
          ),
          SizedBox(height: 20,),

          Row(
            children: [
              Icon(Icons.park),
              SizedBox(width: 5,),
              Text('green_park'.tr(),style:  Theme.of(context).textTheme.headline3,),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.restaurant),
              SizedBox(width: 5,),
              Text('restaurant'.tr(),style:  Theme.of(context).textTheme.headline3,),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.sports_gymnastics),
              SizedBox(width: 5,),
              Text('gym'.tr(),style:  Theme.of(context).textTheme.headline3,),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.school),
              SizedBox(width: 5,),
              Text('school'.tr(),style:  Theme.of(context).textTheme.headline3,),
            ],
          ),
          SizedBox(height: 20,),

        ],
      ),
    ));
  }
}
