import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/theme/app_colors.dart';
import '../../utils/theme/app_constants.dart';
import '../components/k_choices_wrap.dart';
import 'details_requirement.dart';

class PostRequirementScreen extends StatelessWidget {
  const PostRequirementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor:AppColors.primary,
            appBar: AppBar(
              title: Text('post_your_requirement'.tr(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline1),
            ),
          
            body:Padding(padding: const EdgeInsets.all(30) ,
              child: Column(
                children: [
                  Text('give_description_of_requirement'.tr(),style: Theme.of(context).textTheme.headline3,),
                  const SizedBox(height: 40.0,),
                  Text('I_would_like_to'.tr(),
                      style: Theme.of(context).textTheme.headline2),
                  const SizedBox(
                    height: 40.0,
                  ),
                  KChoicesWrap<String>(
                    spacing: 20.0,
                    list: AppConstants.ownershipList,
                    onSelected: (value){
                      //TODO Save value
                    },
                  ),
                  SizedBox(height: 200,),

                  SizedBox(
                    width: double.infinity,
                    height: 35.0,
                    child: ElevatedButton(
                      onPressed: ()  => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => DetailsRequirementScreen())),
                      child: Text('next'.tr(),
                          style: Theme.of(context).textTheme.headline1),
                    ),
                  ),






                ],
              ),
            ),
        );

  }
}
