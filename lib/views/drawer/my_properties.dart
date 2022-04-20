import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../utils/theme/app_colors.dart';
import '../home/home_end_drawer.dart';

class MyPropertiesScreen extends StatelessWidget {
  const MyPropertiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Positioned.fill(
        //     child:
        //         Image.asset('assets/images/packground.jpg', fit: BoxFit.cover)),
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            title: Text('my_properties'.tr(),
                style: Theme.of(context).textTheme.headline3),

          ),
          body: GridView.custom(
            padding: const EdgeInsets.all(20.0),
            gridDelegate: SliverStairedGridDelegate(
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0,
              startCrossAxisDirectionReversed: true,
              pattern: const [
                StairedGridTile(0.5, 0.7),
                StairedGridTile(0.5, 4.5 / 6),
                StairedGridTile(1.0, 8 / 5),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => Stack(
                children: [
                  Container(
                    width: 350,
                    height: 250,
                    alignment: AlignmentDirectional.bottomCenter,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      image: const DecorationImage(
                          image: AssetImage('assets/images/reals.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      height: 50,
                      color: AppColors.primary,
                      child: DefaultTextStyle.merge(
                        style: const TextStyle(color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //const Icon(Icons.favorite),
                            Text("type".tr()),
                            Column(
                              children: [
                                const Icon(Icons.star_rate_outlined),
                                Text('15 review',
                                    style:
                                    Theme.of(context).textTheme.headline1),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  PositionedDirectional(
                    width:75.0,
                    height: 80.0,
                    top:-7,
                    start:-5,
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),

                        ),
                        Text('sale'.tr(),style:Theme.of(context).textTheme.headline4),
                      ],

                    )
                  )
                ],
              ),
              childCount: 10,
            ),
          ),
        ),
      ],
    );
  }
}
