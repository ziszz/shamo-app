import 'package:flutter/material.dart';
import '../../utilities/app_colors.dart';

class FilledTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Color fillColor;
  final double height;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Widget? prefixIcon;

  const FilledTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.textInputAction,
    this.height = 50,
    this.fillColor = AppColors.black2,
    this.onChanged,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        textInputAction: textInputAction,
        obscureText: obscureText,
        controller: controller,
        onChanged: onChanged,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.white,
              fontSize: 14,
            ),
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.grey,
                fontSize: 14,
              ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16),
            child: prefixIcon,
          ),
          prefixIconConstraints: const BoxConstraints(
            maxWidth: 60,
            maxHeight: 60,
          ),
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
      ),
    );
  }
}
