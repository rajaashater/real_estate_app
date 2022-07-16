import 'dart:convert';

import 'package:real_estate_app/models/search_model.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate_app/utils/app_constants.dart';
import 'package:real_estate_app/utils/end_points.dart';

import '../models/response_model.dart';

class SearchService {

  Future<ResponseModel<SearchModel>> search() async {
    var url = Uri.parse('${AppConstants.baseUrl}${EndPoints.search}');
    var response = await http.post(url, body: {});
    print(response);
    if (response.statusCode == 200) {
      var parsedJson = json.decode(response.body);
      return ResponseModel<SearchModel>.fromJson(
          parsedJson, (data) => SearchModel.fromJson(data));
    }
    else {
      throw Exception('Not Found a Result');
    }
  }
}
