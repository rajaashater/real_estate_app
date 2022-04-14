import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:real_estate_app/views/auth/login_screen.dart';

class HomeEndDrawer extends StatelessWidget {
  const HomeEndDrawer({Key? key}) : super(key: key);

  get onChanged => null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      width: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Drawer(
          backgroundColor: AppColors.primary,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Image.asset('assets/images/logo.png', height: 50, width: 50,),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                    ),
                    SizedBox(width: 5,),

                    Text('filter'.tr(),
                        style: Theme.of(context).textTheme.headline1),
                    SizedBox(
                      width: 70,
                    ),
                    SizedBox(
                      width: 120.0,
                      height: 35.0,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('reset_filter'.tr(),
                            style: Theme.of(context).textTheme.headline1),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                    items: [DropdownMenuItem(child: Text('select_location', style:Theme.of(context).textTheme.headline3,))],
                    onChanged: onChanged),
                SizedBox(height: 20),
                DropdownButtonFormField(
                    items: [DropdownMenuItem(child: Text('property_type',style:Theme.of(context).textTheme.headline3,))],
                    onChanged: onChanged),
                SizedBox(height: 20),
                Row(children: [
                  Icon(
                    Icons.circle,
                    size: 10,
                  ),
                  SizedBox(width: 5,),
                  Text('size'.tr(), style: Theme.of(context).textTheme.headline1),
                ]),
                SizedBox(height:5),
                Slider(value: 120,max: 300,min: 50, onChanged: onChanged),
                SizedBox(height: 5),
                Row(children: [
                  Icon(
                    Icons.circle,
                    size: 10,
                  ),
                  SizedBox(width: 5,),

                  Text('price'.tr(),
                      style: Theme.of(context).textTheme.headline1),
                ]),
                SizedBox(height: 10),
                Slider(value: 400,max: 1000,min:100, onChanged: onChanged),
                SizedBox(height: 10),
                Row(children: [
                  Icon(
                    Icons.circle,
                    size: 10,
                  ),
                  SizedBox(width: 5,),

                  Text('number_of_rooms'.tr(),
                      style: Theme.of(context).textTheme.headline1),
                ]),

                SizedBox(height: 10),
                SizedBox(height: 20),
                Row(children: [
                  Icon(
                    Icons.circle,
                    size: 10,
                  ),
                  SizedBox(width: 5,),

                  Text('ownership'.tr(),
                      style: Theme.of(context).textTheme.headline1),
                ]),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: 120.0,
                      height: 35.0,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('rent'.tr(),
                            style: Theme.of(context).textTheme.headline1),
                      ),
                    ),
                    SizedBox(width: 10,),
                    SizedBox(
                      width: 120.0,
                      height: 35.0,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('buy'.tr(),
                            style: Theme.of(context).textTheme.headline1),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 40,),
                SizedBox(
                  width: 120.0,
                  height: 35.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('search'.tr(),
                        style: Theme.of(context).textTheme.headline1),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
