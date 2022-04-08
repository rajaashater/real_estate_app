
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:real_estate_app/views/auth/password_text_from_field.dart';

class LoginScreen extends StatelessWidget {

  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('dsadas'),
               Text('login'.tr(),
              style:const TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved:(value) => _email = value,
                      keyboardType: TextInputType.emailAddress,
                      decoration:  InputDecoration(
                        labelText: 'email'.tr(),
                        prefixIcon: const Icon(Icons.email) ,
                        border: const OutlineInputBorder(),
                      ),
                      validator: qValidator([
                        IsRequired(),
                      ]),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    PasswordTextFormField(onSaved:(value) => _password = value),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 40.0,
                child: ElevatedButton(onPressed: () {
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                  }
                  print(_email);
                  print(_password);
                },
                  child: Text('login'.tr(),
                  style: const TextStyle(color:Colors.white,) ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  const Text('Don\'t have an account ?',),
                  TextButton(
                    onPressed: (){},
                    child:Text ('Regester now'),
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
