import 'package:flutter/material.dart';
import 'package:shamo_app/utilities/app_colors.dart';

class FilledTextField extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final Widget? prefixIcon;

  const FilledTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      style: Theme.of(context).textTheme.bodyText2?.copyWith(
            color: AppColors.white,
            fontSize: 14,
          ),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: AppColors.black2,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: AppColors.grey,
              fontSize: 14,
            ),
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
