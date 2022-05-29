import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:real_estate_app/utils/app_constants.dart';

import '../utils/end_points.dart';

class AuthService{
  Future<void> login(String email, String password) async {
    var url = Uri.parse('${AppConstants.baseUrl}${EndPoints.login}');
    var response = await http.post(url,
        body: {
      "email" : email,
      "password" : password
    });
    print(response.body);
  }
}