import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          elevation: 0,
        backgroundColor: AppColors.primary,
        title: Text('House for sale',style: Theme.of(context).textTheme.headline3,),),
      body: Stack(
          children:[

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
                height: 400.0,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 2.0,
                initialPage: 2,
              ),
            ),
            //Scaffold(appBar:AppBar(backgroundColor: AppColors.primary,title: Text('House for sale',style: Theme.of(context).textTheme.headline3,),),),
            PositionedDirectional(
              bottom: 0,
              start: 0,
              child: Stack(
                children: [
                  PositionedDirectional.fill(
                    top:200,
                    child: Container(
                          height: 300,
                          width: 400,
                          alignment: AlignmentDirectional.bottomCenter,

                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child:
                          PositionedDirectional(
                              top:2,
                              end:1,
                              child: Text('127000000 SYP',style:  Theme.of(context).textTheme.headline3,))


                    ),
                  ),
                  PositionedDirectional(
                    top:0,
                    start:1,
                    child: Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(2.0),
                            child:
                              const Icon(Icons.favorite),),
                        const SizedBox(width: 5.0,),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(2.0),
                          child:
                          const Icon(Icons.location_on_outlined),),
                        const SizedBox(width: 5.0,),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(2.0),
                          child:
                          const Icon(Icons.house),),

                      ],
                    ),
                  ),

                ],
              ),
            )

        ]

      )
    );
  }
}
