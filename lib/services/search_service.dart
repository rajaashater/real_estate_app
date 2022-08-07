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
      int? area,
      double? maxPrice,
      int? numberOfRooms,
      int? numberOfBathRooms,
        double? minPrice,
        String? countryID,
        String? state,
        String? propertyType,
      }) async {
    var url = Uri.parse('${AppConstants.baseUrl}${EndPoints.search}?area=${area ?? ''}&max_price=${maxPrice ?? ''}&number_of_rooms=${numberOfRooms ?? ''}&number_of_path_rooms=${numberOfBathRooms ?? ''}&min_price=${minPrice ?? ''}&country=${countryID ?? ''}&state=${state ?? ''}&property_type=${propertyType ?? ''}');
    print(url.queryParameters);
    var response = await http.get(url, headers: AppUtils.defaultHttpHeaders);
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
