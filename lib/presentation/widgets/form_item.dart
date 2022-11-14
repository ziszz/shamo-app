import 'package:flutter/material.dart';
import 'package:shamo_app/presentation/widgets/filled_textfield.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/font_weight.dart';

class FormItem extends StatelessWidget {
  final String label;
  final Widget prefixIcon;

  const FormItem({
    super.key,
    required this.label,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: medium,
                color: AppColors.white,
                fontSize: 16,
              ),
        ),
        const SizedBox(
          height: 12,
        ),
        FilledTextField(
          hintText: "Your $label",
          prefixIcon: prefixIcon,
        ),
      ],
    );
  }
}
