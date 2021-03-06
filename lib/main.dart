import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';
import 'package:real_estate_app/utils/theme/app_theme.dart';
import 'package:real_estate_app/views/drawer/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;

Future<void> main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const RealEstate()));

}

class RealEstate extends StatelessWidget {
  const RealEstate({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme(context).copyWith(colorScheme: AppTheme.lightTheme(context).colorScheme.copyWith(secondary: AppColors.secondary)),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: LoginScreen(),
    );
  }
}