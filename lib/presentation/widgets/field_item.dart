import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/widgets/filled_textfield.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/constants.dart';

class FormItem extends StatelessWidget {
  final String label;
  final Widget prefixIcon;
  final TextEditingController? controller;

  const FormItem({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.controller,
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
          controller: controller,
          hintText: "Your $label",
          prefixIcon: prefixIcon,
        ),
      ],
    );
  }
}
