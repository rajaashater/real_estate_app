
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:real_estate_app/utils/theme/app_theme.dart';
import 'package:real_estate_app/views/auth/password_text_from_field.dart';

import '../../utils/theme/app_colors.dart';

class RegisterScreen extends StatelessWidget {

  RegisterScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? _name;
  String? _lastName;
  String? _phone;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ) ,
      backgroundColor:AppColors.primary ,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png'),
              const SizedBox(
                height: 10.0,
              ),
              Text('Key In Click',
                  style:Theme.of(context).textTheme.headline1
              ),

              const SizedBox(
                height: 40.0,
              ),
              Text('sign up'.tr(),
                  style:Theme.of(context).textTheme.headline2
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text('create your account'.tr(),
                  style:Theme.of(context).textTheme.headline3
              ),
              const SizedBox(
                height: 40.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved:(value) => _name = value,
                      keyboardType: TextInputType.name,
                      decoration:  InputDecoration(
                        labelText: 'name'.tr(),
                        prefixIcon: const Icon(Icons.person) ,
                      ),
                      validator: qValidator([
                        IsRequired(),
                      ]),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      onSaved:(value) => _lastName = value,
                      keyboardType: TextInputType.name,
                      decoration:  InputDecoration(
                        labelText: 'last name'.tr(),
                        prefixIcon: const Icon(Icons.person) ,
                      ),
                      validator: qValidator([
                        IsRequired(),
                      ]),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      onSaved:(value) => _email = value,
                      keyboardType: TextInputType.emailAddress,
                      decoration:  InputDecoration(
                        labelText: 'email'.tr(),
                        prefixIcon: const Icon(Icons.email) ,
                      ),
                      validator: qValidator([
                        IsRequired(),
                        const IsEmail(),
                      ]),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      onSaved:(value) => _phone = value,
                      keyboardType: TextInputType.phone,
                      decoration:  InputDecoration(
                        labelText: 'phone'.tr(),
                        prefixIcon: const Icon(Icons.phone) ,
                      ),
                      validator: qValidator([
                        IsRequired(),
                        MinLength(10),
                      ]),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    PasswordTextFormField(
                      onSaved:(value) => _password = value,
                      validator: qValidator([
                        IsRequired(),
                        MinLength(8),
                      ]),
                    ),


                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                  width:125.0,
                  height: 35.0,
                child: ElevatedButton(
                  onPressed: () {
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                  }
                },
                  child: Text('sign up'.tr(),
                      style:Theme.of(context).textTheme.headline1),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
                   Text('already have account?'.tr(), style:Theme.of(context).textTheme.headline1),
                  TextButton(
                    onPressed: (){},
                    child:Text ('login'.tr()),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
