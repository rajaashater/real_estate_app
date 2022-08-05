import 'dart:convert';

import '../utils/app_constants.dart';

class RealEstateModel{
  final String address;
  final int id;
  final int? floor;
  final int area;
  final dynamic price;
  final String property_type;
  final String type;
  final dynamic min_price;
  final dynamic max_price;
  final int? number_of_rooms;
  final int? number_of_path_rooms;
  final String state;
  final String furnished;
  final List<String> services;
  final String cover;
  final String image;
  final String image_path;
  final int countF;
  final String status;
  final String end_r_date;
  final String? description;
  final List<String> urls;
  final int user_id;
  final int cities_id;
  final String? long;
  final String? lat;

  RealEstateModel({
  required this.floor, required this.area, required this.price, required this.property_type, required this.type, required this.min_price, required this.max_price, required this.number_of_rooms, required this.number_of_path_rooms, required this.state, required this.furnished, required this.services, required this.cover, required this.image, required this.image_path, required this.countF, required this.status, required this.end_r_date, required this.description, required this.urls, required this.user_id, required this.cities_id, required this.long, required this.lat, required this.address, required this.id,
});

  factory RealEstateModel.fromJson(Map<String, dynamic> json){
    List<String> urls = List<String>.from(jsonDecode(json['urls']));
    List<String> services = List<String>.from(jsonDecode(json['services']));
    // urls = urls.map((e) => AppConstants.domain + e).toList();
    return RealEstateModel(
      id: json['id'],
      price: json['price'],
      address: json['address'],
      floor: json['floor'],
      type: json['type'],
      property_type: json['property_type'],
      min_price: json['min_price'],
      max_price: json['max_price'],
      number_of_path_rooms: json['number_of_path_rooms'],
      number_of_rooms: json['number_of_rooms'],
      state:json['state'],
      furnished:json['furnished'],
      services:services,
      cover : json['cover'],
    image : json['image'],
    image_path : json['image_path'],
    countF : json['countF'],
    status : json['status'],
    end_r_date : json['end_r_date'],
    description : json['description'],
    urls : urls,
    user_id : json['user_id'],
    cities_id : json['cities_id'],
      lat: json['lat'],
      long: json['long'],
      area: json['area'],
    );
   }
}