import 'dart:convert';

import 'package:real_estate_app/models/real_estate_model.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate_app/utils/app_constants.dart';
import 'package:real_estate_app/utils/app_utils.dart';
import 'package:real_estate_app/utils/end_points.dart';

import '../models/response_model.dart';

class SearchService {

  Future<ResponseModel<List<RealEstateModel>>> search(
      {
      double? area,
      double? maxPrice,
      int? numberOfRooms,
      int? numberOfBathRooms,
        double? minPrice,
        String? countryID,
        String? state,
      }) async {
    var url = Uri.parse('${AppConstants.baseUrl}${EndPoints.search}?');
    var response = await http.get(url, body: {
      if(area != null) 'area': area,
      if(maxPrice != null) 'max_price': maxPrice,
      if(numberOfRooms != null) 'number_of_rooms': numberOfRooms,
      if(numberOfBathRooms != null) 'number_of_path_rooms': numberOfBathRooms,
      if(minPrice != null) 'min_price': minPrice,
      if(countryID != null) 'country': countryID,
      if(state != null) 'state': state,
    },headers: AppUtils.defaultHttpHeaders);
    print(response.body);
    if (response.statusCode == 200) {
      var parsedJson = json.decode(response.body);
      return ResponseModel<List<RealEstateModel>>.fromJson(
          parsedJson, (data) => (data as List).map((e) => RealEstateModel.fromJson(e)).toList());
    }
    else {
      throw Exception('Not Found a Result');
    }
  }
}
