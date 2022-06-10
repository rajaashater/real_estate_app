import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:real_estate_app/utils/app_constants.dart';
import 'package:real_estate_app/views/drawer/password_text_from_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/auth_service.dart';
import '../../utils/theme/app_colors.dart';
import '../components/k_drop_down_button_form_field.dart';
import '../main/home/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? _name;
  String? _phone;
  String? _gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(AppConstants.logo),
              const SizedBox(
                height: 10.0,
              ),
              Text('Key In Click',
                  style: Theme.of(context).textTheme.headline1),

              const SizedBox(
                height: 40.0,
              ),
              Text('sign_up'.tr(),
                  style: Theme.of(context).textTheme.headline2),
              const SizedBox(
                height: 10.0,
              ),
              Text('create_your_account'.tr(),
                  style: Theme.of(context).textTheme.headline3),
              const SizedBox(
                height: 40.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (value) => _name = value,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'full_name'.tr(),
                        prefixIcon: const Icon(Icons.person),
                      ),
                      validator: qValidator([
                        IsRequired(),
                      ]),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    KDropDownButtonFormField<String>(
                      label: Text('gander'.tr()),
                      items: ['female'.tr(), 'male'.tr()]
                          .map((e) =>
                          DropdownMenuItem<String>(value: e, child: Text(e)))
                          .toList(),
                      validator: (value){
                        if(value == null){
                          return 'required'.tr();
                        }
                        return null;
                      },
                      onSaved: (value) => _gender = value,
                    ),
                    const SizedBox(
                      height: 10.0,
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
                    ),
                    const SizedBox(
                      height: 10.0,
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
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    PasswordTextFormField(
                      onSaved: (value) => _password = value,
                        labelText: 'password'.tr(),
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
                width: 125.0,
                height: 35.0,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      showDialog(context: context, builder: (context) => Center(child: CircularProgressIndicator()), barrierDismissible: false);
                      var authData = await AuthService().register(_name!,_email!, _password!,  _phone!, _gender!);
                      final sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.remove('token');
                      sharedPreferences.remove('user');
                      sharedPreferences.setString('token', authData.data.token);
                      sharedPreferences.setString('user', json.encode(authData.data.user.toJson()));
                      Navigator.of(context).pop();
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => HomeScreen()), (_) => false);
                    }
                  },
                  child: Text('sign_up'.tr(),
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),
              const SizedBox(
                height: 20.0,
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
