import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/views/main/home/home_end_drawer.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:
      Text('damascus'.tr(), style: Theme.of(context).textTheme.headline3),
      actions: [
        //IconButton(onPressed: () {},
          //icon: const Icon(Icons.compare_arrows),),
        IconButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder:(_) => const HomeEndDrawer() )) ,
          icon: const Icon(Icons.search),
        )
      ],
    );
  }
}
