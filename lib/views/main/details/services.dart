import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';

import '../../../models/real_estate_model.dart';

class Services extends StatelessWidget {
  const Services({Key? key, required this.realEstateModel}) : super(key: key);
  final RealEstateModel realEstateModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Text(realEstateModel.services[index],style:  Theme.of(context).textTheme.headline3,);
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 20,),
        itemCount: realEstateModel.services.length,
      ),
    ));
  }
}
