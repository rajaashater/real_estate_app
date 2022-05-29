import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:real_estate_app/views/drawer/password_text_from_field.dart';

import '../../utils/theme/app_colors.dart';
import '../../utils/app_constants.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String? _password;
  String? _currentPassword;
  String? _newPassword;
  String? _passwordConfirmation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              Text('change_password'.tr(),
                  style: Theme.of(context).textTheme.headline2),
              const SizedBox(
                height: 40.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    PasswordTextFormField(
                      onSaved: (value) => _currentPassword = value,
                      labelText: 'current_password'.tr(),
                      validator: qValidator([
                        IsRequired(),
                        MinLength(8),
                      ]),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PasswordTextFormField(
                      onSaved: (value) => _newPassword = value,
                      labelText: 'new_password'.tr(),
                      validator: qValidator([
                        IsRequired(),
                        MinLength(8),
                      ]),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PasswordTextFormField(
                      onSaved: (value) => _passwordConfirmation = value,
                      labelText: 'password_confirmation'.tr(),
                      validator: qValidator([
                        IsRequired(),
                        MinLength(8),
                      ]),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 125.0,
                height: 35.0,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('update'.tr(),
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
