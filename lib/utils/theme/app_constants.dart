import 'package:easy_localization/easy_localization.dart';


import 'package:easy_localization/easy_localization.dart';
abstract class AppConstants{
  ///Images
  static const String imagesPrefix = 'assets/images';
  static const String logo = '$imagesPrefix/logo.png';

  ///Lists
  static const List<int> numberOfRoomsList = [1, 2, 3, 4, 5, 6, 7, 8];
  static const List<String> ownershipList = ['Rent', 'Buy'];
  static const List<String> postList = ['Rent', 'Sell'];
  static const List<String> statusList = ['Under Construction', 'Ready to move','Rented','Sold','Furnished','Unfurnished'];

}