import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluidNavBar(
      style: const FluidNavBarStyle(
          barBackgroundColor: AppColors.primary,
          iconBackgroundColor: Colors.white,
          iconUnselectedForegroundColor: AppColors.secondary,
          iconSelectedForegroundColor: AppColors.secondary),
      icons: [
        FluidNavBarIcon(icon: Icons.home, backgroundColor: Colors.white),
        FluidNavBarIcon(icon: Icons.person, backgroundColor: Colors.white),
        FluidNavBarIcon(icon: Icons.add_business, backgroundColor: Colors.white)
      ],
    );
  }
}
