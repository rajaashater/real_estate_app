import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';

import '../../../models/real_estate_model.dart';

class Specification extends StatelessWidget {
  const Specification({Key? key, required this.realEstateModel}) : super(key: key);
  final RealEstateModel realEstateModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        shape: Border.all(color: AppColors.primary,width: 8,),
        elevation: 1,
          backgroundColor: Colors.white38,
        title: Text(realEstateModel.state,style: Theme.of(context).textTheme.headline3,),
      ),

      body: Padding( padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(Icons.house),
                SizedBox(width: 5,),
                Text('${'property_type'.tr()}: ',style:  Theme.of(context).textTheme.headline3,),
                Text(realEstateModel.property_type,style:  Theme.of(context).textTheme.headline3,),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.area_chart_sharp),
                SizedBox(width: 5,),
                Text('${'area'.tr()}: ',style:  Theme.of(context).textTheme.headline3,),
                Text(realEstateModel.area.toString(),style:  Theme.of(context).textTheme.headline3,),

              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.fact_check),
                SizedBox(width: 5,),
                Text('${'type'.tr()}: ',style:  Theme.of(context).textTheme.headline3,),
                Text(realEstateModel.type,style:  Theme.of(context).textTheme.headline3,),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.chair_alt),
                SizedBox(width: 5,),
                Text('${'state'.tr()}: ',style:  Theme.of(context).textTheme.headline3,),
                Text(realEstateModel.state,style:  Theme.of(context).textTheme.headline3,),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.bed),
                SizedBox(width: 5,),
                Text('${'number_of_bedrooms'.tr()}: '.tr(),style:  Theme.of(context).textTheme.headline3,),
                SizedBox(width: 3,),
                Text(realEstateModel.number_of_rooms.toString(),style:  Theme.of(context).textTheme.headline3,)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.bathtub),
                SizedBox(width: 5,),
                Text('${'number_of_bathrooms'.tr()} : ',style:  Theme.of(context).textTheme.headline3,),
                SizedBox(width: 3,),
                Text(realEstateModel.number_of_path_rooms.toString(),style:  Theme.of(context).textTheme.headline3,)
              ],
            ),
            SizedBox(height: 20,),

            Row(
              children: [
                Icon(Icons.stairs),
                SizedBox(width: 5,),
                Text('${'number_of_floors'.tr()} : ',style:  Theme.of(context).textTheme.headline3,),
                SizedBox(width: 3,),
                Text(realEstateModel.floor.toString(),style:  Theme.of(context).textTheme.headline3,)
              ],
            ),
            SizedBox(height: 20,),
            Padding(padding: const EdgeInsets.all(5.0),
              child: Container(
                child: Text('This house is located in Damascus_Malki it covers an area of 200 square meter , 4 bedrooms ,3 bathrooms ,2 hall , parking ... ', style:  Theme.of(context).textTheme.headline6,),

              ),
            ),




          ],
        ),
      ),
    );
  }
}

