import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:real_estate_app/utils/theme/app_constants.dart';
import 'package:real_estate_app/views/drawer/password_text_from_field.dart';
import 'package:real_estate_app/views/drawer/register_screen.dart';

import '../../utils/theme/app_colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                    print(_email);
                    print(_password);
                  },
                  child: Text('login'.tr(),
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),
              const SizedBox(
                height: 20.0,
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
