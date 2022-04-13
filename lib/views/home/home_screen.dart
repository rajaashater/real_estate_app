import 'package:easy_localization/easy_localization.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';
import 'package:real_estate_app/views/home/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset('assets/images/splash.png', fit: BoxFit.cover)),
        Scaffold(
          backgroundColor: Colors.transparent,
          drawer: HomeDrawer(),
          appBar: AppBar(
            title:
                Text('damascus'.tr(), style: Theme.of(context).textTheme.headline3),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.compare_arrows),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            separatorBuilder: (_, int index) => SizedBox(
              height: 20.0,
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Row(
                  mainAxisAlignment: index % 2 == 0
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      height: 200,
                      alignment: AlignmentDirectional.bottomCenter,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(offset: Offset(1.0, 2.0), blurRadius: 6.0, color: Colors.black45)
                        ],
                          color: AppColors.secondary,
                          image: DecorationImage(
                              image: AssetImage('assets/images/reals.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(7),
                            bottomRight: Radius.circular(7),
                          )),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        height: 50,
                        color: AppColors.primary,
                        child: DefaultTextStyle.merge(
                          style: TextStyle(color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('1200 ls'),
                              Text("Villa".tr()),
                              Icon(Icons.favorite),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]);
            },
          ),
          bottomNavigationBar: FluidNavBar(
            style: FluidNavBarStyle(
                barBackgroundColor: AppColors.primary,
              iconBackgroundColor: Colors.white,
              iconUnselectedForegroundColor: AppColors.secondary,
              iconSelectedForegroundColor: AppColors.secondary
            ),
            icons: [
              FluidNavBarIcon(
                icon: Icons.home,
                backgroundColor: Colors.white
              ),
              FluidNavBarIcon(
                icon: Icons.person,
                  backgroundColor: Colors.white
              ),
              FluidNavBarIcon(
                icon: Icons.add_business,
                  backgroundColor: Colors.white
              )
            ],
          ),
        ),
      ],
    );
  }
}
