import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:real_estate_app/views/home/post_done_screen.dart';

import '../../utils/theme/app_colors.dart';
import '../../utils/theme/app_constants.dart';
import '../components/k_choices_wrap.dart';
import '../components/k_drop_down_button_form_field.dart';

class AddPropertyScreen extends StatelessWidget {
  AddPropertyScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String? _type;
  double? _price;
  String? _description;
  String? _status;
  String? _posttype;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add_property'.tr(),
            style: Theme.of(context).textTheme.headline1),
      ),
      backgroundColor: AppColors.primary,
      body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: [
              Text('post_your_property_in_simple_steps'.tr(),
                  style: Theme.of(context).textTheme.headline3),
              const SizedBox(
                height: 40.0,
              ),
              Row(children: [
                const Icon(
                  Icons.circle,
                  size: 10,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text('i_want_to'.tr(),
                    style: Theme.of(context).textTheme.headline1),
              ]),
              const SizedBox(height: 10),
              KChoicesWrap<String>(
                spacing: 20.0,
                list: AppConstants.postList,
                onItemSelected: (dynamic value) {
                  _posttype = value;
                  //TODO Save value
                },
              ),
              const SizedBox(height: 30),
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
                        'hotel',
                        'office',
                        'farm'
                      ]
                          .map((e) => DropdownMenuItem<String>(
                              value: e, child: Text(e)))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'required';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),

                    TextFormField(
                      onSaved: (dynamic value) => _price = value,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                        labelText: 'add_price(SYP)'.tr(),
                      ),
                      validator: qValidator([
                        IsRequired(),
                      ]),
                    ),

                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      onSaved: (dynamic value) => _description = value,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                        labelText: 'description'.tr(),
                      ),
                      validator: qValidator([
                        IsRequired(),
                      ]),
                    ),

                  ],
                ),
              ),
              const SizedBox(
                height: 35.0,
              ),
              Row(children: [
                const Icon(
                  Icons.circle,
                  size: 10,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text('current_status'.tr(),
                    style: Theme.of(context).textTheme.headline1),
              ]),
              const SizedBox(height: 10),
              KChoicesWrap<String>(
                spacing: 20.0,
                list: AppConstants.statusList,
                onItemSelected: (dynamic value) {
                  _status = value;
                  //TODO Save value
                },
              ),
              const SizedBox(height: 20.0,),

               const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 35.0,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (_status == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: AppColors.primary,
                            content: Text(
                              ' Is required'.tr(),
                              style: Theme.of(context).textTheme.headline1,
                            )));
                      }
                    if (_posttype == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: AppColors.primary,
                            content: Text(
                              ' is required'.tr(),
                              style: Theme.of(context).textTheme.headline1,
                            )));}
                  else {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => PostDoneScreen()));
                      }
                    }
                  },
                  child: Text('next'.tr(),
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),
            ],
          )),
    );
  }
}
