import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:real_estate_app/views/auth/login_screen.dart';


class HomeEndDrawer extends StatelessWidget {
  const HomeEndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 550,
      width: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Drawer(
          backgroundColor: AppColors.primary,
          child: ListView(
            children: [
              Image.asset('assets/images/logo.png'),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children:[
                 Icon(Icons.circle),
                  Text('filter'.tr(),style: Theme.of(context).textTheme.headline2),
                  SizedBox(height:25 ,),
                  SizedBox(

                    width:125.0,
                    height: 35.0,

                    child: ElevatedButton(onPressed: () {},
                      child: Text('login'.tr(),
                          style:Theme.of(context).textTheme.headline1 ),
                    ),
                  ),



                ],
              ),


            ],
          ),
        ),
      ),
    );;
  }
}
