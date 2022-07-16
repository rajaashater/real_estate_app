class CitiesGetModel{
  final String country;
  final int id;

  CitiesGetModel({required this.id, required this.country});

  factory CitiesGetModel.fromJson(Map<String, dynamic> json){
    return CitiesGetModel(id: json['id'], country: json['country']);
  }
}