class AuthModel{
  final String token;
  final String name;

  AuthModel({required this.token, required this.name});

  factory AuthModel.fromJson(Map<String, dynamic> json){
    return AuthModel(token: json['token'], name: json['name']);
  }
}