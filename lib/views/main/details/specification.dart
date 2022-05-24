import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';

class Specification extends StatelessWidget {
  const Specification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        shape: Border.all(color: AppColors.primary,width: 8,),
        elevation: 1,
          backgroundColor: Colors.white38,
        title: Text('sale'.tr(),style: Theme.of(context).textTheme.headline3,),
      ),

      body: Padding( padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(Icons.house),
                SizedBox(width: 5,),
                Text('house'.tr(),style:  Theme.of(context).textTheme.headline3,),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.area_chart_sharp),
                SizedBox(width: 5,),
                Text('200 m'.tr(),style:  Theme.of(context).textTheme.headline3,),
                Text('2')
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.fact_check),
                SizedBox(width: 5,),
                Text('green_tabu'.tr(),style:  Theme.of(context).textTheme.headline3,),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.chair_alt),
                SizedBox(width: 5,),
                Text('furnished'.tr(),style:  Theme.of(context).textTheme.headline3,),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.bed),
                SizedBox(width: 5,),
                Text('number_of_bedrooms: '.tr(),style:  Theme.of(context).textTheme.headline3,),
                SizedBox(width: 3,),
                Text('4',style:  Theme.of(context).textTheme.headline3,)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.bathtub),
                SizedBox(width: 5,),
                Text('number_of_bathrooms: '.tr(),style:  Theme.of(context).textTheme.headline3,),
                SizedBox(width: 3,),
                Text('3',style:  Theme.of(context).textTheme.headline3,)
              ],
            ),
            SizedBox(height: 20,),

            Row(
              children: [
                Icon(Icons.chair),
                SizedBox(width: 5,),
                Text('number_of_hall: '.tr(),style:  Theme.of(context).textTheme.headline3,),
                SizedBox(width: 3,),
                Text('2',style:  Theme.of(context).textTheme.headline3,)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.stairs),
                SizedBox(width: 5,),
                Text('number_of_floors: '.tr(),style:  Theme.of(context).textTheme.headline3,),
                SizedBox(width: 3,),
                Text('7',style:  Theme.of(context).textTheme.headline3,)
              ],
            ),
            SizedBox(height: 20,),




          ],
        ),
      ),
    );
  }
}

