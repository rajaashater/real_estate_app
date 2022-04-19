import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../utils/theme/app_colors.dart';
import '../home/home_end_drawer.dart';

class MyFavouriteScreen extends StatelessWidget {
  const MyFavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child:
            Image.asset('assets/images/packground.jpg', fit: BoxFit.cover)),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
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
                    width: 300,
                    height: 200,
                    alignment: AlignmentDirectional.bottomCenter,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(1.0, 2.0),
                            blurRadius: 6.0,
                            color: Colors.black45)
                      ],
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
                            const Icon(Icons.favorite),
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
