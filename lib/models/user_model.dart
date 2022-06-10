class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String? profileImg;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.gender,
      required this.profileImg});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        gender: json['gender'],
        profileImg: json['profileImg']);
  }

  Map<String, dynamic> toJson(){
    return {
      'id' : this.id,
      'name' : this.name,
      'email' : this.email,
      'gender' : this.gender,
      'profileImg' : this.profileImg,
    };
  }
}
