import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:real_estate_app/services/auth_service.dart';
import 'package:real_estate_app/utils/app_constants.dart';
import 'package:real_estate_app/views/drawer/password_text_from_field.dart';
import 'package:real_estate_app/views/drawer/register_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:real_estate_app/views/main/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../../utils/theme/app_colors.dart';
import '../main/main_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _email;

  String? _password;

  @override
  void initState() {
    initial();
    super.initState();
  }

  void initial(){
    SharedPreferences.getInstance().then((prefs) {
      if (prefs.getString('token') != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
        );
      }
    });
  }

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
              Text('login'.tr(), style: Theme.of(context).textTheme.headline2),
              const SizedBox(
                height: 10.0,
              ),
              Text('welcome'.tr(),
                  style: Theme.of(context).textTheme.headline3),
              const SizedBox(
                height: 40.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (value) => _email = value,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'email'.tr(),
                        prefixIcon: const Icon(Icons.email),
                      ),
                      validator: qValidator([
                        IsRequired(),
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
                      var authData = await AuthService().login(_email!, _password!);
                      sharedPreferences.setString('token', authData.data.token);
                      sharedPreferences.setString('user', json.encode(authData.data.user.toJson()));
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => MainScreen()));
                    }
                  },
                  child: Text('login'.tr(),
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  Text('don\'t_have_an_account'.tr(),
                      style: Theme.of(context).textTheme.headline1),
                  TextButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RegisterScreen())),
                    child: Text('register_now'.tr()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
