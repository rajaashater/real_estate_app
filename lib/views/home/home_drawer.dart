import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:real_estate_app/views/auth/login_screen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      width: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Drawer(
          backgroundColor: AppColors.primary,
          child: ListView(
            children: [
              //TODO replace true with isSignIn variable
              false ? Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: CircleAvatar(
                            backgroundColor: AppColors.primary,
                            radius: 49,
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage:
                                  AssetImage('assets/images/personal.jpg'),
                            ),
                          ),
                        )
                      ],
                    )
                  : Image.asset('assets/images/logo.png',
                      height: 70, width: 70),
              const SizedBox(height: 20.0),
              ListTile(
                leading: Icon(Icons.circle, color: AppColors.secondary),
                title: Text('profile'.tr(),
                    style: Theme.of(context).textTheme.headline1),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.circle, color: AppColors.secondary),
                title: Text(
                  'my_real_estate'.tr(),
                  style: Theme.of(context).textTheme.headline1,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.circle, color: AppColors.secondary),
                title: Text('my_favourite'.tr(),
                    style: Theme.of(context).textTheme.headline1),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.circle, color: AppColors.secondary),
                title: Text('setting'.tr(),
                    style: Theme.of(context).textTheme.headline1),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.circle,
                  color: AppColors.secondary,
                ),
                title: Text('rate_us'.tr(),
                    style: Theme.of(context).textTheme.headline1),
                onTap: () {},
              ),
              //TODO replace true with isSignIn variable
              ListTile(
                leading: Icon(Icons.circle, color: AppColors.secondary),
                title: Text(false ? 'sign_out'.tr() : 'login'.tr(),
                    style: Theme.of(context).textTheme.headline1),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => LoginScreen())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
