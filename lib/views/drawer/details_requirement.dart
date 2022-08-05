import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';

import '../../services/real_estate_service.dart';
import '../../utils/theme/app_colors.dart';
import '../../utils/app_constants.dart';
import '../components/k_choices_wrap.dart';
import '../components/k_drop_down_button_form_field.dart';
import '../components/k_range_slider.dart';
import 'about_you_screen.dart';

class DetailsRequirementScreen extends StatelessWidget {
  DetailsRequirementScreen({Key? key, required this.ownership}) : super(key: key);
  final String ownership;
  final _formKey = GlobalKey<FormState>();
  String? _address;
  String?  _type;
  int? _numberOfRooms;
  double? _minPrice;
  double? _maxPrice;


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
        child: ListView(
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  KDropDownButtonFormField(
                    onSaved: (dynamic value) => _type = value,
                    label: Text('property_type'.tr()),
                    items: [
                      'apartment',
                      'house',
                      'duplex',
                      'land',
                      'villa',
                      'hotel',
                      'office',
                      'farm'
                    ]
                        .map((e) =>
                            DropdownMenuItem<String>(value: e, child: Text(e)))
                        .toList(),
                    validator: (value){
                      if(value == null){
                        return 'is_required'.tr();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onSaved: (value) => _address = value,
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
            Text('price'.tr(), style: Theme.of(context).textTheme.headline1),
            KRangeSlider(
              min: 50.0,
              max: 1000.0,
              unit: 'SYP',
              onChanged: (value){
                  _minPrice = value.start;
                  _maxPrice = value.end;
                },

            ),
            const SizedBox(
              height: 20.0,
            ),
            Text('number_of_rooms'.tr(),
                style: Theme.of(context).textTheme.headline1),
            const SizedBox(height: 10),
            KChoicesWrap<int>(
              list: AppConstants.numberOfRoomsList,
              onItemSelected: (dynamic value) {
                _numberOfRooms = value;
              },
            ),
            const SizedBox(
              height: 50.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 35.0,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_numberOfRooms == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: AppColors.primary,
                          content: Text(
                            'number of rooms is required'.tr(),
                            style: Theme.of(context).textTheme.headline1,
                          )));
                    }
                     else if(_minPrice == null || _maxPrice == null){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: AppColors.primary,
                          content: Text(
                            'price is required'.tr(),
                            style: Theme.of(context).textTheme.headline1,
                          )));
                    }
                    else {
                      showDialog(context: context, builder: (context) => Center(child: CircularProgressIndicator()), barrierDismissible: false);
                      var data = await RealEstateService().addDsire(_minPrice!,_maxPrice!, ownership, _type!, _address!, _numberOfRooms!);
                      if(data.success){
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.SUCCES,
                          animType: AnimType.BOTTOMSLIDE,
                          body: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Column(
                              children: [
                                Text(
                                  'done_successfully'.tr(),
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                const SizedBox(
                                  height: 25.0,
                                ),
                              ],
                            ),
                          ),
                        ).show();
                      }
                      else{
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.BOTTOMSLIDE,
                          body: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Column(
                              children: [
                                Text(
                                  'failed'.tr(),
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                const SizedBox(
                                  height: 25.0,
                                ),
                              ],
                            ),
                          ),
                        ).show();
                      }
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => AboutYouScreen()));
                    }
                  }
                },
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
