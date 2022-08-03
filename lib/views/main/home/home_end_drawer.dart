import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/models/cities_get_model.dart';
import 'package:real_estate_app/models/response_model.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';
import 'package:real_estate_app/utils/app_constants.dart';
import 'package:real_estate_app/views/components/components.dart';
import 'package:real_estate_app/views/drawer/post_requirement_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/real_estate_model.dart';
import '../../../services/cities_get_service.dart';
import '../../../services/search_service.dart';
import 'home_screen.dart';

class HomeEndDrawer extends StatelessWidget {
   HomeEndDrawer({Key? key, required this.onSearch}) : super(key: key);
   final Function(Future<ResponseModel<List<RealEstateModel>>> data) onSearch;
  double? _area;
  double? _minPrice;
  double? _maxPrice;
  // String? _propertyType;
  int? _numberOfRooms;
  int? _numberOfBathRooms;
  String? _countryID;
  String? _state;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Drawer(
        backgroundColor: AppColors.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              Image.asset(AppConstants.logo, height: 50, width: 50,),
              const SizedBox(height: 20.0),
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
              Column(
                children: [
                  FutureBuilder<ResponseModel<List<CitiesGetModel>>>(
                    future: CitiesGetService().getCities(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return KDropDownButtonFormField<CitiesGetModel>(
                              label:  Text('select_location'.tr()),
                              onSaved: (CitiesGetModel? value) => _countryID = value?.id.toString(),
                              items: (snapshot.data.data as List<CitiesGetModel>).map((CitiesGetModel e) => DropdownMenuItem<CitiesGetModel>(value: e, child: Text(e.country))).toList());
                        } else {
                          return Center(
                            child: CircularProgressIndicator(color: Colors.white),
                          );
                        }
                      }
                  ),
                  const SizedBox(height: 20),
                  KDropDownButtonFormField<String>(
                    label:  Text('property_type'.tr()),
                    items: ['type1', 'type2', 'type3'].map((e) => DropdownMenuItem<String>(value: e, child: Text(e))).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(children: [
                const Icon(
                  Icons.circle,
                  size: 10,
                ),
                const SizedBox(width: 5,),
                Text('area'.tr(), style: Theme.of(context).textTheme.headline1),
              ]),
              const SizedBox(height:5),
              KRangeSlider(
                min: 10.0,
                max: 500.0,
                unit: 'M',
                onChanged: (value){
                  _area = value.start;
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
                  _minPrice = value.start;
                  _maxPrice = value.end;
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
                onItemSelected: (dynamic value){
                  _numberOfRooms = value;
              },
              ),
              const SizedBox(height: 10),
              Row(children: [
                const Icon(
                  Icons.circle,
                  size: 10,
                ),
                const SizedBox(width: 5,),
                Text('number_of_bathrooms'.tr(),
                    style: Theme.of(context).textTheme.headline1),
              ]),
              const SizedBox(height: 10),
              KChoicesWrap<int>(
                list: AppConstants.numberOfRoomsList,
                onItemSelected: (dynamic value){
                  _numberOfBathRooms = value;
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
                list: context.locale.languageCode == 'en' ? AppConstants.ownershipListEn : AppConstants.ownershipListAr,
                onItemSelected: (dynamic value){
                   _state = value;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 120.0,
                height: 35.0,
                child: ElevatedButton(
                  onPressed: () async {
                    var SearchData = SearchService().search(area: _area ,minPrice: _minPrice ,maxPrice: _maxPrice, numberOfRooms: _numberOfRooms, numberOfBathRooms: _numberOfBathRooms, countryID: _countryID);
                    onSearch(SearchData);
                    Navigator.of(context).pop();
                    },
                  child: Text('search'.tr(),
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => PostRequirementScreen())),
                child: Text('request_property'.tr()),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
