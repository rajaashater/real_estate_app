import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';
import 'package:real_estate_app/utils/app_constants.dart';
import 'package:real_estate_app/views/drawer/login_screen.dart';
import 'package:real_estate_app/views/drawer/my_favourite.dart';
import 'package:real_estate_app/views/drawer/my_properties.dart';
import 'package:real_estate_app/views/drawer/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';


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
                  : Image.asset(AppConstants.logo, height: 70, width: 70),
              const SizedBox(height: 20.0),
              if (true) ListTile(
                leading: const Icon(Icons.circle, color: AppColors.secondary),
                title: Text('profile'.tr(),
                    style: Theme.of(context).textTheme.headline1),
                onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ProfileScreen())),
              ),
              ListTile(
                leading: const Icon(Icons.circle, color: AppColors.secondary),
                title: Text(
                  'my_properties'.tr(),
                  style: Theme.of(context).textTheme.headline1,
                ),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const MyPropertiesScreen())),
              ),
              ListTile(
                leading: const Icon(Icons.circle, color: AppColors.secondary),
                title: Text('my_favourite'.tr(),
                    style: Theme.of(context).textTheme.headline1),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const MyFavouriteScreen())),
              ),
              ListTile(
                leading: const Icon(Icons.circle, color: AppColors.secondary),
                title: Text('setting'.tr(),
                    style: Theme.of(context).textTheme.headline1),
                onTap: () {
                  context.setLocale(context.locale.languageCode == 'en'
                      ? const Locale('ar')
                      : const Locale('en'));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.circle,
                  color: AppColors.secondary,
                ),
                title: Text('rate_us'.tr(),
                    style: Theme.of(context).textTheme.headline1),
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.NO_HEADER,
                    animType: AnimType.BOTTOMSLIDE,
                    body: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Column(
                        children: [
                          Text(
                            'rate_us'.tr(),
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          RatingBar.builder(
                            initialRating: 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: AppColors.secondary,
                            ),
                            onRatingUpdate: (rating) {
                              //TODO update rating
                            },
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                //TODO send request with updating value
                              },
                              child: Text(
                                'submit'.tr(),
                                style: Theme.of(context).textTheme.headline1,
                              ))
                        ],
                      ),
                    ),
                  ).show();
                },
              ),
              ListTile(
                leading: const Icon(Icons.circle, color: AppColors.secondary),
                title: Text('sign_out'.tr(),
                    style: Theme.of(context).textTheme.headline1),
                onTap: () async {
                  sharedPreferences.remove('token');
                  sharedPreferences.remove('user');
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => LoginScreen()), (_) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
