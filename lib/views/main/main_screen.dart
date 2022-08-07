import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:real_estate_app/views/drawer/profile_screen.dart';
import 'package:real_estate_app/views/main/home/add_property_screen.dart';
import 'package:real_estate_app/views/main/home/home_bottom_navigation_bar.dart';
import 'package:real_estate_app/views/main/home/home_screen.dart';

import '../../main.dart';
import '../../models/user_model.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          const HomeScreen(),
          ProfileScreen(user: UserModel.fromJson(json.decode(sharedPreferences.getString('user') ?? '{}')),),
          AddPropertyScreen()
        ],
      ),
      bottomNavigationBar: HomeBottomNavigationBar(onChange: (index) => _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut)),
    );
  }
}
