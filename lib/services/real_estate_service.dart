import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'package:real_estate_app/main.dart';
import 'package:real_estate_app/models/real_estate_model.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate_app/models/user_model.dart';
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

  Future<ResponseModel<List<RealEstateModel>>> getMyRealEstate() async {
    var url = Uri.parse('${AppConstants.baseUrl}${EndPoints.get_your_real}/${UserModel.fromJson(json.decode(sharedPreferences.getString('user') ?? '{}')).id}');
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

  Future<ResponseModel<bool>> deleteRealEstate(int id) async {
    var url = Uri.parse('${AppConstants.baseUrl}${EndPoints.delete_real_estate}/$id');
    var response = await http.delete(url, headers: AppUtils.defaultHttpHeaders);
    print(response.body);
    if (response.statusCode == 200) {
      var parsedJson = json.decode(response.body);
      return ResponseModel<bool>.fromJson(parsedJson, (data) => data);
    }
    else {
      throw Exception('Failed');
    }
  }

  Future<ResponseModel<RealEstateModel>> addRealEstate(double price,List<XFile> images, String state,String  propertyType,String countryId,String description) async {
    var url = Uri.parse('${AppConstants.baseUrl}${EndPoints.show_page}');
    var headers = AppUtils.defaultHttpHeaders;
    var request = http.MultipartRequest('POST', url);
    request.fields.addAll({
      'address': 'kljg',
      'floor': '5',
      'area': '32',
      'price': price.toString(),
      'number_of_rooms': '3',
      'number_of_path_rooms': '2',
      'cover': 'cover.jpg',
      'image': 'image.jpg',
      'state': state,
      'type': 'court',
      'property_type': propertyType,
      'cities_id': countryId,
      'furnished': state,
      'services': 'internet',
      'countF': '5',
      'description': description,
      'end_r_date': '2022-06-17 07:24:24',
      'image_path': '/images/lina so_1_03-08-22_16_59_08'
    });

    if (images != null && images.isNotEmpty){
      for (var image in images){
        request.files.add(await http.MultipartFile.fromPath(
          images.indexOf(image) == 0 ? 'cover' : 'images[]',
          image.path,
        ));
      }
    }

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print(response);
    if (response.statusCode == 200) {
      var parsedJson = json.decode(await response.stream.bytesToString());
      return ResponseModel<RealEstateModel>.fromJson(
          parsedJson, (data) => RealEstateModel.fromJson(data));
    }
    else {
      print(await response.stream.bytesToString());
      throw Exception('Failed post realestate');
    }
  }
  Future<ResponseModel<List<RealEstateModel>>> showFavorite() async {
    var url = Uri.parse('${AppConstants.baseUrl}${EndPoints.favourite}');
    var response = await http.get(url, headers: AppUtils.defaultHttpHeaders);
    print(response.body);
    if (response.statusCode == 200) {
      var parsedJson = json.decode(response.body);
      return ResponseModel<List<RealEstateModel>>.fromJson(
          parsedJson, (data) => (data as List).map((e) => RealEstateModel.fromJson(e)).toList());
    }
    else {
      throw Exception('Failed');
    }
  }

  Future<ResponseModel> removeFavorite(int id) async {
    var url = Uri.parse('${AppConstants.baseUrl}${EndPoints.favourite}/$id');
    var response = await http.delete(url, headers: AppUtils.defaultHttpHeaders);
    print(response.body);
    if (response.statusCode == 200) {
      var parsedJson = json.decode(response.body);
      return ResponseModel.fromJson(parsedJson, (data) => data);
    }
    else {
      throw Exception('Failed');
    }
  }

  Future<ResponseModel> addFavorite(int id) async {
    var url = Uri.parse('${AppConstants.baseUrl}${EndPoints.favourite}/$id');
    var response = await http.post(url, headers: AppUtils.defaultHttpHeaders);
    print(response.body);
    if (response.statusCode == 200) {
      var parsedJson = json.decode(response.body);
      return ResponseModel.fromJson(parsedJson, (data) => data);
    }
    else {
      throw Exception('Failed');
    }
  }

  Future<ResponseModel> addDsire(double min_price,double max_price, String state,String  propertyType, String address, int number_of_rooms) async {
    var url = Uri.parse('${AppConstants.baseUrl}${EndPoints.add_DEsire}');
    var response = await http.post(url ,headers: AppUtils.defaultHttpHeaders,body:
    {
      'user_id':UserModel.fromJson(json.decode(sharedPreferences.getString('user') ?? '{}')).id.toString(),
      'address': address.toString(),
      'floor': '5',
      'area': '32',
      'min_price':min_price.toString(),
      'max_price':max_price.toString(),
      'number_of_rooms':number_of_rooms.toString(),
      'number_of_path_rooms': '2',
      'state': state.toString(),
      'type': 'court',
      'property_type': propertyType.toString(),
      'cities_id': '1',
      'furnished': 'furnished',
      'services' : 'intrnet'
    });

    print(response.body);
    if (response.statusCode == 200) {
      var parsedJson = json.decode(response.body);
      return ResponseModel.fromJson(
          parsedJson, (data) => data);
    }
    else {
      throw Exception('Failed');
    }
  }


}