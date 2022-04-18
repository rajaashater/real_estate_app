import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../utils/theme/app_colors.dart';
import '../home/home_end_drawer.dart';

class MyFavouriteScreen extends StatelessWidget {
  const MyFavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('real_estate_search'.tr(),
            style: Theme
                .of(context)
                .textTheme
                .headline3),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context)
                    .push(
                    MaterialPageRoute(builder: (_) => const HomeEndDrawer())),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Stack(
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
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline1),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

            ]
            ,
          );
        },
      ),
    );
  }
}
