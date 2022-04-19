import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/theme/app_colors.dart';
import '../home/home_screen.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const Icon(
              Icons.handshake,
              size: 100,
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              'thank_you'.tr(),
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text('submitted'.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: AppColors.primary)),
            const SizedBox(
              height: 40.0,
            ),
            const SizedBox(
              height: 200,
            ),
            SizedBox(
              width: double.infinity,
              height: 35.0,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const HomeScreen())),
                child: Text('back_to_home'.tr(),
                    style: Theme.of(context).textTheme.headline1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
