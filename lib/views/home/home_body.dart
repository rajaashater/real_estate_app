import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      separatorBuilder: (_, int index) => const SizedBox(
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
                width: 370,
                height: 250,
                alignment: AlignmentDirectional.bottomCenter,
                decoration: BoxDecoration(
                    color: AppColors.secondary,
                    image: const DecorationImage(
                        image: AssetImage('assets/images/reals.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(index % 2 == 0 ? 20 : 0),
                      topEnd: Radius.circular(index % 2 == 0 ? 0 : 20),
                      bottomStart: Radius.circular(index % 2 == 0 ? 20 : 0),
                      bottomEnd: Radius.circular(index % 2 == 0 ? 0 : 20),
                    )),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  height: 50,
                  color: AppColors.primary,
                  child: DefaultTextStyle.merge(
                    style: const TextStyle(color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('1200 SYP'),
                        Text("Villa".tr()),
                        const Icon(Icons.favorite),
                      ],
                    ),
                  ),
                ),
              ),
            ]);
      },
    );
  }
}
