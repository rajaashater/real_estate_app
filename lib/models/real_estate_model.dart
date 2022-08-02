class RealEstateModel{
  final String address;
  final int id;
  final int current_page;
  final int floor;
  final double area;
  final double price;
  final String property_type;
  final String type;
  final int min_price;
  final int max_price;
  final int number_of_rooms;
  final int number_of_path_rooms;
  final bool is_sales;
  final bool is_rent;
  final bool is_favourite;
  final String state;
  final String furnished;
  final String services;
  final String cover;
  final String image;
  final String image_path;
  final int countF;
  final String status;
  final String end_r_date;
  final String description;
  final String urls;
  final String created_at;
  final String updated_at;
  final int user_id;
  final int cities_id;
  final String long;
  final String lat;
  final String deleted_at;




  RealEstateModel({
  required this.floor, required this.area, required this.price, required this.property_type, required this.type, required this.min_price, required this.max_price, required this.number_of_rooms, required this.number_of_path_rooms, required this.is_sales, required this.is_rent, required this.is_favourite, required this.state, required this.furnished, required this.services, required this.cover, required this.image, required this.image_path, required this.countF, required this.status, required this.end_r_date, required this.description, required this.urls, required this.created_at, required this.updated_at, required this.user_id, required this.cities_id, required this.long, required this.lat, required this.deleted_at, required this.address, required this.id, required this.current_page
});

  factory RealEstateModel.fromJson(Map<String, dynamic> json){
    return RealEstateModel(
      id: json['id'],
      price: json['price'],
      current_page: json ['current_page'],
      address: json['address'],
      floor: json['floor'],
      type: json['type'],
      property_type: json['property_type'],
      min_price: json['min_price'],
      max_price: json['max_price'],
      number_of_path_rooms: json['number_of_path_rooms'],
      number_of_rooms: json['number_of_rooms'],
      is_sales:json['is_sales'],
      is_rent:json['is_rent'],
      is_favourite:json['is_favourite'],
      state:json['state'],
      furnished:json['furnished'],
      services:json['services'],
      cover : json['cover'],
    image : json['image'],
    image_path : json['image_path'],
    countF : json['countF'],
    status : json['status'],
    deleted_at : json['deleted_at'],
    end_r_date : json['end_r_date'],
    description : json['description'],
    urls : json['urls'],
      created_at : json['created_at'],
    updated_at : json['updated_at'],
    user_id : json['user_id'],
    cities_id : json['cities_id'],
      lat: json['lat'],
      long: json['long'],
      area: json['area'],
    );
   }
}