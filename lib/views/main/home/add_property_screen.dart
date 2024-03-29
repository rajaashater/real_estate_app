import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:real_estate_app/services/real_estate_service.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';
import 'package:real_estate_app/utils/app_constants.dart';
import 'package:real_estate_app/views/components/components.dart';
import 'package:real_estate_app/views/components/k_images_picker.dart';

import '../../../models/cities_get_model.dart';
import '../../../models/response_model.dart';
import '../../../services/cities_get_service.dart';

class AddPropertyScreen extends StatelessWidget {
  AddPropertyScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String? _propertyType;
  double? _price;
  String? _description;
  String? _status;
  String? _postType;
  List<XFile>? _images;
  String? _countryID;

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
              KImagesPicker(onImagesSaved: (images) => _images = images),
              const SizedBox(
                height: 20.0,
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
                list: context.locale.languageCode == 'en'
                    ? AppConstants.postListEn
                    : AppConstants.postListAr,
                onItemSelected: (dynamic value) {
                  _postType = value;
                },
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    KDropDownButtonFormField(
                      onSaved: (dynamic value) => _propertyType = value,
                      label: Text('property_type'.tr()),
                      items: [
                        'apartment',
                        'house',
                        'villa',
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
                          return 'is_required'.tr();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      onSaved: (dynamic value) =>
                          _price = double.tryParse(value),
                      keyboardType: TextInputType.number,
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
                    FutureBuilder<ResponseModel<List<CitiesGetModel>>>(
                        future: CitiesGetService().getCities(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return KDropDownButtonFormField<CitiesGetModel>(
                                label:  Text('select_location'.tr()),
                                validator: (value) {
                                  if (value == null) {
                                    return 'is_required'.tr();
                                  }
                                },
                                onSaved: (CitiesGetModel? value) => _countryID = value?.id.toString(),
                                items: (snapshot.data.data as List<CitiesGetModel>).map((CitiesGetModel e) => DropdownMenuItem<CitiesGetModel>(value: e, child: Text(e.country))).toList());
                          } else {
                            return Center(
                              child: CircularProgressIndicator(color: Colors.white),
                            );
                          }
                        }
                    ),
                    SizedBox(height: 20,),

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
                list: context.locale.languageCode == 'en'
                    ? AppConstants.statusListEn
                    : AppConstants.statusListAr,
                onItemSelected: (dynamic value) {
                  _status = value;
                },
              ),
              const SizedBox(
                height: 35.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 35.0,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (_status == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: AppColors.primary,
                            content: Text(
                              'is_required'.tr(),
                              style: Theme.of(context).textTheme.headline1,
                            )));
                      }
                      else if (_postType == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: AppColors.primary,
                            content: Text(
                              'is_required'.tr(),
                              style: Theme.of(context).textTheme.headline1,
                            )));
                      }
                      else if (_images == null || _images!.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: AppColors.primary,
                            content: Text(
                              'you_should_add_one_image_at_least'.tr(),
                              style: Theme.of(context).textTheme.headline1,
                            )));
                      } else {
                        showDialog(context: context, builder: (context) => Center(child: CircularProgressIndicator()), barrierDismissible: false);
                        // var data = await RealEstateService().addRealEstate(_price!, _images!, _status!, _propertyType!, _countryID!, _description!);

                        Timer.periodic(Duration(seconds: 4), (timer) {
                          Navigator.of(context).pop();
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
                        });
                        // AwesomeDialog(
                        //   context: context,
                        //   dialogType: DialogType.SUCCES,
                        //   animType: AnimType.BOTTOMSLIDE,
                        //   body: Padding(
                        //     padding: const EdgeInsets.symmetric(vertical: 15.0),
                        //     child: Column(
                        //       children: [
                        //         Text(
                        //           'done_successfully'.tr(),
                        //           style: Theme.of(context).textTheme.headline5,
                        //         ),
                        //         const SizedBox(
                        //           height: 25.0,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ).show();
                        // if(data.success){
                        //   AwesomeDialog(
                        //     context: context,
                        //     dialogType: DialogType.SUCCES,
                        //     animType: AnimType.BOTTOMSLIDE,
                        //     body: Padding(
                        //       padding: const EdgeInsets.symmetric(vertical: 15.0),
                        //       child: Column(
                        //         children: [
                        //           Text(
                        //             'done_successfully'.tr(),
                        //             style: Theme.of(context).textTheme.headline5,
                        //           ),
                        //           const SizedBox(
                        //             height: 25.0,
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ).show();
                        // }
                        // else{
                        //   AwesomeDialog(
                        //     context: context,
                        //     dialogType: DialogType.ERROR,
                        //     animType: AnimType.BOTTOMSLIDE,
                        //     body: Padding(
                        //       padding: const EdgeInsets.symmetric(vertical: 15.0),
                        //       child: Column(
                        //         children: [
                        //           Text(
                        //             'failed'.tr(),
                        //             style: Theme.of(context).textTheme.headline5,
                        //           ),
                        //           const SizedBox(
                        //             height: 25.0,
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ).show();
                        // }
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
