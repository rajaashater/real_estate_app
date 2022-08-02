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
      }) async {
    var url = Uri.parse('${AppConstants.baseUrl}${EndPoints.search}');
    var response = await http.post(url, headers: AppUtils.defaultHttpHeaders);
    print(response);
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
