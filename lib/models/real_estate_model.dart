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




  RealEstateModel(this.floor, this.area, this.price, this.property_type, this.type, this.min_price, this.max_price, this.number_of_rooms, this.number_of_path_rooms, this.is_sales, this.is_rent, this.is_favourite, this.state, this.furnished, this.services, this.cover, this.image, this.image_path, this.countF, this.status, this.end_r_date, this.description, this.urls, this.created_at, this.updated_at, this.user_id, this.cities_id, this.long, this.lat, this.deleted_at, this.address, this.id, this.current_page, );

  factory RealEstateModel.fromJson(Map<String, dynamic> json){
    return RealEstateModel(id: json['id'], price: json['price'], current_page: json ['current_page'], address: json['address'],floor: json['floor'],type: json['type'],property_type: json['property_type'],min_price: json['min_price'],max_price: json['max_price'],max_price: json['max_price'],number_of_path_rooms: json['number_of_path_rooms'],number_of_rooms: json['number_of_rooms'],is_sales:json['is_sales'],is_rent:json['is_rent'],is_favourite:json['is_favourite']);

  }
}