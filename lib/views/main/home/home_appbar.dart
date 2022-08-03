// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:real_estate_app/views/main/home/home_end_drawer.dart';
//
// import '../../../models/real_estate_model.dart';
// import '../../../models/response_model.dart';
//
// class HomeAppBar extends StatelessWidget {
//   const HomeAppBar({Key? key, required this.onSearch}) : super(key: key);
//   final Function(Future<ResponseModel<List<RealEstateModel>>> data) onSearch;
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title:
//       Text('damascus'.tr(), style: Theme.of(context).textTheme.headline3),
//       actions: [
//         //IconButton(onPressed: () {},
//           //icon: const Icon(Icons.compare_arrows),),
//         IconButton(
//           onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder:(_) =>  HomeEndDrawer(onSearch: onSearch) )) ,
//           icon: const Icon(Icons.search),
//         )
//       ],
//     );
//   }
// }
