import 'dart:convert';

import 'package:real_estate_app/models/auth_model.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate_app/utils/app_constants.dart';
import 'package:real_estate_app/utils/end_points.dart';

import '../models/response_model.dart';

class AuthService{

  Future<ResponseModel<AuthModel>> login(String email, String password) async {
    var url = Uri.parse('${AppConstants.baseUrl}${EndPoints.login}');
    var response = await http.post(url, body: {'email': email, 'password': password});
    print(response);
    if(response.statusCode == 200) {
      var parsedJson = json.decode(response.body);
      return ResponseModel<AuthModel>.fromJson(parsedJson, (data) => AuthModel.fromJson(data));
    }
    else{
      throw Exception('Failed to login');
    }
  }

  Future<ResponseModel<AuthModel>> register(String name, String email, String password, String phone, String gender) async {
    var url = Uri.parse('${AppConstants.baseUrl}${EndPoints.register}');
    var response = await http.post(url, body: {'name': name, 'email': email, 'password': password, 'c_password' : password, 'phone': phone, 'gender' : gender});
    print(response);
    if(response.statusCode == 200) {
      var parsedJson = json.decode(response.body);
      return ResponseModel<AuthModel>.fromJson(parsedJson, (data) => AuthModel.fromJson(data));
    }
    else{
      throw Exception('Failed to register');
    }
  }

  //return ResponseModel<List<CityModel>>.fromJson(parsedJson, (data) => (data as List).map((e) => CityModel.fromJson(e)).toList());
}