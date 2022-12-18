import 'package:flutter/material.dart';
import 'package:core/presentation/widget/widgets/filled_textfield.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/constants.dart';

class FormItem extends StatelessWidget {
  final String label;
  final Widget prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;

  const FormItem({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.obscureText = false,
    this.controller,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: Constants.medium,
                color: AppColors.white,
                fontSize: 16,
              ),
        ),
        const SizedBox(
          height: 12,
        ),
        FilledTextField(
          textInputAction: textInputAction,
          obscureText: obscureText,
          controller: controller,
          hintText: "Your $label",
          prefixIcon: prefixIcon,
        ),
      ],
    );
  }
}
