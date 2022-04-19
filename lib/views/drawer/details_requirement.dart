import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';

import '../../utils/theme/app_colors.dart';
import '../../utils/theme/app_constants.dart';
import '../components/k_choices_wrap.dart';
import '../components/k_drop_down_button_form_field.dart';
import '../components/k_range_slider.dart';
import 'about_you_screen.dart';

class DetailsRequirementScreen extends StatelessWidget {
  DetailsRequirementScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String? _city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Text('details_your_requirement'.tr(),
            style: Theme.of(context).textTheme.headline1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child:  ListView(
          children: [
            Text(
              'go_it'.tr(),
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text('what_type_of_property_you_need'.tr(),
                style: Theme.of(context).textTheme.headline3),
            const SizedBox(
              height: 30.0,
            ),
            KDropDownButtonFormField<String>(
              label: const Text('select_property_type'),
              items: [
                'apartment',
                'house',
                'duplex',
                'land',
                'hotel',
                'office',
                'farm'
              ]
                  .map(
                      (e) => DropdownMenuItem<String>(value: e, child: Text(e)))
                  .toList(),

            ),
            const SizedBox(
              height: 20.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (value) => _city = value,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: 'city/address'.tr(),
                    ),
                    validator: qValidator([
                      IsRequired(),
                    ]),
                  ),
                  ],
              ),
            ),
                  const SizedBox(
                    height: 30.0,
                  ),

                    Text('price'.tr(),
                        style: Theme.of(context).textTheme.headline1),

                  KRangeSlider(
                    min: 50.0,
                    max: 1000.0,
                    unit: 'SYP',
                    onChanged: (value){
                      //TODO Save value
                    },
                  ),
            const SizedBox(height: 20.0,),
            Text('number_of_rooms'.tr(),
                style: Theme.of(context).textTheme.headline1),
            const SizedBox(height: 10),
            KChoicesWrap<int>(
              list: AppConstants.numberOfRoomsList,
              onSelected: (value){
                //TODO Save value
              },
            ),
            const SizedBox(height: 50.0,),

            SizedBox(
              width: double.infinity,
              height: 35.0,
              child: ElevatedButton(
                onPressed: ()  => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => AboutYouScreen())),
                child: Text('continue'.tr(),
                    style: Theme.of(context).textTheme.headline1),
              ),
            ),


          ],
        ),


      ),
    );
  }
}
