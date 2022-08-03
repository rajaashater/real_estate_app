import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/services/real_estate_service.dart';
import 'package:real_estate_app/views/main/home/home_body.dart';
import 'package:real_estate_app/views/main/home/home_drawer.dart';
import 'package:real_estate_app/views/main/home/home_end_drawer.dart';

import '../../../models/real_estate_model.dart';
import '../../../models/response_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<ResponseModel<List<RealEstateModel>>> _data = RealEstateService().showPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer:  HomeEndDrawer(onSearch: (Future<ResponseModel<List<RealEstateModel>>> data) { setState(() {
        _data = data;
      }); },),
      drawer: const HomeDrawer(),
      appBar: AppBar(
        elevation: 0.0,
        title: Text('damascus'.tr(),
            style: Theme.of(context).textTheme.headline3),
        actions: [
          //IconButton(onPressed: () {},
          //icon: const Icon(Icons.compare_arrows),),
          Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: const Icon(Icons.search),
            ),
          )
        ],
      ),
      body: HomeBody(data: _data),
    );
  }
}
