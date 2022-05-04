import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/views/main/home/home_body.dart';
import 'package:real_estate_app/views/main/home/home_drawer.dart';
import 'package:real_estate_app/views/main/home/home_end_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const HomeEndDrawer(),
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
      body: const HomeBody(),
    );
  }
}
