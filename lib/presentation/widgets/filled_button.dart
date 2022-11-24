import 'package:flutter/material.dart';
import 'package:shamo_app/utilities/app_colors.dart';

class FilledButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final Color fillColor;
  final double width;
  final double height;

  const FilledButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.fillColor = AppColors.purple,
    this.width = double.infinity,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        key: key,
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(fillColor),
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
