import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';

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
          title: Text('House for sale',style: Theme.of(context).textTheme.headline3,),),
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
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 2,
            ),
          ),
          SizedBox(height: 30),
          TabBar(controller: _tabController, tabs: [Tab(text: 'Tab1'), Tab(text: 'Tab2'), Tab(text: 'Tab3')]),
          Expanded(
            child: TabBarView(
              controller: _tabController,
                children: [
              Text('Text1'), //TODO replace with specification widget
              Text('Text2'), //TODO replace with services widget
              Text('Text3'), //TODO replace with location widget
            ]),
          )
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
