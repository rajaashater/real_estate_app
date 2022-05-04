import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children:[
            CarouselSlider(
              items: [
                Container(
                  child: AppBar(
                    title: Text('House for sale',style: Theme.of(context).textTheme.headline3,),
                  ),
                )
              ],
              options: null,
            )
        ]
      )
    );
  }
}
