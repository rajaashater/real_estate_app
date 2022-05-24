import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';
import 'package:real_estate_app/views/main/details/services.dart';
import 'package:real_estate_app/views/main/details/specification.dart';
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
            items: List<Widget>.generate(8, (index) => Image.asset('assets/images/h1 (${index + 1}).jpg', fit: BoxFit.cover, width: double.infinity)),
            options:
            CarouselOptions(
              height: 250.0,
              autoPlay: true,
              viewportFraction: 1
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
