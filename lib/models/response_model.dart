class ResponseModel<T>{
  final bool success;
  final T data;
  final String message;

  ResponseModel({required this.success, required this.data, required this.message});

  factory ResponseModel.fromJson(Map<String, dynamic> json, Function(dynamic data) create){
    return ResponseModel(success: json['success'], data: create(json['data']), message: json['message']);
  }
}