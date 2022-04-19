import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/theme/app_colors.dart';
import '../../utils/theme/app_constants.dart';
import '../components/k_choices_wrap.dart';
import 'details_requirement.dart';

class PostRequirementScreen extends StatelessWidget {
  PostRequirementScreen({Key? key}) : super(key: key);
  String? _ownership;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor:Colors.white,
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
                  Text('give_description_of_requirement'.tr(),style: Theme.of(context).textTheme.headline3!.copyWith(color: AppColors.primary)),
                  const SizedBox(height: 40.0,),
                  Text('I_would_like_to'.tr(),
                      style: Theme.of(context).textTheme.headline2),
                  const SizedBox(
                    height: 40.0,
                  ),
                  KChoicesWrap<String>(
                    spacing: 20.0,
                    list: AppConstants.ownershipList,
                    onItemSelected: (dynamic value){
                      _ownership = value;
                    },
                  ),
                  const SizedBox(height: 200),

                  SizedBox(
                    width: double.infinity,
                    height: 35.0,
                    child: ElevatedButton(
                      onPressed: ()  {
                        if(_ownership != null){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => DetailsRequirementScreen()));
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ownership is required')));
                        }
                      },
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
