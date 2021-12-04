import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:real_estate_app/views/auth/password_text_from_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
               Text('login'.tr(),
              style:const TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration:  InputDecoration(
                  labelText: 'email'.tr(),
                  prefixIcon:const Icon(Icons.email) ,
                  border: const OutlineInputBorder(),
                ),
                validator: qValidator([
                  const IsRequired(),
                ]),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const PasswordTextFormField(),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                // color: Colors.indigo,
                height: 40.0,
                child: ElevatedButton(onPressed: () {
                  if(_formKey.currentState!.validate()){

                  }
                },
                  child:  Text ('login'.tr(),
                  style:const TextStyle(color:Colors.white,) ),

                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
