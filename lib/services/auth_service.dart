import 'package:http/http.dart' as http;
import 'package:real_estate_app/models/response_model.dart';
import 'dart:convert';

import 'package:real_estate_app/utils/app_constants.dart';

import '../models/auth_model.dart';
import '../utils/end_points.dart';

class AuthService{
  Future<ResponseModel<AuthModel>?> login(String email, String password) async {
    var url = Uri.parse('${AppConstants.baseUrl}${EndPoints.login}');
    var response = await http.post(url,
        body: {
      "email" : email,
      "password" : password
    });
    if(response.statusCode == 200){
      Map<String, dynamic> parsedResponse = jsonDecode(response.body);
      return ResponseModel<AuthModel>.fromJson(parsedResponse, (data) => AuthModel.fromJson(data));
    }
    else{
      print('Error');
    }
  }
}