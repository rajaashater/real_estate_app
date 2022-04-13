import 'package:easy_localization/easy_localization.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';
import 'package:real_estate_app/views/home/home_appbar.dart';
import 'package:real_estate_app/views/home/home_body.dart';
import 'package:real_estate_app/views/home/home_bottom_navigation_bar.dart';
import 'package:real_estate_app/views/home/home_drawer.dart';
import 'package:real_estate_app/views/home/home_end_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset('assets/images/splash.png', fit: BoxFit.cover)),
        Scaffold(
          backgroundColor: Colors.transparent,
          endDrawer: HomeEndDrawer(),
          drawer: HomeDrawer(),
          appBar:  AppBar(
            title:
            Text('damascus'.tr(), style: Theme.of(context).textTheme.headline3),
            actions: [
              //IconButton(onPressed: () {},
              //icon: const Icon(Icons.compare_arrows),),
              IconButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder:(_) => HomeEndDrawer() )) ,
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: HomeBody(),
          bottomNavigationBar: HomeBottomNavigationBar(),
        ),
      ],
    );
  }
}
