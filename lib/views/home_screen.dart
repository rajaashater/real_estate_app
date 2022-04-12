import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../utils/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      backgroundColor: Colors.white,

      appBar: AppBar(

        title: Text('damascus'.tr(), style:Theme.of(context).textTheme.headline3),
        actions: [
          IconButton(onPressed: () {},
            icon: const Icon(Icons.compare_arrows),),
          IconButton(onPressed: () {},
            icon: const Icon(Icons.search),)
        ],
      ),

      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        separatorBuilder: (_, int index) => SizedBox(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Row(
              mainAxisAlignment: index % 2 == 0
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [ Container(
                width: 300,
                height: 200,
                alignment: AlignmentDirectional.bottomCenter,
                decoration: BoxDecoration(
                    color: AppColors.secondary,
                    image: DecorationImage(
                        image: AssetImage('assets/images/reals')),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))
                ),
                child: Container(
                  height: 50,
                  color: AppColors.primary,
                  child: DefaultTextStyle.merge(
                    style: TextStyle(color: AppColors.secondary),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Price:1200'),
                        Text("Type:home"),
                        Icon(Icons.favorite),

                      ],

                    ),
                  ),

                ),
              ),
              ]
          );
        },
      ),


      //bottomNavigationBar: BottomNavigationBar(items: [BottomNavigationBarItem(icon: Icon(Icons.person))BottomNavigationBarItem(icon: Icon(Icons.home)),BottomNavigationBarItem(icon: Icon(Icons.home_work_outlined)),],),
    );
  }
}


