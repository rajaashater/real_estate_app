import 'package:flutter/material.dart' show BuildContext, Colors, Icon, IconButton, Icons, InputDecoration, Key, State, StatefulWidget, TextFormField, TextInputType, Widget;
import 'package:real_estate_app/utils/theme/app_colors.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({Key? key, this.onSaved, this.validator, this.labelText})
      : super(key: key);
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? labelText;

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
        labelText: widget.labelText,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              color: _obscureText == false ? AppColors.secondary : Colors.white,
            ),
            onPressed: () => setState(() {
                  _obscureText = !_obscureText;
                })),
      ),
      validator: widget.validator,
    );
  }
}
