import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
    );
  }
}
