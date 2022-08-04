import 'dart:convert';

import 'package:real_estate_app/models/real_estate_model.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate_app/utils/app_constants.dart';
import 'package:real_estate_app/utils/app_utils.dart';
import 'package:real_estate_app/utils/end_points.dart';

import '../models/response_model.dart';

class RealEstateService {

  Future<ResponseModel<List<RealEstateModel>>> showPage() async {
    var url = Uri.parse('${AppConstants.baseUrl}${EndPoints.show_page}');
    var response = await http.get(url, headers: AppUtils.defaultHttpHeaders);
    print(response.body);
    if (response.statusCode == 200) {
      var parsedJson = json.decode(response.body);
      return ResponseModel<List<RealEstateModel>>.fromJson(
          parsedJson, (data) => (data as List).map((e) => RealEstateModel.fromJson(e)).toList());
    }
    else {
      throw Exception('Failed find page');
    }
  }

  Future<ResponseModel<RealEstateModel>> addRealEstate(double price,) async {
    var url = Uri.parse('${AppConstants.baseUrl}${EndPoints.show_page}');
    var response = await http.post(url, body: {
      'address' : '','floor':'','area':'','price': price,'number_of_rooms':'','number_of_bath_rooms':'',

    } ,headers:AppUtils.defaultHttpHeaders);
    print(response);
    if (response.statusCode == 200) {
      var parsedJson = json.decode(response.body);
      return ResponseModel<RealEstateModel>.fromJson(
          parsedJson, (data) => RealEstateModel.fromJson(data));
    }
    else {
      throw Exception('Failed find page');
    }
  }


}