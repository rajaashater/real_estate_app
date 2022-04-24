import 'package:easy_localization/easy_localization.dart';


import 'package:easy_localization/easy_localization.dart';
abstract class AppConstants{
  ///Images
  static const String imagesPrefix = 'assets/images';
  static const String logo = '$imagesPrefix/logo.png';

  ///Lists
  static const List<int> numberOfRoomsList = [1, 2, 3, 4, 5, 6, 7, 8];
  static const List<String> ownershipListEn = ['Rent', 'Buy'];
  static const List<String> ownershipListAr = ['آجار', 'شراء'];
  static const List<String> postListEn = ['Rent', 'Sell'];
  static const List<String> postListAr = ['اجار', 'بيع'];
  static const List<String> statusListEn = ['Under Construction', 'Ready to move','Rented','Sold','Furnished','Unfurnished'];
  static const List<String> statusListAr = ['قيد الإنشاء', 'جاهز للسكن','مؤجر','مباع','مفروش','غير مفروش'];
}