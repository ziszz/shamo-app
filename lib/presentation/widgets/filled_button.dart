import 'package:flutter/material.dart';
import 'package:shamo_app/utilities/app_colors.dart';

class FilledButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final double width;
  final double height;

  const FilledButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width = double.infinity,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(
            AppColors.purple,
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
