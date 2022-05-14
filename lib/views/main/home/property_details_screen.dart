import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children:[

            CarouselSlider(
              items: [
                //TODO Apis
                Image.asset('assets/images/reals.jpg'),
                Image.asset('assets/images/personal.jpg'),
                Image.asset('assets/images/logo.png'),


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
            Positioned(
              top: 0,
              child: AppBar(
                backgroundColor: AppColors.primary,
                title: Text('House for sale',style: Theme.of(context).textTheme.headline3,),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Stack(
                children: [
                  Container(
                        height: 100,
                        width: 400,
                        alignment: AlignmentDirectional.bottomCenter,
                          
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child:
                        Positioned(
                            top:2,
                            right:1,
                            child: Text('127000000 SYP',style:  Theme.of(context).textTheme.headline3,))


                  ),
                  Positioned(
                    top:-4,
                    left:1,
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
