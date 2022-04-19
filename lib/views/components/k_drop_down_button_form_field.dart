import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';

class KDropDownButtonFormField<T> extends StatelessWidget {
  const KDropDownButtonFormField({Key? key, required this.items, this.value, this.onSaved, this.validator, this.label}) : super(key: key);
  final List<DropdownMenuItem<T>>? items;
  final T? value;
  final void Function(T?)? onSaved;
  final String? Function(T?)? validator;
  final Widget? label;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: (_){},
      onSaved: onSaved,
      validator: validator,
      style: const TextStyle(color: AppColors.secondary),
      decoration: InputDecoration(
        label: label,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0)
      ),
    );
  }
}
