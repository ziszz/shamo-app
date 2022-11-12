import 'package:flutter/material.dart';
import 'package:shamo_app/utilities/app_colors.dart';
import 'package:shamo_app/utilities/font_weight.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Page not found!!!",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: AppColors.white,
                  fontWeight: medium,
                ),
          ),
        ),
      ),
    );
  }
}
