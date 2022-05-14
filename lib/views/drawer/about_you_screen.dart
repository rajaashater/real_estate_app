
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:real_estate_app/views/drawer/thank_you_screen.dart';

import '../../utils/theme/app_colors.dart';

class AboutYouScreen extends StatelessWidget {
   AboutYouScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  String? _email;
  String? _name;
  String? _phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Text('please_tell_us_about_yourself'.tr(),
                  style: Theme.of(context).textTheme.headline3),
              const SizedBox(
                height: 30.0,
              ),


              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (value) => _name = value,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'name'.tr(),
                        prefixIcon: const Icon(Icons.person),
                      ),
                      validator: qValidator([
                        IsRequired(),
                      ]),
                      initialValue: 'Adam',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      onSaved: (value) => _email = value,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'email'.tr(),
                        prefixIcon: const Icon(Icons.email),
                      ),
                      validator: qValidator([
                        IsRequired(),
                        const IsEmail(),
                      ]),
                      initialValue: 'adam88@gmail.com',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      onSaved: (value) => _phone = value,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'phone'.tr(),
                        prefixIcon: const Icon(Icons.phone),
                      ),
                      validator: qValidator([
                        IsRequired(),
                        MinLength(10),
                      ]),
                      initialValue: '0988763983',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 200.0),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ThankYouScreen())),
                  //TODO API request
                  child: Text('continue'.tr(),
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),

              //Text('already have account?'.tr(), style:Theme.of(context).textTheme.headline1),
              //TextButton(onPressed: ()=> Navigator.of(context).pop(MaterialPageRoute(builder:(_) => LoginScreen() )) ,child:Text ('login'.tr()),),
            ],
          ),
        ),
      ),
    );
  }
}
