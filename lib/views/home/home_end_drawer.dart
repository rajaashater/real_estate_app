import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';
import 'package:real_estate_app/utils/theme/app_constants.dart';
import 'package:real_estate_app/views/components/components.dart';

import '../drawer/post_requirement_screen.dart';

class HomeEndDrawer extends StatelessWidget {
  const HomeEndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Drawer(
        backgroundColor: AppColors.primary,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Image.asset(AppConstants.logo, height: 50, width: 50,),
              const SizedBox(height: 40.0),
              Row(
                children: [
                  const Icon(
                    Icons.circle,
                    size: 10,
                  ),
                  const SizedBox(width: 5),
                  Text('filter'.tr(),
                      style: Theme.of(context).textTheme.headline1),
                  const SizedBox(
                    width: 70,
                  ),
                  SizedBox(
                    width: 120.0,
                    height: 35.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('reset_filter'.tr(),
                          style: Theme.of(context).textTheme.headline1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              KDropDownButtonFormField<String>(
                label: const Text('select_location'),
                  items: ['city1', 'city2', 'city3'].map((e) => DropdownMenuItem<String>(value: e, child: Text(e))).toList(),
                  ),
              const SizedBox(height: 20),
              KDropDownButtonFormField<String>(
                label: const Text('property_type'),
                items: ['type1', 'type2', 'type3'].map((e) => DropdownMenuItem<String>(value: e, child: Text(e))).toList(),
              ),
              const SizedBox(height: 20),
              Row(children: [
                const Icon(
                  Icons.circle,
                  size: 10,
                ),
                const SizedBox(width: 5,),
                Text('size'.tr(), style: Theme.of(context).textTheme.headline1),
              ]),
              const SizedBox(height:5),
              KRangeSlider(
                min: 10.0,
                max: 500.0,
                unit: 'M',
                onChanged: (value){
                  //TODO Save value
                },
              ),
              const SizedBox(height: 5),
              Row(children: [
                const Icon(
                  Icons.circle,
                  size: 10,
                ),
                const SizedBox(width: 5,),

                Text('price'.tr(),
                    style: Theme.of(context).textTheme.headline1),
              ]),
              const SizedBox(height: 10),
              KRangeSlider(
                min: 50.0,
                max: 1000.0,
                unit: 'SYP',
                onChanged: (value){
                  //TODO Save value
                },
              ),
              const SizedBox(height: 10),
              Row(children: [
                const Icon(
                  Icons.circle,
                  size: 10,
                ),
                const SizedBox(width: 5,),

                Text('number_of_rooms'.tr(),
                    style: Theme.of(context).textTheme.headline1),
              ]),
              const SizedBox(height: 10),
              KChoicesWrap<int>(
                list: AppConstants.numberOfRoomsList,
                onSelected: (value){
                //TODO Save value
              },
              ),
              const SizedBox(height: 10),
              Row(children: [
                const Icon(
                  Icons.circle,
                  size: 10,
                ),
                const SizedBox(width: 5,),

                Text('ownership'.tr(),
                    style: Theme.of(context).textTheme.headline1),
              ]),
              const SizedBox(height: 10),
              KChoicesWrap<String>(
                spacing: 20.0,
                list: AppConstants.ownershipList,
                onSelected: (value){
                  //TODO Save value
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 120.0,
                height: 35.0,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('search'.tr(),
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),
              const SizedBox(height: 20),

              TextButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => PostRequirementScreen())),
                child: Text('post_your_requirement'.tr()),
              ),


            ],
          ),
        ),
      ),
    );

  }
}
