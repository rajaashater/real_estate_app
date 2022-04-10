import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({Key? key, this.onSaved}) : super(key: key);
  final void Function(String?)? onSaved;

  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'password'.tr(),
        prefixIcon: const Icon(Icons.lock) ,
        suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye, color: _obscureText == false ? AppColors.primary : Colors.grey,), onPressed: () => setState(() {
          _obscureText = !_obscureText;
        })),
      ),
      validator: qValidator([
        IsRequired(),
      ]),
    );
  }
}
