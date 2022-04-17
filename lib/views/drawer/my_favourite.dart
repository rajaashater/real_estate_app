import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
      body: ListView.separated(
        padding: const EdgeInsets.all(20.0),
        separatorBuilder: (_, int index) =>
        const SizedBox(
          height: 20.0,
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
                        Text("saved for later".tr()),
                        Column(
                          children: [
                            const Icon(Icons.rate_review),
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
              Row(children: [
                Column(
                  children:[
                    Row(children:[const Icon(
                      Icons.circle,
                      size: 10,
                    ),

                      const SizedBox(width: 5),
                      Text('5 rooms'.tr(),
                          style: Theme.of(context).textTheme.headline1),]),
                    const SizedBox(height: 10.0,),
                    Row(children:[const Icon(
                      Icons.circle,
                      size: 10,
                    ),

                      const SizedBox(width: 5),
                      Text('with parking'.tr(),
                          style: Theme.of(context).textTheme.headline1),]),
                    const SizedBox(height: 10.0,),
                    Row(children:[const Icon(
                      Icons.circle,
                      size: 10,
                    ),

                      const SizedBox(width: 5),
                      Text('for rent'.tr(),
                          style: Theme.of(context).textTheme.headline1),]),
                  ],),
                const SizedBox(
                  width: 70,
                ),
                Text(
                  '897600SYP',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ])
              ,
            ]
            ,
          );
        },
      ),
    );
  }
}
