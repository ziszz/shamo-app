import 'package:flutter/material.dart';
import '../../../core/lib/utilities/app_colors.dart';
import '../../../core/lib/utilities/constants.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Page not found!!!",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.white,
                  fontWeight: Constants.medium,
                ),
          ),
        ),
      ),
    );
  }
}
