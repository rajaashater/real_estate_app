import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:real_estate_app/models/user_model.dart';
import '../../utils/theme/app_colors.dart';
import '../components/components.dart';
import 'change_password.dart';


class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  XFile? _image;

  String? _email;

  String? _city;

  String? _name;

  String? _lastName;

  String? _phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'.tr()),
      ),
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KProfileImage(
                    onImageSelected: (image){
                     //TODO Practice
                      _image = image;
                    },
                  ),
                  const SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) =>  ChangePasswordScreen())),
                    child: Text('change_password'.tr(),
                        style: Theme.of(context).textTheme.headline1),
                  ),
                ],
              ),
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
                      onSaved: (value) => _lastName = value,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'last_name'.tr(),
                        prefixIcon: const Icon(Icons.person),
                      ),
                      validator: qValidator([
                        IsRequired(),
                      ]),
                      initialValue: 'Moghrabi',
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
                    TextFormField(
                      onSaved: (value) => _city = value,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                        labelText: 'city'.tr(),
                        prefixIcon: const Icon(Icons.location_city),
                      ),
                      validator: qValidator([
                        IsRequired(),
                      ]),
                      initialValue: 'paramkeh'.tr(),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              KDropDownButtonFormField<String>(
                label: Text('gander'.tr()),
                items: ['female'.tr(), 'male'.tr()]
                    .map((e) =>
                        DropdownMenuItem<String>(value: e, child: Text(e)))
                    .toList(),
              ),
              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    //TODO API request
                  },
                  child: Text('update_profile'.tr(),
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
