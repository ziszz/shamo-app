import 'package:flutter/material.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/constants.dart';

void errorSnackbar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.red,
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.white,
              fontWeight: Constants.medium,
            ),
      ),
    ),
  );
}
