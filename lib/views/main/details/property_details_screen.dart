import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';
import 'package:real_estate_app/views/main/details/services.dart';
import 'package:real_estate_app/views/main/details/specification.dart';

import '../../drawer/post_requirement_screen.dart';
import 'location.dart';

class PropertyDetailsScreen extends StatefulWidget {
  const PropertyDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          elevation: 0,
          backgroundColor: AppColors.primary,
          title: Text('House for sale'.tr(),style: Theme.of(context).textTheme.headline3,),),
      body: Column(
        children: [
          CarouselSlider(
            items: [
              //TODO Apis
              Image.asset('assets/images/h1 (1).jpg'),
              Image.asset('assets/images/h1 (2).jpg'),
              Image.asset('assets/images/h1 (3).jpg'),
              Image.asset('assets/images/h1 (4).jpg'),
              Image.asset('assets/images/h1 (5).jpg'),
              Image.asset('assets/images/h1 (6).jpg'),
              Image.asset('assets/images/h1 (7).jpg'),
              Image.asset('assets/images/h1 (8).jpg'),
            ],
            options:
            CarouselOptions(
              height: 150.0,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction:1,
              aspectRatio: 6,
              initialPage: 2,
           disableCenter: true,
              pageSnapping: true,

            ),
          ),
          SizedBox(height: 30),
          Padding(padding: const EdgeInsets.all(5.0),
            child: Container(
              child: Text('This house is located in Damascus_Malki it covers an area of 200 square meter , 4 bedrooms ,3 bathrooms ,2 hall , parking ... ', style:  Theme.of(context).textTheme.headline6,),

            ),
          ),
          TabBar(controller: _tabController, tabs: [Tab(text: 'specification'.tr()), Tab(text: 'services'.tr()), Tab(text: 'location'.tr() ,)]),
          Expanded(
            child: TabBarView(
              controller: _tabController,
                children: [
                  Specification(),
                  Services(),
                  Location(),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('contact'.tr(),
                    style: Theme.of(context).textTheme.headline1),
              ),
              TextButton(
                onPressed: () {},
                child: Text('email'.tr(),style:  Theme.of(context).textTheme.headline6),
              ),
            ],
          ),

          // Container(
          //       height: 300,
          //       width: 400,
          //       alignment: AlignmentDirectional.bottomCenter,
          //
          //       decoration: BoxDecoration(
          //         color: AppColors.primary,
          //         borderRadius: BorderRadius.circular(20)
          //       ),
          //       child:
          //       Text('127000000 SYP',style:  Theme.of(context).textTheme.headline3,)
          //
          //
          // ),
          // Row(
          //   children: [
          //     Container(
          //       decoration: const BoxDecoration(
          //           color: Colors.white,
          //           shape: BoxShape.circle,
          //       ),
          //       padding: const EdgeInsets.all(2.0),
          //         child:
          //           const Icon(Icons.favorite),),
          //     const SizedBox(width: 5.0,),
          //     Container(
          //       decoration: const BoxDecoration(
          //         color: Colors.white,
          //         shape: BoxShape.circle,
          //       ),
          //       padding: const EdgeInsets.all(2.0),
          //       child:
          //       const Icon(Icons.location_on_outlined),),
          //     const SizedBox(width: 5.0,),
          //     Container(
          //       decoration: const BoxDecoration(
          //         color: Colors.white,
          //         shape: BoxShape.circle,
          //       ),
          //       padding: const EdgeInsets.all(2.0),
          //       child:
          //       const Icon(Icons.house),),
          //
          //   ],
          // ),
        ],
      )
    );
  }
}
