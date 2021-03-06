import 'dart:convert';

import 'package:real_estate_app/main.dart';
import 'package:real_estate_app/models/cities_get_model.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate_app/utils/app_constants.dart';
import 'package:real_estate_app/utils/app_utils.dart';
import 'package:real_estate_app/utils/end_points.dart';

import '../models/response_model.dart';
class CitiesGetService {

  Future<ResponseModel<List<CitiesGetModel>>> getCities () async {
    var url = Uri.parse('${AppConstants.baseUrl}${EndPoints.cities_get}');
    var response = await http.get(url, headers: AppUtils.defaultHttpHeaders);
    print(response.body);
    if (response.statusCode == 200) {
      var parsedJson = json.decode(response.body);
      return ResponseModel<List<CitiesGetModel>>.fromJson(parsedJson, (data) =>
          (data as List).map((e) => CitiesGetModel.fromJson(e)).toList());
    }
    else
      throw Exception('not found cities');
  }
}