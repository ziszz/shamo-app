import 'package:flutter/material.dart';
import '../../utilities/app_colors.dart';

class CenterMessage extends StatelessWidget {
  final String text;

  const CenterMessage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.white,
            ),
      ),
    );
  }
}
