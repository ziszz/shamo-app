import 'package:flutter/material.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/constants.dart';

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
